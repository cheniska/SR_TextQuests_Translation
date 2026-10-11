import sys
S=sys.argv[1]
seen={};order=[]
for l in open(S+'/items.tsv',encoding='utf-8').read().split('\n'):
    n,p,v=l.split('\t',2)
    if v not in seen: seen[v]=len(order)+1; order.append((p,v))
open(S+'/w/todo.txt','w',encoding='utf-8').write('\n'.join(f'{i+1}\t{v}' for i,(p,v) in enumerate(order)))
open(S+'/w/todo_paths.txt','w',encoding='utf-8').write('\n'.join(f'{i+1}\t{p}' for i,(p,v) in enumerate(order)))
print(len(order))
