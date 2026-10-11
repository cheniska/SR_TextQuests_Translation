import re,sys
S=sys.argv[1]
L=open(S+'/mercs.txt',encoding='utf-8').read().split('\n')
cyr=re.compile('[А-Яа-яЁё]')
path=[];out=[]
for i,l in enumerate(L):
    m=re.match(r'^\s*(\S+) [\^~]\{$',l)
    if m: path.append(m.group(1));continue
    if l.strip()=='}': path.pop();continue
    if '=' in l:
        k,v=l.strip().split('=',1)
        if cyr.search(v): out.append((i+1,'/'.join(path)+'/'+k,v))
open(S+'/items.tsv','w',encoding='utf-8').write('\n'.join(f'{a}\t{b}\t{c}' for a,b,c in out))
print(len(out),len(L))
import collections
c=collections.Counter(); ch=collections.Counter()
for a,b,v in out:
    t='/'.join(b.split('/')[:4]); c[t]+=1; ch[t]+=len(v)
for t,n in sorted(ch.items(),key=lambda x:-x[1])[:40]: print(t,c[t],n)
