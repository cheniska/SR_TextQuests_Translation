# apply: builds Eng Lang.txt
import sys,re
S=sys.argv[1]; out=sys.argv[2]
import glob
todo={}
for l in open(S+'/w/todo.txt',encoding='utf-8').read().split('\n'):
    n,v=l.split('\t',1); todo[int(n)]=v
en={}
for f in sorted(glob.glob(S+'/w/p*.txt')):
    for l in open(f,encoding='utf-8').read().split('\n'):
        if l.strip():
            n,v=l.split('\t',1); en[int(n)]=v
m={todo[n]:v for n,v in en.items()}
L=open(S+'/mercs.txt',encoding='utf-8',newline='').read().split('\r\n')
cyr=re.compile('[А-Яа-яЁё]')
miss=0
for i,l in enumerate(L):
    if '=' in l and not re.match(r'^\s*\S+ [\^~]\{$',l):
        pre,v=l.split('=',1); k=pre
        if cyr.search(v):
            if v in m: L[i]=pre+'='+m[v]
            else: miss+=1
data=b'\xff\xfe'+'\r\n'.join(L).encode('utf-16-le')
open(out,'wb').write(data); print('written; untranslated lines',miss)
