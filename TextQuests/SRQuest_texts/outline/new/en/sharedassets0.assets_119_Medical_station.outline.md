# Квест (формат 1111111127)
Сложность 50; стартовая локация: [10]; путей по умолчанию: 0

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
- P9 'ext_PriceStimulantOne' [0..999999999] тип=обычный
    старт: [100]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 9
- P10 'ext_PriceStimulantTwo' [0..999999999] тип=обычный
    старт: [100]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 10
- P11 'ext_StimulantOneTime' [-1..999999999] тип=обычный
    старт: [0]
    [-1..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 11
- P12 'ext_StimulantTwoTime' [-1..999999999] тип=обычный
    старт: [0]
    [-1..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 12
- P13 'ext_TimeForStimOne' [0..150] тип=обычный
    старт: [100]
    [0..150] Параметр номер 13: <>
    критическое: Сообщение достижения критического значения параметром 13
- P14 'ext_MaxStructure' [0..999999999] тип=обычный
    старт: [100]
    [0..999999999] Параметр номер 14: <>
    критическое: Сообщение достижения критического значения параметром 14
- P15 'ext_TimeForStimTwo' [0..150] тип=обычный
    старт: [150]
    [0..150] Параметр номер 15: <>
    критическое: Сообщение достижения критического значения параметром 15
- P16 'Price 1' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 16: <>
    критическое: Сообщение достижения критического значения параметром 16
- P17 'Price 2' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 17: <>
    критическое: Сообщение достижения критического значения параметром 17
- P18 'ext_Nark' [0..1] тип=обычный
    старт: [1]
    [0..0] Параметр номер 18: <>
    [1..1] "doper"
    критическое: Сообщение достижения критического значения параметром 18
- P19 'ext_Peni' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 19: <>
    критическое: Сообщение достижения критического значения параметром 19

## Локации и переходы

### Loc1 [обычная]
    выбор описания: {[p3]+([p19]>0)*9}
    Loc1-1: <Player>, are you really a ranger? Welcome! I didn't expect to see you here. The medical board at our health center, <StationName>, has long been disbanded. Whi…
    Loc1-2: Excellent, we've already finished repairing your ship. / Anything else?
    Loc1-3: Transaction complete. Star chart loaded into your ship's navigation system. / Anything else?
    Loc1-4: You've bought the <StimulantOne> stimulant for [p9] cr. / Its effect will last for [p11] days.
    Loc1-5: You've bought the <StimulantTwo> stimulant for [p10] cr. / Its effect will last for [p12] days.
    Loc1-6: No, <Player>, that's enough. You've already taken the highest dosage of this stimulant. Prolonging its effect any further is dangerous for your health!
    Loc1-7: Well, whatever. It's up to you. / Anything else?
    Loc1-8: I'm sorry, <Player>, but the current condition of your health restricts you to <clr>two<clrEnd> stimulants at a time. Although, under certain circumstances, tha…
    Loc1-9: I'm sorry, <Player>, but, even under the effect of the [d18], the current state of your health and the range of medications available at the station prevent us …
    Loc1-10: I never thought I'd see you here, <Ranger>. Especially after the repeat nonpayers list was updated to include you. Bound by the oath of goodness and mercy, we l…
    Loc1-11: We have finished repairing your ship. / I hope you appreciated the fact that we didn't even mention your loan debt. / Would you like anything else?
    Loc1-12: Transaction complete. Thanks for paying for our services in advance. As they say, trust the client, but always check his reputation. / Star chart loaded into yo…
    Loc1-13: You've bought the <StimulantOne> stimulant for [p9] cr. / Its effect will last for [p11] days, no matter how far away you go.
    Loc1-14: You've bought the <StimulantTwo> stimulant for [p10] cr. / Its effect will last for [p12] days." / I hope you won't list the use of this product as an excuse fo…
    Loc1-15: No, <Player>, that's enough. You've already taken the highest dose of this stimulant. Prolonging its effect any further is dangerous for your health! I'd think …
    Loc1-16: Well, whatever. It's up to you. / Anything else?
    Loc1-17: I'm sorry, <Player>, but the current condition of your health restricts you to <clr>two<clrEnd> stimulants at a time. Although, under certain circumstances, tha…
    Loc1-18: I'm sorry, <Player>, but, even under the effect of the [d18], the current state of your health and the range of medications available at the station prevent us …
    скрыт: P2,P3,P4,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P5,P1,P18,P19
  -> Path7 => Loc5  вер=1 порядок=7
       текст: I want to buy a star chart
       условия: логика {[p2]>0}
       эффект: P3(Text) = {1}
       эффект: P8(ext_PlayerBuysMap) = {0}
  -> Path9 => Loc7  вер=1 [всегда видна] порядок=3
       текст: I need to get my ship repaired
       условия: логика {[p1]<[p14] and [p4]>=[p5]}
       эффект: P3(Text) = {1}
       эффект: P6(Needs repairing) = {[p14]-[p1]}
  -> Path16 => Loc10  вер=1 порядок=9
       текст: Undock
  -> Path24 => Loc1  вер=100 порядок=5
       текст: I want to buy stimulants
       условия: логика {[p11]<>0 and [p12]<>0}
       эффект: P3(Text) = {8+[p18]}
  -> Path26 => Loc4  вер=1 порядок=5
       текст: I want to buy stimulants
       условия: логика {[p11]=0 or [p12]=0}

### Loc2 [обычная]
    Loc2-1: Considering your financial situation, our experts will repair [p6] structure of your ship for [p7] cr. / Deal?
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
    Loc4-1: At the moment, we have the following stimulants on offer: / <StimulantOne> for [p9] cr. <StimulantOneText>. Duration: [p13] days. / <StimulantTwo> for [p10] cr.…
  -> Path6 => Loc1  вер=1 [всегда видна] порядок=1
       текст: I'll have the <StimulantOne>
       условия: логика {[p4]>=[p9] and [p11]=0}
       эффект: P3(Text) = {4}
       эффект: P4(ext_Money) = {[p4]-[p9]}
       эффект: P11(ext_StimulantOneTime) = {[p11]+[p13]}
  -> Path11 => Loc1  вер=1 [всегда видна] порядок=3
       текст: I'll buy the <StimulantTwo>
       условия: логика {[p4]>=[p10] and [p12]=0}
       эффект: P3(Text) = {5}
       эффект: P4(ext_Money) = {[p4]-[p10]}
       эффект: P12(ext_StimulantTwoTime) = {[p12]+[p15]}
  -> Path13 => Loc1  вер=1 порядок=5
       текст: None of the above
       эффект: P3(Text) = {7}
  -> Path22 => Loc4  вер=1 порядок=5
       условия: логика {[p15]=0 and [p3]=5 and 1=2}
       эффект: P3(Text) = {6}
  -> Path25 => Loc4  вер=1 порядок=5
       текст: I want to buy stimulants
       условия: логика {[p12]=0 and [p11]<>0 and 1=2}
       эффект: P16(Price 1) = {[p9]}
       эффект: P15(ext_TimeForStimTwo) = {300}
  -> Path27 => Loc4  вер=1 порядок=5
       текст: I want to buy stimulants
       условия: логика {[p11]=0 and [p12]=0 and 1=2}
       эффект: P13(ext_TimeForStimOne) = {300-[p11]}
       эффект: P16(Price 1) = {[p9]/100*(300-[p11])}
  -> Path28 => Loc4  вер=1 порядок=5
       условия: логика {[p12]>=0 and [p12]<201 and 1=2}
       эффект: P15(ext_TimeForStimTwo) = {100}
       эффект: P17(Price 2) = {[p10]}
  -> Path30 => Loc4  вер=1 порядок=5
       условия: логика {[p12]<0 and 1=2}
       эффект: P15(ext_TimeForStimTwo) = {100}
       эффект: P17(Price 2) = {[p10]}
  -> Path31 => Loc4  вер=100 порядок=5
       текст: I'll have the <StimulantOne>
       условия: логика {[p11]<0 and 1=2}
       эффект: P3(Text) = {8+[p18]}
  -> Path32 => Loc4  вер=100 порядок=5
       текст: I'll buy the <StimulantTwo>
       условия: логика {[p12]<0 and 1=2}
       эффект: P3(Text) = {8+[p18]}

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

### Loc7 [пустая]
    эффект: P7(Repair cost) = {[p6]*[p5]}
  -> Path2 => Loc2  вер=1 порядок=3
       условия: логика {[p4]>=[p7]}
  -> Path5 => Loc2  вер=1 порядок=5
       условия: логика {[p4]<[p7]}
       эффект: P6(Needs repairing) = {[p4] div [p5]}

### Loc8 [ПРОВАЛ]

### Loc10 [СТАРТ]
  -> Path21 => Loc8  вер=1 порядок=9
       условия: логика {[p19]>0}
  -> Path23 => Loc11  вер=4 порядок=9
  -> Path29 => Loc1  вер=1000 проходов<=1 порядок=5

### Loc11 [УСПЕХ]

## Анализ
- стартовых: [10]
- концовки: {8: 'ПРОВАЛ', 11: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
