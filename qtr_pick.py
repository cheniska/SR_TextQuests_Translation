import sys,re
rus=sys.argv[1]; types=sys.argv[2].split(',')
def load(p):
    d={};cur=None
    for l in open(p,'rb').read().decode('utf-16').replace('\r\n','\n').split('\n'):
        if '\t' not in l: continue
        t,x=l.split('\t',1)
        if t=='*' and cur: d[cur]+=' ¶ '+x
        else: cur=t; d[t]=x
    return d
r=load(rus); e=load(sys.argv[3])
for t in types:
    print('##',t); print('RU:',r.get(t)); print('EN:',e.get(t))
