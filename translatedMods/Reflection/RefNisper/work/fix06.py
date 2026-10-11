p='p06.txt'
s=open(p,encoding='utf-8').read()
s=s.replace("Certainly, Blazer's powerful squads","Certainly, <color=255,20,20>Blazer</color>'s powerful squads")
s=s.replace("Well, Keller's raids annoyed","Well, <color=30,145,255>Keller</color>'s raids annoyed")
s=s.replace("but Terron's hordes terrified","but <color=0,255,130>Terron</color>'s hordes terrified")
open(p,'w',encoding='utf-8').write(s)
