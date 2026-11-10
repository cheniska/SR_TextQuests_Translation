# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Программ "Интерком"' [0..3] тип=обычный
    старт: [3]
    [0..3] Program Intercom: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Грубая настройка, канал' [0..6] тип=обычный
    старт: [0]
    [0..6] Rough Tuning, channel {[p2]+1}
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Точная настройка, канал' [0..2] тип=обычный
    старт: [0]
    [0..2] Fine Tuning, channel {[p3]+1}
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Дельта' [-2..2] тип=обычный
    старт: [0]
    [-2..2] Delta: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_Money' [0..1000000000] тип=обычный
    старт: [0]
    [0..1000000000] Параметр номер 5: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Номер локации' [0..100] тип=обычный
    старт: [0]
    [0..100] Location number: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Колво каналов' [0..7] тип=обычный
    старт: [7]
    [0..7] Number of channels: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'Сумма награды' [0..9999] тип=обычный
    старт: [0]
    [0..9999] Параметр номер 8: <>
    критическое: Сообщение достижения критического значения параметром 8

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: A wormhole opens in front of you, and a strange object materializes out of it. You stare at it, unable to believe your own eyes: it's an alien ship from hypersp…
    эффект: P4(Дельта) = {[-2..2]} [скрыт]
    эффект: P8(Сумма награды) = {[p5]/30+1000}
    скрыт: P1,P2,P3,P5,P6,P7
  -> Path2 => Loc2  вер=1 порядок=9
       текст: Ignore the signal
  -> Path3 => Loc3  вер=1 порядок=1
       текст: Try to decode the signal

### Loc2 [ПРОВАЛ]
    Loc2-1: You decide to make yourself scarce. Who knows what's on the alien's mind? You turn the ship around and fly away at full speed, as far as you can.

### Loc3 [обычная]
    Loc3-1: It turns out to be a broadband signal; your communicator kindly highlights a few <clr>rough tuning<clrEnd> channels ({[p7]}, to be more precise) which seem to b…
  -> Path4 => Loc4  вер=1 порядок=1
       текст: Begin decoding
       показ: P1,P2,P3

### Loc4 [обычная]
    выбор описания: {(([p2]+[p4]+[p7]) mod [p7])*3+[p3]+1}
    Loc4-1: On this frequency, the decoded message looks like this: / <clr>"*ou***a*****us***ve****t****ou***r**w****?*Of****rse***ut****w********a*f*****ne!"<clrEnd>
    Loc4-2: On this frequency, the decoded message looks like this: / <clr>"W***d***cit*********i****e****th**n***ods*****c****e******it****ld**e*****ke*****"<clrEnd>
    Loc4-3: On this frequency, the decoded message looks like this: / <clr>"***l* * *****s*l*****n*****s****er***o**** ****ou**** b*******ou***b* ***a***o***"<clrEnd>
    Loc4-4: On this frequency, the decoded message looks like this: / <clr>"A***u**a***g ****t***dd**ly*****e**on***s***rr***t*a"<clrEnd>
    Loc4-5: On this frequency, the decoded message looks like this: / <clr>"***z**h***a***g****s***e*** **ok******h***c****t****"<clrEnd>
    Loc4-6: On this frequency, the decoded message looks like this: / <clr>"* ***k***l******n***u***n***c****d*** *** *ar*** *e*"<clrEnd>
    Loc4-7: On this frequency, the decoded message looks like this: / <clr>"S***l***nu****ur*** ***t****ac***ne**f***y****net***ec****y"<clrEnd>
    Loc4-8: On this frequency, the decoded message looks like this: / <clr>"**oo**m*****ct****g**s***e ****bo***o***n***l****'s******m*"<clrEnd>
    Loc4-9: On this frequency, the decoded message looks like this: / <clr>"*to****a**f*****in**i* ****b******e ****** p*a***** ***no**"<clrEnd>
    Loc4-10: On this frequency, the decoded message looks like this: / <clr>"L*o**t** ***t***un******sh**.****ue***n****mm***c**i*******oco*****a***ng ***ly"<clrEnd>
    Loc4-11: On this frequency, the decoded message looks like this: / <clr>"***ok**o**o***e******w*****p***e****t****c********t**n **o****l.*****t****r*p**"<clrEnd>
    Loc4-12: On this frequency, the decoded message looks like this: / <clr>"*h****o**t* *h****k*o*n***i***R*q**s***g**o***ni****o*****t******Aw***i****e***"<clrEnd>
    Loc4-13: On this frequency, the decoded message looks like this: / <clr>"***le***u**r*******in*****yo******el****s ***de******e***bo****v***s**wa**"<clrEnd>
    Loc4-14: On this frequency, the decoded message looks like this: / <clr>"w**** ****a***sl*****g**n******ho*****d***b*****s***h********so***i*****ke"<clrEnd>
    Loc4-15: On this frequency, the decoded message looks like this: / <clr>"*hi***y*****e ***ep*********u****me*a******or******t****eb*l**o*t*** a***e"<clrEnd>
    Loc4-16: On this frequency, the decoded message looks like this: / <clr>"f**h***nn***b***i*le****t***im*****l**an*****e **sh**os**a****t***"<clrEnd>
    Loc4-17: On this frequency, the decoded message looks like this: / <clr>"*i***c****t**e***l**d,****s*****r*a*,***d**iv**f*** c***** f***u*e"<clrEnd>
    Loc4-18: On this frequency, the decoded message looks like this: / <clr>"**s***a**o*****k*******i*'****mo********* l*****ish****t****or**n*"<clrEnd>
    Loc4-19: On this frequency, the decoded message looks like this: / <clr>"*h****o**t* *h****k*o*n***i***R*q**s***g**o***ni****o*****t******Aw***i****e***"<clrEnd>
    Loc4-20: On this frequency, the decoded message looks like this: / <clr>"T***l****h***i****vi****o**ch****l****B***ig***re****t**sa******ll***un**"<clrEnd>
    Loc4-21: On this frequency, the decoded message looks like this: / <clr>"**e **zy***g****gi***g***u****nn**s****fl****t***qu**** ***vo**i*******ch"<clrEnd>
    эффект: P6(Номер локации) = {(([p2]+[p4]+[p7]) mod [p7])*3+[p3]+1}
  -> Path5 => Loc5  вер=1 порядок=9
       текст: Launch the Intercom
       условия: логика {([p2]+[p4]+[p7]) mod [p7]=3}
       эффект: P1(Программ "Интерком") -1
  -> Path6 => Loc8  вер=1 порядок=9
       текст: Launch the Intercom
       условия: логика {([p2]+[p4]+[p7]) mod [p7]<>3}
       эффект: P1(Программ "Интерком") -1
  -> Path9 => Loc4  вер=1 порядок=1
       текст: Next rough tuning channel
       эффект: P2(Грубая настройка, канал) = {(([p2]+1) mod [p7])}
  -> Path10 => Loc4  вер=1 порядок=2
       текст: Previous rough tuning channel
       эффект: P2(Грубая настройка, канал) = {(([p2]+[p7]-1) mod [p7])}
  -> Path11 => Loc4  вер=1 порядок=4
       текст: Previous fine tuning channel
       эффект: P3(Точная настройка, канал) = {(([p3]+2) mod 3)}
  -> Path12 => Loc4  вер=1 порядок=3
       текст: Next fine tuning channel
       эффект: P3(Точная настройка, канал) = {(([p3]+1) mod 3)}

