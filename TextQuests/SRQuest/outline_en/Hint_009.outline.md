# Квест (формат 1111111127)
Сложность 10; стартовая локация: [1]; путей по умолчанию: 0

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

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p3]}
    Loc1-1: Approaching your destination, you <clr>notice<clrEnd> an outdated Peleng <clr>spying probe<clrEnd> in orbit.  / Knowing what these things usually do, you use yo…
    эффект: P2(Count_Text) = {} [скрыт]
    скрыт: P1,P3
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Take the test

### Loc2 [обычная]
    Loc2-1: Is luxury a cool thing?
  -> Path3 => Loc3  вер=1 порядок=3
       текст: Yes
       эффект: P2(Count_Text) +1
  -> Path9 => Loc3  вер=1 порядок=5
       текст: No

### Loc3 [обычная]
    Loc3-1: Are frogsters stronger than bambays?
  -> Path4 => Loc4  вер=1 порядок=3
       текст: Yes
       эффект: P2(Count_Text) +1
  -> Path10 => Loc4  вер=1 порядок=5
       текст: No

### Loc4 [обычная]
    Loc4-1: Do Maloqs like penchequacks?
  -> Path5 => Loc5  вер=1 порядок=3
       текст: Yes
       эффект: P2(Count_Text) +1
  -> Path11 => Loc5  вер=1 порядок=5
       текст: No

### Loc5 [обычная]
    Loc5-1: What about breeding them?
  -> Path6 => Loc6  вер=1 порядок=3
       текст: Yes
       эффект: P2(Count_Text) +1
  -> Path12 => Loc6  вер=1 порядок=5
       текст: No

### Loc6 [обычная]
    Loc6-1: Are Maloqs the dumbest creatures in the Galaxy?
  -> Path13 => Loc10  вер=1 порядок=3
       текст: Yes
       эффект: P2(Count_Text) +1
  -> Path14 => Loc10  вер=1 порядок=5
       текст: No

### Loc7 [УСПЕХ]
    Loc7-1: You look through the recordings made by the spying probe, not just to find out who, with whom, why, where, what, in which position, and to what result everythin…
    эффект: P1(ext_Hint) +1

### Loc8 [ПРОВАЛ]
    Loc8-1: The decision doesn't seem Peleng enough for you, so you make sure the spying probe will enter the dense atmosphere on a trajectory that makes its further existe…

### Loc9 [обычная]
    Loc9-1: Realizing that the results of the anti-Maloq test can be easily predicted from the available answers, you sigh in relief and choose your next action.
  -> Path7 => Loc7  вер=1 порядок=5
       текст: Rummage through the spying probe's recordings
       условия: логика {[p2]>=6}
  -> Path8 => Loc8  вер=1 порядок=5
       текст: Spit angrily, wipe the screen, and keep on flying
       условия: логика {[p2]<6}
  -> Path16 => Loc2  вер=1 порядок=3
       текст: Try again
       условия: логика {[p2]<6}
       эффект: P3(Text) = {2}

### Loc10 [обычная]
    Loc10-1: How would you like it if some Maloqs ended up in a swamp?
  -> Path15 => Loc9  вер=1 порядок=7
       текст: No
       эффект: P2(Count_Text) +1
  -> Path17 => Loc9  вер=1 порядок=5
       текст: Yes

## Анализ
- стартовых: [1]
- концовки: {7: 'УСПЕХ', 8: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
