# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Text' [1..10] тип=обычный
    старт: [1..5]
    [1..10] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p1]}
    Loc1-1: The already-familiar black dot appears straight ahead of your ship, slowly getting bigger and bigger. In a few seconds, the black spot expands rapidly, shroudin…
    Loc1-2: A shining dot appears straight ahead. Before you can say a word, it goes black, rapidly growing bigger and bigger. In a few seconds, it shrouds the flight deck …
    Loc1-3: A black dot appears straight ahead of your ship, slowly growing bigger and bigger. A couple of minutes later, you realize that it's located inside the flight de…
    Loc1-4: You notice a black dot appear straight ahead of your ship and swear that you won't let this nonsense take you by surprise this time. After a few seconds, you've…
    Loc1-5: This time there is no black spot. The darkness envelops the ship so suddenly that you lose all sense of space and time and stop feeling anything at all before y…
    скрыт: P1
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Allusion!

### Loc2 [обычная]
    выбор описания: {[p1]}
    Loc2-1: "I'm here. Ready for another target run. Is that how you say it?"
    Loc2-2: "One moment. I'm almost done... Nah, this isn't working. I've been trying to expedite our mission, but, unfortunately, I haven't found any other way to reach th…
    Loc2-3: "Here I am. You took your time returning. Well, shall we repeat our attempt?"
    Loc2-4: Silence was the answer. Suspecting the worst, you fill your lungs with air, wanting to scream, and... / "I'm right here. Sorry, I got distracted. You can breath…
    Loc2-5: "I thought you'd fallen asleep. Remember, the only way for my consciousness to connect with yours is after an incoming signal - that is, after you address me. S…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Remind me - what do I have to do?

### Loc3 [УСПЕХ]

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
