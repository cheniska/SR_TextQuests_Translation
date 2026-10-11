"""Сверка всего корпуса EN с глоссарием: устаревшие формы -> итоговые. 
  python3 qglossfix.py scan            -> счётчики по файлам
  python3 qglossfix.py fix [--mods]    -> правка TextQuests Eng (UTF-16) и work/p*.txt модов (потом modtool build)"""
import re,sys,os,glob,collections
R=os.path.dirname(os.path.abspath(__file__))
# (шаблон, замена) — применяется без учёта регистра, регистр первой буквы сохраняется
RULES0=[
 (r'mach?pella(s?)',r'makhpella\1'),(r'mahpella(s?)',r'makhpella\1'),
 (r'\bpenchekryak(?:us)?(es|s)?\b',lambda m:'penchecrakus'+('es' if (m.group(1) or '') in ('es','s') else '')),
 (r'penchequack','penchecrakus'),(r'gobzaur(us|i|uses)',r'gobsaur\1'),
 (r'\bgobsaur(s?)\b',lambda m:'gobsaurus'+('es' if m.group(1) else '')),
 (r'\bpelengan(s?)\b',r'peleng\1'),
 (r'hach-?ball','hatchball'),(r'hatch-ball','hatchball'),(r'hach-hryap','hatch-hryap'),
 (r'\bdalany\b','dalani'),(r'\bheldas\b','helldas'),(r'stereovisor','stereovision'),
 (r'kindza','kinza'),(r'kwanga','quanga'),(r'borzuhan','Borzukhan'),(r'rachehan','Rachekhan'),
 (r'dzukhallag','Dzuhallag'),(r'zhupei','Zoopie'),(r'yanvelb(?!a)|janwelb','ekup'),(r'aipentac?k','Eipentak'),
 (r'\bstoolie(s?)\b',lambda m:'snitch'+('es' if m.group(1) else '')),
 (r'\bcut-throat(s?)\b',r'cutthroat\1'),(r'(?<![a-z])galactic council','Galaxy Council'),
 (r'\bflyer(s?)\b',r'flier\1'),(r'nanitode(s?)',r'nanitoid\1'),(r'mentoprobe','menthoprobe'),
 (r'hyper-jumping','hyperjumping'),(r'encyclopaedi','encyclopedi'),
 (r'colour','color'),(r'armour','armor'),(r'manoeuvr','maneuver'),(r'theatre','theater'),(r'(?<![a-z])centre','center'),
 (r'\bgrey','gray'),(r'(\w+)isation',r'\1ization'),(r'pasteuris','pasteuriz'),(r'colonis','coloniz'),(r'civilis','civiliz'),
 (r'favour','favor'),(r'honour','honor'),(r'neighbour','neighbor'),(r'defence','defense'),
]
def _case(m,rep):
    r=rep(m) if callable(rep) else m.expand(rep)
    t=m.group(0)
    if t.isupper() and len(t)>2: return r.upper()
    if t[:1].isupper(): return r[:1].upper()+r[1:]
    return r
RULES=[(re.compile(p,re.I),(lambda m,rep=r:_case(m,rep))) for p,r in RULES0]
US=[]
def files():
    f=[]
    for p in glob.glob(R+'/TextQuests/*/*/*.txt')+glob.glob(R+'/TextQuests/*/*.txt'):
        if '/Rus/' in p or '/questsRus/' in p or '/notes/' in p or 'readme' in p: continue
        if '/Eng/' in p or '/questsEng/' in p: f.append(p)
    f=[x for x in f if not os.path.basename(x).startswith(('Cybersport.txt','Massacri.txt'))]
    m=glob.glob(R+'/translatedMods/*/*/work/p*.txt')+glob.glob(R+'/translatedMods/*/*/work/auto.txt')+glob.glob(R+'/translatedMods/*/*/work/extra.txt')+[R+'/translatedMods/tools/tm.tsv']
    return f,m
def rd(p):
    b=open(p,'rb').read()
    if b[:2]==b'\xff\xfe': return b.decode('utf-16'),'u16'
    return b.decode('utf-8'),'u8'
def wr(p,s,k):
    open(p,'wb').write((b'\xff\xfe'+s.encode('utf-16-le')) if k=='u16' else s.encode('utf-8'))
TOKRX=re.compile(r'(<[^<>]*>|\{[^{}]*\}|\[[^\[\]]*\]|Mods\\[^\s\t]*|[A-Za-z0-9_\\/.-]+\.(?:cmap|map|qmm|jpg|png|wav|ogg|dat|bmp))')
def apply(s,rules,count=None):
    n=0;parts=TOKRX.split(s)
    for i in range(0,len(parts),2):
        for rx,fn in rules:
            parts[i],k=rx.subn(fn,parts[i]); n+=k
    return ''.join(parts),n
if __name__=='__main__':
    q,m=files(); mode=sys.argv[1]; rules=RULES
    tot=collections.Counter(); per=collections.defaultdict(int)
    for p in q+(m if True else []):
        s,k=rd(p); t,n=apply(s,rules)
        if n:
            per[p]=n
            if mode=='fix':
                if '/work/' in p and '--mods' not in sys.argv: continue
                wr(p,t,k)
    # детализация по правилам
    det=collections.Counter()
    for p in q+m:
        s,k=rd(p)
        for rx,fn in rules:
            c=len(rx.findall(s)); 
            if c: det[rx.pattern[:30]]+=c
    for k,v in det.most_common(): print(v,k)
    print('файлов с правками:',len(per),'всего замен:',sum(per.values()))
