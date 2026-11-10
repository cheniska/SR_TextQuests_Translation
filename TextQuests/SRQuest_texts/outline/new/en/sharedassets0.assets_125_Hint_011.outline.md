# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Structure' [0..999999999] тип=обычный
    старт: [100]
    [0..999999999] Structure: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Коэффициент откуса структуры' [1..10] тип=обычный
    старт: [6..8]
    [1..10] Structure loss: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Откус структуры' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Structural for the text: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 6: <>
    критическое: Сообщение достижения критического значения параметром 6

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: You notice a familiar-shaped ship orbiting a star. You realize that one of your predecessors used to fly such a ship. The problem is that the ship's engines are…
    эффект: P5(Откус структуры) = {} [скрыт]
    скрыт: P1,P2,P3,P4
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Fly away
  -> Path5 => Loc4  вер=1 порядок=5
       текст: Fly to the rescue
       условия: логика {[p3]<70}
       эффект: P4(Коэффициент откуса структуры) = {[4..5]}
  -> Path9 => Loc3  вер=1 порядок=5
       текст: Fly to the rescue
       условия: логика {[p3]>=70}
       эффект: P5(Откус структуры) = {[p2] div [p4]}

### Loc2 [ПРОВАЛ]
    выбор описания: {[p6]}
    Loc2-1: "Every man for himself," you decide, quite reasonably, accelerating and leaving the dangerous place as quickly as you can.
    Loc2-2: "Every man for himself," you decide, quite reasonably, accelerating and leaving the dangerous place as quickly as you can. It makes you sad to think of the [p5]…
    эффект: P2(ext_Structure) = {[p2]-[p5]}

### Loc3 [УСПЕХ]
    Loc3-1: Your ship's sensors just managed to pick up a more or less intelligible signal and decipher it. / The <clr>bad news<clrEnd>: during such a close encounter with …
    эффект: P1(ext_Hint) = 1
    эффект: P2(ext_Structure) = {[p2]-[p5]}

### Loc4 [обычная]
    Loc4-1: You catch up with the ship and begin scanning. The very first results are disappointing: the flying tincan has been empty for a long time. Then the onboard comp…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Continue scanning
       условия: логика {[p3]>=40}
       эффект: P5(Откус структуры) = {[p2] div [p4]}
  -> Path4 => Loc2  вер=1 порядок=5
       текст: Stop scanning
       эффект: P5(Откус структуры) = {([p2] div [p4]) div 2}
       эффект: P6(Text) = 2
  -> Path8 => Loc5  вер=1 порядок=5
       текст: Continue scanning
       условия: логика {[p3]<40}
       эффект: P4(Коэффициент откуса структуры) = {[2..3]}

### Loc5 [обычная]
    Loc5-1: The hull temperature is increasing rapidly. You won't have an easy time getting away now. / You must decide immediately whether to continue scanning or not.
  -> Path6 => Loc2  вер=1 порядок=5
       текст: Stop scanning and retreat
       эффект: P5(Откус структуры) = {([p2] div [p4]) div 2}
       эффект: P6(Text) = 2
  -> Path7 => Loc3  вер=1 порядок=5
       текст: Continue scanning
       эффект: P5(Откус структуры) = {[p2] div [p4]}

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
