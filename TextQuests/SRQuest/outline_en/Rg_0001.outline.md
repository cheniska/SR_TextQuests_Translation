# Квест (формат 1111111127)
Сложность 10; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P2 'ext_Fuel' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Fuel: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Structure' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Structure: <>
    критическое: Сообщение достижения критического значения параметром 4
- P6 'Откус топлива' [0..999999999] тип=обычный
    старт: [1..60]
    [0..999999999] Number 6: <>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Text' [1..10] тип=обычный
    старт: [1..10]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'Откус структуры' [0..999999999] тип=обычный
    старт: [25..250]
    [0..999999999] Number 8: <>
    критическое: Сообщение достижения критического значения параметром 8

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p7]}
    Loc1-1: Your ship shakes violently.
    Loc1-2: The viewscreen shows a small but quickly growing meteorite. / "So pretty! I wonder where it's headed?" you think. Your question is immediately answered by a pow…
    Loc1-3: Your ship shakes violently. / "WHA..? Again?!" you think.
    Loc1-4: Something crashes heavily into the fuel tank. / "What the..." you think, but you already know the answer. Or do you?
    Loc1-5: Suddenly the peaceful cosmic silence is broken by a howling alarm. / "WHAT THE..." Your eyes are still closed, and you can barely form a thought, but your hands…
    Loc1-6: The shrill sound of an alarm tears you away from your sleep. / Your reflexes, honed by many years of fighting, make you do what is necessary. You react automati…
    Loc1-7: The viewscreen shows a meteorite speeding towards you. / You jerk the steering yoke, trying to avoid a collision, but before you can finish the maneuver you alr…
    Loc1-8: The ship shudders, then goes still for a second as if it hit something, then speeds ahead. / If it weren't for your seatbelts, the viewscreen would've given you…
    Loc1-9: The ship shakes, as if it has hit something invisible. Or perhaps it was visible and you just didn't notice it?
    Loc1-10: A loud BANG from the fuel tank signals that your ship has hit something. / Time to see how much your lack of attention has cost you this time.
    эффект: P6(Откус топлива) = {} [скрыт]
    скрыт: P1,P2,P3,P4,P5,P7,P8
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Start diagnostics
       условия: логика {[p6]<[p2] and [p8]<[p4]}
       эффект: P7(Text) = {[1..6]}
  -> Path3 => Loc2  вер=1 порядок=5
       текст: Start diagnostics
       условия: логика {[p6]<[p2] and [p8]>=[p4]}
       эффект: P7(Text) = {[7..10]}
       эффект: P8(Откус структуры) = {[p4]-1}
  -> Path4 => Loc2  вер=1 порядок=5
       текст: Start diagnostics
       условия: логика {[p6]>=[p2] and [p8]<[p4]}
       эффект: P6(Откус топлива) = {[p2]}
       эффект: P7(Text) = {[7..10]}
  -> Path5 => Loc2  вер=1 порядок=5
       текст: Start diagnostics
       условия: логика {[p6]>=[p2] and [p8]>=[p4]}
       эффект: P6(Откус топлива) = {[p2]}
       эффект: P7(Text) = {[7..10]}
       эффект: P8(Откус структуры) = {[p4]-1}
       эффект: P3(ext_Luck) -3

### Loc2 [УСПЕХ]
    выбор описания: {[p7]}
    Loc2-1: The collision with the meteorite cost you [p8] structure and [p6] fuel.
    Loc2-2: You routinely fire up the diagnostic system. After a couple of seconds, you learn that the collision with the meteorite resulted in some damage to the hull and …
    Loc2-3: After a few seconds, you learn that you just graciously gave away [p8] structure, [p6] fuel, and 2 hours of your time patching a series of holes in the hull and…
    Loc2-4: The report, accompanied with the usual recommendation to "be more careful," informs you that you have lost [p8] structure, [p6] fuel, and a couple of hours spen…
    Loc2-5: After a few seconds, you realize that you not only lost [p8] structure and [p6] fuel but also ensured that your droids would be busy for a while, fixing the new…
    Loc2-6: Your hands trembling, you push the buttons to begin the diagnostic procedure... No miracle came to save you: you lost [p8] structure and [p6] fuel as a result o…
    Loc2-7: The diagnostic system doesn't want to start up at first. You understand why when you see that you have lost [p8] structure and [p6] fuel: the system simply does…
    Loc2-8: "What an dolt!" you curse yourself, realizing that your inattention cost you damage to your fuel tank and hull and a loss of [p8] structure and [p6] fuel.
    Loc2-9: "I'm a real Maloq!" you exclaim proudly, seeing that you have suffered damage to your durable hull and fuel tank, stupidly losing [p8] structure and [p6] fuel.
    Loc2-10: As you read the report about the damaged fuel tank and hull, for the first time you can clearly see the actual place you deserve in the evolutionary tree of the…
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
