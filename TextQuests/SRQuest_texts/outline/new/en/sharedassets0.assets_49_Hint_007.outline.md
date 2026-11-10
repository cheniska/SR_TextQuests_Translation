# Квест (формат 1111111127)
Сложность 20; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Count_Text' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Text Counter: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Слово номер 1' [0..2] тип=обычный
    старт: [0..2]
    [0..0] Smart
    [1..1] Wise
    [2..2] Knowledgeable
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Слово номер 2' [0..2] тип=обычный
    старт: [0..2]
    [0..0] Honest
    [1..1] Truthful
    [2..2] Sincere
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Слово номер 3' [0..2] тип=обычный
    старт: [0..2]
    [0..0] Handsome
    [1..1] Elegant
    [2..2] Wonderful
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Слово номер 4' [0..2] тип=обычный
    старт: [0..2]
    [0..0] Fair
    [1..1] Kind
    [2..2] Generous
    критическое: Сообщение достижения критического значения параметром 7
- P8 'Слово номер 5' [0..2] тип=обычный
    старт: [0..2]
    [0..0] Modest
    [1..1] Noble
    [2..2] Decent
    критическое: Сообщение достижения критического значения параметром 8
- P9 'Выбор игрока' [0..2] тип=обычный
    старт: [0]
    [0..2] Player's choice: <>
    критическое: Сообщение достижения критического значения параметром 9

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p3]}
    Loc1-1: Your ship shakes. The onboard computer happily informs you that a tiny meteorite has honored the hull of your ship with a visit. Two hours of grunts punctuated …
    Loc1-2: The writing appears on the screen: /  "Only the most [d4], [d5], [d6], [d7], and [d8] will be able to open this container." Then the writing blinks and disappea…
    эффект: P2(Count_Text) = {} [скрыт]
    скрыт: P1,P3,P4,P5,P6,P7,P8,P9
  -> Path2 => Loc8  вер=1 порядок=5
       текст: Smart
       эффект: P9(Выбор игрока) = {0}
  -> Path9 => Loc8  вер=1 порядок=5
       текст: Knowledgeable
       эффект: P9(Выбор игрока) = {2}
  -> Path10 => Loc8  вер=1 порядок=5
       текст: Wise
       эффект: P9(Выбор игрока) = {1}

### Loc2 [обычная]
    Loc2-1: Choose the second word:
  -> Path3 => Loc9  вер=1 порядок=5
       текст: Honest
       эффект: P9(Выбор игрока) = {0}
  -> Path11 => Loc9  вер=1 порядок=5
       текст: Truthful
       эффект: P9(Выбор игрока) = {1}
  -> Path12 => Loc9  вер=1 порядок=5
       текст: Sincere
       эффект: P9(Выбор игрока) = {2}

### Loc3 [обычная]
    Loc3-1: Choose the third word:
  -> Path4 => Loc10  вер=1 порядок=5
       текст: Handsome
       эффект: P9(Выбор игрока) = {0}
  -> Path13 => Loc10  вер=1 порядок=5
       текст: Elegant
       эффект: P9(Выбор игрока) = {1}
  -> Path14 => Loc10  вер=1 порядок=5
       текст: Wonderful
       эффект: P9(Выбор игрока) = {2}

### Loc4 [обычная]
    Loc4-1: Choose the fourth word:
  -> Path5 => Loc11  вер=1 порядок=5
       текст: Fair
       эффект: P9(Выбор игрока) = {0}
  -> Path15 => Loc11  вер=1 порядок=5
       текст: Generous
       эффект: P9(Выбор игрока) = {2}
  -> Path16 => Loc11  вер=1 порядок=5
       текст: Kind
       эффект: P9(Выбор игрока) = {1}

