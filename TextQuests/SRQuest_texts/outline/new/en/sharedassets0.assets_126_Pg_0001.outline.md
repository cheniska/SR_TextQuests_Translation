# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Structure' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Structure: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Fuel' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Fuel: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..999999999] тип=обычный
    старт: [50]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Teleport' [0..3] тип=обычный
    старт: [0]
    [0..3] Teleport: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Damage' [0..1000] тип=обычный
    старт: [1..125]
    [0..1000] Damage: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'FuelDamage' [1..100] тип=обычный
    старт: [1]
    [1..100] Fuel Damage: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'TeleportBonus' [0..5] тип=обычный
    старт: [0]
    [0..5] Параметр номер 8: <>
    критическое: Сообщение достижения критического значения параметром 8

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: You're rushing at full speed through a section of space littered with stars... Why is there an absolutely black hole ahead of you, darker than even the space ar…
    скрыт: P1,P2,P3,P4,P5,P6,P7,P8
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Time to run like hell before it sucks me in
       условия: логика {[p2]<=2}
       эффект: P6(Damage) = 0
  -> Path3 => Loc3  вер=1 порядок=3
       текст: Continue on the same course
       условия: логика {[p1]>1}
  -> Path6 => Loc2  вер=1 порядок=5
       текст: Time to run like hell before it sucks me in
       условия: логика {[p2]>2}
       эффект: P2(ext_Fuel) = {[p2]-2}
       эффект: P6(Damage) = 0
  -> Path18 => Loc3  вер=1 порядок=5
       текст: Continue on the same course
       условия: логика {[p1]<=1}
       эффект: P1(ext_Structure) = {2}
       эффект: P5(Text) = {2}

### Loc2 [ПРОВАЛ]
    выбор описания: {[p5]}
    Loc2-1: "Time to run like hell before it sucks me in and crushes me with its gravitational force!" you think, as your trembling fingers input into the navigational syst…
    Loc2-2: "Run like hell!" you shout, rather than thinking, while inputting the coordinates for an emergency hyperjump into the navigational system. The black spot is gro…
    эффект: P1(ext_Structure) = {[p1]-[p6]}
    эффект: P3(ext_Luck) -5

### Loc3 [обычная]
    Loc3-1: The black spot is now really huge. You're very close, and flying right at it, but you still have a chance to steer away and save yourself. You need to make a de…
  -> Path4 => Loc4  вер=1 порядок=3
       текст: Still go on, without changing course
       условия: логика {[p2]>2}
  -> Path8 => Loc2  вер=1 порядок=5
       текст: OK, I'm running!
       условия: логика {[p6]<[p1]}
       эффект: P5(Text) = {2}
  -> Path10 => Loc2  вер=1 порядок=5
       текст: OK, I'm running!
       условия: логика {[p6]>=[p1]}
       эффект: P5(Text) = {2}
       эффект: P6(Damage) = {[p1]-1}
  -> Path19 => Loc4  вер=1 порядок=5
       текст: Still go on, without changing course
       условия: логика {[p2]<=2 and [p5]<>2}
       эффект: P2(ext_Fuel) = {3}
       эффект: P5(Text) = {3}
  -> Path22 => Loc4  вер=1 порядок=5
       текст: Still go on, without changing course
       условия: логика {[p2]<=2 and [p5]=2}
       эффект: P2(ext_Fuel) = {4}
       эффект: P5(Text) = {4}

