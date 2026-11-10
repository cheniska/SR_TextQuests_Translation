# Квест (формат 1111111127)
Сложность 50; стартовая локация: [20]; путей по умолчанию: 0

## Параметры
- P1 'История' [1..9] тип=обычный
    старт: [1..9]
    [1..9] Story <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Имя' [0..10] тип=обычный
    старт: [0..10]
    [0..0] Ole-Kotor
    [1..1] Tsypa-Lya
    [2..2] Vladislav
    [3..3] Eliomay
    [4..4] Ratsapesha
    [5..5] Gaff
    [6..6] Dubchik
    [7..7] Jonathan
    [8..8] Algernon
    [9..10] Harper
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Credit' [0..100000] тип=обычный
    старт: [0]
    [0..100000] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Имя конторы' [0..10] тип=обычный
    старт: [0..10]
    [0..0] Acme
    [1..1] Mirkdirt
    [2..2] Ragriches
    [3..3] Butt-Kicking
    [4..4] Ga-Rocky
    [5..5] Rilicano
    [6..6] Emert
    [7..7] Patso
    [8..8] Kelmy-Amay
    [9..10] Goods-Allman
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Переключатель описаний' [0..7] тип=обычный
    старт: [0]
    [0..7] Параметр номер 5: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Имя Звезды' [0..10] тип=обычный
    старт: [0..10]
    [0..0] Sol
    [1..1] Betelgeuse
    [2..2] Rigel
    [3..3] Altair
    [4..4] Arts
    [5..5] Bellatrix
    [6..6] Elga
    [7..7] Castor
    [8..8] Cephron
    [9..10] Rex
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Временная' [0..100000] тип=обычный
    старт: [0]
    [0..100000] TMP <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'ext_Structure' [0..1000] тип=обычный
    старт: [1]
    [0..1000] ext_Structure <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'ext_Money' [0..10000000] тип=обычный
    старт: [0]
    [0..10000000] Money <>
    критическое: Сообщение достижения критического значения параметром 9
- P10 'ext_Fuel' [0..100] тип=обычный
    старт: [50]
    [0..100] ext_Fuel <>
    критическое: Сообщение достижения критического значения параметром 10
- P11 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] ext_Luck <>
    критическое: Сообщение достижения критического значения параметром 11
- P12 'Tmp02' [0..100000] тип=обычный
    старт: [0]
    [0..100000] Параметр номер 12: <>
    критическое: Сообщение достижения критического значения параметром 12

## Локации и переходы

### Loc1 [обычная]
    выбор описания: {[p1]}
    Loc1-1: The communicator screeches unpleasantly, and then an even more unpleasant alien mug appears on the screen: / "Hello. I'm [d2] from [d4] Collection Agency. Do yo…
    Loc1-2: You're watching stars slowly passing by through your ship's portholes when you notice something peculiar on the starship's armor. You take a closer look and rea…
    Loc1-3: You've been noticing something weird lately: none of the passing ships have wanted to communicate with you, and some of the pilots have even contacted you just …
    Loc1-4: The cosmic silence is broken by an incoming call from a ranger named [d2].
    Loc1-5: Your journey is interrupted by the annoying crackling of the diagnostic system; seems like everything is <clr>in bad shape<clrEnd>. / After analyzing the diagno…
    Loc1-6: Your journey is interrupted by the annoying crackling of the diagnostic system; seems like everything is <clr>in bad shape<clrEnd>. / After analyzing the diagno…
    Loc1-7: For a few weeks everything's been getting on your nerves: things kept going wrong and you couldn't do anything properly. Flying through open space in a metal bo…
    Loc1-8: As you are killing time in your usual manner (studying the patterns of dirt on the porthole), you hear an intercom notification. / You take a look at it and see…
    Loc1-9: The cosmic silence ringing in your ears is suddenly broken by a notification of an incoming message: / "Dear <Ranger>, I am contacting you on behalf of the [d4]…
  -> Path10 => Loc5  вер=1 порядок=5
       условия: логика {[p1]=1}
       эффект: P7(Временная) = {[p9]/1000+[5..15]}
  -> Path25 => Loc9  вер=1 порядок=5
       условия: логика {[p1]=2}
  -> Path29 => Loc12  вер=1 порядок=5
       условия: логика {[p1]=3}
       эффект: P7(Временная) = {([p8]/4)-([p11]*([p8]/500))+2}
  -> Path37 => Loc15  вер=1 порядок=5
       условия: логика {[p1]=4}
  -> Path47 => Loc18  вер=1 порядок=5
       условия: логика {[p1]=5}
       эффект: P5(Переключатель описаний) = 0
  -> Path57 => Loc21  вер=1 порядок=5
       условия: логика {[p1]=6}
       эффект: P5(Переключатель описаний) = 0
       эффект: P12(Tmp02) = {[p10]/8+1}
       эффект: P7(Временная) = {([p8]/2)-([p11]*([p8]/200))+2}
  -> Path71 => Loc26  вер=1 порядок=5
       условия: логика {[p1]=7}
       эффект: P7(Временная) = {[1..5]}
  -> Path83 => Loc32  вер=1 порядок=5
       условия: логика {[p1]=8}
  -> Path91 => Loc4  вер=1 порядок=5
       текст: Finish reading
       условия: логика {[p1]=9}

