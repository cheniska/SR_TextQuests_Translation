"""gl.py Mod [Mod...]: glossary hits for RU texts of mods; flags rows whose EN is absent from our translation (if built)."""
import sys,re,os
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import modtool as m
rows=[]
for f in ['Translation/GLOSSARY.md','Translation/GLOSSARY_MODS.md']:
    for l in open(m.R+'/'+f,encoding='utf-8'):
        c=[x.strip() for x in l.split('|')]
        if len(c)<4 or not m.cyr.search(c[1]): continue
        ru,en=c[1],c[2]
        for t in re.split(r'[;,/]| или ',ru):
            t=t.strip(' «»"')
            if len(t)>=4 and m.cyr.search(t): rows.append((t,en))
for g in sys.argv[1:]:
    g='Reflection/'+g if '/' not in g else g
    todo,en,_=m.load(g)
    txt='\n'.join(todo.values()); low=txt.lower()
    eng='\n'.join(en.values()).lower()
    seen=set()
    for t,e in rows:
        s=t.lower(); s=s[:max(4,len(s)-2)] if len(s)>5 else s
        if re.search(r'(?<![а-яё])'+re.escape(s),low) and (t,e) not in seen:
            seen.add((t,e)); print(f'{g.split("/")[1]}: {t} => {e[:90]}')
