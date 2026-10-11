"""Подстановка старого перевода Redux (reference/ReduxOld/pairs.tsv) в todo мода — с проверкой.
  oldsub.py Group/Mod   (после modtool.py init) -> work/p00.txt (подставлено) + work/oldsub_report.txt (отложено и почему)
Подставляется, если: RU неизменён (pairs.tsv), токены/числа/апострофы как в RU (vok+QUOTE), нет кириллицы,
нет известных устаревших терминов, раса не с заглавной посреди фразы. Остальное — на ручной перевод."""
import sys,os,re,collections
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import modtool as M
SHORT=60
BAD=[r'Zhupe',r'yanvelb',r'Yanvelb']
RACE=re.compile(r'(?<=[a-z,;] )(Peleng|Maloq|Faeyan|Gaal|Gaalian|Human|Klissan|Dominator)s?\b')
def main(g):
    pairs={}
    for l in open(M.R+'/reference/ReduxOld/pairs.tsv',encoding='utf-8').read().split('\n'):
        if '\t' in l: a,b=l.split('\t',1); pairs[a]=b
    w=M.wd(g)
    if os.path.exists(w+'/p00.txt'): os.remove(w+'/p00.txt')
    todo,en,_=M.load(g); out=[]; rep=[]; hints=[]
    for n,v in sorted(todo.items()):
        if n in en or v not in pairs: continue
        e=pairs[v]; why=None
        if not M.vok(v,e): why='токены/числа/длина'
        elif M.cyr.search(e): why='кириллица'
        elif "'" in v and v.count("'")!=e.count("'"): why='апострофы'
        elif '\t' in e: why='tab'
        elif any(re.search(b,e) for b in BAD): why='устаревший термин'
        elif RACE.search(e): why='раса с заглавной'
        if why: rep.append(f'{n}\t{why}\t{v[:70]} => {e[:70]}')
        elif len(v)>SHORT or re.search(r'[.!?]',v): hints.append(f'{n}\t{v}\t{e}')
        else: out.append(f'{n}\t{e}')
    open(w+'/p00.txt','w',encoding='utf-8').write('\n'.join(out)+('\n' if out else ''))
    open(w+'/old_hints.txt','w',encoding='utf-8').write('\n'.join(hints))
    open(w+'/oldsub_report.txt','w',encoding='utf-8').write('\n'.join(rep))
    print(g,'todo',len(todo),'substituted',len(out),'hints(long, to review)',len(hints),'deferred(unsafe)',len(rep))
main(sys.argv[1])
