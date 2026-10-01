"""qtr_sbs.py <RU.txt> <EN.txt> <from> <to>
Показывает построчно RU и EN для уникальных (по RU) записей с номера from до to.
Запуск: py -3.14 qtr_sbs.py ru.txt en.txt 0 30 < /dev/null   (вывод большой - лучше в файл и читать Read-ом)"""
import sys
sys.path.insert(0, 'E:/disasm2500/QUESTS')
import qtr

ru_p, en_p, a, b = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4])
ru = qtr.records(qtr.read_tge(ru_p))
en = qtr.records(qtr.read_tge(en_p)) if not en_p.endswith('.work.txt') else qtr.records(open(en_p, encoding='utf-8').read())
seen, u = set(), []
for (t, r), (_, e) in zip(ru, en):
    if r in seen:
        continue
    seen.add(r)
    u.append((t, r, e))
for t, r, e in u[a:b]:
    print('##', t)
    print('RU:', r.replace('\n', ' ¶ '))
    print('EN:', e.replace('\n', ' ¶ '))
print('-- total unique', len(u))
