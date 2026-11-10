# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Fuel' [0..100] тип=обычный
    старт: [50]
    [0..100] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'tmp' [0..100000] тип=обычный
    старт: [1]
    [0..100000] tmp <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'PlanetName' [0..11] тип=обычный
    старт: [0]
    [0..0] Persephone
    [1..1] Shuhao
    [2..2] Hotrod
    [3..3] Aelank
    [4..4] Graneka
    [5..5] Dzytskaz
    [6..6] Duedeh
    [7..7] Arnarick Gaudad
    [8..8] Shimea
    [9..9] Malari
    [10..10] Malis Calanca
    [11..11] Cayanca
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Money' [0..9999999] тип=обычный
    старт: [1000]
    [0..9999999] ext_Money <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_Structure' [0..1000] тип=обычный
    старт: [100]
    [0..1000] ext_Structure <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'StructureLabel' [0..100] тип=обычный
    старт: [1]
    [0..100] Параметр номер 6: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'FuelLabel' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 7: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] ext_Luck <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'tmpLocation' [0..4] тип=обычный
    старт: [0]
    [0..4] Параметр номер 9: <>
    критическое: Сообщение достижения критического значения параметром 9

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Suddenly you hear a quiet knocking on the ship's armor. As a seasoned space wanderer, you know from experience that tiny fragments or space junk are usually fol…
    эффект: P2(tmp) = 1
    эффект: P3(PlanetName) = {[0..11]}
  -> Path2 => Loc2  вер=1 порядок=1
       текст: Activate defense mode
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Perform a maneuver to avoid the cloud of junk
       эффект: P6(StructureLabel) = {[1..15]}
       эффект: P7(FuelLabel) = {[1..3]}

### Loc2 [обычная]
    выбор описания: {[p2]}
    Loc2-1: When you activate <clr>defense mode<clrEnd>, the onboard computer very happily informs you of the <clr>absence<clrEnd> of any asteroid threat.  / After spending…
    Loc2-2: Still nothing on the radar. Your confidence in the reality of this sound is gradually diminishing. Meanwhile, your <clr>anxiety level<clrEnd> is skyrocketing. W…
    Loc2-3: The last cycle of environmental scanning is taking much longer than the one before it. It seems that the machine is stretching the time out deliberately. The re…
    Loc2-4: You launch the scanning process and let out a sign of relief when you see the guns of your ship turn towards the hostile mass of space wreckage, preparing to de…
  -> Path4 => Loc3  вер=1 порядок=5
       текст: Accelerate
       эффект: P7(FuelLabel) = {[1..3]}
       эффект: P6(StructureLabel) = {[1..15]}
  -> Path11 => Loc2  вер=2 проходов<=3 порядок=1
       текст: Activate defense mode once again
       эффект: P2(tmp) = {[2..4]}
  -> Path12 => Loc5  вер=1 порядок=1
       текст: Activate defense mode once again

### Loc3 [УСПЕХ]
    Loc3-1: You decide to take the easy route: scanning the surroundings, you make a short <clr>hyperjump<clrEnd> to escape the field of rubble and junk. Sometimes this tac…
    эффект: P1(ext_Fuel) = {[p1]-[p7]}
    эффект: P5(ext_Structure) = {[p5]-[p6]}

### Loc5 [обычная]
    Loc5-1: You reach out and are about to press the activation button with a strong finger, like how Ranger <clr>Gref<clrEnd> pushed Machpella's eyes out of her skull, whe…
  -> Path9 => Loc6  вер=1 порядок=5
       текст: Establish contact with the metal bastard

### Loc6 [обычная]
    Loc6-1: You activate the communication system, and a thundering, low voice fills the ship. Compared to this voice, the howls of a dying Terron would sound like a baby c…
  -> Path16 => Loc8  вер=1
       текст: Give money
       эффект: P2(tmp) = {[p4]/50+10}
  -> Path17 => Loc9  вер=1 [всегда видна] порядок=1
       текст: Give fuel
       эффект: P2(tmp) = {[p1]/10+1}
  -> Path21 => Loc7  вер=1 порядок=2
       текст: Deny the request
       эффект: P5(ext_Structure) -1
       эффект: P7(FuelLabel) = 0
       эффект: P6(StructureLabel) = 0
       эффект: P8(ext_Luck) = {[p8]-3}
       эффект: P9(tmpLocation) = 2
  -> Path22 => Loc7  вер=1 порядок=4
       текст: Attack the damned beggar
       эффект: P6(StructureLabel) = {[10..40]}
       эффект: P7(FuelLabel) = {[3..7]}
       эффект: P8(ext_Luck) = {[p8]-5}
       эффект: P9(tmpLocation) = 3

### Loc7 [УСПЕХ]
    выбор описания: {[p9]}
    Loc7-1: "Thank you, thank you, thank you!" yells the robot in a suddenly thinner voice. "<clr>The government of <clrEnd>[d3] will greatly appreciate your generosity! An…
    Loc7-2: Difficult times leave no room for charity. You deny the robot's request. / Immediately, you are stunned once again by technological progress in general and the …
    Loc7-3: Thinking that charity is a luxury you cannot afford at the moment and under the present conditions, you decide to destroy the obnoxious robot. After all, it mig…
    Loc7-4: "Thank you, thank you, thank you!" yells the robot in a suddenly much thinner voice when it sees the bubbles of fuel emerging from your ship. "<clr>The governme…
    эффект: P1(ext_Fuel) = {[p1]+[p7]}
    эффект: P5(ext_Structure) = {[p5]-[p6]}

### Loc8 [обычная]
    Loc8-1: How much money are you willing to donate in order to save the government of [d3] from a fiery fuel-fueled hell?
  -> Path13 => Loc8  вер=1 [всегда видна]
       текст: Double the amount
       условия: логика {[p2]*2<=[p4]}
       эффект: P2(tmp) = {[p2]+[p2]}
  -> Path14 => Loc7  вер=1 [всегда видна] порядок=2
       текст: Donate [p2] cr.
       условия: логика {[p4]>=[p2]}
       эффект: P4(ext_Money) = {[p4]-[p2]}
       эффект: P8(ext_Luck) = {[p8]+([p2]/[p4]*20)}
       эффект: P9(tmpLocation) = 1
  -> Path15 => Loc8  вер=1 [всегда видна] порядок=3
       текст: Half the amount
       условия: логика {[p2]/2>=1}
       эффект: P2(tmp) = {[p2]/2}
  -> Path24 => Loc6  вер=1 порядок=9
       текст: Back

### Loc9 [обычная]
    Loc9-1: How much fuel are you ready to donate in order to burn the government of [d3]?
  -> Path18 => Loc9  вер=1 [всегда видна]
       текст: Double the amount
       условия: логика {[p2]*2<=[p1]}
       эффект: P2(tmp) = {[p2]*2}
  -> Path19 => Loc9  вер=1 [всегда видна] порядок=6
       текст: Half the amount
       условия: логика {[p2]/2>=1}
       эффект: P2(tmp) = {[p2]/2}
  -> Path20 => Loc7  вер=1 [всегда видна] порядок=5
       текст: Donate [p2] fuel
       условия: логика {[p1]>=[p2]}
       эффект: P1(ext_Fuel) = {[p1]-[p2]}
       эффект: P8(ext_Luck) = {[p8]+([p2]/[p1]*15)}
       эффект: P9(tmpLocation) = 4
  -> Path23 => Loc6  вер=1 порядок=9
       текст: Back

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ', 7: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