### Loc2 [обычная]
    выбор описания: {[p5]}
    Loc2-1: "<Ranger>, you took out a loan at a <clr>business center<clrEnd> and still haven't repaid it. The current amount of the loan, including the late fee, is [p3] cr…
    Loc2-2: "What do you mean by 'perhaps'?" replies [d2] angrily, "I need an exact answer: do you know <Ranger>? I'll keep calling until you answer!"
    Loc2-3: "Ranger <Ranger> took out a loan and hasn't repaid it yet. Our company wishes to motivate him using any means and methods necessary. So, do you know him?"
    Loc2-4: "Let's drop the act," comes the gloating reply, "<Ranger> is our debtor, and we're prepared to do anything to collect that debt. So, are you <Ranger>? Confess, …
    Loc2-5: "Of course I know <Ranger>! He's my old friend!" you start your bravado, "We recently spent some time reminiscing on a small planet around [d6]." / [d2] reacts …
  -> Path11 => Loc5  вер=1 порядок=5
       условия: логика {[p5]>1 and [p5]<5}
  -> Path12 => Loc7  вер=1 порядок=5
       условия: логика {[p5]=1}
  -> Path14 => Loc4  вер=1 порядок=5
       текст: End the call
       условия: логика {[p5]=5}

### Loc3 [обычная]
    Loc3-1: You reach for the call termination button when you suddenly hear mysterious noises coming from the control panel.
  -> Path7 => Loc1  вер=1 порядок=5
       текст: Look for the source of the noise

### Loc4 [УСПЕХ]

### Loc5 [пустая]
  -> Path2 => Loc2  вер=1
       текст: Can you read? It clearly says I'm <Ranger>
       условия: логика {[p1]=1}
       эффект: P5(Переключатель описаний) = 1
  -> Path3 => Loc2  вер=1 порядок=5
       текст: No, I don't know him. Who is he?
       условия: логика {[p1]=1}
       эффект: P5(Переключатель описаний) = 4
  -> Path4 => Loc2  вер=1 порядок=1
       текст: Perhaps
       условия: логика {[p1]=1}
       эффект: P5(Переключатель описаний) = 2
  -> Path5 => Loc2  вер=1 порядок=4
       текст: Why exactly are you asking?
       эффект: P5(Переключатель описаний) = 3
  -> Path6 => Loc3  вер=3 проходов<=5 порядок=7
       текст: End the call
  -> Path8 => Loc4  вер=1 порядок=7
       текст: End the call
  -> Path13 => Loc2  вер=1 порядок=6
       текст: Say that <Ranger> is your friend
       эффект: P5(Переключатель описаний) = 5

