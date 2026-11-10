# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Structure' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Structure: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Штраф структуры' [0..300] тип=обычный
    старт: [0]
    [0..300] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 5

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Because of the low-quality part sitting between your steering yoke and your chair, your ship exits hyperspace on the edge of a local asteroid field. The sensors…
    скрыт: P1,P2,P3,P4,P5
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Choose not to take the risk
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Check the source of the signal
       эффект: P2(Штраф структуры) = {[20..300]}
  -> Path5 => Loc4  вер=5 порядок=5
       текст: Check the source of the signal

### Loc2 [ПРОВАЛ]
    Loc2-1: Wise decision! You have plenty to do as it is.

### Loc3 [пустая]
    эффект: P2(Штраф структуры) = {[p2]-[p3]}
    эффект: P5(Text) = {2}
  -> Path4 => Loc4  вер=1 проходов<=1 порядок=5
       условия: логика {[p2]<[p1]-10}
  -> Path6 => Loc4  вер=1 порядок=5
       условия: логика {[p2]>=[p1]-10}
       эффект: P2(Штраф структуры) = {[p1]-10}

### Loc4 [УСПЕХ]
    выбор описания: {[p5]}
    Loc4-1: Some <clr>good news<clrEnd>: dissecting the discovered black box, you find a hint: a recording of the last battle. One of the combatants looks very much like a …
    Loc4-2: Some <clr>bad news<clrEnd>: your parkour session in the asteroid field cost your ship [p2] structure.  / Some <clr>good news<clrEnd>: dissecting the discovered …
    эффект: P4(ext_Hint) = 1
    эффект: P1(ext_Structure) = {[p1]-[p2]}

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 4: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
