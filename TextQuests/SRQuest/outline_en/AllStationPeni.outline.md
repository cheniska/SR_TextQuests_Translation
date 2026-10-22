# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P3 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Money' [0..999999999] тип=обычный
    старт: [1000]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 4
- P23 'ext_Peni' [0..100000000] тип=обычный
    старт: [2]
    [0..100000000] Параметр номер 23: <>
    критическое: Сообщение достижения критического значения параметром 23
- P24 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 24: <>
    критическое: Сообщение достижения критического значения параметром 24
- P25 'Escape chance' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 25: <>
    критическое: Сообщение достижения критического значения параметром 25
- P26 'Extra Chance' [0..2000] тип=обычный
    старт: [0..2000]
    [0..2000] Параметр номер 26: <>
    критическое: Сообщение достижения критического значения параметром 26
- P27 'ext_WhoRanger' [0..2] тип=обычный
    старт: [0]
    [0..0] merchant
    [1..1] pirate
    [2..2] warrior
    критическое: Сообщение достижения критического значения параметром 27
- P28 'Bonus_WhoRanger0t' [0..20] тип=обычный
    старт: [0]
    [0..20] Параметр номер 28: <>
    критическое: Сообщение достижения критического значения параметром 28
- P29 'Bonus_WhoRanger1p' [0..20] тип=обычный
    старт: [0]
    [0..20] Параметр номер 29: <>
    критическое: Сообщение достижения критического значения параметром 29
- P30 'Bonus_WhoRanger2w' [0..20] тип=обычный
    старт: [0]
    [0..20] Параметр номер 30: <>
    критическое: Сообщение достижения критического значения параметром 30
- P31 'Ransom Amount' [0..100000000] тип=обычный
    старт: [1000]
    [0..100000000] Параметр номер 31: <>
    критическое: Сообщение достижения критического значения параметром 31
- P32 'ext_Plot' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 32: <>
    критическое: Сообщение достижения критического значения параметром 32

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: After finishing your business, you head into the hangar, passing a group of soldiers and a couple civilians on the way. Your trained ear picks out a few words f…
    скрыт: P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P25,P26,P27,P28,P29,P30,P31,P32
  -> Path23 => Loc11  вер=1 порядок=9
       текст: Quicken your pace

### Loc8 [УСПЕХ]

### Loc10 [ПРОВАЛ]

### Loc11 [обычная]
    Loc11-1: You break into a run and race up to the landing platform, hoping to leave this hospitable station before the enforcement officers arrest your ship with all its …
    эффект: P25(Escape chance) = {[0..100]}
  -> Path34 => Loc15  вер=1 [всегда видна] порядок=5
       условия: логика {[p27]=0}
       эффект: P28(Bonus_WhoRanger0t) = 20
       эффект: P31(Ransom Amount) = {(([p4] div 5) to ([p4] div 2)) div 4}
  -> Path38 => Loc15  вер=1 [всегда видна] порядок=5
       условия: логика {[p27]=1}
       эффект: P29(Bonus_WhoRanger1p) = 20
       эффект: P31(Ransom Amount) = {([p4] div 5) to ([p4] div 2)}
  -> Path42 => Loc15  вер=1 порядок=5
       условия: логика {[p27]=2}
       эффект: P30(Bonus_WhoRanger2w) = 20
       эффект: P31(Ransom Amount) = {([p4] div 5) to ([p4] div 2)}

### Loc12 [обычная]
    выбор описания: {[p3]}
    Loc12-1: You close your secret cargo hold hatch and, trying to breathe as quietly as possible, wait for the enforcement officers to find no one on board and leave. Every…
    Loc12-2: For the next couple of hours, you watch with great interest as they try their best to find you. It feels scary at first. Then it gets pretty exciting. By the en…
    Loc12-3: It all happens very quickly. Enjoying the soldiers' awed looks, you reach the hangar gate. Suddenly, one of the enforcement officers, a Maloq, notices that, unl…
    Loc12-4: You carefully remove the air vent grill and, trying to make as little noise as possible, slowly squeeze yourself into the opening. After a few minutes, you real…
    Loc12-5: A few minutes after making this decision, you realize that it's virtually impossible to knock a combat-equipped Maloq out with a wrench blow on the head. On the…
    Loc12-6: Things look pretty rosy at the start: two salvos are more than enough to make all the enforcement officials present in the hangar hard-of-hearing and blow the a…
    Loc12-7: Your first shot hits the rear of a Maloq soldier. His shout is the last sound you hear before the world goes black around you. You recover from a series of stun…
    Loc12-8: Ignoring the blasters pointed directly at you, you approach the officer in charge of the operation and ask him in a whisper: how much money does the brave enfor…
  -> Path39 => Loc10  вер=1 порядок=5
       текст: Learn your fate

### Loc13 [обычная]
    Loc13-1: Ignoring the blasters pointed directly at you, you approach the officer in charge of the operation and ask him in a whisper: how much money does the brave enfor…
  -> Path36 => Loc14  вер=1 порядок=4
       текст: Bribe the official
       эффект: P3(Text) = 6
       эффект: P4(ext_Money) = {[p4]-[p31]}
  -> Path37 => Loc12  вер=1 порядок=5
       текст: Say no
       эффект: P3(Text) = 8

