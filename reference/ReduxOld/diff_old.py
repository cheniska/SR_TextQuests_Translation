"""Сравнение старого Redux (Rus+Eng) с текущим ToTranslate: что не изменилось / изменилось / новое.
  python3 reference/ReduxOld/diff_old.py [Group/Mod ...]   -> DIFF_REPORT.md, pairs.tsv (RU<TAB>EN неизменённых строк)"""
import os,re,sys,collections
H=os.path.dirname(os.path.abspath(__file__)); R=H+'/../..'
cyr=re.compile('[А-Яа-яЁё]')
def rd(f):
    t=open(f,'rb').read().decode('utf-16').lstrip(chr(0xfeff)); return t.replace('\r\n','\n').split('\n')
def items(L):
    path=[];out={}
    for l in L:
        m=re.match(r'^\s*(\S+) [\^~]\{$',l)
        if m: path.append(m.group(1));continue
        if l.strip()=='}':
            if path: path.pop()
            continue
        if '=' in l:
            k,v=l.strip().split('=',1); out['/'.join(path)+'/'+k]=v
    return out
mods=sys.argv[1:] or sorted(g+'/'+m for g in os.listdir(H+'/Rus') for m in os.listdir(H+'/Rus/'+g))
rows=[];pairs=collections.OrderedDict();
for md in mods:
    po=f'{H}/Rus/{md}/CFG/Rus/Lang.txt'; pe=f'{H}/Eng/{md}/CFG/Eng/Lang.txt'; pn=f'{R}/ToTranslate/{md}/CFG/Rus/Lang.txt'
    if not os.path.exists(pn): rows.append((md,'нет в ToTranslate'));continue
    if not os.path.exists(po): rows.append((md,'новый мод (нет в старом паке)'));continue
    o=items(rd(po)); n=items(rd(pn)); e=items(rd(pe)) if os.path.exists(pe) else {}
    same=chg=new=0; noeng=0
    for k,v in n.items():
        if not cyr.search(v): continue
        if k not in o: new+=1
        elif o[k]==v:
            same+=1
            if k in e and e[k]!=v and not cyr.search(e[k]): pairs.setdefault(v,e[k])
            else: noeng+=1
        else: chg+=1
    gone=sum(1 for k in o if k not in n and cyr.search(o[k]))
    rows.append((md,f'без изменений {same} (без EN {noeng}) · изменено {chg} · новых {new} · удалено {gone}'+('' if e else ' · НЕТ СТАРОГО EN')))
with open(H+'/DIFF_REPORT.md','w',encoding='utf-8') as f:
    f.write('# Старый Redux vs текущий ToTranslate (по ключам)\n\n| Мод | Итог |\n|---|---|\n')
    for m,s in rows: f.write(f'| {m} | {s} |\n')
with open(H+'/pairs.tsv','w',encoding='utf-8') as f:
    for a,b in pairs.items(): f.write(a+'\t'+b+'\n')
print(len(rows),'mods',len(pairs),'pairs')
