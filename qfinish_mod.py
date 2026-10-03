#!/usr/bin/env python3
"""qfinish_mod.py <Мод> <Name> <записей> <уникальных> "<примечание>" gl.txt lore_idx.txt lore.txt notes.txt < /dev/null
Оформление переведённого МОДОВОГО квеста: GLOSSARY_MODS.md (раздел), LORE_FACTS_MODS.md (строка индекса + раздел),
TextQuests/<Мод>/Eng/notes/<Name>_notes.txt, строка в STATUS.md, MANUAL в qstatus.py. Пустой файл/«-» = пропустить."""
import sys, os, datetime
mod, name, nrec, uniq, note = sys.argv[1:6]
def rd(p):
    return '' if p == '-' else open(p, encoding='utf-8').read().strip('\n')
gl, idx, lore, notes = (rd(p) for p in sys.argv[6:10])
d = datetime.date.today().isoformat()
if gl:
    p = 'Translation/GLOSSARY_MODS.md'; s = open(p, encoding='utf-8').read().rstrip('\n')
    open(p, 'w', encoding='utf-8').write(s + '\n\n' + gl + '\n')
if idx or lore:
    p = 'Translation/lore/LORE_FACTS_MODS.md'; s = open(p, encoding='utf-8').read()
    if idx:
        a = '\n## Cybersport'; assert a in s
        s = s.replace(a, idx + '\n' + a, 1)
    open(p, 'w', encoding='utf-8').write(s.rstrip('\n') + ('\n\n' + lore if lore else '') + '\n')
if notes:
    os.makedirs('TextQuests/%s/Eng/notes' % mod, exist_ok=True)
    open('TextQuests/%s/Eng/notes/%s_notes.txt' % (mod, name), 'w', encoding='utf-8').write(notes + '\n')
p = 'Translation/STATUS.md'; s = open(p, encoding='utf-8').read().rstrip('\n')
open(p, 'w', encoding='utf-8').write(s + '\n- %s %s/%s: %s записей (%s уникальных); %s\n' % (d, mod, name, nrec, uniq, note))
p = 'qstatus.py'; s = open(p, encoding='utf-8').read()
a = "    ('RevTextQuests', 'Cybersport'):"; assert a in s
k = "    ('%s', '%s'):" % (mod, name)
if k not in s:
    s = s.replace(a, k + " ('ПЕРЕВЕДЁН', '%s', 'да', 'переведён с RU (мод); check 0/0'),\n" % d + a, 1)
open(p, 'w', encoding='utf-8').write(s)
print('оформлено:', mod, name)
