# usage: pc.py S  -> checks all w/pNN.txt against w/todo.txt
import re,sys,glob,collections
S=sys.argv[1]
todo={}
for l in open(S+'/w/todo.txt',encoding='utf-8').read().split('\n'):
    n,v=l.split('\t',1); todo[int(n)]=v
tok=re.compile(r'<[^<>]*>|\{[^{}]*\}|\[[^\[\]]*\]')
cyr=re.compile('[А-Яа-яЁё]')
en={};bad=0
for f in sorted(glob.glob(S+'/w/p*.txt')):
    for l in open(f,encoding='utf-8').read().split('\n'):
        if not l.strip(): continue
        n,v=l.split('\t',1); n=int(n)
        if n in en: print('DUP',n); bad+=1
        en[n]=v
for n,v in en.items():
    r=todo.get(n)
    if r is None: print('NOID',n);bad+=1;continue
    if collections.Counter(tok.findall(r))!=collections.Counter(tok.findall(v)): print('TOK',n,tok.findall(r),tok.findall(v));bad+=1
    if cyr.search(v): print('CYR',n);bad+=1
    if '\t' in v or '\n' in v: print('WS',n);bad+=1
missing=[n for n in todo if n not in en]
print('done',len(en),'of',len(todo),'bad',bad,'first missing',missing[:1])
