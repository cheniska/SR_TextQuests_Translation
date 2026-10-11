"""Таблица терминов/имён из старого Rus↔Eng мода (по ключам) и сверка с нашими частями work/p*.txt.
  terms_old.py Group/Mod -> reference/ReduxOld/terms_<Mod>.tsv (RU, старый EN [частота], наш EN) и отчёт расхождений"""
import sys,os,re,collections,glob
H=os.path.dirname(os.path.abspath(__file__)); R=H+'/../..'
sys.path.insert(0,R+'/translatedMods/tools'); import modtool as M
g=sys.argv[1]; mod=g.split('/')[1]
o=M.items(M.readu16(f'{H}/Rus/{g}/CFG/Rus/Lang.txt')); e=M.items(M.readu16(f'{H}/Eng/{g}/CFG/Eng/Lang.txt'))
od={p:v for _,p,v in o}; ed={p:v for _,p,v in e}
col=re.compile(r'<color=[^>]*>(.*?)</color>'); qt=re.compile(r'"([^"]{2,60})"')
cap_ru=re.compile(r'(?<=[а-яё,;:] )([А-ЯЁ][а-яё]+(?: [А-ЯЁ][а-яё]+)*)'); cap_en=re.compile(r'(?<=[a-z,;:] )([A-Z][a-z]+(?: [A-Z][a-z]+)*)')
T=collections.defaultdict(collections.Counter)
for p,v in od.items():
    if p not in ed: continue
    w=ed[p]
    for rx in (col,qt,cap_ru):
        rx2=col if rx is col else qt if rx is qt else cap_en
        a=rx.findall(v); b=rx2.findall(w)
        if a and len(a)==len(b):
            for x,y in zip(a,b):
                if not M.cyr.search(y) and not re.search(r'<[A-Za-z]+>',x) and len(x)>2: T[x.lower()][y]+=1
# наши переводы: RU(todo) -> EN
todo,en,_=M.load(g); ours={todo[n]:v for n,v in en.items()}
cur={v:v for v in ours}
rows=[];diff=[]
for ru,c in sorted(T.items(),key=lambda kv:-sum(kv[1].values())):
    olds=[k for k,_ in c.most_common(3)]
    # где русский термин встречается в текущем RU, а мы перевели — в нашем EN есть ли старый вариант?
    hit=ok=0;seen=set()
    for r,eng in ours.items():
        if ru in r.lower():
            hit+=1
            if any(o_.lower() in eng.lower() for o_ in olds): ok+=1
    rows.append((ru,'; '.join(f'{k} [{n}]' for k,n in c.most_common(3)),hit,ok))
    if hit and ok<hit: diff.append((ru,olds,hit,ok))
with open(f'{H}/terms_{mod}.tsv','w',encoding='utf-8') as f:
    f.write('RU\tстарый EN [частота]\tнаших строк с термином\tиз них со старым вариантом\n')
    for r in rows: f.write('\t'.join(map(str,r))+'\n')
print(len(rows),'терминов; расхождений:',len(diff))
for ru,olds,hit,ok in diff[:80]: print(f'{ru!r}: старый {olds} — у нас {ok}/{hit}')