### Loc14 [обычная]
    выбор описания: {[p3]}
    Loc14-1: You close your secret cargo hold hatch and, trying to breathe as quietly as possible, wait for the enforcement officers to find no one on board and leave. Every…
    Loc14-2: For the next couple of hours, you watch with great interest as they try their best to find you. It feels scary at first. Then it gets pretty exciting. By the en…
    Loc14-3: It all happens very quickly. Enjoying the soldiers' awed looks, you reach the hangar gate. Suddenly, one of the enforcement officers, a Maloq, notices that, unl…
    Loc14-4: You carefully remove the air vent grill and, trying to make as little noise as possible, slowly squeeze yourself into the narrow opening. Over the next two hour…
    Loc14-5: You sneak up to the heedless guard and put the wrench you're holding to improper use. Your victim turns around to face you, says "that was an A sharp" with an a…
    Loc14-6: You agree to the enforcement officer's terms. You feel as if a huge burden has been lifted off your shoulders! Or is that just because your wallet has become mu…
  -> Path26 => Loc8  вер=1 порядок=9
       текст: Undock

### Loc15 [пустая]
  -> Path24 => Loc14  вер=1 порядок=5
       текст: Hide in your secret cargo hold for smuggled goods
       условия: логика {[p24]+[p3]+[p29]>=[p25]+[p23]*3}
       эффект: P3(Text) = 1
       эффект: P4(ext_Money) = {[p4]+[p26]}
       эффект: P32(ext_Plot) +1
  -> Path25 => Loc12  вер=1 порядок=5
       текст: Hide in your secret cargo hold for smuggled goods
       условия: логика {[p24]+[p3]+[p29]<[p25]+[p23]*3}
       эффект: P3(Text) = 1
  -> Path27 => Loc12  вер=1 порядок=5
       текст: Change into a different outfit and dance through the cordon around your ship, waving your feather dusters
       условия: логика {[p24]+[p3]+[p28]<[p25]+[p23]*3}
       эффект: P3(Text) = 3
  -> Path28 => Loc12  вер=1 порядок=5
       текст: Hide in the hangar, behind the fueler
       условия: логика {[p24]+[p3]+[p30]<[p25]+[p23]*3}
       эффект: P3(Text) = 2
  -> Path29 => Loc14  вер=1 порядок=5
       текст: Hide in the hangar, behind the fueler
       условия: логика {[p24]+[p3]+[p30]>=[p25]+[p23]*3}
       эффект: P3(Text) = 2
       эффект: P4(ext_Money) = {[p4]+[p26]}
       эффект: P32(ext_Plot) +1
  -> Path30 => Loc14  вер=1 порядок=5
       текст: Change into a different outfit and dance through the cordon around your ship, waving your feather dusters
       условия: логика {[p24]+[p3]+[p28]>=[p25]+[p23]*3}
       эффект: P3(Text) = 3
       эффект: P4(ext_Money) = {[p4]+[p26]}
       эффект: P32(ext_Plot) +1
  -> Path31 => Loc14  вер=1 порядок=5
       текст: Try to leave the hangar via the ventilation system
       условия: логика {[p24]+[p3]+[p30]>=[p25]+[p23]*3}
       эффект: P3(Text) = 4
       эффект: P4(ext_Money) = {[p4]+[p26]}
       эффект: P32(ext_Plot) +1
  -> Path32 => Loc14  вер=1 порядок=5
       текст: Neutralize one of the soldiers and try to leave the hangar in his uniform
       условия: логика {[p24]+[p3]+[p29]>=[p25]+[p23]*3}
       эффект: P3(Text) = 5
       эффект: P4(ext_Money) = {[p4]+[p26]}
       эффект: P32(ext_Plot) +1
  -> Path33 => Loc12  вер=1 порядок=5
       текст: Try to leave the hangar via the ventilation system
       условия: логика {[p24]+[p3]+[p29]<[p25]+[p23]*3}
       эффект: P3(Text) = 4
  -> Path35 => Loc12  вер=1 порядок=5
       текст: Neutralize one of the soldiers and try to leave the hangar in his uniform
       условия: логика {[p24]+[p3]+[p30]<[p25]+[p23]*3}
  -> Path40 => Loc12  вер=1 порядок=5
       текст: Fire the guns to blow the airlock out
       эффект: P3(Text) = 6
  -> Path41 => Loc12  вер=1 порядок=5
       текст: Take down your guests with your blaster
       эффект: P3(Text) = 7
  -> Path43 => Loc13  вер=1 порядок=5
       текст: Try to make a deal with the enforcement officers
       условия: логика {[p4]>=[p31]}
  -> Path44 => Loc12  вер=1 порядок=5
       текст: Try to make a deal with the enforcement officers
       условия: логика {[p4]<[p31]}

## Анализ
- стартовых: [1]
- концовки: {8: 'УСПЕХ', 10: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [24]
