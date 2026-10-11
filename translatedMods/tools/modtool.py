"""Generic Lang.txt mod pipeline.
  modtool.py tm                      -> rebuild translatedMods/tools/tm.tsv (vanilla + finished mods)
  modtool.py init  Group/Mod         -> work/{src.txt,items.tsv,todo.txt,auto.txt}
  modtool.py check Group/Mod         -> validate work/p*.txt against todo.txt
  modtool.py build Group/Mod         -> write CFG/Eng/Lang.txt (uses auto.txt + p*.txt)
"""
import re,sys,os,glob,collections
R=os.path.dirname(os.path.abspath(__file__))+'/../..'
T=R+'/translatedMods'; SRC=R+'/ToTranslate'
cyr=re.compile('[А-Яа-яЁё]')
PATHRE=re.compile(r'^Mods\\|\.(cmap|map|qmm|jpg|png|wav|ogg|dat|bmp)$',re.I)
tok=re.compile(r'<[^<>]*>|\{[^{}]*\}|\[p\d+\]|@[A-Za-z]|%[sd]|\\"')
SEP='\r\n'
def readu16(f):
    global SEP
    t=open(f,'rb').read().decode('utf-16').lstrip(chr(0xfeff))
    SEP='\r\n' if '\r\n' in t else '\n'
    return t.split(SEP)
def items(L):
    path=[];out=[]
    for i,l in enumerate(L):
        m=re.match(r'^\s*(\S+) [\^~]\{$',l)
        if m: path.append(m.group(1));continue
        if l.strip()=='}':
            if path: path.pop()
            continue
        if '=' in l:
            k,v=l.strip().split('=',1); out.append((i,'/'.join(path)+'/'+k,v))
    return out
def vok(v,e):
    if collections.Counter(tok.findall(v))!=collections.Counter(tok.findall(e)): return False
    if re.findall(r'\d+',v)!=re.findall(r'\d+',e): return False
    if not 0.3<len(e)/max(1,len(v))<3.5: return False
    return True
SAFE={'Назад','Да','Нет','Система','Системы','Ладно','Ладно...','Спасибо!','Рейнджер','Пират','Фрилансер','Тип:','Конец связи','Обычный','Отключен','Включен'}
def reauto(g):
    w=wd(g); tm={}
    for l in open(T+'/tools/tm.tsv',encoding='utf-8').read().split('\n'):
        if '\t' in l: a,b=l.split('\t',1); tm[a]=b
    todo,en,_=load(g); have=set(todo.values())
    L=readu16(SRC+'/'+g+'/CFG/Rus/Lang.txt'); seen=[]
    for i,p,v in items(L):
        if cyr.search(v) and v not in have and v not in seen: seen.append(v)
    open(w+'/auto.txt','w',encoding='utf-8').write('\n'.join(v+'\t'+tm[v] for v in seen if v in tm))
    print(g,'reauto',sum(1 for v in seen if v in tm),'not in todo and tm; cyr values outside todo and tm:',[v for v in seen if v not in tm][:3])
def items_idx(L):
    c=collections.Counter(); out=[]
    for i,p,v in items(L):
        c[p]+=1; out.append((i,p+'#'+str(c[p]),v))
    return out
def tm_build():
    d=collections.defaultdict(collections.Counter)
    rus=open(R+'/Translation/lore/source/SRHD_rus.txt',encoding='cp1251',errors='replace').read().replace('\r\n','\n').split('\n')
    eng=open(R+'/Translation/lore/source/SRHD_Lang_Eng_Vanilla.txt',encoding='cp1251',errors='replace').read().replace('\r\n','\n').split('\n')
    ie={p:v for _,p,v in items_idx(eng)}
    for _,p,v in items_idx(rus):
        if cyr.search(v) and p in ie and not cyr.search(ie[p]) and vok(v,ie[p]): d[v][ie[p]]+=2   # vanilla weight
    for f in ([] if os.environ.get('NOMODS') else glob.glob(T+'/*/*/CFG/Eng/Lang.txt')):
        a=items(readu16(f.replace('/Eng/','/Rus/').replace(T,SRC)));b=items(readu16(f))
        if len(a)!=len(b): continue
        for (_,p,v),(_,q,w) in zip(a,b):
            if cyr.search(v) and not cyr.search(w): d[v][w]+=1
    with open(T+'/tools/tm.tsv','w',encoding='utf-8') as o:
        for v,c in d.items(): o.write(v+'\t'+c.most_common(1)[0][0]+'\n')
    print('tm',len(d))
