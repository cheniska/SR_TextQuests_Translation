# Квест (формат 1111111127)
Сложность 10; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_PirateDefence' [0..100] тип=обычный
    старт: [0]
    [0..100] Protection from pirate attacks: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_TimeDefence' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Number of light years: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..999999999] тип=обычный
    старт: [70]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Text' [1..10] тип=обычный
    старт: [1..10]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Бонусная' [0..201] тип=обычный
    старт: [60..201]
    [0..201] Параметр номер 5: <>
    критическое: Сообщение достижения критического значения параметром 5

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p4]}
    Loc1-1: You suddenly remember that you failed to review all of your incoming messages and reports before takeoff. Now is the best time to catch up on your reading.
    скрыт: P1,P2,P3,P4,P5
  -> Path2 => Loc2  вер=1 порядок=5
       текст: View messages and reports
       эффект: P1(ext_PirateDefence) = {[28..64]}
       эффект: P2(ext_TimeDefence) = {[p2]+[p5]}

### Loc2 [УСПЕХ]
    выбор описания: {[p4]}
    Loc2-1: Flicking through a pile of fresh papers, you notice a 3D photograph showing a disturbingly familiar ship wrapped in a strange glow. Your ship. Looks like recent…
    Loc2-2: Before you begin reading, the ship shakes violently. / You run diagnostics and are surprised to see that the ship is perfectly fine, but its silhouette appears.…
    Loc2-3: Something flashes on your viewscreen and the ship shakes slightly. You start diagnostics to find out that the ship is perfectly fine, except for one little thin…
    Loc2-4: A couple of minutes later, you stare incredulously at your contract for covering your ship with a layer of invisible ink. Looks like that recent drinking bout i…
    Loc2-5: The ship shakes suddenly, and the alarm starts howling immediately. You turn it off and start automatic diagnostics.  / In a few seconds, the situation becomes …
    Loc2-6: Something flashes on your viewscreen, and the ship shakes violently. / You start the diagnostic procedure and are surprised to see that the ship is perfectly fi…
    Loc2-7: One of the messages offers the placement of advertising slogans in pastel shades on the sides of your ship. You turn the e-page and are about to send this messa…
    Loc2-8: Among the pile of messages, you noticed a signed contract for placing advertising slogans on the sides of your ship.  / How strange - you don't remember signing…
    Loc2-9: One of the messages grabs your attention: it's from a certain shaman that you happen to know. He thanks you for doing him a favor and informs you that he's perf…
    Loc2-10: The ship shakes suddenly, and the alarm starts howling immediately. You stop its howling and launch automatic diagnostics.  / In a few seconds, the situation be…
    эффект: P3(ext_Luck) = {[5..10]}

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
