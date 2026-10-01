# -*- coding: utf-8 -*-
# Эвристика: время глаголов в русских записях. Запуск: py -3.14 tense.py <Rus.txt> [min_total] < /dev/null
import sys, re
sys.path.insert(0, r'E:\disasm2500\QUESTS')
raw = open(sys.argv[1], 'rb').read().decode('utf-16')
recs = []
for line in raw.replace('\r\n', '\n').split('\n'):
    if not line:
        continue
    if '\t' not in line:
        continue
    t, x = line.split('\t', 1)
    if t == '*' and recs:
        recs[-1][1] += ' ' + x
    else:
        recs.append([t, x])
PAST = re.compile(r'\b[а-яё]{2,}(?:л|ла|ло|ли)(?:ся|сь)?\b')
PRES = re.compile(r'\b[а-яё]{2,}(?:ешь|ёшь|ете|ёте|ет|ёт|ут|ют|ит|ат|ят|ется|ётся|ются|ятся|ится|атся)\b')
STOP = set('стол угол ствол вол орёл осёл козёл котёл весёл квартал шквал металл идеал канал портал сигнал финал журнал персонал арсенал вокзал зал зала залы идеалы метал мол мало мал было дало ушло'.split())
STOPP = set('нет свет ответ секрет бред привет совет паёт ает навет рассвет кабинет балет билет пакет планет планет сюжет аппарат автомат солдат отряд брат ряд ряд оклад подарок'.split())
mt = int(sys.argv[2]) if len(sys.argv) > 2 else 3
out = []
for t, x in recs:
    if t.startswith('Path') and not t.endswith('b') and '-par' not in t and '-crit' not in t:
        continue  # кнопки выбора
    xl = x.lower()
    p = [w for w in PAST.findall(xl) if w not in STOP]
    n = [w for w in PRES.findall(xl) if w not in STOPP]
    if len(p) + len(n) < mt:
        continue
    out.append((t, len(p), len(n)))
for t, p, n in out:
    tag = 'PAST' if n == 0 else ('PRES' if p == 0 else ('mix-p' if p >= 2 * n else ('mix-n' if n >= 2 * p else 'MIX')))
    print('%-22s past=%-3d pres=%-3d %s' % (t, p, n, tag))
