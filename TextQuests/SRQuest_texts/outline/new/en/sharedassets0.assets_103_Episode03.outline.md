# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Счетчик' [0..20] тип=обычный
    старт: [8]
    [0..20] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: At first you don't see anything interesting about this system. But when after a few seconds the lights on the flight deck go out and then immediately turn back …
    эффект: P2(Text) = {} [скрыт]
    скрыт: P1,P3
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Hoarse von Steed?!

### Loc2 [обычная]
    Loc2-1: "Thanks to you, the great pirate Hoarse von Steed, who could hijack caravans better than anyone in the galaxy, died during the Dominators' attack on Mergaz, cre…
  -> Path4 => Loc4  вер=1 порядок=5
       текст: Hoarse von Mare?!
       эффект: P2(Text) = 1
  -> Path5 => Loc4  вер=1 порядок=5
       текст: Arutszakh?
       эффект: P2(Text) = 3
  -> Path6 => Loc4  вер=1 порядок=5
       текст: Dominated Mergaz?
       эффект: P2(Text) = 2

### Loc3 [УСПЕХ]
    Loc3-1: You don't even have time to feel scared. The booth flies for a few meters and then stops in the air. You immediately hear <clr>Arutszakh's<clrEnd> desperate cri…

### Loc4 [обычная]
    выбор описания: {[p2]}
    Loc4-1: "Wrong. Since the time of your crafty trick I have been called <clr>Ranger Arutszakh<clrEnd>. By the way, are you comfortable hanging there? You don't need to a…
    Loc4-2: "Laugh while you can. While you have something to laugh at. My name is actually rRanger <clr>Arutszakh<clrEnd>. By the way, are you comfortable hanging there? Y…
    Loc4-3: "You are smart indeed, aren't you. Yes, since then I've been called ranger <clr>Arutszakh<clrEnd>. By the way, are you comfortable hanging there? You don't need…
  -> Path7 => Loc5  вер=1 порядок=5
       текст: Hoarsy, I tried, honestly. But every time your structure falls below a few hundred, you somehow get whisked away to some planet to get fixed.

### Loc5 [обычная]
    Loc5-1: "Should've tried better! For a whole year, I had to defend Mergaz against the Dominators practically alone, until some spare parts came! And when they did, that…
    эффект: P2(Text) = 1
  -> Path8 => Loc7  вер=1 порядок=5
       текст: Drop the false modesty. They're rewarded you for this, surely.

### Loc6 [обычная]
    Loc6-1: "You don't know this?! You surprise me. Really. 'Abacus' in the language of the ancient Aztoi is '<clr>Yupana<clrEnd>'! Have a soft landing, <Ranger>." After th…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Get frightened

### Loc7 [обычная]
    Loc7-1: "Oh, yes, I was rewarded. They gave me <clr>Uranium Milko<clrEnd> and in a pompous ceremony made me a ranger. When my mates on Rahish found out about these inci…
  -> Path9 => Loc8  вер=1 порядок=5
       текст: Wait! When leaving Mergaz, I didn't leave you tied and hanging upside down, did I? Are you sure that this kind of score-settling will bring back your friends' r…

### Loc8 [обычная]
    выбор описания: {[p2]}
    Loc8-1: "That's true, smartypants. Fortunately, I've developed a few talents during the time I've spent here, and I have found the most elegant solution to our problem.…
    Loc8-2: You whole-heartedly bathe the Peleng in the choicest untranslatable interstellar filth. Once you've finished your furious speech, the pleased <clr>Arutszakh<clr…
    Loc8-3: "This joke might not be connected to the Dominators. The local structure is too ancient and too developed at the same time. It's quite open, I'd even say predis…
    Loc8-4: "With pleasure! Plus, you won't tell anybody about this. This thing has interesting error protection. When something goes wrong, it restarts the virtual world f…
    Loc8-5: "Hoping to get out? I wouldn't. You don't look mad, so I'll just give you a hint: ranger, <Ranger>, <Hint>." After this, the booth shakes - the knashes have saw…
  -> Path10 => Loc10  вер=1 проходов<=1 порядок=3
       текст: Better tell me something about this Dominator piece of scrap.
       эффект: P2(Text) = 3
  -> Path11 => Loc9  вер=1 проходов<=1 порядок=2
       текст: Do you know who you are? You're a little, lousy piece of...
       эффект: P2(Text) = 2
  -> Path14 => Loc6  вер=1
       текст: Help me with the crossword. Number 5 down, 6 letters. How do you say "abacus" in the language of the ancient Aztoi? Begins with "y", ends with "na."
       условия: логика {[p3]>=20}
  -> Path15 => Loc11  вер=1 проходов<=1 порядок=4
       текст: I see you've found a common language with this piece of scrap metal. You could share some secrets about it.
       эффект: P2(Text) = 4
  -> Path17 => Loc12  вер=1 проходов<=1 порядок=5
       текст: If you know, tell me - where do I find the next messenger? I was looking for one and found you instead.
       эффект: P2(Text) = 5
       эффект: P1(ext_Hint) = 1

### Loc9 [пустая] визитов<=1
  -> Path13 => Loc8  вер=1 проходов<=1 порядок=5
       эффект: P3(Счетчик) = {[p3]+[p2]}

### Loc10 [пустая] визитов<=1
  -> Path12 => Loc8  вер=1 проходов<=1 порядок=5
       эффект: P3(Счетчик) = {[p3]+[p2]}

### Loc11 [пустая] визитов<=1
  -> Path16 => Loc8  вер=1 проходов<=1 порядок=5
       эффект: P3(Счетчик) = {[p3]+[p2]}

### Loc12 [пустая] визитов<=1
  -> Path18 => Loc8  вер=1 проходов<=1 порядок=5
       эффект: P3(Счетчик) = {[p3]+[p2]}

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