### Loc6 [обычная]
    выбор описания: {[p5]}
    Loc6-1: "That wasn't smart, <Ranger>," says [d2] acidly, "All conversations are recorded, including your insults. Thanks to the <clr>auto-justice system<clrEnd>, the ca…
    Loc6-2: "You shouldn't have forgotten about this, <Ranger>," says [d2] sadly, "The late fee is growing, you know, plus you might go to jail for failing to repay the loa…
    Loc6-3: "You can sell your ship to repay the loan at any time," recommends [d2]. "That's much better than receiving daily calls from our staff and risking incarceration…
    Loc6-4: "You do understand that you're obliged to repay the loan, don't you, <Ranger>? I'm not calling you just because I have nothing better to do. [d4] Company repres…
  -> Path22 => Loc7  вер=1 порядок=5

### Loc7 [пустая]
  -> Path15 => Loc6  вер=1 порядок=2
       текст: I forgot
       эффект: P5(Переключатель описаний) = 2
  -> Path16 => Loc6  вер=1 порядок=6
       текст: I have no money
       эффект: P5(Переключатель описаний) = 3
  -> Path17 => Loc6  вер=1 порядок=3
       текст: I'll definitely repay it
       условия: логика {[p5]<>4}
       эффект: P5(Переключатель описаний) = 4
  -> Path18 => Loc6  вер=1 [всегда видна] порядок=1
       текст: Curse them
       условия: логика {[p9]>=[p7]}
       эффект: P9(ext_Money) = {[p9]-[p7]}
       эффект: P5(Переключатель описаний) = 1
  -> Path20 => Loc4  вер=1 порядок=9
       текст: End the call
  -> Path21 => Loc3  вер=2 проходов<=5 порядок=9
       текст: End the call
       эффект: P11(ext_Luck) = {[p11]-1}
  -> Path23 => Loc8  вер=1 порядок=4
       текст: I'm ready to pay right now
       условия: логика {[p5]=4}

### Loc8 [обычная]
    Loc8-1: "Perfect, <Ranger>. You've at last begun to understand the seriousness of your situation. You can pay back your loan at the nearest <clr>business center<clrEnd>…
  -> Path24 => Loc4  вер=1 порядок=5
       текст: Turn off the communicator

### Loc9 [пустая]
  -> Path26 => Loc10  вер=1 порядок=7
       текст: Ignore the message and continue flying
       эффект: P11(ext_Luck) = {[p11]-5}
  -> Path27 => Loc11  вер=1 порядок=5
       текст: Put on a spacesuit and wipe off the writing

### Loc10 [УСПЕХ]

### Loc11 [обычная]
    Loc11-1: Looking at the writing from the other side, you're surprised to find that a whole phrase has appeared on the hull: "<clr>PAY UP YOUR DEBT, PISSLING<clrEnd>"  / …
  -> Path28 => Loc10  вер=1 порядок=5
       текст: Sit in your pilot's chair

### Loc12 [пустая]
  -> Path30 => Loc10  вер=1 порядок=9
       текст: Better think about the search for the messengers
       эффект: P11(ext_Luck) = {[p11]-10}
  -> Path31 => Loc13  вер=1 порядок=5
       текст: Read about yourself on the Galanet
       условия: логика {[p5]<>2}
       эффект: P5(Переключатель описаний) = 2
  -> Path32 => Loc13  вер=1 порядок=5
       текст: Put on a spacesuit and examine the ship
       эффект: P5(Переключатель описаний) = 1

### Loc13 [обычная]
    выбор описания: {[p5]}
    Loc13-1: As you inspect the armor of your mighty star bird, you notice some strange writing on the top part of the hull: "<clr>ALL YOUR SHIPS ARE BELONG TO US<clrEnd>". …
    Loc13-2: You type your name in the search system and get an unfortunate result: / "Your search for 'Ranger <Ranger>' returned no results." / You try different spellings,…
  -> Path33 => Loc12  вер=1 порядок=5
  -> Path34 => Loc14  вер=1 порядок=5
       текст: Get back in the ship
       условия: логика {[p7]>[p8] and [p5]=1}
       эффект: P7(Временная) = {[p8]}
  -> Path36 => Loc14  вер=1 порядок=5
       текст: Get back in the ship
       условия: логика {[p7]<=[p8] and [p5]=1}

