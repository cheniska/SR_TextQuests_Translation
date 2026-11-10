# Квест (формат 1111111127)
Сложность 10; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P3 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Structure' [0..999999999] тип=обычный
    старт: [70]
    [0..999999999] Structure: <>
    критическое: Сообщение достижения критического значения параметром 4
- P7 'Text' [1..10] тип=обычный
    старт: [1..10]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'Откус структуры' [0..999999999] тип=обычный
    старт: [60..380]
    [0..999999999] Number 8: <>
    критическое: Сообщение достижения критического значения параметром 8

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p7]}
    Loc1-1: An object of an unidentified shape suddenly appears in front of you and hits the ship. You hear an unpleasant crack. The flight deck goes dark for a few seconds…
    Loc1-2: The viewscreen shows a small but quickly growing meteorite. / "What an interesting shape! I wonder why it's coming at me," you think. Your question is answered …
    Loc1-3: Some kind of object briefly appears on the screen. The ship shakes violently.  / "WHA..? Again? What is..." you think, but you already know the answer. Or do yo…
    Loc1-4: Something crashes heavily into the cargo hold. / "What the..." You nervously scramble to find the right button.
    Loc1-5: Suddenly the peaceful cosmic silence and your sleep are broken by a howling alarm. / "WHAT THE..." Your eyes aren't really open yet, and you can barely form a c…
    Loc1-6: A howling alarm jerks you out of your light sleep. Your reflexes, honed by years of fighting, make you do the right thing. You react automatically...
    Loc1-7: The viewscreen shows a meteorite speeding towards you. / You jerk the steering yoke, trying to avoid a collision, but before you even finish the maneuver, you r…
    Loc1-8: An object of an unidentified shape suddenly appears in front of you and hits the ship. You hear an unpleasant cracking, which slowly turns into the whistle of a…
    Loc1-9: Suddenly an object appears on the viewscreen and dives under your ship. You hear a loud crash. / The ship jerks so suddenly that you bite your tongue and lose t…
    Loc1-10: The loud BANG from the service module signals that your ship has hit something. / Time to see how much your lack of attention has cost you this time.
    эффект: P6(Number 6) = {} [скрыт]
    скрыт: P1,P2,P3,P4,P5,P7,P8
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Start diagnostics
       условия: логика {[p8]<[p4]}
  -> Path3 => Loc2  вер=1 порядок=5
       текст: Start diagnostics
       условия: логика {[p8]>=[p4]}
       эффект: P8(Откус структуры) = {[p4]-1}
       эффект: P3(ext_Luck) -5

### Loc2 [УСПЕХ]
    выбор описания: {[p7]}
    Loc2-1: You learn that the collision with the meteorite cost you damage to your ship's hull and a loss of [p8] structure.
    Loc2-2: After a few seconds, you realize it isn't the viewscreen that has cracked – it was the protective glass on the outer cameras.  / "<clr>I got off easy<clrEnd>," …
    Loc2-3: You routinely fire up the diagnostic system. It takes you a couple of seconds to learn that the collision with the meteorite resulted in some damage to the tank…
    Loc2-4: "Oh, why me?!" you cry pointlessly after finishing reading the report: the collision with the meteorite cost you [p8] structure.
    Loc2-5: "What an idiot!" you curse yourself, seeing that you slept through [p8] damage to your sturdy hull.
    Loc2-6: The report, accompanied with the usual recommendation to "be more careful," informs you that you've lost [p8] structure – which means a big bill from the techni…
    Loc2-7: Rows of numbers appear before your eyes, informing you that colliding with the meteorite has cost you [p8] structural damage to your hull.
    Loc2-8: After a few seconds, you receive two messages. / The first one: "<clr>The hole in the hull has been successfully repaired<clrEnd>." / The second message: "The s…
    Loc2-9: In the unwanted silence, you learn that colliding with the meteorite has cost you [p8] structural damage to your hull.
    Loc2-10: Your hands trembling, you push the buttons to start the diagnostic procedure. No miracle came to save you: you've lost [p8] structure as a result of the damage …
    эффект: P2(ext_Fuel) = {[p2]-[p6]}
    эффект: P4(ext_Structure) = {[p4]-[p8]}
    эффект: P3(ext_Luck) -5

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