### Loc5 [обычная]
    Loc5-1: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr>Lhooktoo to the unknown ship. Requesting communication protocol. Awaiting…
  -> Path8 => Loc7  вер=1 порядок=9
       текст: Send coordinates
  -> Path14 => Loc9  вер=1 порядок=1
       текст: Don't give the coordinates

### Loc6 [ПРОВАЛ]
    Loc6-1: Unfortunately, all your attempts to understand the alien ship prove futile. Well, looks like you are not going to be the first human to establish contact with t…

### Loc7 [УСПЕХ]
    Loc7-1: You send the coordinates to Lhooktoo. A couple minutes later, a small wormhole appears from the hyperspace in front of his ship and swallows it immediately. And…
    эффект: P5(ext_Money) = {[p5]+[p8]}

### Loc8 [обычная]
    выбор описания: {(([p2]+[p4]+[p7]) mod [p7])+1}
    Loc8-1: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr>Would a citrus live in the southern woods? Of course, but it would be a f…
    Loc8-2: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr>A Dzukhallag agent suddenly choked on his carrot tea<clrEnd>" /  / Obviou…
    Loc8-3: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr>Stool manufacturing is the backbone of any planet's economy<clrEnd>" /  /…
    Loc8-4: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr><clrEnd>" /  / Obviously, this decoding is not the message that the unkno…
    Loc8-5: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr>while you are sleeping on your homeland's borders, the cibolusovt is awak…
    Loc8-6: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr>fish cannot be killed, it's immortal, and live fish cost a fortune<clrEnd…
    Loc8-7: You launch the Intercom, and the fully decoded message is shown on the screen: / "<clr>The lazy hog is giving you channels?! Byflight request, salvo till launch…
  -> Path7 => Loc4  вер=1 порядок=5
       текст: Continue scanning
       условия: P1(Программ "Интерком") 1..3
  -> Path13 => Loc6  вер=1 порядок=9
       текст: Complete the decoding
       условия: P1(Программ "Интерком") 0..0

### Loc9 [ПРОВАЛ]
    Loc9-1: Deciding that it would be best not to reveal any coordinates to this potential enemy, you turn your ship around and fly away.

### Loc10 [обычная]

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 6: 'ПРОВАЛ', 7: 'УСПЕХ', 9: 'ПРОВАЛ'}
- недостижимые локации: [10]
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
