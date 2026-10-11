import re
rom=['I','II','III','IV','V','VI','VII','VIII']
names={'генератор защиты':'Shield Generator','дроид':'Droid','двигатель':'Engine','топливный бак':'Fuel Tank','захват':'Gripper','радар':'Radar','сканер':'Scanner'}
fixed={
1:'Hull "Trickster"',
2:'<color=248,252,248>In the thirty-first century peleng ranger ships not only allowed effective combat operations but also proved themselves well in carrying contraband goods. That is why one of the high-ranking lyakushas ordered for himself a hull with exactly the same design and functionality, but refined and with acryn technologies introduced. However, someone from his inner circle stole the technology for creating such ships and put them into wide production. Now anyone can afford such a model.</color>',
3:'Charm skill: <bonSkill5> units',
4:'Hull "Daredevil"',
5:'<color=248,252,248>A series of hulls outwardly identical to the ships of human rangers, made to order for the Solar System Klissan War Museum Network. Despite the exact repetition of a three-hundred-year-old design, the ship is in the technical sense entirely modern. The ship\'s armor is supplemented with acryn elements, which raises its cost. It is known that humans love luxury, so inside the ship is finished with mahogany, and aboard there is also a cozy jacuzzi where the pilot can relax after his space adventures. An ideal choice for a humanoid who cares about human history.</color>',
6:'Trade skill: <bonSkill4> units',
7:'Hull "Peacemaker"',
8:'<color=248,252,248>The famous iike-baanist Noo-A\'tra, in long reflections on the fate of the Universe, Eternal Harmony and the meaning of each race\'s existence, came to the conclusion that the composition of the cosmos should be completed by ships like those that served the gaals at the time when one of the greatest mysteries in the history of the Coalition was solved - the cause of the klissans\' aggression. The wise gaal invested in restoring the hulls of gaal rangers of that era, but also added a condition: acryn elements must be introduced into the ships\' armor, as a symbol of the Projection of the Past into the Future.</color>',
9:'Tech skill: <bonSkill3> units',
10:'Hull "Rationalist"',
11:'<color=248,252,248>The design of faeyan ranger ships has changed little since the time of the Klissan War, but this did not prevent scientists from restoring models of precisely those years, now with the use of acryn technologies. They explain this by saying that from a technical point of view old hulls may still have a not fully revealed potential. After long scientific disputes, in which respected dalani scrawled ten-story formulas on holographic boards while their opponents slapped themselves in the face, not everyone was persuaded, though history lovers were delighted all the same. These differ from modern hulls not only in a lighter coloring but also in interior decor. Otherwise the differences are minimal, including efficiency and durability.</color>',
12:'Maneuverability skill: <bonSkill2> units',
91:'Hull "Warrior"',
92:'<color=248,252,248>A series of acryn hulls issued by order of General Garndym, exactly repeating in design the ships of the valiant maloq rangers who wrote their names into the history of the liberation of our arm of the Galaxy from the klissans three centuries ago. Fearsome and majestic, the ship\'s appearance makes every warrior involuntarily salute at the sight of it.</color>',
93:'Accuracy skill: <bonSkill1> units',
}
desc={
'генератор защиты':'<color=248,252,248>A series of shield generators operating on principles used three centuries ago. Experiments with acrynation brought obsolete technologies back to competitiveness, breathing new life into rarities. Highly valued by humanoids with a passion for history.</color>',
'дроид':'<color=248,252,248>A series of acryn droids made on the basis of samples from the time of the Klissan War. Compared to their predecessors they work far more effectively thanks to improved design elements and a reworked artificial intelligence that lets these droids stand level with modern models.</color>',
'двигатель':'<color=248,252,248>Modern analogues of space engines restored from blueprints of the era of resistance to the Klissan occupation. Mass production of such samples was set up after scientists obtained theoretical calculations proving that, subjected to acryn modernization, such engines would not be inferior to modern ones. The cheapness of manufacture contributed to an economical price, which suits many buyers.</color>',
'топливный бак':'<color=248,252,248>Research in acryn technologies allowed the scientific community to reconsider its views on obsolete principles of fuel tank manufacture, resulting in this line, a modification of samples made in the times of Rachekhan. The design of these models has proven quite reliable and the manufacture inexpensive, which makes returning the old samples to production fully justified. Besides, the use of acryn technologies has made these fuel containers very popular with rangers. Such fuel tanks are in no way inferior to modern analogues.</color>',
'захват':'<color=248,252,248>Three hundred years ago grippers were far more primitive than now: they did not even allow pulling objects while the ship was moving. However, scientists managed to breathe new life into the old models, changing most parts and thereby significantly raising the power of the rarities. The introduction of acryn technologies opened up even more possibilities for using this equipment.</color>',
'радар':'<color=248,252,248>An industrial line of radars developed by engineers on the basis of modifications of samples that went through the Klissan War. Thanks to adding acryn elements to the structure, a high coverage radius is achieved, which lets these radars take their niche in the space technology market.</color>',
'сканер':'<color=248,252,248>Serially produced analogues of scanners from the time of the klissan aggression. Having requested samples from the Gaaldok museum, engineers copied their design for experiments with applying acryn. After several years of persistent research the scientists managed to modify the scanner devices so that their power increased many times over, allowing these models to scan spacecraft no worse than modern samples. An economical analogue, suitable for low-income pilots or connoisseurs of the retro style.</color>',
}
fuel={'II':15,'III':20,'IV':25,'V':30,'VI':35,'VII':40,'VIII':50}
todo=[l.rstrip('\n').split('\t',1) for l in open('todo.txt',encoding='utf-8') if l.strip()]
out=[]
for n,t in todo:
    n=int(n)
    if n in fixed: out.append('%d\t%s'%(n,fixed[n])); continue
    m=re.match(r'Ремастивный (.+?) (I-VIII|[IV]+)$',t)
    if m:
        k=m.group(1); r=m.group(2); en='Remastered '+names[k]
        out.append('%d\t%s %s'%(n,en,r)); continue
    if t.startswith('<color'):
        for k,v in desc.items():
            pass
        out.append(None); continue
    m=re.match(r'Снижение веса топливного бака: <clr>-(\d+)%<clrEnd>',t)
    if m: out.append('%d\tFuel tank weight reduction: <clr>-%s%%<clrEnd>'%(n,m.group(1))); continue
    out.append('%d\t??? %s'%(n,t))
# fill desc: preceding "I" line decides kind
res=[];prev=None
for (n,t),o in zip(todo,out):
    n=int(n)
    if o is None:
        pass
    res.append((n,t,o))
final=[]
last=None
for n,t,o in res:
    if o is None:
        o='%d\t%s'%(n,desc[last])
    else:
        m=re.match(r'\d+\tRemastered (.+) I$',o)
        if m:
            last=[k for k,v in names.items() if v==m.group(1)][0]
    final.append(o)
open('p01.txt','w',encoding='utf-8').write('\n'.join(final)+'\n')
print([f for f in final if '???' in f])
