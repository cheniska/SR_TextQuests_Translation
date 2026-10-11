"""sent.py draft Group/Mod BaseMod [BaseMod...] : draft for work/todo.txt using sentence-level memory from BaseMod p-files.
   Output work/draft.txt ("n<TAB>EN" with [[RU]] for unknown sentences)."""
import sys,re,os,collections
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
import math
def align(a,c):
    n,mm=len(a),len(c); INF=1e9; SK=1.2
    D=[[INF]*(mm+1) for _ in range(n+1)]; B=[[None]*(mm+1) for _ in range(n+1)]; D[0][0]=0
    for i in range(n+1):
        for j in range(mm+1):
            if D[i][j]>=INF: continue
            if i<n and D[i+1][j]>D[i][j]+SK: D[i+1][j]=D[i][j]+SK; B[i+1][j]=(i,j,0)
            if j<mm and D[i][j+1]>D[i][j]+SK: D[i][j+1]=D[i][j]+SK; B[i][j+1]=(i,j,0)
            if i<n and j<mm:
                r=len(c[j])/max(1,len(a[i])); cst=abs(math.log(r))
                if 0.6<r<2.0 and D[i+1][j+1]>D[i][j]+cst: D[i+1][j+1]=D[i][j]+cst; B[i+1][j+1]=(i,j,1)
    i,j=n,mm; out=[]
    while (i,j)!=(0,0):
        pi,pj,t=B[i][j]
        if t: out.append((a[pi],c[pj]))
        i,j=pi,pj
    return out[::-1]
def vmem():
    tm={}
    rus=open(m.R+'/Translation/lore/source/SRHD_rus.txt',encoding='cp1251',errors='replace').read().replace('\r\n','\n').split('\n')
    eng=open(m.R+'/Translation/lore/source/SRHD_Lang_Eng_Vanilla.txt',encoding='cp1251',errors='replace').read().replace('\r\n','\n').split('\n')
    ie={p:v for _,p,v in m.items_idx(eng)}
    for _,p,v in m.items_idx(rus):
        e=ie.get(p)
        if e is None or not m.cyr.search(v) or m.cyr.search(e): continue
        a,c=split(v),split(e)
        pairs=zip(a,c) if len(a)==len(c) else align(a,c) if len(a)<=40 and len(c)<=40 else []
        for x,y in pairs:
            if m.cyr.search(x) and collections.Counter(m.tok.findall(x))==collections.Counter(m.tok.findall(y)): tm.setdefault(x,y)
    return tm
def draft(g,bases):
    g='Reflection/'+g if '/' not in g else g
    tm,bad=mem(bases); vm=vmem(); tm.update(vm); print('sentence memory',len(tm),'(vanilla',len(vm),') misaligned paragraphs',bad)
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
