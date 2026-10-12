"""resync.py Group/Mod : source updated (git OLD=9f817d9^). Old RU->EN map from old RU + current Eng (aligned by position);
writes work/{todo.txt,todo_paths.txt,auto.txt}, removes old p*.txt (kept in git). Then translate todo, modtool check/build."""
import sys,subprocess,os,glob
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import modtool as M
OLD='9f817d9^'
def go(g):
    old=subprocess.run(['git','show',f'{OLD}:ToTranslate/{g}/CFG/Rus/Lang.txt'],cwd=M.R,capture_output=True).stdout
    t=old.decode('utf-16').lstrip(chr(0xfeff)); sep='\r\n' if '\r\n' in t else '\n'
    oi=M.items(t.split(sep)); ei=M.items(M.readu16(f'{M.T}/{g}/CFG/Eng/Lang.txt'))
    assert len(oi)==len(ei),(g,len(oi),len(ei))
    om={}
    for (_,_,v),(_,_,e) in zip(oi,ei):
        if M.cyr.search(v) and not M.cyr.search(e): om.setdefault(v,e)
    tm={}
    for l in open(M.T+'/tools/tm.tsv',encoding='utf-8').read().split('\n'):
        if '\t' in l: a,b=l.split('\t',1); tm[a]=b
    L=M.readu16(f'{M.SRC}/{g}/CFG/Rus/Lang.txt'); seen={};order=[]
    for i,p,v in M.items(L):
        if M.cyr.search(v) and not M.PATHRE.search(v) and v not in seen: seen[v]=1; order.append((p,v))
    w=M.wd(g)
    for f in glob.glob(w+'/p*.txt'): os.remove(f)
    todo=[(p,v) for p,v in order if v not in om and v not in tm]
    open(w+'/todo.txt','w',encoding='utf-8').write('\n'.join(f'{i+1}\t{v}' for i,(p,v) in enumerate(todo)))
    open(w+'/todo_paths.txt','w',encoding='utf-8').write('\n'.join(f'{i+1}\t{p}' for i,(p,v) in enumerate(todo)))
    open(w+'/auto.txt','w',encoding='utf-8').write('\n'.join(v+'\t'+(om[v] if v in om else tm[v]) for p,v in order if v in om or v in tm))
    print(g,'todo',len(todo),'auto',len(order)-len(todo))
    if not todo: M.build(g)
for g in sys.argv[1:]: go(g)
