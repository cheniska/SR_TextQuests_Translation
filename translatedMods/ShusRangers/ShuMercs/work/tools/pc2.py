import re,glob,collections
t={}
for l in open('w/todo.txt',encoding='utf-8').read().split('\n'):
    n,v=l.split('\t',1); t[int(n)]=v
e={}
for f in glob.glob('w/p*.txt'):
    for l in open(f,encoding='utf-8').read().split('\n'):
        if l.strip(): n,v=l.split('\t',1); e[int(n)]=v
x=re.compile(r'@[A-Z]|\bcnt\b|\bcost\b|\bdate\b|<\d>|\\"|\'')
for n in sorted(t):
    a=collections.Counter(re.findall(r'@[A-Z]|\bcnt\b|\bcost\b|\bdate\b|<\d>|\\"',t[n])); b=collections.Counter(re.findall(r'@[A-Z]|\bcnt\b|\bcost\b|\bdate\b|<\d>|\\"',e[n]))
    if a!=b: print(n,a,b)
