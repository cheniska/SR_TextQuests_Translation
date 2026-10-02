r"""Проверка кусков перевода: py -3.14 qtr_partcheck.py <Name>   (запускать из QUESTS, < /dev/null)
Сверяет Translation\work\<Name>.pNN.txt с <Name>.todo.txt по порядку: типы, токены разметки,
число строк в записи, остатки кириллицы."""
import sys, glob
sys.path.insert(0, '.')
import qtr
name = sys.argv[1]
todo = qtr.records(qtr.read_tge('Translation/work/%s.todo.txt' % name))
en = []
for f in sorted(glob.glob('Translation/work/%s.p[0-9][0-9].txt' % name)):
    en += qtr.records(qtr.read_tge(f))
print('записей в кусках', len(en), 'из', len(todo))
bad = 0
for i, ((t, a), (t2, b)) in enumerate(zip(en, todo)):
    if t != t2:
        print('ТИП не совпал на', i, t, t2); bad += 1; break
    ta, tb = qtr.toks_pair(a, b)
    if ta != tb:
        print(t, 'токены', dict(tb - ta), dict(ta - tb)); bad += 1
    if qtr.CYR.search(a):
        print(t, 'кириллица', a[:50]); bad += 1
    if a.count('\n') != b.count('\n'):
        print(t, 'строк', b.count('\n') + 1, '->', a.count('\n') + 1); bad += 1
print('проблем', bad)
