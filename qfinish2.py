# qfinish2.py <Name> <записей> <уникальных> "<примечание STATUS>" gl.txt lore_index.txt lore.txt notes.txt — оформление переведённого квеста SR2HD Untranslated (глоссарий, лор, notes, STATUS, MANUAL в qstatus.py). Запуск: python3 qfinish2.py ... < /dev/null
import sys, re
name, nrec, uniq, statusnote, gl, lore_idx, lore, notes = [open(f, encoding='utf-8').read() if i > 3 else f for i, f in enumerate(sys.argv[1:])]
p = 'Translation/GLOSSARY.md'; g = open(p, encoding='utf-8').read(); open(p, 'w', encoding='utf-8').write(g.rstrip('\n') + '\n\n' + gl.strip('\n') + '\n')
p = 'Translation/lore/LORE_FACTS.md'; s = open(p, encoding='utf-8').read()
a = '- **Bank** (КР1, SR1TextQuests):'; assert a in s
s = s.replace(a, lore_idx.strip('\n') + '\n' + a, 1); open(p, 'w', encoding='utf-8').write(s.rstrip('\n') + '\n\n' + lore.strip('\n') + '\n')
open('TextQuests/SR2HD/questsEng/notes/%s_notes.txt' % name, 'w', encoding='utf-8').write(notes)
p = 'Translation/STATUS.md'; s = open(p, encoding='utf-8').read()
lines = s.split('\n')
for k, l in enumerate(lines):
    if l.startswith('## SR2HD Untranslated'):
        m = k + 1
        while m < len(lines) and lines[m].strip():
            items = [x.strip() for x in lines[m].split(',')]
            items = [x for x in items if x and x != name]
            lines[m] = ', '.join(items) + (',' if lines[m].rstrip().endswith(',') else '')
            m += 1
s = '\n'.join(lines)
lines = s.split('\n'); i = lines.index('## Журнал выполненных')
j = i + 1
while j < len(lines) and (lines[j].startswith('|') or j <= i + 1): j += 1
lines.insert(j, '| %s | 2026-10-02 | %s (%s уникальных) | %s |' % (name, nrec, uniq, statusnote))
open(p, 'w', encoding='utf-8').write('\n'.join(lines))
p = 'qstatus.py'; s = open(p, encoding='utf-8').read()
a = "    ('SR2HD', 'Moi'):"; assert a in s
s = s.replace(a, "    ('SR2HD', '%s'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),\n" % name + a)
open(p, 'w', encoding='utf-8').write(s)
