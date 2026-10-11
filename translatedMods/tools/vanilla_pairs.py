"""Выравнивание ванильных РУ/EN ланг-файлов по ключам -> translatedMods/tools/vanilla_pairs.tsv (RU<TAB>EN, короткие значения).
  vanilla_pairs.py            строит таблицу
  vanilla_pairs.py Group/Mod  показывает строки todo мода, чей RU точно есть в ваниле (с EN из ваниле), и сравнивает с p00/частями
"""
import sys,os,re,glob,collections
R=os.path.abspath(os.path.join(os.path.dirname(__file__),'..','..'))
SRC=R+'/Translation/lore/source/'
def parse(path,enc):
    d={};st=[]
    for l in open(path,encoding=enc,errors='replace').read().split('\n'):
        l=l.rstrip('\r'); s=l.strip()
        if s.endswith('^{'): st.append(s[:-2].strip()); continue
        if s=='}': 
            if st: st.pop()
            continue
        if '=' in s: k,v=s.split('=',1); d['.'.join(st+[k])]=v
    return d
def build():
    ru=parse(SRC+'SRHD_rus.txt','cp1251'); en=parse(SRC+'SRHD_Lang_Eng_Vanilla.txt','utf-8')
    m=collections.defaultdict(collections.Counter)
    for k,v in ru.items():
        if k in en and re.search('[А-Яа-я]',v) and len(v)<=200: m[v][en[k]]+=1
    out=[]
    for v,c in m.items():
        e=c.most_common(1)[0][0].replace('\t',' '); out.append(f'{v.replace(chr(9),chr(32))}\t{e}\t{sum(c.values())}\t{len(c)}')
    open(R+'/translatedMods/tools/vanilla_pairs.tsv','w',encoding='utf-8').write('\n'.join(out)+'\n')
    print('pairs',len(out))
def show(g):
    sys.path.insert(0,os.path.dirname(__file__)); import modtool as M
    P={}
    for l in open(R+'/translatedMods/tools/vanilla_pairs.tsv',encoding='utf-8').read().split('\n'):
        if l:
            a=l.split('\t'); v=a[0]; e=a[1]; n=a[-2]; k=a[-1]; P[v]=(e,int(n),int(k))
    todo,en,_=M.load(g); w=M.wd(g); mine={}
    for f in glob.glob(w+'/p*.txt'):
        for l in open(f,encoding='utf-8').read().split('\n'):
            if '\t' in l: n,e=l.split('\t',1); mine[int(n)]=e
    for n,v in sorted(todo.items()):
        if v in P:
            e,c,k=P[v]; m=mine.get(n)
            flag='' if m is None else ('OK' if m==e else 'DIFF')
            print(f'{n}\t{v[:60]}\tVAN: {e[:60]}\t{"(x"+str(c)+("/"+str(k)+" variants" if k>1 else "")+")"}\t{flag} {"" if m is None or m==e else m[:60]}')
if len(sys.argv)>1: show(sys.argv[1])
else: build()
