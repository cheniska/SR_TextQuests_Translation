import sys,glob
H,S=sys.argv[1],sys.argv[2]
ht={}
for l in open(H+'/todo.txt',encoding='utf-8').read().split('\n'):
    n,v=l.split('\t',1); ht[int(n)]=v
he={}
for f in sorted(glob.glob(H+'/p*.txt')):
    for l in open(f,encoding='utf-8').read().split('\n'):
        if l.strip():
            n,v=l.split('\t',1); he[ht[int(n)]]=v
out=[];hit=0
for l in open(S+'/w/todo.txt',encoding='utf-8').read().split('\n'):
    n,v=l.split('\t',1)
    if v in he: out.append(f'{n}\t{he[v]}'); hit+=1
open(S+'/w/reuse.txt','w',encoding='utf-8').write('\n'.join(out))
print(hit)
