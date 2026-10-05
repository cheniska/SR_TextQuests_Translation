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
  cond FILE.md...             — дописать к фактам с ссылками на Quest.*/GovGreetings/ShipGreetings/
                               RobotsMap пометку ⟨условия: …⟩ из полей ланга: планета-заказчик
                               не конкретная, а ЛЮБАЯ подходящая (раса, правление, экономика,
                               пиратский клан, статус игрока). Идемпотентно; запускать после merge.
  merge STAGE.txt            — разложить черновик по разделам свода. Строка черновика:
                               '@Раздел/Подраздел<TAB>- [факт] КР2. Текст. [SR2:ключ]'
                               Раздел — начало заголовка '## ' (Малоки, Доминаторы, Рейнджеры…),
                               Подраздел — начало '### ' внутри него (номер ветви '5' или слово);
                               '@PARODY/Игры', '@DOUBTS' — в соответствующие файлы.
                               Факт добавляется в конец общей части подраздела (перед первым
                               '#### '-блоком персонажа; в разделе с '### ' без подраздела —
                               перед первым '### '). Строка '#### Имя…' — в конец подраздела;
                               следующие за ней строки с тем же тегом — внутрь этого блока
                               (общие факты того же тега ставить ДО заголовка). Без '@' — пропуск.
