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
- P3 'Параметр номер 3' [0..20] тип=обычный
    старт: [1]
    [0..20] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Having completed the scan, you look at the screen to check the results as usual, but suddenly hear a strange sound coming from the right. You instinctively turn…
    скрыт: P3,P1,P2
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Greet the Maloq verbally
  -> Path4 => Loc2  вер=1 порядок=5
       текст: Stretch your hand out for a handshake
  -> Path5 => Loc2  вер=1 порядок=5
       текст: Hud Crando

### Loc2 [обычная]
    выбор описания: {[p2]}
    Loc2-1: The next few minutes could be described as an attempt at conversation between a monkey and a statue. None of your efforts to communicate with the Maloq produce …
    Loc2-2: While performing the therapy, you forget for a second that you're a conductor, not an insulator. There's a bright flash. Then a distinctive crack follows, and y…
    Loc2-3: After the 30th hit, you realize that spending this much effort trying to scratch through a wall would've yielded better results. Seems like the Maloq thinks the…
    Loc2-4: Judging by the Maloq's reaction, your speech has had some effect. He's indifferent at first, but then with each passing minute he seems to understand the essenc…
    Loc2-5: You shouldn't have done that. For the next five minutes, the Maloq tells you his whole life story, as well as his opinion about every commander that he's ever s…
  -> Path3 => Loc4  вер=1
       текст: Make the Maloq feel at ease with an oral measurement of his blood alcohol level
       условия: логика {[p3]>=10}
       эффект: P2(Text) = 1
       эффект: P3(Параметр номер 3) = 0
  -> Path6 => Loc6  вер=1 проходов<=1 порядок=3
       текст: Kindly punch him in the face one or two... dozen times
       эффект: P2(Text) = 3
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}
  -> Path7 => Loc7  вер=1 проходов<=1 порядок=2
       текст: Invigorate the Maloq with an electric shock
       эффект: P2(Text) = 2
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}
  -> Path12 => Loc8  вер=1 проходов<=1 порядок=4
       текст: Give an eloquent speech about the rules of conducting a third degree interrogation
       эффект: P2(Text) = 4
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}
  -> Path13 => Loc10  вер=1 проходов<=1 порядок=5
       текст: Inject him with a serum of tru... Er, a serum of burning desire to be interviewed.
       эффект: P2(Text) = 5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc3 [УСПЕХ]
    Loc3-1: "Of course I can," says Crando, then gives you a meaningful look for the first time and starts pattering. / "Thanks for your help! Be careful with the next mess…

### Loc4 [обычная]
    выбор описания: {[p2]}
    Loc4-1: At first the liquid therapy doesn't seem to be effective. You even try to remember your school chemistry lessons, thinking of a combination of ingredients that …
    Loc4-2: Peleng duckweed always loosens Lepras tongues, but to Maloqs the swill tastes like fermented fruit sauce. So you aren't surprised to see the Maloq keep his sile…
    Loc4-3: Exquisite human lolingreen is your favorite drink. Unfortunately, judging by his continued gloomy silence, the Maloq doesn't share your taste.
    Loc4-4: Gaal stickuila - the name promises so much... You feel like you've started drifting. The Maloq is, unfortunately, still firmly on the ground.
    Loc4-5: Maloq coriander is guaranteed to blow out the brains of any creature in the galaxy, except for Maloqs. Then again, what is there to blow out? Just to be sure, y…
  -> Path10 => Loc5  вер=1 проходов<=1 порядок=2
       текст: Give the Maloq some coriander
       эффект: P2(Text) = 5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}
  -> Path11 => Loc9  вер=1
       текст: Offer Crando a glass of water
       условия: логика {[p3]>=10}
       эффект: P3(Параметр номер 3) = 0
       эффект: P1(ext_Hint) = 1
  -> Path18 => Loc11  вер=1 проходов<=1 порядок=3
       текст: Pour your drinking... um, talking companion some duckweed
       эффект: P2(Text) = 2
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}
  -> Path20 => Loc12  вер=1 проходов<=1 порядок=5
       текст: Cheer your mate up with some lolingreen
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}
       эффект: P2(Text) = 3
  -> Path22 => Loc13  вер=1 проходов<=1 порядок=5
       текст: Treat the Captain with some stickuila
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}
       эффект: P2(Text) = 4

### Loc5 [пустая] визитов<=1
  -> Path17 => Loc4  вер=1 проходов<=1 порядок=5

### Loc6 [пустая] визитов<=1
  -> Path8 => Loc2  вер=1 проходов<=1 порядок=5

### Loc7 [пустая] визитов<=1
  -> Path9 => Loc2  вер=1 проходов<=1 порядок=5

### Loc8 [пустая] визитов<=1
  -> Path14 => Loc2  вер=1 проходов<=1 порядок=5

### Loc9 [обычная]
    Loc9-1: You didn't expect that the synthesis of 2 parts of hydrogen and 1 part of oxygen would affect the Maloq so much. Perhaps the water in the glass miraculously tur…
  -> Path24 => Loc14  вер=1 порядок=5
       текст: Crando, do you want to go home?

### Loc10 [пустая] визитов<=1
  -> Path15 => Loc2  вер=1 проходов<=1 порядок=5

### Loc11 [пустая] визитов<=1
  -> Path19 => Loc4  вер=1 проходов<=1 порядок=5

### Loc12 [пустая] визитов<=1
  -> Path21 => Loc4  вер=1 проходов<=1 порядок=5

### Loc13 [пустая] визитов<=1
  -> Path23 => Loc4  вер=1 проходов<=1 порядок=5

### Loc14 [обычная]
    Loc14-1: "AHA!" This is the first time the Captain gives a definite answer to a question.
  -> Path16 => Loc3  вер=1 порядок=5
       текст: Then say "<clr>Yupana<clrEnd>" out loud. It'll bring your consciousness back. Come on, say it. I believe you can do it.

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