### Loc4 [обычная]
    выбор описания: {[p5]}
    Loc4-1: The ship shakes. Then pitch-black darkness engulfs your ship completely. It's like you're outside time and space. The navigation system is spewing out impossibl…
    Loc4-2: The ship shakes. You start automatic diagnostics and can't believe your eyes: your structure has increased to [p1]. At that moment, pitch-black darkness engulfs…
    Loc4-3: The ship shakes. You start automatic diagnostics and can't believe your eyes: your fuel level has increased to [p2]. At that moment, pitch-black darkness engulf…
    Loc4-4: The ship shakes. You start automatic diagnostics and can't believe your eyes: your structure has increased to [p1] and your fuel level to [p2]. At that moment, …
    эффект: P6(Damage) = {[1..175]}
  -> Path5 => Loc5  вер=1 порядок=5
       текст: Stick to the same course
       условия: логика {[p6]+20>=[p1]}
       эффект: P5(Text) = {2}
       эффект: P6(Damage) = {[p1]-1}
  -> Path7 => Loc5  вер=1 порядок=3
       текст: Dodge left
       эффект: P5(Text) = {1}
       эффект: P6(Damage) = {0}
  -> Path9 => Loc5  вер=1 порядок=7
       текст: Dodge right
       условия: логика {[p6]>=[p1]}
       эффект: P5(Text) = {2}
       эффект: P6(Damage) = {[p1]-1}
  -> Path16 => Loc5  вер=1 порядок=5
       текст: Stick to the same course
       условия: логика {[p6]+20<[p1]}
       эффект: P5(Text) = {2}
       эффект: P6(Damage) = {[p6]+20}
  -> Path17 => Loc5  вер=1 порядок=7
       текст: Dodge right
       условия: логика {[p6]<[p1]}
       эффект: P5(Text) = {2}

### Loc5 [обычная]
    выбор описания: {[p5]}
    Loc5-1: You masterfully escape the strange object but then notice another one ahead, even more mysterious. It seems especially eerie thanks to its strange glow, which l…
    Loc5-2: A powerful blow shakes the ship. The diagnostic system immediately informs that you have lost [p6] structure, but you have no time to mourn – you notice another…
    эффект: P1(ext_Structure) = {[p1]-[p6]}
    эффект: P7(FuelDamage) = {[1..40]}
  -> Path11 => Loc6  вер=1 порядок=5
       текст: Stick to the same course
       условия: логика {[p7]+10>=[p2]}
       эффект: P5(Text) = {2}
       эффект: P6(Damage) = {[p2]-1}
  -> Path12 => Loc6  вер=1 порядок=3
       текст: Push the yoke forward
       условия: логика {[p7]<[p2]}
       эффект: P5(Text) = {3}
  -> Path13 => Loc6  вер=1 порядок=7
       текст: Pull the yoke back
       эффект: P5(Text) = {1}
       эффект: P6(Damage) = {0}
  -> Path20 => Loc6  вер=1 порядок=5
       текст: Push the yoke forward
       условия: логика {[p7]>=[p2]}
       эффект: P5(Text) = {3}
       эффект: P6(Damage) = {[p2]-1}
  -> Path21 => Loc6  вер=1 порядок=5
       текст: Stick to the same course
       условия: логика {[p7]+10<[p2]}
       эффект: P5(Text) = {2}
       эффект: P6(Damage) = {[p7]+10}

### Loc6 [обычная]
    выбор описания: {[p5]}
    Loc6-1: You pull the steering yoke and successfully dodge the weird fiery sphere. You have no time to congratulate yourself on the maneuver because, after a few seconds…
    Loc6-2: You decide not to turn and fly on. You quickly glance at the heat sensors and notice that the glow is now burning at a mortally dangerous temperature.  / Unders…
    Loc6-3: Trying to avoid a collision, you push the steering yoke forward. The ship jerks down. You glance at the viewscreen and notice that you're plummeting right towar…
    эффект: P8(TeleportBonus) = {[1..4]}
  -> Path14 => Loc7  вер=1 порядок=5
       текст: Open your eyes
       условия: логика {[p3]>=70}
       эффект: P2(ext_Fuel) = {[p2]-[p6]}
       эффект: P4(ext_Teleport) = {[p4]+[p8]+1}
  -> Path15 => Loc7  вер=1 порядок=5
       текст: Open your eyes
       условия: логика {[p3]<70}
       эффект: P2(ext_Fuel) = {[p2]-[p6]}
       эффект: P4(ext_Teleport) = {[p4]+[p8]}

### Loc7 [УСПЕХ]
    выбор описания: {[p5]}
    Loc7-1: You open your eyes and see that you're in normal space, in the system you were originally headed to. There's a message on the main screen: / "<clr>Teleportation…
    Loc7-2: You open your eyes and see that you're in normal space, in the system you were originally headed to. There's a message on the main screen: / "<clr>Teleportation…
    Loc7-3: You open your eyes and see that you're in normal space, in the system you were originally headed to. There's a message on the main screen: / "<clr>Teleportation…
    эффект: P3(ext_Luck) +5

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 7: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
