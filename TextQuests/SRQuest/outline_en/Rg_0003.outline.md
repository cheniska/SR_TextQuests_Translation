# Квест (формат 1111111127)
Сложность 10; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P3 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P7 'Text' [1..10] тип=обычный
    старт: [1..10]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 7

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p7]}
    Loc1-1: Your ship shakes violently. / "WHA..? Again?!" you think.
    Loc1-2: The viewscreen shows a small but quickly growing meteorite. / "So pretty! I wonder where it's headed?" you think. Your question is immediately answered by a pow…
    Loc1-3: Your ship shakes violently. The alarm starts howling. You try hard to remember the relevant portion of the user manual and perform the appropriate action...
    Loc1-4: Something crashes heavily into the service module. / "What the..." you think, already guessing what the answer is. Or do you?
    Loc1-5: Suddenly the peaceful cosmic silence is broken by a howling alarm. / "WHAT THE..." Your eyes are still closed, and you can barely form a thought, but your hands…
    Loc1-6: The shrill sound of an alarm tears you away from your sleep. Your reflexes, honed by years of fighting, make you do the right thing. You react automatically.
    Loc1-7: The viewscreen shows a meteorite speeding towards you. / You jerk the steering yoke, trying to avoid a collision, but before you even finish the maneuver, you r…
    Loc1-8: The ship shudders, then goes still for a second as if it has hit something, then speeds ahead. / If it weren't for your seatbelts, the viewscreen would've given…
    Loc1-9: The ship shakes, as if it has hit something invisible. Or perhaps it was visible and you just didn't notice it?
    Loc1-10: The loud BANG from the cargo hold signals that your ship has hit something. / Time to see how much your lack of attention has cost you this time.
    эффект: P6(Number 6) = {} [скрыт]
    скрыт: P1,P2,P3,P4,P5,P7
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Start diagnostics

### Loc2 [УСПЕХ]
    выбор описания: {[p7]}
    Loc2-1: "Another day, another lucky escape," you conclude happily, reading the diagnostic report informing you that the incident <clr>hasn't damaged your ship at all<cl…
    Loc2-2: It takes you a few seconds to learn that <clr>your ship didn't suffer any damage<clrEnd>, and you start a happy dance... ...Such a happy dance, in fact, that yo…
    Loc2-3: "Could've been worse," you think after reading the report: <clr>the ship hasn't suffered any damage at all<clrEnd> (unlike your pants).
    Loc2-4: You nervously start the diagnostic procedure. After a few seconds, you learn that the incident has only cost you some nerve cells and a visit to the washing mac…
    Loc2-5: You routinely fire up the diagnostic system. After a few seconds, you realize that you have to pour a strong drink for yourself right away: colliding with the m…
    Loc2-6: After a few seconds you find out that there was no need to worry: <clr>the ship didn't suffer any damage<clrEnd>.
    Loc2-7: There are only two possible options: either your maneuver was a success, or the diagnostic system went haywire: it claims that <clr>your ship hasn't suffered an…
    Loc2-8: "Maloqi craftsmanship rules!" you think proudly, seeing that <clr>your ship hasn't suffered any damage.<clrEnd> None at all.
    Loc2-9: "All's well that ends well," you think, as you notice that the unknown debris <clr>didn't damage your ship at all<clrEnd>.
    Loc2-10: Your hands trembling, you push the buttons to begin the diagnostic procedure... Apparently a miracle just happened: <clr>the ship didn't suffer any damage<clrEn…
    эффект: P2(ext_Fuel) = {[p2]-[p6]}
    эффект: P4(ext_Structure) = {[p4]-[p8]}
    эффект: P3(ext_Luck) = {[3..7]}

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