"""
import os, re, sys, difflib

ROOT = os.path.dirname(os.path.abspath(__file__))
SRC = os.path.join(ROOT, 'Translation', 'lore', 'source')
OUT = os.path.join(ROOT, 'Translation', 'work', 'lore')
LANGS = ['SR1', 'SR2', 'SRHD']
# по одинаковому ключу сравниваем только КР2 и HD (HD — расширение КР2, номера совпадают);
# КР1 — другие квесты под теми же номерами
PAIR = {'SR2': ['SRHD'], 'SRHD': ['SR2'], 'SR1': []}
REF_RE = re.compile(r'\b(SR1|SR2|SRHD|TQ1|TQ2):([^\s;,\]\)]+)')
# текстовые квесты как «ланги»: TQ1 = КР1 (SR1TextQuests), TQ2 = SR2HD; ключ «Квест:Запись» (Bank:Loc1-1)
TQ = {'TQ1': os.path.join('TextQuests', 'SR1TextQuests', 'Rus'),
      'TQ2': os.path.join('TextQuests', 'SR2HD', 'questsRus')}
ALL = LANGS + list(TQ)


def parse_tq(lang):
    d = os.path.join(ROOT, TQ[lang])
    res = []
    for fn in sorted(os.listdir(d)):
        if not fn.endswith('.txt'):
            continue
        q = fn[:-4]
        raw = open(os.path.join(d, fn), 'rb').read().decode('utf-16').lstrip('\ufeff')
        for line in raw.split('\r\n'):
            k, sep, v = line.partition('\t')
            if not sep:
                continue
            if k == '*' and res and res[-1][0].startswith(q + ':'):
                res[-1][1] += ' ¶ ' + v
            elif k != '*':
                res.append([q + ':' + k, v])
    return res


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
    for lang in ALL:
        rows = parse_tq(lang) if lang in TQ else parse(lang)
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
                    best = None
                    for k2, v2 in bykey.get((l, base(k)), []):
                        r = difflib.SequenceMatcher(None, n, norm(v2), autojunk=False).ratio()
                        if best is None or r > best[0]:
                            best = (r, k2, v2)
                    if best:
                        r, k2, v2 = best
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
    for l in langs or ALL:
        for k, v in load(l):
            if r.search(v) or r.search(k):
                print('%s:%s\t%s' % (l, k, v))


def get(refs):
    data = {l: dict(load(l)) for l in ALL}
    for ref in refs:
        l, _, k = ref.partition(':')
        print('%s\t%s' % (ref, data.get(l, {}).get(k, '!!! НЕТ ТАКОГО КЛЮЧА')))


def check(files):
    data = {l: set(k for k, _ in load(l)) for l in ALL}
    bad = total = 0
    for fn in files:
        for i, line in enumerate(open(fn, encoding='utf-8'), 1):
            line = line.split(' ' + COND_MARK)[0]   # пометка условий — не ссылки
            for l, k in REF_RE.findall(line):
                k = k.rstrip('.')
                if '.' not in k:   # пример формата в шапке ('SR2:ключ')
                    continue
                total += 1
                if k not in data[l]:
                    bad += 1
                    print('%s:%d: нет ключа %s:%s' % (fn, i, l, k))
    # 'SR2, SRHD:ключ' допустимо только если тексты КР2 и HD под этим ключом совпадают
    txt = {l: dict(load(l)) for l in ('SR2', 'SRHD')}
    dual = 0
    for fn in files:
        for i, line in enumerate(open(fn, encoding='utf-8'), 1):
            line = line.split(' ' + COND_MARK)[0]
            for k in re.findall(r'SR2, SRHD:([^\s;,\]\)]+)', line):
                k = k.rstrip('.')
                if '.' not in k:
                    continue
                a, b = norm(txt['SR2'].get(k, '')), norm(txt['SRHD'].get(k, ''))
                if not a or a != b:
                    dual += 1
                    print('%s:%d: «SR2, SRHD:%s» — тексты КР2 и HD различаются, нужны раздельные ссылки' % (fn, i, k))
    # каждый факт (пункт с меткой, «Раскрыто…», «Варианты…», пародия «- КР…») — со ссылкой на ланг
    noref = 0
    fact_re = re.compile(r'- (\[|Раскрыто|Варианты|КР[12])')
    for fn in files:
        if 'SUMMARY' in fn:   # обзор-выжимка без ссылок, ссылки — в полном своде
            continue
        sec, code = '', False
        for i, line in enumerate(open(fn, encoding='utf-8'), 1):
            if line.startswith('```'):
                code = not code
            if line.startswith('#'):
                sec = line
            aux = ('PARODY' in fn or 'DOUBTS' in fn) and sec.startswith('## ') and line.startswith('- ')
            if code or sec.startswith(('## Правила', '## Прогресс')) or not (fact_re.match(line) or aux):
                continue
            if not REF_RE.search(line.split(' ' + COND_MARK)[0]):
                noref += 1
                print('%s:%d: факт без ссылки: %s' % (fn, i, line.strip()[:100]))
    print('ссылок: %d, битых: %d, ошибочных двойных: %d, фактов без ссылки: %d' % (total, bad, dual, noref))
    return bad + dual + noref


# ---------- условия записей (планета-заказчик не конкретная, а любая подходящая) ----------
COND_MARK = '⟨условия:'
_RACE = {'Maloc': 'малоки', 'Peleng': 'пеленги', 'People': 'люди', 'Fei': 'фэяне', 'Gaal': 'гаальцы'}
_RACE_ADJ = {'Maloc': 'малокская', 'Peleng': 'пеленгская', 'People': 'людская', 'Fei': 'фэянская', 'Gaal': 'гаальская'}
_GOV = {'Democracy': 'демократия', 'Republic': 'республика', 'Monarchy': 'монархия',
        'Dictatorship': 'диктатура', 'Anarchy': 'анархия'}
_ECO = {'Mixed': 'смешанная', 'Industrial': 'индустриальная', 'Agriculture': 'аграрная'}
_STATUS = {'Warrior': 'воин', 'Trader': 'торговец', 'Pirate': 'пират'}
_SHIP = {'Ranger': 'рейнджер', 'Diplomat': 'дипломат', 'Transport': 'транспорт', 'Liner': 'лайнер',
         'Pirate': 'пират', 'Pirat': 'пират', 'Warrior': 'военный'}
_ALL5 = {'Maloc', 'Peleng', 'People', 'Fei', 'Gaal'}
_COND_REF = re.compile(r'((?:SR1|SR2|SRHD)(?:, (?:SR1|SR2|SRHD))*):([^\s;,\]\)]+)')
_REC = re.compile(r'^(Quest\.(?:DefShip|KillShip|DefSystem|SendLetter)\.\d+|GovGreetings\.\d+|ShipGreetings\.\d+|RobotsMap\.\d+)\.')


def _vals(v):
    return [x.strip() for x in v.split(',') if x.strip()]


def _planet(rec, races, gov=None, eco=None, clan=None, word='планета'):
    """«любая пеленгская планета (диктатура…)»"""
    rr = [r for r in races if r in _RACE]
    nonpir = 'OnlyNonPirate' in races or clan == ['No']
    if not rr or set(rr) == _ALL5:
        s = 'любая %s' % word if not rr or set(rr) == _ALL5 else ''
        s = 'любая %s любой расы' % word if set(rr) == _ALL5 else 'любая %s' % word
    elif len(rr) == 1:
        s = 'любая %s %s' % (_RACE_ADJ[rr[0]], word)
    else:
        s = 'любая %s расы: %s' % (word, ', '.join(_RACE[r] for r in rr))
    extra = []
    if gov:
        extra.append('правление — ' + '/'.join(_GOV.get(g, g) for g in gov))
    if eco:
        extra.append('экономика — ' + '/'.join(_ECO.get(e, e) for e in eco))
    if nonpir:
        extra.append('не под пиратами')
    elif clan == ['Yes']:
        extra.append('под властью пиратского клана')
    return s + (' (%s)' % '; '.join(extra) if extra else '')


def _cond_text(rec, f):
    """f — поля записи {поле: значение}; возвращает строку условий или ''."""
    g = lambda k: [x for x in _vals(f.get(k, '')) if x != 'Any']
    parts = []
    if rec.startswith('Quest.'):
        typ = rec.split('.')[1]
        if typ == 'SendLetter':
            parts.append('заказчик — ' + _planet(rec, g('FromRace')))
            if g('ToRace'):
                parts.append('получатель — ' + _planet(rec, g('ToRace')))
        else:
            parts.append('заказчик — ' + _planet(rec, _vals(f.get('PlanetRace', 'Any'))))
            if g('ShipRace') and set(g('ShipRace')) != _ALL5:
                parts.append('раса корабля-цели: ' + ', '.join(_RACE.get(r, r) for r in g('ShipRace')))
    elif rec.startswith('GovGreetings.'):
        parts.append('говорит правительство — ' + _planet(rec, g('CurPlanetRace'), g('CurPlanetGoverment'),
                                                        g('CurPlanetEconomy'), _vals(f.get('CurPlanetPirateClan', '')) or None))
    elif rec.startswith('ShipGreetings.'):
        who = 'любой корабль'
        if g('ShipType') and len(set(g('ShipType'))) < 5:
            who = 'корабль: ' + '/'.join(dict.fromkeys(_SHIP.get(t, t) for t in g('ShipType')))
        if g('ShipRace') and set(g('ShipRace')) != _ALL5:
            who += ', раса — ' + ', '.join(_RACE.get(r, r) for r in g('ShipRace'))
        parts.append('говорит ' + who)
        if g('LastPlanetRace') or g('LastPlanetGoverment') or g('LastPlanetEconomy'):
            parts.append('прилетел с планеты — ' + _planet(rec, g('LastPlanetRace'), g('LastPlanetGoverment'), g('LastPlanetEconomy')))
    elif rec.startswith('RobotsMap.'):
        parts.append('планета — ' + _planet(rec, _vals(f.get('PlanetRace', 'Any'))))
    st = g('Status') or g('PlayerStatus')
    if st:
        parts.append('игрок — ' + '/'.join(_STATUS.get(x, x) for x in st))
    if g('PlayerRace'):
        parts.append('раса игрока — ' + ', '.join(_RACE.get(r, r) for r in g('PlayerRace')))
    if f.get('DominatorsAlreadyDefeated') == 'Yes':
        parts.append('после победы над доминаторами')
    if f.get('CoalitionAlreadyDefeated') == 'Yes':
        parts.append('после падения Коалиции')
    return '; '.join(parts)


def cond(files):
    """Дописывает к фактам с ссылками на квесты/приветствия/планетарные бои пометку
    ⟨условия: …⟩ из полей ланга (идемпотентно: старая пометка заменяется)."""
    fields = {}
    for l in LANGS:
        d = {}
        for k, v in load(l):
            m = _REC.match(k)
            if m and len(v) < 120:
                d.setdefault(m.group(1), {})[k[len(m.group(1)) + 1:]] = v
        fields[l] = d
    n = 0
    for fn in files:
        lines = open(fn, encoding='utf-8').read().split('\n')
        for i, line in enumerate(lines):
            base = line.split(' ' + COND_MARK)[0]
            seen = {}
            for langs, k in _COND_REF.findall(re.sub(r'`[^`]*`', '', base)):   # примеры в `...` — не ссылки
                m = _REC.match(k.rstrip('.') + '.')
                if not m:
                    continue
                rec = m.group(1)
                for l in langs.split(', '):
                    f = fields[l].get(rec)
                    if f is None:
                        continue
                    t = _cond_text(rec, f)
                    if t:
                        seen.setdefault(t, []).append('%s:%s' % (l, rec.split('.', 1)[1] if rec.startswith('Quest.') else rec))
            if seen:
                if len(seen) == 1:
                    tag = ' %s %s⟩' % (COND_MARK, next(iter(seen)))
                else:
                    tag = ' %s %s⟩' % (COND_MARK, ' | '.join('%s — %s' % (', '.join(dict.fromkeys(v)), t) for t, v in seen.items()))
                new = base + tag
            else:
                new = base
            if new != line:
                lines[i] = new
                n += 1
        open(fn, 'w', encoding='utf-8').write('\n'.join(lines))
    print('строк с обновлёнными условиями: %d' % n)

LORE = os.path.join(ROOT, 'Translation', 'lore')
FILES = {'': 'GALAXY_LORE.md', 'PARODY': 'GALAXY_LORE_PARODY.md', 'DOUBTS': 'GALAXY_LORE_DOUBTS.md',
         # лор текстовых квестов (канон: КР1 + SR2HD)
         'TQ': 'LORE_FACTS.md', 'TQPARODY': 'LORE_FACTS_PARODY.md', 'TQDOUBTS': 'LORE_FACTS_DOUBTS.md'}


def _insert(lines, path, text, after=None):
    """Вставка строки в раздел. Общий факт — перед первым блоком персонажа (####)
    раздела; заголовок #### — в конец раздела; строка блока (after=индекс
    предыдущей строки этого блока) — сразу за ней. Возвращает индекс или None."""
    if after is not None:
        lines.insert(after + 1, text)
        return after + 1
    sec = path[0].strip() if path else ''
    sub = path[1].strip() if len(path) > 1 else ''
    start = 0
    if sec:
        cand = [i for i, l in enumerate(lines) if l.startswith('## ') and l[3:].lower().startswith(sec.lower())]
        if not cand:
            cand = [i for i, l in enumerate(lines) if l.startswith('## ') and sec.lower() in l.lower()]
        if not cand:
            return None
        start = cand[0]
    end = len(lines)
    for j in range(start + 1, len(lines)):
        if lines[j].startswith('## ') or lines[j].startswith('# '):
            end = j
            break
    if sub:
        cand = [i for i in range(start + 1, end) if lines[i].startswith('### ')
                and (lines[i][4:].lower().startswith(sub.lower() + '.') or lines[i][4:].lower().startswith(sub.lower()))]
        if not cand:
            return None
        start = cand[0]
        for j in range(start + 1, end):
            if lines[j].startswith('#') and not lines[j].startswith('#### '):
                end = j
                break
    elif any(lines[j].startswith('### ') for j in range(start + 1, end)):
        end = next(j for j in range(start + 1, end) if lines[j].startswith('### '))
    if not text.startswith('#### '):
        blk = [j for j in range(start + 1, end) if lines[j].startswith('#### ')]
        if blk:
            end = blk[0]
    k = end
    while k > start + 1 and lines[k - 1].strip() == '':
        k -= 1
    lines.insert(k, text)
    return k


def merge(stage):
    docs = {}
    bad = n = 0
    last = None
    for raw in open(stage, encoding='utf-8'):
        raw = raw.rstrip('\n')
        if not raw.startswith('@'):
            last = None
            continue
        tag, _, text = raw.partition('\t')
        path = tag[1:].split('/')
        fkey = path[0] if path[0] in FILES and path[0] else ''
        if fkey:
            path = path[1:]
        fn = os.path.join(LORE, FILES[fkey])
        if fn not in docs:
            docs[fn] = open(fn, encoding='utf-8').read().split('\n')
        if fkey in ('DOUBTS', 'TQDOUBTS') and not path:
            path = ['Пункты']
        after = last[2] if last and last[0] == tag and not text.startswith('#') else None
        k = _insert(docs[fn], path, text, after)
        if k is not None:
            n += 1
            # строки блока персонажа (####) идут следом за ним, пока тег тот же
            last = (tag, fn, k) if text.startswith('#### ') or after is not None else None
        else:
            last = None
            bad += 1
            print('!!! раздел не найден:', tag, text[:60])
    for fn, lines in docs.items():
        open(fn, 'w', encoding='utf-8').write('\n'.join(lines))
    print('добавлено: %d, не найдено разделов: %d' % (n, bad))
    cond(list(docs))   # пометки ⟨условия: …⟩ у новых фактов
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
    elif a[0] == 'merge':
        sys.exit(1 if merge(a[1]) else 0)
    elif a[0] == 'cond':
        cond(a[1:])
    elif a[0] == 'check':
        sys.exit(1 if check(a[1:]) else 0)
    else:
        print(__doc__)
