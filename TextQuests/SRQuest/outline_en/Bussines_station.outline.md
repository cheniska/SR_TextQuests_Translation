# Квест (формат 1111111127)
Сложность 50; стартовая локация: [11]; путей по умолчанию: 0

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
- P6 'Needs repairing' [0..99999999] тип=обычный
    старт: [0]
    [0..99999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Repair cost' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'ext_PlayerBuysMap' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'ext_Credit' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 9
- P10 'ext_TimeCredit' [0..500] тип=обычный
    старт: [0]
    [0..500] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 10
- P11 'ext_PercentCredit' [0..48] тип=обычный
    старт: [0]
    [0..48] Steam
    критическое: Сообщение достижения критического значения параметром 11
- P12 'Small loan amount, or repays half the loan' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Cardboard
    критическое: Сообщение достижения критического значения параметром 12
- P13 'ext_SmallTimeCredit' [100..300] тип=обычный
    старт: [150..300]
    [100..300] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 13
- P14 'ext_SmallPctCredit' [8..36] тип=обычный
    старт: [8..32]
    [8..36] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 14
- P15 'Large loan amount, or repays maximum amount with 100 remaining' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 15
- P16 'ext_BigTimeCredit' [300..400] тип=обычный
    старт: [300..400]
    [300..400] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 16
- P17 'ext_BigPctCredit' [12..48] тип=обычный
    старт: [16..48]
    [12..48] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 17
- P18 'Small loan repayment amount' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 18
- P19 'Large loan repayment amount' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 19
- P20 'ext_MaxStructure' [0..999999999] тип=обычный
    старт: [100]
    [0..999999999] Параметр номер 20: <>
    критическое: Сообщение достижения критического значения параметром 20
- P21 'Loan bonus' [1..10000] тип=обычный
    старт: [10000]
    [1..10000] Параметр номер 21: <>
    критическое: Сообщение достижения критического значения параметром 21
- P22 'Maximum repayment' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 22: <>
    критическое: Сообщение достижения критического значения параметром 22
- P23 'ext_Peni' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 23: <>
    критическое: Сообщение достижения критического значения параметром 23
- P24 'ext_Fuel' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 24: <>
    критическое: Сообщение достижения критического значения параметром 24
- P26 'Extra Chance' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 26: <>
    критическое: Сообщение достижения критического значения параметром 26

## Локации и переходы

### Loc1 [обычная]
    выбор описания: {[p3]+([p23]>0)*10}
    Loc1-1: Now let me see who's docked! Welcome, <Player>. We don't get many rangers around here. The <StationName> business center is happy to provide you with high quali…
    Loc1-2: Excellent, we've already finished repairing your ship. / Anything else?
    Loc1-3: Transaction complete. Star chart loaded into your ship's navigation system. / Anything else?
    Loc1-4: Congratulations!  / You have taken out a loan of [p12] cr. for [p13] days, at a rate of [p14]%. Counting interest, you will have to repay [p18] cr. / Please kee…
    Loc1-5: Congratulations!  / You have taken out a loan of [p15] cr. for [p16] days at a rate of [p17]%. Counting interest, you will have to repay [p19] cr. / Please keep…
    Loc1-6: Congratulations! / You have repaid half of your loan: [p12] cr. Please make sure to pay back the rest of it on time! / You have: [p4] cr. / Left to repay: [p9] …
    Loc1-7: Congratulations! / You have paid off your loan successfully. We appreciate responsible loan customers. This will be reflected in your credit history. / You have…
    Loc1-8: Congratulations! / You have repaid part of your loan: [p22] cr. Please make sure to pay back the rest of it on time! / You have: [p4] cr. / Left to repay: [p9] …
    Loc1-9: Well, whatever. It's up to you. / Anything else?
    Loc1-10: Congratulations! / You have repaid part of your loan: [p15] cr. Please make sure to pay back the rest of it on time! / You have: [p4] cr. / Left to repay: [p9] …
    Loc1-11: Who do we have here? Long time no see, <Ranger>. Did you know that you haven't repaid your loan in due time? Your outstanding amount, including the interest pay…
    Loc1-12: Your ship has been repaired. / Anything else – before those enforcement officers pay you a visit?
    Loc1-13: Transaction complete. Star chart loaded into your ship's navigation system. / If I were you, I'd make myself scarce before those enforcement officers grab me by…
    Loc1-14: Congratulations!  / You have taken out a loan of [p12] cr. for [p13] days, at a rate of [p14]%. Counting interest, you will have to repay [p18] cr. / Please kee…
    Loc1-15: Congratulations!  / You have taken out a loan of [p15] cr. for [p16] days at a rate of [p17]%. Counting interest, you will have to repay [p19] cr. / Please keep…
    Loc1-16: Congratulations! / You have repaid half of your loan: [p12] cr. / You have: [p4] cr. / Left to repay: [p9] cr.  / We have to remind you that your repayment term…
    Loc1-17: Congratulations! / You have paid off your loan successfully. We've been waiting so long for this moment! It's good to see that you're still in one piece, unbrok…
    Loc1-18: Congratulations! / You have repaid part of your loan: [p22] cr. Make sure to pay off the rest of your debt! / You have: [p4] cr. / Left to repay: [p9] cr. / We …
    Loc1-19: Well, whatever. It's up to you. But keep in mind that an overdue loan is an offense punishable by the law. / Anything else?
    Loc1-20: Congratulations! / You have repaid part of your loan: [p15] cr. Make sure to pay off the rest of your debt! / You have: [p4] cr. / Left to repay: [p9] cr. / We …
    скрыт: P1,P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,P21,P22,P23,P25,P26,P24
  -> Path4 => Loc4  вер=1 порядок=5
       текст: I want to take out a loan
       условия: логика {[p9]<=0}
       эффект: P3(Text) = {1}
       эффект: P12(Small loan amount, or repays half the loan) = {[p4]/10*2+[p21]}
       эффект: P15(Large loan amount, or repays maximum amount with 100 remaining) = {[p4]/10*4+[p21]*2}
  -> Path7 => Loc5  вер=1 порядок=7
       текст: I want to buy a star chart
       условия: логика {[p2]>0}
       эффект: P3(Text) = {1}
       эффект: P8(ext_PlayerBuysMap) = {0}
  -> Path9 => Loc7  вер=1 [всегда видна] порядок=1
       текст: I need to get my ship repaired
       условия: логика {[p1]<[p20] and [p4]>=[p5]}
       эффект: P3(Text) = {1}
       эффект: P6(Needs repairing) = {[p20]-[p1]}
  -> Path17 => Loc9  вер=1 порядок=5
       текст: I want to repay the loan
       условия: логика {[p9]>0 and [p4]>0}
       эффект: P3(Text) = {1}
       эффект: P12(Small loan amount, or repays half the loan) = {[p9] div 2}
       эффект: P15(Large loan amount, or repays maximum amount with 100 remaining) = {[p4]-100}
       эффект: P22(Maximum repayment) = {[p4]}
  -> Path23 => Loc11  вер=1 порядок=9
       текст: Undock

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
       эффект: P3(Text) = {9}

### Loc4 [обычная]
    Loc4-1: We can offer you the following options: / The <clr>"Pay and Fly"<clrEnd> loan provided by Faeyan banks: [p12] cr. for [p13] days at a rate of [p14]%. Total amou…
    эффект: P18(Small loan repayment amount) = {[p12]+[p12]/100*[p14]}
    эффект: P19(Large loan repayment amount) = {[p15]+[p15]/100*[p17]}
  -> Path6 => Loc1  вер=1 [всегда видна] порядок=1
       текст: I'm ready to pay and fly! Give me [p12] cr. for [p13] days at a rate of [p14]%.
       эффект: P3(Text) = {4}
       эффект: P4(ext_Money) = {[p4]+[p12]}
       эффект: P9(ext_Credit) = {[p12]+[p12]/100*[p14]}
       эффект: P10(ext_TimeCredit) = {[p13]}
       эффект: P11(ext_PercentCredit) = {[p14]}
  -> Path11 => Loc1  вер=1 [всегда видна] порядок=3
       текст: I'll take the Moort-Gage! Give me [p15] cr. for [p16] days at a rate of [p17]%.
       эффект: P3(Text) = {5}
       эффект: P4(ext_Money) = {[p4]+[p15]}
       эффект: P9(ext_Credit) = {[p15]+[p15]/100*[p17]}
       эффект: P10(ext_TimeCredit) = {[p16]}
       эффект: P11(ext_PercentCredit) = {[p17]}
  -> Path13 => Loc1  вер=1 порядок=5
       текст: I don't want a loan. Your interest rates are outrageous!
       эффект: P3(Text) = {9}

### Loc5 [обычная]
    Loc5-1: Our database contains maps of the neighboring sectors. / We can offer you a map of the <SectorMap> sector for [p2] cr. / Want to buy it?
  -> Path8 => Loc1  вер=1 порядок=5
       текст: Nah, that's too expensive
       эффект: P3(Text) = {9}
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

### Loc8 [УСПЕХ]

### Loc9 [обычная]
    Loc9-1: You have [p4] cr. / Please select your loan repayment option.  / <clr>Warning<clrEnd>: If you repay only half of the loan amount, the bank may charge a fee for …
  -> Path18 => Loc1  вер=1 порядок=5
       текст: I've changed my mind
       эффект: P3(Text) = {9}
  -> Path19 => Loc1  вер=1 порядок=2
       текст: I'm repaying half the loan: [p12] cr.
       условия: логика {[p4]>=[p12] and [p12]>=50}
       эффект: P3(Text) = {6}
       эффект: P4(ext_Money) = {[p4]-[p12]}
       эффект: P9(ext_Credit) = {[p9]-[p12]}
       эффект: P26(Extra Chance) = 1
  -> Path20 => Loc1  вер=1 порядок=3
       текст: I'm repaying the loan in full: [p9] cr.
       условия: логика {[p4]>=[p9]}
       эффект: P3(Text) = {7}
       эффект: P4(ext_Money) = {[p4]-[p9]}
       эффект: P9(ext_Credit) = {0}
       эффект: P23(ext_Peni) = 0
       эффект: P26(Extra Chance) = 1
  -> Path21 => Loc1  вер=1
       текст: I'm repaying the maximum amount: [p22] cr.
       условия: логика {[p4]<[p12] and [p4]>0 and [p24]>=20}
       эффект: P3(Text) = {8}
       эффект: P4(ext_Money) = {[p4]-[p22]}
       эффект: P9(ext_Credit) = {[p9]-[p22]}
       эффект: P26(Extra Chance) = 1
  -> Path22 => Loc1  вер=1 порядок=1
       текст: I'm repaying the maximum amount: [p15] cr. I'll keep the other <clr>100<clrEnd> cr.
       условия: логика {[p4]<[p12] and [p4]>100}
       эффект: P3(Text) = {10}
       эффект: P4(ext_Money) = {[p4]-[p15]}
       эффект: P9(ext_Credit) = {[p9]-[p15]}
       эффект: P26(Extra Chance) = 1

### Loc10 [ПРОВАЛ]

### Loc11 [СТАРТ]
  -> Path25 => Loc1  вер=1000 проходов<=1 порядок=5
  -> Path26 => Loc8  вер=3 порядок=5
  -> Path27 => Loc10  вер=1 порядок=5
       условия: логика {[p23]>0 and [p26]<>1}

## Анализ
- стартовых: [11]
- концовки: {8: 'УСПЕХ', 10: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
