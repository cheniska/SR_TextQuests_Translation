# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Text' [1..10] тип=обычный
    старт: [1..5]
    [1..10] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: A light is blinking on a panel, indicating an incoming short-range transmission. Curious, you do the following...
    скрыт: P1
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Answer the call

### Loc2 [обычная]
    выбор описания: {[p1]}
    Loc2-1: A booming officer's voice shakes the air: / "...And remember, rookies, <clr>approaching a dryndar at close range is a suicidal act<clrEnd>. Try to stay as far a…
    Loc2-2: The Ranger Information Service is happy to greet you, <Ranger>. At the moment, our service is running in test mode, so some resources might be unavailable. What…
    Loc2-3: A Maloq appears on the screen, giving a peace of his mind to a Faeyan in front of him: / "Didn't I tell you that <clr>the same trick wouldn't work against a chu…
    Loc2-4: A transmission of a space battle appears on the screen. Two ships are fighting each other: a Navy fighter and a pirate croakster. The events are happening thick…
    Loc2-5: An unknown Gaal appears on the screen. Judging by what you see in the background, his ship has taken a bad beating. He notices your look of surprise and explain…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Nothing... It was you who got in touch with me!

### Loc3 [УСПЕХ]
    выбор описания: {[p1]}
    Loc3-1: After you reply, you hear giggles among the recruits. Some of the future pilots start coughing to disguise their laughter. / "I apologize, ranger. Connection ch…
    Loc3-2: "Must have been a system malfunction. Unfortunately, we haven't had the time to fix everything... Ah, no, this isn't a malfunction. You required information on …
    Loc3-3: "Oh, really?" surprised, the Maloq continues. "Stay alert, then. The pirates are especially active out here. Have a nice flight!" His huge hand reaches out towa…
    Loc3-4: "Oh, really? There must have been an error. We apologize for disturbing you, Sir Ranger. We will be honored to offer recordings of your battles to our viewers o…
    Loc3-5: "Oh, really? I don't remember. I guess it has to do with the pollutants in the onboard atmosphere. It would be best for us to call for help immediately. I don't…

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
