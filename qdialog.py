"""qdialog.py - оформление реплик в Eng как в RU того же квеста (решение пользователя 2026-10-04).

  python3 qdialog.py [подстрока...] [--write] [--show N] [--dev] < /dev/null

Если строка RU начинается с тире (реплика по-русски), а строка Eng - с кавычки, Eng переводится в тире:
  "Speech," said X. "More."   ->   - Speech, - said X. - More.
Одинарные кавычки внутри реплики снова становятся двойными (только если их столько же пар, сколько в RU).
Строки, которые не удалось разобрать надёжно, не трогаются и печатаются SKIP для ручного разбора.
DevTranslated (тексты разработчиков) - только с --dev. Без --write только отчёт.
"""
import sys, os, re
import qcheck_all, qtr

D_RU = re.compile(r'^[ \t]*[-—–][ \t]+(?=\S)')
Q_EN = re.compile(r'^([ \t]*)"')
QUOTED = re.compile(r'"([^"]*)"')
SQ = re.compile(r"(?<![A-Za-z0-9])'([^'\n]+?)'(?![A-Za-z0-9])")
RUQ = re.compile(r'"[^"]*"|«[^»]*»|“[^”]*”')
DASH_RU = re.compile(r'[ \t][-—–][ \t]')


PUNCT = ',.!?…:;-'


def parse(body, budget, start):
    """разбор реплики, открытой до позиции start. -> (части [(k, текст)], реплика не закрыта) или None"""
    parts, i, mode, used = [], start, 's', 0
    while True:
        q = body.find('"', i)
        if q < 0:
            break
        prev, nxt = body[q - 1:q], body[q + 1:q + 2]
        if mode == 's':
            end = not body[q + 1:].strip()
            if (prev and prev in PUNCT and (nxt == '' or nxt in ' \t,.;:!?')) or (end and prev in ' \t'):
                if not end and used >= budget:
                    return None
                parts.append(('s', body[start:q].rstrip()))
                if not end:
                    used += 1
                mode, start, i = 'a', q + 1, q + 1
                continue
            q2 = body.find('"', q + 1)          # кавычки внутри реплики
            if q2 < 0:
                break
            i = q2 + 1
        else:
            gap = body[start:q].strip()
            if prev in ' \t' and gap and gap[-1] in ',.:!?…' and used + 1 <= budget:
                parts.append(('a', gap))
                used += 1
                mode, start, i = 's', q + 1, q + 1
                continue
            q2 = body.find('"', q + 1)          # кавычки внутри ремарки
            if q2 < 0:
                return None
            i = q2 + 1
    if mode == 's':
        parts.append(('s', body[start:].rstrip()))
        return parts, True
    if body[start:].strip():
        parts.append(('a', body[start:].strip()))
    return parts, False


def build(parts, rbody, first):
    if any(k == 's' and not x.strip() for k, x in parts[1:]):
        return None
    rq = len(RUQ.findall(rbody))
    sq = sum(len(SQ.findall(x)) for k, x in parts if k == 's')
    if sq and sq == rq:
        parts = [(k, SQ.sub(r'"\1"', x) if k == 's' else x) for k, x in parts]
    out = first + parts[0][1]
    for k, x in parts[1:]:
        out += ' - ' + x
    return out


def outer(en, ru):
    """анекдот/цитата в кавычках с репликами внутри (RU: '- Есть, сэр!"'): внешняя закрывающая кавычка остаётся"""
    s = en.rstrip()
    if s.endswith('""') and ru.rstrip().endswith(('"', '»')):
        return s[:-1], '"' + en[len(s):]
    return en, ''


def convert(en, ru):
    """-> (новая строка, причина пропуска или None, реплика не закрыта)"""
    m = Q_EN.match(en)
    if not m or not D_RU.match(ru):
        return en, None, False
    en2, ext = outer(en, ru)
    body = en2[m.end(1):]
    rbody = D_RU.sub('', ru, count=1)
    r = parse(body.rstrip(), len(DASH_RU.findall(rbody)), 1)
    if r is None:
        return en, 'разбор', False
    out = build(r[0], rbody, '- ')
    if out is None or not r[0][0][1].strip():
        return en, 'пустая реплика', False
    return m.group(1) + out + (ext or body[len(body.rstrip()):]), None, r[1]


def cont(en, ru):
    """продолжение незакрытой реплики на следующем абзаце -> (строка, всё ещё открыта, ошибка)"""
    x = en
    if x.startswith('"') and not ru.lstrip().startswith(('"', '«')):
        x = x[1:]                               # англ. повторная кавычка нового абзаца
    x, ext = outer(x, ru)
    r = parse(x.rstrip(), len(DASH_RU.findall(ru)), 0)
    if r is None:
        return en, True, 'закрытие'
    out = build(r[0], ru, '')
    if out is None:
        return en, True, 'закрытие'
    return out + (ext or x[len(x.rstrip()):]), r[1], None


def process(e, r, write, show, stats):
    el = qtr.read_tge(e).split('\r\n')
    rl = qtr.read_tge(r).split('\r\n')
    if len(el) != len(rl):
        print('!! число строк не совпадает:', e)
        return
    nch, key, opened = 0, '', False
    for i, (a, b) in enumerate(zip(el, rl)):
        ka, _, xa = a.partition('\t')
        kb, _, xb = b.partition('\t')
        if ka != kb:
            print('!! строка %d: %s / %s' % (i + 1, ka, kb))
            return
        if ka != '*':
            key = ka
        if ka != '*':
            opened = False
        if opened and not D_RU.match(xb):
            c, opened, why = cont(xa, xb)
        else:
            c, why, opened = convert(xa, xb)
        if why:
            stats['skip'] += 1
            if show:
                print('SKIP %s %s [%s]\n   EN: %s\n   RU: %s' % (os.path.basename(e), key, why, xa[:300], xb[:300]))
        if c != xa:
            nch += 1
            el[i] = ka + '\t' + c
            if show and stats['shown'] < show:
                stats['shown'] += 1
                print('%s %s\n   - %s\n   + %s' % (os.path.basename(e), key, xa[:300], c[:300]))
    stats['lines'] += nch
    if nch:
        print('%5d  %s' % (nch, qcheck_all.rel(e)))
    if write and nch:
        open(e, 'wb').write(b'\xff\xfe' + '\r\n'.join(el).encode('utf-16-le'))


def main(a):
    write, dev = '--write' in a, '--dev' in a
    show = 0
    if '--show' in a:
        k = a.index('--show'); show = int(a[k + 1]); a = a[:k] + a[k + 2:]
    subs = [x for x in a if not x.startswith('--')]
    stats = {'lines': 0, 'skip': 0, 'shown': 0}
    pairs, _ = qcheck_all.pairs()
    for e, r in pairs:
        if r is None or (not dev and qcheck_all.is_dev(e)):
            continue
        if subs and not any(s.lower() in e.lower() for s in subs):
            continue
        process(e, r, write, show, stats)
    print('итого строк: %d, пропущено (ручной разбор): %d' % (stats['lines'], stats['skip']))


if __name__ == '__main__':
    main(sys.argv[1:])
