#!/usr/bin/env python3
"""qtr.py - рабочий инструмент перевода текстовых квестов TGE (txt, UTF-16LE).

  py -3.14 qtr.py unpack <src_rus.txt> [work_dir]   -> <work_dir>\\<Name>.work.txt (UTF-8, для правки)
  py -3.14 qtr.py pack   <work.txt> <src_rus.txt> <dest_eng.txt>
                                                    -> проверка + запись TGE txt (UTF-16LE+BOM, CRLF)
  py -3.14 qtr.py check  <file.txt> <src_rus.txt>   -> только проверка
  py -3.14 qtr.py todo   <src_rus.txt> <todo.txt>   -> только первые вхождения уникальных RU-текстов (для перевода)
  py -3.14 qtr.py fill   <src_rus.txt> <todo_en.txt> <work.txt> -> раскладывает перевод на точные повторы
  py -3.14 qtr.py dups   <src_rus.txt>              -> группы повторяющихся/почти одинаковых фраз

Запускать ТОЛЬКО как `py -3.14 qtr.py ... < /dev/null`.
Проверки pack: та же последовательность типов записей (Par1-1, Loc5-3...), те же
токены разметки (<clr>, <Ranger>, [p12], {...}, <format=..>), все строки с TAB,
остатки кириллицы (предупреждение), обрезанные/пустые переводы.
"""
import sys, re, os, collections, difflib

TOK = re.compile(r'<[^>\t\r\n]{1,40}>|\[p\d+\]|\{[^}\r\n]{1,60}\}|%\w+|\^[^^\r\n]{1,25}\^')
CYR = re.compile(r'[А-Яа-яЁё]')


def read_tge(path):
    b = open(path, 'rb').read()
    if b[:2] == b'\xff\xfe':
        return b[2:].decode('utf-16-le')
    if b[:3] == b'\xef\xbb\xbf':
        return b[3:].decode('utf-8')
    return b.decode('utf-8')


def records(text):
    """-> [(type, text)] ; '*' строки склеиваются в предыдущую запись через \\n."""
    recs = []
    for i, ln in enumerate(text.replace('\r\n', '\n').split('\n'), 1):
        if ln == '*':
            ln = '*\t'  # редакторы режут хвостовой TAB у пустой строки продолжения
        if '\t' not in ln:
            if ln == '':
                continue
            raise ValueError('строка %d без TAB: %r' % (i, ln[:60]))
        t, s = ln.split('\t', 1)
        if t == '*':
            if not recs:
                raise ValueError('строка %d: * без записи' % i)
            recs[-1][1].append(s)
        else:
            recs.append((t, [s]))
    return [(t, '\n'.join(s)) for t, s in recs]


def toks(s):
    return collections.Counter(TOK.findall(s))


def toks_pair(a, b):
    """Токены перевода a и исходника b для сравнения. Кириллические <...> в исходнике - не теги игры,
    а авторские псевдотеги (напр. <Цензурой>): им может соответствовать столько же латинских <...> в переводе."""
    ta, tb = toks(a), toks(b)
    for o, pat in (('<', r'<[A-Za-z][A-Za-z -]*>'), ('{', r'\{[A-Za-z][A-Za-z\' -]*\}')):
        # то же для {текст} с кириллицей (не формула, а текст в фигурных скобках, напр. "{не согласилась}")
        ps = [t for t in tb if t.startswith(o) and CYR.search(t)]
        n = sum(tb.pop(t) for t in ps)
        if n:
            extra = collections.Counter({t: c for t, c in (ta - tb).items() if t.startswith(o)})
            if all(re.fullmatch(pat, t) for t in extra) and sum(extra.values()) == n:
                ta = ta - extra
    # сломанный в исходнике тег (напр. "<clrEnd," без ">") в переводе можно починить
    for m in re.findall(r'<(clrEnd|clr)(?![>\w])', b):
        t = '<%s>' % m
        if ta[t] > tb[t]:
            ta[t] -= 1
    # непарные теги в исходнике (напр. "<clrEnd>Белые<clrEnd>"): в переводе можно поставить парные <clr>...<clrEnd>
    d = ta['<clr>'] - tb['<clr>']
    if 0 < d <= tb['<clrEnd>'] - tb['<clr>'] and tb['<clrEnd>'] - ta['<clrEnd>'] == d and ta['<clr>'] == ta['<clrEnd>']:
        ta['<clr>'] -= d
        ta['<clrEnd>'] += d
    return ta, tb


def dup_groups(src_recs, thr=0.9, minlen=20):
    """-> (exact, near): exact = [[типы...]] с одинаковым текстом; near = [(тип1, тип2, ratio)] с ratio>=thr, но не равные."""
    by = collections.defaultdict(list)
    for t, x in src_recs:
        by[x].append(t)
    exact = [v for k, v in by.items() if len(v) > 1 and k.strip()]
    uniq = [(v[0], k) for k, v in by.items() if len(k) >= minlen]
    uniq.sort(key=lambda r: len(r[1]))
    near = []
    for i, (ta, xa) in enumerate(uniq):
        for tb, xb in uniq[i + 1:]:
            if len(xb) > len(xa) / thr + 1:
                break
            sm = difflib.SequenceMatcher(None, xa, xb, autojunk=False)
            if sm.real_quick_ratio() < thr or sm.quick_ratio() < thr:
                continue
            r = sm.ratio()
            if r >= thr:
                near.append((ta, tb, round(r, 3)))
    return exact, near


