# Квест (формат 1111111127)
Сложность 30; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Fuel' [0..999999999] тип=обычный
    старт: [20]
    [0..999999999] Fuel: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..999999999] тип=обычный
    старт: [40]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Structure' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Structure: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_Money' [0..999999999] тип=обычный
    старт: [10000]
    [0..999999999] Money: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Damage' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Damage: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'Damage2' [0..999999999] тип=обычный
    старт: [13..20]
    [0..999999999] Damage 2: <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'Ring' [0..10] тип=обычный
    старт: [0]
    [0..10] Круголя: <>
    критическое: Сообщение достижения критического значения параметром 9
- P10 'DamageFuel' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Fuel damage: <>
    критическое: Сообщение достижения критического значения параметром 10

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Another ship's pilot gets in touch with you: / "I have the information you need. I can sell it to you."
    скрыт: P1,P2,P3,P4,P5,P6,P7,P8,P9,P10
  -> Path9 => Loc5  вер=1 порядок=5
       текст: What's the amount?

### Loc2 [ПРОВАЛ]
    выбор описания: {[p7]}
    Loc2-1: "Well, that's up to you," the pilot says and, a few minutes later, vanishes into hyperspace.
    Loc2-2: "I'm gone," says the pilot and, a few minutes later, vanishes into hyperspace.

### Loc3 [УСПЕХ]
    выбор описания: {[p7]}
    Loc3-1: "<Hint>," says the pilot and, a few minutes later, vanishes into hyperspace.
    Loc3-2: "<Hint>," says the pilot and, a few minutes later, vanishes into hyperspace. You look at yourself, cast a glance around the flight deck, and decide that nothing…
    эффект: P1(ext_Hint) = {1}

### Loc4 [пустая]
    эффект: P6(Damage) = {[p5] div [p8]}
  -> Path5 => Loc5  вер=1 порядок=5
       эффект: P7(Text) +1
       эффект: P8(Damage2) = {([p8]*[15..20])/10}
       эффект: P9(Ring) +1

### Loc5 [обычная]
    выбор описания: {[p7]}
    Loc5-1: "[p6] in solid Galactic currency. Deal?"
    Loc5-2: "Only for you: [p6] cr. Do we have a deal?"
    Loc5-3: "I'd agree to [p6] in solid Galactic currency and [p10] fuel. All righty?"
    эффект: P6(Damage) = {[p5] div [p8]}
  -> Path2 => Loc2  вер=1 порядок=3
       текст: That won't work for me
       эффект: P7(Text) = {1}
  -> Path3 => Loc3  вер=1 [всегда видна] порядок=7
       текст: Agreed
       эффект: P2(ext_Fuel) = {[p2]-[p10]}
       эффект: P5(ext_Money) = {[p5]-[p6]}
       эффект: P7(Text) = {1}
  -> Path4 => Loc4  вер=1 порядок=5
       текст: Sorry, can't afford that. Could we settle for less?
       условия: логика {[p9]=0}
  -> Path6 => Loc6  вер=1 порядок=5
       текст: Do you have any other payment options to offer?
       условия: логика {[p9]>=2 and [p3]>=40 and [p3]<=80}
  -> Path10 => Loc7  вер=1 порядок=5
       текст: That's too much. Can I offer you anything else?
       условия: логика {[p9]=1}
       эффект: P8(Damage2) = {([p8]*[15..20])/10}
       эффект: P10(DamageFuel) = {[p2]/3}

### Loc6 [обычная]
    Loc6-1: "I'm interested in one thing: your luck. You've gotten lucky again. I'm eager to sell the information you're seeking for half your luck. We'll both benefit from…
  -> Path7 => Loc3  вер=1 порядок=5
       текст: Deal!
       эффект: P3(ext_Luck) = {[p3]/3}
       эффект: P7(Text) = {2}
  -> Path8 => Loc2  вер=1 порядок=5
       текст: Get lost...
       эффект: P7(Text) = {2}

### Loc7 [пустая]
  -> Path11 => Loc5  вер=1 порядок=5
       условия: логика {[p10]<[p2]}
       эффект: P7(Text) +1
       эффект: P9(Ring) +1
  -> Path12 => Loc5  вер=1 порядок=5
       условия: логика {[p10]>=[p2]}
       эффект: P7(Text) +1
       эффект: P9(Ring) +1
       эффект: P10(DamageFuel) = {[p2]-1}

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