### Loc14 [обычная]
    Loc14-1: Judging from the structural analysis of the ship the writing is fresh, as you expected.  / Turns out you lost [p7] structure points to the damage. The writer re…
    эффект: P8(ext_Structure) = {[p8]-[p7]}
  -> Path35 => Loc10  вер=1 порядок=5
       текст: Finish your investigation

### Loc15 [пустая]
    эффект: P7(Временная) = {[p8]/20+[1..5]}
    эффект: P5(Переключатель описаний) = 0
    эффект: P12(Tmp02) = {[p9]/100-([p11]*([p9]/10000))+50}
  -> Path39 => Loc16  вер=1 порядок=5
       условия: логика {[p8]>=[p7]}
       эффект: P8(ext_Structure) = {[p8]-[p7]}
  -> Path40 => Loc15  вер=1 порядок=5
       условия: логика {[p8]<[p7]}
       эффект: P7(Временная) = {[p8]}

### Loc16 [пустая]
  -> Path38 => Loc10  вер=1 порядок=6
       текст: Turn off the intercom
       условия: логика {[p5]<5}
       эффект: P11(ext_Luck) = {[p11]-5}
  -> Path41 => Loc17  вер=1 порядок=5
       текст: Answer
       условия: логика {[p5]=0}
       эффект: P5(Переключатель описаний) = 1
  -> Path42 => Loc17  вер=1 порядок=5
       текст: What writing?
       условия: логика {[p5]=1}
       эффект: P5(Переключатель описаний) = 2
  -> Path44 => Loc17  вер=1 порядок=2
       текст: Maybe you're the one who wrote it, [d2]?
       условия: логика {[p5]>1 and [p5]<5}
       эффект: P5(Переключатель описаний) = 3
  -> Path45 => Loc17  вер=1 порядок=2
       текст: Agree to get repairs done for [p12] cr.
       условия: логика {[p5]>1 and [p5]<5 and [p9]>=[p12]}
       эффект: P5(Переключатель описаний) = 5
       эффект: P9(ext_Money) = {[p9]-[p12]}
       эффект: P8(ext_Structure) = {[p8]+[p7]}
  -> Path46 => Loc17  вер=1 порядок=4
       текст: Ask for a photo of the writing
       условия: логика {[p5]>1 and [p5]<5}
       эффект: P5(Переключатель описаний) = 4
  -> Path92 => Loc10  вер=1 порядок=5
       текст: Turn off the intercom
       условия: логика {[p5]=5}

### Loc17 [обычная]
    выбор описания: {[p5]}
    Loc17-1: "Greetings, ranger <Ranger>! From the words written on your ship, I'm guessing you're also a victim of the creditors?"
    Loc17-2: "It's on the top of your ship's hull and it says, '<clr>PAY UP YOUR DEBT, WORM<clrEnd>.' That happened to me, too; in my case it was the work of the [d4] Collec…
    Loc17-3: "Come on, <Ranger>," he objected, "Why would I ever point that out to you and expose myself like this? And if I'd been hired by the creditors, it'd be really st…
    Loc17-4: There really is writing on the ship, and it's been written so well that it can be clearly seen even from a long distance away It also seems that the writing was…
    Loc17-5: "Perfect!" [d2] beams, "I can already see the money in my account. Wait for a bit, I'm sending the droid over." / After a few minutes, you do actually hear meta…
  -> Path43 => Loc16  вер=1 порядок=5

