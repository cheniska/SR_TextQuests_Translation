# qfinish.py <Name> <записей> <уникальных> "<примечание STATUS>" gl.txt lore_index.txt lore.txt notes.txt — оформление переведённого квеста КР1 (глоссарий, лор, notes, STATUS, MANUAL в qstatus.py, CLAUDE.md). Запуск: python3 qfinish.py ... < /dev/null
import sys
name, nrec, uniq, statusnote, gl, lore_idx, lore, notes = [open(f,encoding='utf-8').read() if i>3 else f for i,f in enumerate(sys.argv[1:])]
p='Translation/GLOSSARY.md'; g=open(p,encoding='utf-8').read(); open(p,'w',encoding='utf-8').write(g.rstrip('\n')+'\n\n'+gl.strip('\n')+'\n')
p='Translation/lore/LORE_FACTS.md'; s=open(p,encoding='utf-8').read()
a='- **Fishing** (КР1, SR1TextQuests):'; assert a in s
s=s.replace(a,lore_idx.strip('\n')+'\n'+a,1); open(p,'w',encoding='utf-8').write(s.rstrip('\n')+'\n\n'+lore.strip('\n')+'\n')
open('TextQuests/SR1TextQuests/Eng/notes/%s_notes.txt'%name,'w',encoding='utf-8').write(notes)
p='Translation/STATUS.md'; s=open(p,encoding='utf-8').read()
import re
s=re.sub(r'(Очередь \(актуально на [^)]*\): )([^\n]*)', lambda m: m.group(1)+', '.join(x for x in m.group(2).rstrip('.').split(', ') if x!=name)+'.', s)
s=re.sub(r' %s [0-9+]+,'%name,'',s)
s=s.rstrip('\n')+'\n| %s | 2026-10-02 | %s (%s уникальных) | переведён заново с RU | %s |\n'%(name,nrec,uniq,statusnote)
open(p,'w',encoding='utf-8').write(s)
p='qstatus.py'; s=open(p,encoding='utf-8').read()
a="    ('SR1TextQuests', 'Fishing'):"; assert a in s
s=s.replace(a,"    ('SR1TextQuests', '%s'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),\n"%name+a)
open(p,'w',encoding='utf-8').write(s)
p='CLAUDE.md'; s=open(p,encoding='utf-8').read()
m=re.search(r'готово (\d+) из 25 \(([^)]*)\)',s)
s=s.replace(m.group(0),'готово %d из 25 (%s, %s)'%(int(m.group(1))+1,m.group(2),name))
s=re.sub(r' %s [0-9+]+,'%name,'',s); s=re.sub(r', %s [0-9+]+\.'%name,'.',s)
open(p,'w',encoding='utf-8').write(s)
