import sys
s=open('ToTranslate/ShusRangers/ShuMercs/CFG/Rus/Lang.txt','rb').read().decode('utf-16')
open(sys.argv[1]+'/mercs.txt','w',encoding='utf-8',newline='').write(s.lstrip('﻿'))