### Loc18 [пустая]
    эффект: P12(Tmp02) = {[p10]/8+1}
    эффект: P7(Временная) = {([p8]/2)-([p11]*([p8]/500))+2}
  -> Path48 => Loc19  вер=1 порядок=7
       текст: Ignore the warning
       условия: логика {[p5]<>1 and [p5]<>4}
       эффект: P5(Переключатель описаний) = 1
       эффект: P8(ext_Structure) = {[p8]-[p7]}
       эффект: P10(ext_Fuel) = {[p10]-[p12]}
  -> Path49 => Loc10  вер=1 порядок=5
       текст: Keep on searching for the messengers
       условия: логика {[p5]=1 or [p5]=4}
  -> Path50 => Loc19  вер=1 проходов<=1 порядок=3
       текст: Scan the fuel tank
       условия: логика {[p5]<>1 and [p5]<>4}
       эффект: P5(Переключатель описаний) = 2
  -> Path51 => Loc19  вер=1 проходов<=1 порядок=5
       текст: Examine the tank yourself
       условия: логика {[p5]<1 and [p5]<4 or [p5]=2}
       эффект: P5(Переключатель описаний) = 3
  -> Path52 => Loc19  вер=1 проходов<=1 порядок=2
       текст: Dump [p12] fuel into space
       условия: логика {[p5]<5 and [p5]>1}
       эффект: P5(Переключатель описаний) = 4
       эффект: P10(ext_Fuel) = {[p10]-[p12]}
       эффект: P11(ext_Luck) = {[p11]+5}

### Loc19 [обычная]
    выбор описания: {[p5]}
    Loc19-1: Forgetting that the engine actually requires fuel, you ignore the warning.  / Apparently that was a mistake. After a few minutes the engine stops; the onboard c…
    Loc19-2: You decide to use the onboard equipment to scan the fuel tank. / Apart from receiving the detailed plan of the tank itself, you manage to compare the compositio…
    Loc19-3: You decide to do everything the old-fashioned way: you take out your tools and try to get through the tangle of tubes, wires, and other mechanical stuff to make…
    Loc19-4: Having dumped [p12] fuel into space, you are relieved to see the warning <clr>disappear<clrEnd>. Seems like you can go on with your journey safely now.
  -> Path53 => Loc18  вер=1 порядок=5

### Loc20 [СТАРТ]
  -> Path54 => Loc1  вер=1 порядок=5
       условия: логика {[p1]>4 and [p1]<7 and [p10]<2}
       эффект: P1(История) = {[1..4]}
  -> Path55 => Loc1  вер=1 порядок=5
       условия: логика {[p1]>4 and [p1]<7 and [p10]>=2 or [p1]<5 or [p1]>6}

### Loc21 [пустая]
  -> Path58 => Loc10  вер=1 порядок=5
       текст: Keep on searching for the messengers
       условия: логика {[p5]=1 or [p5]>3}
  -> Path59 => Loc22  вер=1 порядок=5
       текст: Examine the tank yourself
       условия: логика {[p5]<4 and [p5]<>1}
       эффект: P5(Переключатель описаний) = 3
  -> Path60 => Loc23  вер=1 порядок=7
       текст: Ignore the warning
       условия: логика {[p5]>1 and [p5]<4 or [p5]=0}
       эффект: P5(Переключатель описаний) = 1
       эффект: P12(Tmp02) = {[p10]}
       эффект: P7(Временная) = {[p7]+[p10]}
  -> Path61 => Loc22  вер=1 порядок=3
       текст: Scan the fuel tank
       условия: логика {[p5]<>1 and [p5]<3}
       эффект: P5(Переключатель описаний) = 2
  -> Path62 => Loc22  вер=1 порядок=2
       текст: Dump [p12] fuel into space in hopes that the bomb will be dumped with it
       условия: логика {[p5]=2}
       эффект: P5(Переключатель описаний) = 4
       эффект: P10(ext_Fuel) = {[p10]-[p12]}
  -> Path65 => Loc22  вер=1
       текст: Try to disarm the bomb yourself
       условия: логика {[p5]=3}
       эффект: P5(Переключатель описаний) = 5
  -> Path66 => Loc24  вер=1
       текст: Try to disarm the bomb yourself
       условия: логика {[p5]=3 and [p11]<50}
       эффект: P5(Переключатель описаний) = 1
  -> Path68 => Loc22  вер=1 порядок=5
       текст: Dump [p12] fuel into space in hopes that the bomb will be dumped with it
       условия: логика {[p5]=2}
       эффект: P5(Переключатель описаний) = 6
       эффект: P8(ext_Structure) = {[p8]-([p7]/3)}
  -> Path69 => Loc22  вер=1
       текст: Thow the bomb into open space
       условия: логика {[p5]=3}
       эффект: P5(Переключатель описаний) = 7
  -> Path70 => Loc24  вер=1
       текст: Thow the bomb into open space
       условия: логика {[p5]=3 and [p11]<50}
       эффект: P5(Переключатель описаний) = 2

