# Квест (формат 1111111127)
Сложность 50; стартовая локация: [15]; путей по умолчанию: 0

## Параметры
- P1 'ext_Structure' [0..999999999] тип=обычный
    старт: [90]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_PriceMap' [0..999999999] тип=обычный
    старт: [500]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Money' [0..999999999] тип=обычный
    старт: [10000]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_PriceRepair' [0..9999999] тип=обычный
    старт: [1]
    [0..9999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Needs repairing' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Repair cost' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'ext_PlayerBuysMap' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'ext_PirateDefence' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 9
- P10 'ext_PriceDefence' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 10
- P11 'ext_TimeDefence' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Steam
    критическое: Сообщение достижения критического значения параметром 11
- P12 'Double Defense' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Cardboard
    критическое: Сообщение достижения критического значения параметром 12
- P13 'Параметр номер 13' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 13: <>
    критическое: Сообщение достижения критического значения параметром 13
- P14 'ext_MaxStructure' [0..999999999] тип=обычный
    старт: [100]
    [0..999999999] Параметр номер 14: <>
    критическое: Сообщение достижения критического значения параметром 14
- P15 'ext_Peny' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 15: <>
    критическое: Сообщение достижения критического значения параметром 15
- P16 'ext_Plot' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 16: <>
    критическое: Сообщение достижения критического значения параметром 16
- P17 'ext_Eldunator' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 17: <>
    критическое: Сообщение достижения критического значения параметром 17

## Локации и переходы

### Loc1 [обычная]
    выбор описания: {[p3]+([p15]>0)*7}
    Loc1-1: <Player>, who would have thought! What's a ranger like you doing at an old pirate base like <StationName>?  / Would you like to join the pirates, perhaps? Relax…
    Loc1-2: Great, <Player>, the repairs are complete. As you see, all was done fairly and on time, except that we have a couple extra parts left over.  / Anything else?
    Loc1-3: Transaction complete. Star chart loaded into your ship's navigation system. / Anything else?
    Loc1-4: You've bought the <clr>Yellow Pass<clrEnd> for [p10] cr. It offers over <clr>70%<clrEnd> protection from attacks for the next <clr>100<clrEnd> days. / Would you…
    Loc1-5: You've bought the <clr>White Ticket<clrEnd> for [p12] cr. It offers over <clr>70%<clrEnd> protection from attacks for the next <clr>300<clrEnd> days. / Would yo…
    Loc1-6: Well, whatever. It's up to you. / Anything else?
    Loc1-7: We appreciate your desire to buy something here. But what we appreciate even more are our laws forbidding you to buy a new pass until your existing one expires.…
    Loc1-8: <Ranger>, haven't the cops caught you yet, with your loan so long overdue? Should we help them out? Just kidding – we don't sell our own. Welcome to <StationNam…
    Loc1-9: Great, <Player>, the repairs are complete. As you see, all was done fairly and on time, except that we have a couple extra parts left over. Should you end up se…
    Loc1-10: Transaction complete. Star chart loaded into your ship's navigation system. We hope that helps you escape your debt collectors. / Anything else?
    Loc1-11: You've bought the <clr>Yellow Pass<clrEnd> for [p10] cr. It offers over <clr>70%<clrEnd> protection from attacks for the next <clr>100<clrEnd> days. Doesn't wor…
    Loc1-12: You've bought the <clr>White Ticket<clrEnd> for [p12] cr. It offers over <clr>70%<clrEnd> protection from attacks for the next <clr>300<clrEnd> days. Doesn't wo…
    Loc1-13: Well, whatever. It's up to you. / Anything else?
    Loc1-14: We appreciate your desire to buy something here. But what we appreciate even more are our laws forbidding you to buy a new pass until your existing one expires.…
    скрыт: P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17
  -> Path4 => Loc4  вер=1 [всегда видна] порядок=5
       текст: I want to buy a pass
       условия: логика {[p11]=0}
       эффект: P3(Text) = {1}
       эффект: P12(Double Defense) = {[p10]*2}
  -> Path7 => Loc5  вер=1 порядок=7
       текст: I want to buy a star chart
       условия: логика {[p2]>0}
       эффект: P3(Text) = {1}
       эффект: P8(ext_PlayerBuysMap) = {0}
  -> Path9 => Loc7  вер=1 [всегда видна] порядок=1
       текст: I need to get my ship repaired
       условия: логика {[p1]<[p14] and [p4]>=[p5]}
       эффект: P3(Text) = {1}
       эффект: P6(Needs repairing) = {[p14]-[p1]}
  -> Path16 => Loc15  вер=1 порядок=9
       текст: Undock
  -> Path17 => Loc1  вер=1 порядок=5
       текст: I want to buy a pass
       условия: логика {[p11]>0}
       эффект: P3(Text) = 7

### Loc2 [обычная]
    Loc2-1: Considering your financial situation, our experts will repair [p6] structure of your ship for [p7] cr. / Deal?
    эффект: P7(Repair cost) = {[p6]*[p5]}
  -> Path10 => Loc1  вер=1 [всегда видна] порядок=1
       текст: Deal, let's repair it!
       условия: логика {[p4]>=[p7]}
       эффект: P1(ext_Structure) = {[p1]+[p6]}
       эффект: P3(Text) = {2}
       эффект: P4(ext_Money) = {[p4]-[p7]}
  -> Path14 => Loc1  вер=1 порядок=5
       текст: I refuse to pay this. Your prices are outrageous!
       эффект: P3(Text) = {6}

### Loc4 [обычная]
    Loc4-1: We're offering you the best passes on our base! They offer <clr>more than 70%<clrEnd> protection from our colleagues' attacks.  / The <clr>Yellow Pass<clrEnd> l…
  -> Path6 => Loc1  вер=1 [всегда видна] порядок=1
       текст: I'll take the yellow pass
       условия: логика {[p4]>=[p10]}
       эффект: P3(Text) = {4}
       эффект: P4(ext_Money) = {[p4]-[p10]}
       эффект: P9(ext_PirateDefence) = {72}
       эффект: P11(ext_TimeDefence) = {100}
  -> Path11 => Loc1  вер=1 [всегда видна] порядок=3
       текст: I'll take the white ticket
       условия: логика {[p4]>=[p12]}
       эффект: P3(Text) = {5}
       эффект: P4(ext_Money) = {[p4]-[p12]}
       эффект: P9(ext_PirateDefence) = {72}
       эффект: P11(ext_TimeDefence) = {300}
  -> Path13 => Loc1  вер=1 порядок=5
       текст: I don't want anything
       эффект: P3(Text) = {6}

### Loc5 [обычная]
    Loc5-1: Our database contains maps of the neighboring sectors. / We can offer you a map of the <SectorMap> sector for [p2] cr. / Want to buy it?
  -> Path8 => Loc1  вер=1 порядок=5
       текст: Nah, that's too expensive
       эффект: P3(Text) = {6}
  -> Path15 => Loc1  вер=1 [всегда видна] порядок=1
       текст: Yes, I'll buy a map of the <SectorMap> sector
       условия: логика {[p4]>=[p2]}
       эффект: P3(Text) = 3
       эффект: P4(ext_Money) = {[p4]-[p2]}
       эффект: P8(ext_PlayerBuysMap) = 1

### Loc7 [пустая]
    эффект: P7(Repair cost) = {[p6]*[p5]}
  -> Path2 => Loc2  вер=1 порядок=3
       условия: логика {[p4]>=[p7]}
  -> Path5 => Loc2  вер=1 порядок=5
       условия: логика {[p4]<[p7]}
       эффект: P6(Needs repairing) = {[p4] div [p5]}

### Loc8 [обычная]
    Loc8-1: "Operation aborted due to access hatch depressurization," the onboard computer breaks the news in its ever-pleasant voice. Well, you have no choice but to leave…
  -> Path20 => Loc10  вер=1 порядок=5
       текст: Check the airlock hatch

### Loc9 [УСПЕХ]

### Loc10 [обычная]
    Loc10-1: When you reach the access hatch, you are amazed to find it wide open. / "Stupid idiot, you could have suffocated!" you yell out loud. A brief moment and an impo…
  -> Path21 => Loc11  вер=1 порядок=5
       текст: Give the Peleng some air so that he can answer your questions

### Loc11 [обычная]
    Loc11-1: "Relax, <Ranger>. If I wanted to kill you, I would have done so long ago," croaks the guest, panting for air. Having recovered his breath, he says: / "Your refl…
  -> Path23 => Loc13  вер=1 порядок=5
       текст: What is it?
       эффект: P3(Text) = 1

### Loc12 [обычная]
    выбор описания: {[p3]}
    Loc12-1: Tsachash reaches into his pocket again and takes out a box that you identify as a portable electronic terminal. He makes sure that the agreed amount has been tr…
    Loc12-2: "Well, whatever. I'm not going to insist. I apologize, but I must go now." The Peleng gives you a curt bow and leaves your ship. The hatch closes behind him, an…
  -> Path26 => Loc14  вер=1 порядок=5
       текст: Undock

### Loc13 [обычная]
    выбор описания: {[p3]}
    Loc13-1: "It's my invention. I call it the <clr>Prongonator<clrEnd> - an autonomous missile launcher that fires a pack of five missiles. Great strike power and an onboar…
    Loc13-2: "Once I invent that, you'll be among the first to know. Meanwhile, think about the current offer. You won't get another chance to get a unique missile launcher …
  -> Path22 => Loc12  вер=1 порядок=6
       текст: Thanks, but no thanks
       эффект: P3(Text) = 2
  -> Path24 => Loc12  вер=1 порядок=5
       текст: Deal! I'll have it! Come on, install it right away!
       условия: логика {[p4]>=10000}
       эффект: P4(ext_Money) = {[p4]-10000}
       эффект: P17(ext_Eldunator) = 1
       эффект: P3(Text) = 1
  -> Path25 => Loc13  вер=1 проходов<=1 порядок=4
       текст: I need to think it over. Do you have anything else of interest?
       эффект: P3(Text) = 2

### Loc14 [УСПЕХ]

### Loc15 [СТАРТ]
  -> Path18 => Loc9  вер=3 порядок=9
  -> Path19 => Loc8  вер=1 порядок=9
       условия: логика {[p15]>0 and [p16]>=7 and [p17]=0}
  -> Path27 => Loc1  вер=1000 проходов<=1 порядок=5

## Анализ
- стартовых: [15]
- концовки: {9: 'УСПЕХ', 14: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
