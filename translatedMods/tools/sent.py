"""sent.py draft Group/Mod BaseMod [BaseMod...] : draft for work/todo.txt using sentence-level memory from BaseMod p-files.
   Output work/draft.txt ("n<TAB>EN" with [[RU]] for unknown sentences)."""
import sys,re,os
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import modtool as m
SP=re.compile(r'(?<=[.!?])\s+(?=[^\s])')
def split(t):
    return SP.split(t)
def mem(bases):
    tm={}; bad=0
    for b in bases:
        g='Reflection/'+b if '/' not in b else b
        todo,en,_=m.load(g)
        for n,r in todo.items():
            e=en.get(n)
            if e is None: continue
            a,c=split(r),split(e)
            if len(a)==len(c):
                for x,y in zip(a,c): tm.setdefault(x,y)
            else:
                tm.setdefault(r,e); bad+=1
    return tm,bad
def draft(g,bases):
    g='Reflection/'+g if '/' not in g else g
    tm,bad=mem(bases); print('sentence memory',len(tm),'misaligned paragraphs',bad)
    todo,_,_=m.load(g); out=[]; unk=0
    for n,r in todo.items():
        if r in tm: out.append(f'{n}\t{tm[r]}'); continue
        parts=[]; 
        for s in split(r):
            if s in tm: parts.append(tm[s])
            else: parts.append('[['+s+']]'); unk+=1
        sep=' '
        out.append(f'{n}\t'+sep.join(parts))
    open(m.wd(g)+'/draft.txt','w',encoding='utf-8').write('\n'.join(out))
    print('unknown sentences',unk)
if __name__=='__main__':
    if sys.argv[1]=='draft': draft(sys.argv[2],sys.argv[3:])