### Loc22 [обычная]
    выбор описания: {[p5]}
    Loc22-1: Forgetting that you must not allow foreign objects into your fuel tank, you ignore the warning. / That was a mistake; after a few minutes it <clr>explodes<clrEn…
    Loc22-2: You decide to use the onboard equipment to scan the fuel tank. / In addition to getting a detailed plan of the tank itself, you locate a spherical object, which…
    Loc22-3: You decide to do everything the old-fashioned way: you take out your tools and try to get through the tangle of tubes, wires, and other mechanical stuff to make…
    Loc22-4: Having dumped [p12] fuel into space, you notice with relief that the bomb disappeared with it.  / The warning is <clr>gone<clrEnd>; looks like you can go on wit…
    Loc22-5: Remembering what your years of being a ranger taught you, you open the bomb's protective jacket. / You dig through wires and boards and then start cutting them …
    Loc22-6: Having dumped [p12] fuel into space, you notice with relief that the bomb disappeared with it. Unfortunately, the bomb <clr>explodes<clrEnd> inside the cloud of…
    Loc22-7: You choose the simplest solution: you take the bomb to the cargo hold and pack it in an armored box. Then you put the box next to the airlock and press the open…
  -> Path63 => Loc21  вер=1 порядок=5

### Loc23 [пустая]
    эффект: P8(ext_Structure) = {[p8]-[p7]}
    эффект: P10(ext_Fuel) = 0
  -> Path64 => Loc22  вер=1 порядок=5

### Loc24 [обычная]
    Loc24-1: Remembering everything your years of being a ranger taught you, you open up the bomb's protective jacket. / You dig through wires and boards and then start cutt…
    Loc24-2: You choose the simplest solution: you take the bomb to the airlock and reach for the open button. Unfortunately, you can't do it in time, and the bomb explodes …
  -> Path67 => Loc25  вер=1 порядок=5
       текст: Go to a better place

### Loc25 [СМЕРТЬ]

### Loc26 [пустая]
  -> Path72 => Loc27  вер=1 проходов<=1 порядок=5
       текст: Fumble under the steering controls
       эффект: P5(Переключатель описаний) = 1
  -> Path73 => Loc27  вер=1 проходов<=1 порядок=5
       текст: Look for the source in the food equipment
       эффект: P5(Переключатель описаний) = 2
  -> Path74 => Loc27  вер=1 проходов<=1 порядок=5
       текст: Look for the source in the cargo hold
       эффект: P5(Переключатель описаний) = 4
  -> Path75 => Loc27  вер=1 проходов<=1 порядок=5
       текст: Search under the visor above the control panel
       эффект: P5(Переключатель описаний) = 3
  -> Path76 => Loc27  вер=1 проходов<=1 порядок=5
       текст: Search around the control panel
       эффект: P5(Переключатель описаний) = 5
  -> Path77 => Loc10  вер=1 порядок=7
       текст: Finish searching and continue looking for the messengers
       эффект: P11(ext_Luck) = {[p11]-3}

### Loc27 [пустая]
  -> Path78 => Loc30  вер=1 порядок=5
       условия: логика {[p5]=[p7]}
  -> Path79 => Loc29  вер=1 порядок=5
       условия: логика {[p5]<>[p7]}

