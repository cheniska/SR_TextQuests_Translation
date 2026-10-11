import sys
# usage: mk.py out.txt start "name1|name2|..."
out=sys.argv[1]; start=int(sys.argv[2]); names=sys.argv[3].split('|')
with open(out,'w',encoding='utf-8') as f:
    for i,n in enumerate(names):
        f.write('%d\t%s\n'%(start+i,n.strip()))
