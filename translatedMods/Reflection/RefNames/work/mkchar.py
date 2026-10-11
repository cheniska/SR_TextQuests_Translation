import re
m={'Разбойник':'Brigand','Бандит':'Bandit','Мародер':'Marauder','Делец':'Dealer','Магнат':'Magnate','Громила':'Thug','Налетчик':'Raider','Торгаш':'Huckster','Коммерсант':'Merchant','Корсар':'Corsair','Наемник':'Mercenary','Агент':'Agent','Воитель':'Warrior','Защитник':'Defender','Герой':'Hero'}
out=[]
for l in open('todo.txt',encoding='utf-8'):
    n,t=l.rstrip('\n').split('\t',1)
    if 891<=int(n)<=905:
        w=re.search(r'[А-Яа-я]+$',t).group(0)
        out.append('%s\t%s'%(n,t[:-len(w)]+m[w]))
open('p08.txt','w',encoding='utf-8').write('\n'.join(out)+'\n')
