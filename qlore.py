# -*- coding: utf-8 -*-
"""qlore.py — работа с лангами игры (лор): ссылки вида SR2:Quest.DefShip.17.Start#2.

Исходники: Translation/lore/source/{SR1,SR2,SRHD}_rus.txt (cp1251, как в игре; НЕ менять).
  SR1 = КР1 (~3000 г.), SR2 = КР2 (~3300 г.), SRHD = КР2 HD (уступает SR1/SR2 по каноничности).

Ключ = путь блоков через точку; если в блоке ключ повторяется (несколько строк Start),
к нему добавляется #N (с 1), иначе без номера.

Команды (python3 qlore.py ... < /dev/null):
  flat                       — пересобрать Translation/work/lore/<LANG>.flat (ключ<TAB>текст)
  dump PREFIX [LANG]         — все записи с ключом, начинающимся на PREFIX (по умолч. SRHD),
                               с пометкой, где тот же текст есть в других лангах:
                               '= SR2:ключ' — совпадает, '~ SR2:ключ(N%)' — тот же ключ, текст отличается
                               (≥50%; '≠' — <50%, другой текст;
                               при <97% текст другого ланга печатается следом); 'ТОЛЬКО X' — нигде больше
  find REGEX [LANG...]       — поиск по тексту во всех (или указанных) лангах
  get REF...                 — показать текст по ссылкам (SR2:Quest.DefShip.17.Start#2)
  check FILE.md...           — проверить, что все ссылки [LANG:ключ] в файлах существуют
"""
import os, re, sys, difflib

ROOT = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(ROOT, 'Translation', 'lore', 'source')
OUT = os.path.join(ROOT, 'Translation', 'work', 'lore')
LANGS = ['SR1', 'SR2', 'SRHD']
# по одинаковому ключу сравниваем только КР2 и HD (HD — расширение КР2, номера совпадают);
# КР1 — другие квесты под теми же номерами
PAIR = {'SR2': ['SRHD'], 'SRHD': ['SR2'], 'SR1': []}
REF_RE = re.compile(r'\b(SR1|SR2|SRHD):([^\s;,\]\)]+)')


def parse(lang):
    path = os.path.join(SRC, lang + '_rus.txt')
    raw = open(path, 'rb').read().decode('cp1251')
    stack, res, counts = [], [], {}
    for line in raw.splitlines():
        s = line.strip()
        if s.endswith('^{') or s.endswith('~{'):
            stack.append(s[:-2].strip())
            continue
        if s == '}':
            if stack:
                stack.pop()
            continue
        if '=' in s:
            k, v = s.split('=', 1)
            key = '.'.join(stack + [k.strip()])
            res.append([key, v])
            counts[key] = counts.get(key, 0) + 1
    seen = {}
    for item in res:
        key = item[0]
        if counts[key] > 1:
            seen[key] = seen.get(key, 0) + 1
            item[0] = '%s#%d' % (key, seen[key])
    return res


def flat():
    os.makedirs(OUT, exist_ok=True)
    for lang in LANGS:
        rows = parse(lang)
        with open(os.path.join(OUT, lang + '.flat'), 'w', encoding='utf-8') as f:
            for k, v in rows:
                f.write(k + '\t' + v + '\n')
        print(lang, len(rows))


def load(lang):
    p = os.path.join(OUT, lang + '.flat')
    if not os.path.exists(p):
        flat()
    rows = []
    for line in open(p, encoding='utf-8'):
        k, _, v = line.rstrip('\n').partition('\t')
        rows.append((k, v))
    return rows


def norm(s):
    s = re.sub(r'<[^>]*>', '', s)
    s = re.sub(r'[\s"«»“”\'’]+', ' ', s)
    return s.strip().lower()


def base(key):
    return key.split('#')[0]


def dump(prefix, lang='SRHD'):
    data = {l: load(l) for l in LANGS}
    idx = {}
    bykey = {}
    for l in LANGS:
        if l == lang:
            continue
        for k, v in data[l]:
            idx.setdefault(norm(v), []).append('%s:%s' % (l, k))
            bykey.setdefault((l, base(k)), []).append((k, v))
    for k, v in data[lang]:
        if not k.startswith(prefix):
            continue
        marks, alts = [], []
        n = norm(v)
        if len(n) >= 20:
            same = idx.get(n, [])
            marks += ['=' + r for r in same[:4]]
            if not same:
                for l in PAIR.get(lang, []):
                    for k2, v2 in bykey.get((l, base(k)), []):
                        r = difflib.SequenceMatcher(None, n, norm(v2)).ratio()
                        sign = '~' if r >= 0.5 else '≠'
                        marks.append('%s%s:%s(%d%%)' % (sign, l, k2, r * 100))
                        if r < 0.97:
                            alts.append('   %s %s:%s\t%s' % (sign, l, k2, v2))
                if not marks:
                    marks.append('ТОЛЬКО ' + lang)
        print('%s:%s%s\t%s' % (lang, k, (' [' + '; '.join(marks) + ']') if marks else '', v))
        for a in alts:
            print(a)


def find(rx, langs):
    r = re.compile(rx, re.I)
    for l in langs or LANGS:
        for k, v in load(l):
            if r.search(v) or r.search(k):
                print('%s:%s\t%s' % (l, k, v))


def get(refs):
    data = {l: dict(load(l)) for l in LANGS}
    for ref in refs:
        l, _, k = ref.partition(':')
        print('%s\t%s' % (ref, data.get(l, {}).get(k, '!!! НЕТ ТАКОГО КЛЮЧА')))


def check(files):
    data = {l: set(k for k, _ in load(l)) for l in LANGS}
    bad = total = 0
    for fn in files:
        for i, line in enumerate(open(fn, encoding='utf-8'), 1):
            for l, k in REF_RE.findall(line):
                k = k.rstrip('.')
                total += 1
                if k not in data[l]:
                    bad += 1
                    print('%s:%d: нет ключа %s:%s' % (fn, i, l, k))
    print('ссылок: %d, битых: %d' % (total, bad))
    return bad


if __name__ == '__main__':
    a = sys.argv[1:]
    if not a:
        print(__doc__)
    elif a[0] == 'flat':
        flat()
    elif a[0] == 'dump':
        dump(a[1], a[2] if len(a) > 2 else 'SRHD')
    elif a[0] == 'find':
        find(a[1], a[2:])
    elif a[0] == 'get':
        get(a[1:])
    elif a[0] == 'check':
        sys.exit(1 if check(a[1:]) else 0)
    else:
        print(__doc__)
