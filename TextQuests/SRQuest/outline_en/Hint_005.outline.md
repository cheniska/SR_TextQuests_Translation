# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Money' [0..999999999] тип=обычный
    старт: [10000]
    [0..999999999] Money: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Выбор игрока' [1..36] тип=обычный
    старт: [1]
    [1..18] Red
    [19..36] Black
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Номер' [1..36] тип=обычный
    старт: [1..36]
    [1..36] Number: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Проигрыш' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Loss: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 7

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: As you are waiting for your flight to end, you doze off. You dream of a strange shapeless creature. It's impossible to describe, even using those idiomatic expr…
    эффект: P6(Проигрыш) = {[p2] div 20+2} [скрыт]
    скрыт: P1,P2,P3,P4,P5,P7
  -> Path4 => Loc4  вер=1 порядок=3
       текст: I bet on red
       эффект: P4(Выбор игрока) = {18}
       эффект: P7(Text) = {1}
  -> Path5 => Loc4  вер=1 порядок=5
       текст: I bet on black
       эффект: P4(Выбор игрока) = {19}
       эффект: P7(Text) = {2}

### Loc2 [ПРОВАЛ]
    выбор описания: {[p7]}
    Loc2-1: The ball lands on <clr>red<clrEnd>, but you had bet on black. The strange creature laughs in your face. Its laughter gets louder and louder, turning into a poun…
    Loc2-2: The ball lands on <clr>black<clrEnd>, but you had bet on red. The strange creature laughs in your face. Its laughter gets louder and louder, turning into a poun…
    эффект: P2(ext_Money) = {[p2]-[p6]}

### Loc3 [УСПЕХ]
    выбор описания: {[p7]}
    Loc3-1: The ball lands on <clr>red<clrEnd>, the very color you bet on. The strange creature says between its teeth: / "You beat me," adding something long and unintelli…
    Loc3-2: The ball lands on <clr>black<clrEnd>, the very color you bet on. The strange creature says between its teeth: / "You beat me," adding something long and unintel…
    эффект: P1(ext_Hint) = 1

### Loc4 [обычная]
    Loc4-1: Immediately a strange, disc-shaped object with a ball inside it appears out of thin air. "<clr>The spinette<clrEnd>," you realize. / The strange creature turns …
    эффект: P5(Номер) = {[1..36]}
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Find out the result
       условия: логика {[p4]=18 and [p4]+[p3] div 10<[p5]}
       эффект: P7(Text) = {2}
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Find out the result
       условия: логика {[p4]=19 and [p4]-[p3] div 10<=[p5]}
       эффект: P7(Text) = {2}
  -> Path6 => Loc2  вер=1 порядок=5
       текст: Find out the result
       условия: логика {[p4]=19 and [p4]-[p3] div 10>[p5]}
       эффект: P7(Text) = {1}
  -> Path7 => Loc3  вер=1 порядок=5
       текст: Find out the result
       условия: логика {[p4]=18 and [p4]+[p3] div 10>=[p5]}
       эффект: P7(Text) = {1}

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
