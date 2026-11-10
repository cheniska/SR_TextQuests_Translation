# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Text' [1..10] тип=обычный
    старт: [1..5]
    [1..10] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Money' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Расчетная' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Расчетная 2' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 4: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_Luck' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 5: <>
    критическое: Сообщение достижения критического значения параметром 5

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: A light is blinking on a panel, indicating an incoming short-range transmission. Curious, you do the following...
    эффект: P4(Расчетная 2) = {[20..50]} [скрыт]
    скрыт: P3,P5,P1,P2
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Answer the call
       эффект: P3(Расчетная) = {([p2] div [p4])+6}

### Loc2 [УСПЕХ]
    выбор описания: {[p1]}
    Loc2-1: An unknown Faeyan appears on the screen and starts pattering: / "<Ranger>, the personal lottery ticket that you left at your previous parking spot won you a pri…
    Loc2-2: The face of the Maloq on the screen seems vaguely familiar: / "Hey, <Ranger>! Why did ya make off so fast? Thought I ain't got cash to pay for the lost bet? Wel…
    Loc2-3: The person looking at you looks exactly like... Well, you can't tell, but he's wearing a turban and a dashing robe over his spacesuit. He noisily bows before yo…
    Loc2-4: Some Peleng appears on the screen and, looking around fearfully, says something that makes your jaw drop dangerously low: / "Hey, listen, <Ranger>, I'm sorry. I…
    Loc2-5: A Gaal appears on the screen. He glares at you for a few minutes, then concludes: / "You were right. The third eye has nothing to do with telepathy. Here's your…
    эффект: P2(ext_Money) = {[p2]+[p3]}
    эффект: P5(ext_Luck) +5

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