def consistency(w, s):
    """одинаковые исходные фразы -> одинаковый перевод; почти одинаковые -> почти одинаковый. -> (errors, warnings)"""
    err, warn = [], []
    tr = {}
    for (t, a), (_, b) in zip(w, s):
        tr.setdefault(b, []).append((t, a))
    for b, lst in tr.items():
        if len(lst) > 1 and b.strip() and len({a for _, a in lst}) > 1:
            err.append('одинаковый русский текст (%s) переведён по-разному: %s' % (
                ', '.join(t for t, _ in lst[:6]), ' | '.join(sorted({a.replace(chr(10), ' / ')[:50] for _, a in lst}))))
    ex, near = dup_groups(s)
    wd = dict((t, a) for t, a in w)
    for ta, tb, r in near:
        if ta in wd and tb in wd:
            rr = difflib.SequenceMatcher(None, wd[ta], wd[tb], autojunk=False).ratio()
            if rr < r - 0.12:
                warn.append('почти одинаковые фразы (RU %.0f%%) переведены непохоже (EN %.0f%%): %s / %s' % (r * 100, rr * 100, ta, tb))
    return err, warn


def fmt_recs(recs):
    out = []
    for t, x in recs:
        ls = x.split('\n')
        out.append(t + '\t' + ls[0])
        out += ['*\t' + l for l in ls[1:]]
    return '\n'.join(out) + '\n'


def first_occ(recs):
    """-> (todo: [(тип, ru)] первые вхождения уникальных ru-текстов, owner: ru -> тип первого)"""
    owner, todo = {}, []
    for t, x in recs:
        if x not in owner:
            owner[x] = t
            todo.append((t, x))
    return todo, owner


def compare(work, src):
    """возвращает (errors, warnings)"""
    err, warn = [], []
    w, s = records(work), records(src)
    wt, st = [t for t, _ in w], [t for t, _ in s]
    if wt != st:
        ws, ss = collections.Counter(wt), collections.Counter(st)
        miss = list((ss - ws).elements())[:15]
        extra = list((ws - ss).elements())[:15]
        err.append('типы записей не совпадают с исходником: нет %s; лишние %s' % (miss, extra))
        if not miss and not extra:
            err.append('порядок записей изменён')
    else:
        for (t, a), (_, b) in zip(w, s):
            ta, tb = toks_pair(a, b)
            if ta != tb:
                err.append('%s: токены разметки: ожидалось %s, есть %s' % (
                    t, dict(tb - ta) or '-', dict(ta - tb) or '-'))
            if CYR.search(a):
                warn.append('%s: осталась кириллица: %s' % (t, a.replace('\n', ' / ')[:70]))
            if b.strip() and not a.strip():
                err.append('%s: пустой перевод' % t)
        e2, w2 = consistency(w, s)
        err += e2
        warn += w2
    return err, warn


def write_tge(path, text):
    text = text.replace('\r\n', '\n').rstrip('\n').replace('\n', '\r\n') + '\r\n'
    os.makedirs(os.path.dirname(os.path.abspath(path)), exist_ok=True)
    open(path, 'wb').write(b'\xff\xfe' + text.encode('utf-16-le'))


def main(a):
    if len(a) < 2:
        print(__doc__)
        return 2
    cmd = a[0]
    if cmd == 'unpack':
        src = a[1]
        wd = a[2] if len(a) > 2 else os.path.join(os.path.dirname(os.path.abspath(__file__)), 'Translation', 'work')
        os.makedirs(wd, exist_ok=True)
        name = os.path.splitext(os.path.basename(src))[0]
        out = os.path.join(wd, name + '.work.txt')
        t = read_tge(src)
        records(t)  # валидация формата
        open(out, 'w', encoding='utf-8', newline='\r\n').write(t.replace('\r\n', '\n'))
        print('unpack ->', out, '| записей:', len(records(t)))
        return 0
    if cmd == 'todo':
        recs = records(read_tge(a[1]))
        todo, _ = first_occ(recs)
        out = a[2]
        open(out, 'w', encoding='utf-8', newline='\r\n').write(fmt_recs(todo))
        print('todo ->', out, '| уникальных текстов:', len(todo), 'из', len(recs))
        return 0
    if cmd == 'fill':
        src, tr, out = a[1], a[2], a[3]
        recs = records(read_tge(src))
        _, owner = first_occ(recs)
        en = dict(records(read_tge(tr)))
        res, miss = [], []
        for t, x in recs:
            e = en.get(t)
            if e is None:
                e = en.get(owner[x])
            if e is None:
                miss.append(t)
                e = x
            res.append((t, e))
        open(out, 'w', encoding='utf-8', newline='\r\n').write(fmt_recs(res))
        print('fill ->', out, '| не переведено:', len(miss), miss[:20])
        return 1 if miss else 0
    if cmd == 'dups':
        exact, near = dup_groups(records(read_tge(a[1])))
        print('ТОЧНЫЕ повторы (переводить один раз, везде одинаково): %d групп' % len(exact))
        for g in exact:
            print('  ', ', '.join(g))
        print('ПОЧТИ повторы (>=90%%): %d пар' % len(near))
        for ta, tb, r in sorted(near, key=lambda x: -x[2]):
            print('  %s ~ %s  %.0f%%' % (ta, tb, r * 100))
        return 0
    if cmd in ('pack', 'check'):
        if cmd == 'pack':
            work, src, dest = a[1], a[2], a[3]
        else:
            work, src, dest = a[1], a[2], None
        wt, st = read_tge(work), read_tge(src)
        err, warn = compare(wt, st)
        for e in err:
            print('ОШИБКА:', e)
        for w in warn[:12]:
            print('предупр.:', w)
        if len(warn) > 12:
            print('... ещё предупреждений:', len(warn) - 12)
        print('записей: %d, ошибок: %d, предупреждений: %d' % (len(records(st)), len(err), len(warn)))
        if err:
            return 1
        if dest:
            write_tge(dest, wt)
            print('записано:', dest)
        return 0
    print(__doc__)
    return 2


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