### Loc5 [обычная]
    Loc5-1: And finally, choose the fifth word:
  -> Path6 => Loc13  вер=1 порядок=5
       текст: Modest
       эффект: P9(Выбор игрока) = {0}
  -> Path17 => Loc13  вер=1 порядок=5
       текст: Decent
       эффект: P9(Выбор игрока) = {2}
  -> Path18 => Loc13  вер=1 порядок=5
       текст: Noble
       эффект: P9(Выбор игрока) = {1}

### Loc6 [обычная]
    выбор описания: {[p2]}
    Loc6-1: Once you've chosen the fifth word, a phrase appears on the screen: / "Wrong code, try again," and it immediately becomes clear that some of your choices were wr…
    Loc6-2: Once you've chosen the fifth word, a phrase appears on the screen: / "Wrong code, try again," and it immediately becomes clear that some of your choices were wr…
    Loc6-3: Once you've chosen the fifth word, a phrase appears on the screen: / "Wrong code, try again," and it immediately becomes clear that some of your choices were wr…
    Loc6-4: Once you've chosen the fifth word, a phrase appears on the screen: / "Wrong code, try again," and it immediately becomes clear that some of your choices were wr…
    Loc6-5: Once you've chosen the fifth word, a phrase appears on the screen: / "Code accepted." Immediately, the solid container wall slowly opens, giving you access to a…
  -> Path7 => Loc7  вер=1 порядок=5
       текст: Connect the storage medium to your onboard computer
       условия: логика {[p2]>4}
  -> Path8 => Loc12  вер=1 порядок=5
       текст: Dump the container into space and forget about it
       условия: логика {[p2]<=4}
  -> Path29 => Loc1  вер=1 порядок=5
       текст: Try again
       условия: логика {[p2]<=4}
       эффект: P2(Count_Text) = {0}
       эффект: P3(Text) = {2}
       эффект: P4(Слово номер 1) = {[0..2]}
       эффект: P5(Слово номер 2) = {[0..2]}
       эффект: P6(Слово номер 3) = {[0..2]}
       эффект: P7(Слово номер 4) = {[0..2]}
       эффект: P8(Слово номер 5) = {[0..2]}
       эффект: P9(Выбор игрока) = {[0..2]}

### Loc7 [УСПЕХ]
    Loc7-1: Over the next three minutes, you witness the most interesting show, made by the person you're looking for. You wonder how he managed to send his message with su…
    эффект: P1(ext_Hint) +1

### Loc8 [пустая]
  -> Path19 => Loc2  вер=1 порядок=5
       условия: логика {[p9]<>[p4]}
  -> Path20 => Loc2  вер=1 порядок=5
       условия: логика {[p9]=[p4]}
       эффект: P2(Count_Text) +1

### Loc9 [пустая]
  -> Path21 => Loc3  вер=1 порядок=5
       условия: логика {[p9]<>[p5]}
  -> Path22 => Loc3  вер=1 порядок=5
       условия: логика {[p9]=[p5]}
       эффект: P2(Count_Text) +1

### Loc10 [пустая]
  -> Path23 => Loc4  вер=1 порядок=5
       условия: логика {[p9]<>[p6]}
  -> Path24 => Loc4  вер=1 порядок=5
       условия: логика {[p9]=[p6]}
       эффект: P2(Count_Text) +1

### Loc11 [пустая]
  -> Path25 => Loc5  вер=1 порядок=5
       условия: логика {[p9]<>[p7]}
  -> Path26 => Loc5  вер=1 порядок=5
       условия: логика {[p9]=[p7]}
       эффект: P2(Count_Text) +1

### Loc12 [ПРОВАЛ]
    Loc12-1: You decide you've had enough, dump the container into space, and go on your way.

### Loc13 [пустая]
  -> Path27 => Loc6  вер=1 порядок=5
       условия: логика {[p9]<>[p8]}
  -> Path28 => Loc6  вер=1 порядок=5
       условия: логика {[p9]=[p8]}
       эффект: P2(Count_Text) +1

## Анализ
- стартовых: [1]
- концовки: {7: 'УСПЕХ', 12: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