def wd(g): return T+'/'+g+'/work'
def init(g):
    L=readu16(SRC+'/'+g+'/CFG/Rus/Lang.txt'); w=wd(g); os.makedirs(w,exist_ok=True)
    it=[x for x in items(L) if cyr.search(x[2]) and not PATHRE.search(x[2])]
    tm={}
    if os.path.exists(T+'/tools/tm.tsv'):
        for l in open(T+'/tools/tm.tsv',encoding='utf-8').read().split('\n'):
            if '\t' in l: a,b=l.split('\t',1); tm[a]=b
    seen={};order=[]
    for i,p,v in it:
        if v not in seen: seen[v]=1; order.append((p,v))
    todo=[(p,v) for p,v in order if v not in tm]; auto=[(p,v) for p,v in order if v in tm]
    open(w+'/todo.txt','w',encoding='utf-8').write('\n'.join(f'{i+1}\t{v}' for i,(p,v) in enumerate(todo)))
    open(w+'/todo_paths.txt','w',encoding='utf-8').write('\n'.join(f'{i+1}\t{p}' for i,(p,v) in enumerate(todo)))
    open(w+'/auto.txt','w',encoding='utf-8').write('\n'.join(v+'\t'+tm[v] for p,v in auto))
    print(g,'cyr lines',len(it),'unique',len(order),'todo',len(todo),'auto(tm)',len(auto))
def load(g):
    w=wd(g); todo={}
    if os.path.exists(w+'/todo.txt') and open(w+'/todo.txt',encoding='utf-8').read().strip():
        for l in open(w+'/todo.txt',encoding='utf-8').read().split('\n'):
            n,v=l.split('\t',1); todo[int(n)]=v
    en={};bad=0
    for f in sorted(glob.glob(w+'/p*.txt')):
        for l in open(f,encoding='utf-8').read().split('\n'):
            if not l.strip(): continue
            n,v=l.split('\t',1); n=int(n)
            if n in en: print('DUP',n);bad+=1
            en[n]=v
    for n,v in list(en.items()):   # copy syntax: =M|from|to
        if v.startswith('='):
            a,f,t=v[1:].split('|'); en[n]=en[int(a)].replace(f,t,1)
    return todo,en,bad
def check(g):
    todo,en,bad=load(g)
    for n,v in en.items():
        r=todo.get(n)
        if r is None: print('NOID',n);bad+=1;continue
        if collections.Counter(tok.findall(r))!=collections.Counter(tok.findall(v)): print('TOK',n,tok.findall(r),tok.findall(v));bad+=1
        if cyr.search(v): print('CYR',n);bad+=1
        if '\t' in v: print('TAB',n);bad+=1
        if "'" in r and r.count("'")!=v.count("'"): print('QUOTE',n,r.count("'"),v.count("'"));bad+=1
    miss=[n for n in todo if n not in en]
    print(g,'done',len(en),'of',len(todo),'bad',bad,'missing',miss[:5])
def build(g):
    todo,en,bad=load(g); m={todo[n]:v for n,v in en.items()}
    w=wd(g)
    for fn in ('extra.txt','auto.txt'):
        if os.path.exists(w+'/'+fn):
            for l in open(w+'/'+fn,encoding='utf-8').read().split('\n'):
                if '\t' in l: a,b=l.split('\t',1); m.setdefault(a,b)
    L=readu16(SRC+'/'+g+'/CFG/Rus/Lang.txt'); miss=0
    for i,l in enumerate(L):
        if '=' in l and not re.match(r'^\s*\S+ [\^~]\{$',l):
            pre,v=l.split('=',1)
            if cyr.search(v) and not PATHRE.search(v):
                if v in m: L[i]=pre+'='+m[v]
                else: miss+=1
    out=T+'/'+g+'/CFG/Eng/Lang.txt'; os.makedirs(os.path.dirname(out),exist_ok=True)
    open(out,'wb').write(b'\xff\xfe'+SEP.join(L).encode('utf-16-le'))
    print(g,'built; untranslated',miss, 'cyr left', sum(1 for l in L if cyr.search(l) and not PATHRE.search(l.split('=',1)[-1])))
if __name__=='__main__':
    c=sys.argv[1]
    if c=='tm': tm_build()
    else: {'init':init,'check':check,'build':build,'reauto':reauto}[c](sys.argv[2])