### Loc29 [обычная]
    выбор описания: {[p5]}
    Loc29-1: The search for the source of the noise leads you to the steering controls. You fumble under it and find lots of dust and some wrappers, but nothing that could h…
    Loc29-2: It's hard to imagine that just a few thousand years ago all the races of the Coalition used to hunt animals for survival or had to grow food, which was a long a…
    Loc29-3: In ancient times, practically all races used wheel-based vehicles, since the earliest vehicles could only move across planetary surfaces. That was when the prin…
    Loc29-4: Remembering how much junk and assorted equipment you're keeping in the cargo hold, you decide to look for the source of the damned sound there. You spend severa…
    Loc29-5: The control panel, the bridge between the pilot and the ship, is considered a sacred place on any vessel.  / Remembering this, you go there to search for the so…
  -> Path80 => Loc26  вер=1 порядок=5

### Loc30 [обычная]
    выбор описания: {[p5]}
    Loc30-1: The search for the source of the noise leads you to the steering controls. You fumble under it and find lots of dust and some wrappers, but nothing that could h…
    Loc30-2: It's hard to imagine that just a few thousand years ago all the races of the Coalition used to hunt animals for survival or had to grow food, which was a long a…
    Loc30-3: In ancient times, practically all races used wheel-based vehicles, since the earliest vehicles could only move across planetary surfaces. That was when the prin…
    Loc30-4: Remembering how much junk and assorted equipment you're keeping in the cargo hold, you decide to look for the source of the damned sound there. You spend severa…
    Loc30-5: The control panel, the bridge between the pilot and the ship, is considered a sacred place on any vessel.  / Remembering this, you go there to search for the so…
  -> Path82 => Loc31  вер=1 порядок=5
       текст: Examine the whistle

### Loc31 [обычная]
    Loc31-1: You fiddle with it a little and notice a white corner sticking out from inside the whistle. You pull it and draw out a long piece of paper with a message: / "<c…
  -> Path81 => Loc10  вер=1 порядок=5
       текст: Go back to saving the Universe
       эффект: P11(ext_Luck) = {[p11]+5}

### Loc32 [пустая]
  -> Path84 => Loc10  вер=1 порядок=6
       текст: You can just shove your questions up your orifices! (End the call.)
  -> Path85 => Loc33  вер=1 порядок=5
       текст: Tell how things really are
       эффект: P5(Переключатель описаний) = 1
  -> Path87 => Loc33  вер=1 порядок=5
       текст: Avoid a straight answer
       эффект: P5(Переключатель описаний) = 3
  -> Path88 => Loc33  вер=1 порядок=5
       текст: Say everything's fine
       эффект: P5(Переключатель описаний) = 2
  -> Path89 => Loc33  вер=1 порядок=5
       текст: Complain about your life
       эффект: P5(Переключатель описаний) = 4

### Loc33 [обычная]
    выбор описания: {[p5]}
    Loc33-1: You try to remember the details of your life from your earliest childhood, and then begin your story. / You mention your crib, your favorite rubber duck and you…
    Loc33-2: "It's fine, it's okay," you reply with a dispirited look. Judging by his reaction, your dispirited look was a success. / "<Ranger>, I actually have important in…
    Loc33-3: "Everything's fine, I'm managing," you reply, "What about you, [d2]?" / "Oh, I'm fine too," he replied, "In fact, I have some important information for you."
    Loc33-4: "How am I?!" you cried, "How do you think I am? When the whole Universe is in danger, and our savage Galaxy keeps refusing any aid, and when the people of the i…
  -> Path86 => Loc34  вер=1 порядок=5
       текст: What information? Not spam, I hope?

### Loc34 [обычная]
    Loc34-1: "Recently I have started getting weird calls: lots of humanoids claiming they work for some [d4] agency, and all of them are looking for <clr>you<clrEnd>. Somet…
  -> Path90 => Loc4  вер=1 порядок=5
       текст: Say goodbye to the ranger

## Анализ
- стартовых: [20]
- концовки: {4: 'УСПЕХ', 10: 'УСПЕХ', 25: 'СМЕРТЬ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [2, 3, 4, 6]
