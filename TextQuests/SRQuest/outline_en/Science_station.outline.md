# Квест (формат 1111111127)
Сложность 50; стартовая локация: [13]; путей по умолчанию: 0

## Параметры
- P1 'ext_Structure' [0..999999999] тип=обычный
    старт: [90]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_PriceMap' [0..999999999] тип=обычный
    старт: [500]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Money' [0..999999999] тип=обычный
    старт: [1000]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_PriceRepair' [0..9999999] тип=обычный
    старт: [1]
    [0..9999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Needs repairing' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Repair cost' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'ext_PlayerBuysMap' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'ext_PriceUpEngine' [1..999999999] тип=обычный
    старт: [1]
    [1..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 9
- P10 'ext_PriceUpShield' [1..999999999] тип=обычный
    старт: [1]
    [1..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 10
- P11 'ext_LevelEngine' [1..4] тип=обычный
    старт: [1]
    [1..1] Energenic
    [2..2] Dive
    [3..3] Singular
    [4..4] Gillnozzle
    критическое: Сообщение достижения критического значения параметром 11
- P12 'ext_LevelShield' [0..4] тип=обычный
    старт: [0]
    [0..0] Absent
    [1..1] Shortwave
    [2..2] Polarizing
    [3..3] Mesonic
    [4..4] Meshed
    критическое: Сообщение достижения критического значения параметром 12
- P13 'ext_LevelHull' [1..4] тип=обычный
    старт: [1]
    [1..1] Octaplaxic
    [2..2] Crystalline
    [3..3] Gravicore
    [4..4] Mesostructural
    критическое: Сообщение достижения критического значения параметром 13
- P14 'ext_MaxStructure' [0..999999999] тип=обычный
    старт: [400]
    [0..999999999] Параметр номер 14: <>
    критическое: Сообщение достижения критического значения параметром 14
- P15 'ext_PriceUpHull' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 15
- P16 'We have an engine on offer' [1..4] тип=обычный
    старт: [1]
    [1..1] Energenic
    [2..2] Dive
    [3..3] Singular
    [4..4] Gillnozzle
    критическое: Сообщение достижения критического значения параметром 16
- P17 'We have a FSG on offer' [0..20] тип=обычный
    старт: [0]
    [0..4] Archivous
    [5..9] Aquapunctural
    [10..14] Hyperfluid
    [15..20] Condensate
    критическое: Сообщение достижения критического значения параметром 17
- P18 'We have a hull on offer' [1..4] тип=обычный
    старт: [1]
    [1..1] Octaplaxic
    [2..2] Crystalline
    [3..3] Gravicore
    [4..4] Mesostructural
    критическое: Сообщение достижения критического значения параметром 18
- P19 'ext_Peni' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 19: <>
    критическое: Сообщение достижения критического значения параметром 19

## Локации и переходы

### Loc1 [обычная]
    выбор описания: {[p3]+([p19]>0)*8}
    Loc1-1: It's an honor to have you here on the <StationName> research station, <Ranger>! / You know perfectly well that a ranger's time is short. Our equipment will help…
    Loc1-2: Great, <Player>, the repairs are complete. As you see, all was done fairly and on time, except that we have a couple extra parts left over. Or did those come fr…
    Loc1-3: Transaction complete. Star chart loaded into your ship's navigation system. / Anything else?
    Loc1-4: Congratulations! For just [p9] cr., we've replaced the smoking piece of junk inside your ship with the [d11] engine! / Would you like anything else?
    Loc1-5: For just [p10] cr., you just acquired the [d12] force shield generator. Congratulations! / Would you like anything else?
    Loc1-6: Congratulations! Now your ship has the [d13] hull, and the local dock workers have [p15] cr. for alcoho... uh, I mean, for a small celebration! / Would you like…
    Loc1-7: Well, whatever. It's up to you. / Anything else?
    Loc1-8: Hey, I'd say your ship is virtually the most perfect in the Galaxy as it is. / Engine: [d11].  / Maximum jump distance: <EngineStatsNow>.  / Fuel tank capacity:…
    Loc1-9: It's an honor to have you here on the <StationName> research station, <Ranger>! Oh, did I mention that they've put out an APB on you as a persistent nonpayer? I…
    Loc1-10: Great, <Ranger>, the repairs are complete. All high-quality work. We value our academic and business reputation as much as you value yours. / Anything else?
    Loc1-11: Transaction complete. Star chart loaded into your ship's navigation system.  / Anything else? / Oh, while you're thinking, I have something to share with you. A…
    Loc1-12: Congratulations! For just [p9] cr., we've replaced the smoking piece of junk inside your ship with the [d11] engine! I can tell you, just between us, that this …
    Loc1-13: For just [p10] cr., you just acquired the [d12] force shield generator. Congratulations! I hope it will be better at neutralizing enemy shots than the local enf…
    Loc1-14: Congratulations! Now your ship has the [d13] hull... / Hey, those enforcement officers keep pestering me with their urgent messages. Why don't you just repay yo…
    Loc1-15: Well, whatever. It's up to you. / Anything else?
    Loc1-16: Hey, I'd say your ship is virtually the most perfect in the Galaxy as it is. / Engine: [d11].  / Maximum jump distance: <EngineStatsNow>.  / Fuel tank capacity:…
    эффект: P16(We have an engine on offer) = {} [скрыт]
    скрыт: P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P17,P18,P19
  -> Path7 => Loc5  вер=1 порядок=7
       текст: I want to buy a star chart
       условия: логика {[p2]>0}
       эффект: P3(Text) = {1}
       эффект: P8(ext_PlayerBuysMap) = {0}
  -> Path9 => Loc7  вер=1 [всегда видна] порядок=1
       текст: I need to get my ship repaired
       условия: логика {[p1]<[p14] and [p4]>=[p5]}
       эффект: P3(Text) = {1}
       эффект: P6(Needs repairing) = {[p14]-[p1]}
  -> Path17 => Loc13  вер=1 порядок=9
       текст: Undock
  -> Path18 => Loc9  вер=1 порядок=5
       текст: I want to upgrade my equipment
       условия: логика {[p11]<4 or [p12]<4 or [p13]<4}
       эффект: P3(Text) = {1}
  -> Path23 => Loc11  вер=1 порядок=5
       текст: I want to upgrade my ship
       условия: логика {[p11]>=4 and [p12]>=4 and [p13]>=4}
       эффект: P3(Text) = {8}

### Loc2 [обычная]
    Loc2-1: We can repair your ship: restore [p6] structure for [p7] cr. / Deal?
    эффект: P7(Repair cost) = {[p6]*[p5]}
  -> Path10 => Loc1  вер=1 [всегда видна] порядок=1
       текст: Deal, let's repair it!
       условия: логика {[p4]>=[p7]}
       эффект: P1(ext_Structure) = {[p1]+[p6]}
       эффект: P3(Text) = {2}
       эффект: P4(ext_Money) = {[p4]-[p7]}
  -> Path14 => Loc1  вер=1 порядок=5
       текст: I refuse to pay this. Your prices are outrageous!
       эффект: P3(Text) = {7}

### Loc4 [обычная]
    Loc4-1: All rangers like flying fast without having to fear they might fall out of the sky!  / We suggest you replace your horribly outdated [d11] engine with a new [d1…
  -> Path11 => Loc1  вер=1 [всегда видна] порядок=1
       текст: Yes! Come on, install it right away!
       условия: логика {[p4]>=[p9] and [p11]<4}
       эффект: P3(Text) = {4}
       эффект: P4(ext_Money) = {[p4]-[p9]}
       эффект: P11(ext_LevelEngine) +1
  -> Path13 => Loc1  вер=1 порядок=5
       текст: Not now. Maybe later.
       эффект: P3(Text) = {7}
       эффект: P16(We have an engine on offer) = {[p11]-1}

### Loc5 [обычная]
    Loc5-1: Our database contains maps of the neighboring sectors. / We can offer you a map of the <SectorMap> sector for [p2] cr. / Want to buy it?
  -> Path8 => Loc1  вер=1 порядок=5
       текст: Nah, that's too expensive
       эффект: P3(Text) = {7}
  -> Path15 => Loc1  вер=1 [всегда видна] порядок=1
       текст: Yes, I'll buy a map of the <SectorMap> sector
       условия: логика {[p4]>=[p2]}
       эффект: P3(Text) = 3
       эффект: P4(ext_Money) = {[p4]-[p2]}
       эффект: P8(ext_PlayerBuysMap) = 1

### Loc6 [обычная]
    Loc6-1: Launching diagnostics... Let me see... / Force shield generator: [d12]. Would you like to upgrade to the [d17]? / With consideration for the price of your old e…
  -> Path12 => Loc1  вер=1 [всегда видна] порядок=1
       текст: Yes! Come on, install it right away!
       условия: логика {[p4]>=[p10] and [p12]<4}
       эффект: P3(Text) = {5}
       эффект: P4(ext_Money) = {[p4]-[p10]}
       эффект: P12(ext_LevelShield) +1
  -> Path16 => Loc1  вер=1 порядок=5
       текст: Not now. Maybe later.
       эффект: P3(Text) = {7}
       эффект: P17(We have a FSG on offer) = {[p12]-1}

### Loc7 [пустая]
    эффект: P7(Repair cost) = {[p6]*[p5]}
  -> Path2 => Loc2  вер=1 порядок=3
       условия: логика {[p4]>=[p7]}
  -> Path5 => Loc2  вер=1 порядок=5
       условия: логика {[p4]<[p7]}
       эффект: P6(Needs repairing) = {[p4] div [p5]}

### Loc8 [УСПЕХ]

### Loc9 [обычная]
    Loc9-1: You have: / Engine: [d11].  / Maximum jump distance: <EngineStatsNow>.  / Fuel tank capacity: <TankStatsNow>. / Hull: [d13]. / Maximum structure: <HullStatsNow>…
  -> Path4 => Loc4  вер=1 порядок=1
       текст: Engine (and fuel tank)
       условия: логика {[p11]<4}
       эффект: P3(Text) = {1}
       эффект: P16(We have an engine on offer) = {[p11]+1}
  -> Path6 => Loc6  вер=1 порядок=3
       текст: Force shield generator
       условия: логика {[p12]<4 and 1=2}
       эффект: P3(Text) = {1}
       эффект: P17(We have a FSG on offer) = {[p12]+1}
  -> Path19 => Loc10  вер=1 порядок=5
       текст: Hull
       условия: логика {[p13]<4}
       эффект: P3(Text) = {1}
       эффект: P18(We have a hull on offer) = {[p13]+1}
  -> Path22 => Loc1  вер=1 порядок=7
       текст: None of the above
       эффект: P3(Text) = {7}

### Loc10 [обычная]
    Loc10-1: We suggest you replace your old, rusty, [d13] hull covered in all these obscenities with a new shiny [d18] hull. Your hull structure will increase from <HullSta…
  -> Path20 => Loc1  вер=1 [всегда видна] порядок=5
       текст: Yes! Come on, install it right away!
       условия: логика {[p4]>=[p15] and [p13]<4}
       эффект: P1(ext_Structure) = {[p1]+200}
       эффект: P3(Text) = {6}
       эффект: P4(ext_Money) = {[p4]-[p15]}
       эффект: P13(ext_LevelHull) +1
       эффект: P14(ext_MaxStructure) = {[p14]+200}
  -> Path21 => Loc1  вер=1 порядок=5
       текст: Not now. Maybe later.
       эффект: P3(Text) = {7}
       эффект: P18(We have a hull on offer) = {[p13]-1}

### Loc11 [пустая]
  -> Path24 => Loc1  вер=1 порядок=5

### Loc12 [ПРОВАЛ]

### Loc13 [СТАРТ]
  -> Path25 => Loc12  вер=1 порядок=9
       условия: логика {[p19]>0}
  -> Path26 => Loc8  вер=4 порядок=9
  -> Path27 => Loc1  вер=1000 проходов<=1 порядок=5

## Анализ
- стартовых: [13]
- концовки: {8: 'УСПЕХ', 12: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
