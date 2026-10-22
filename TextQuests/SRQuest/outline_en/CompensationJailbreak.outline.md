# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Money' [0..9999999] тип=обычный
    старт: [2]
    [0..9999999] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Параметр номер 2' [0..10000] тип=обычный
    старт: [0]
    [0..10000] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[1..9]}
    Loc1-1: While taking off, you hear the ringing of monastery bells. You figure you probably just finally went mad in prison, but just to be sure, you decide to check the…
    Loc1-2: As you are finally leaving this damned planet, you notice something strange: your account balance has increased by [p2] cr.! / Some of your old friends probably…
    Loc1-3: The moment you get back to your cozy chair, you receive a transmission from some ship: / "Hey <Ranger>, nice work! You managed to escape from prison! Me and my …
    Loc1-4: You've barely had any time to catch your breath after your thrilling escape, when suddenly an unknown pirate decides to contact you: / "Hey, <Ranger>? Remember …
    Loc1-5: Still feeling the adrenaline rushing through your veins from your recent escape, you finally start to get accustomed to your cozy chair, but something is still …
    Loc1-6: As you are leaving the planet's atmosphere, you notice a blinking light signalling that there's a new message in your inbox. You open it immediately. / The mess…
    Loc1-7: You've gotten pretty far away from that damn planet when you're contacted by a trade ship: / "<Ranger>, you recently visited the closest planet, right? Do you b…
    Loc1-8: You decide to start your new life after the sudden end of your sentence by cleaning up your ship. In the process, you find a tattered <clr>lottery ticket<clrEnd…
    Loc1-9: While you were away your inbox has gotten pretty full. One weird message catches your eye: / "Dear <Ranger>, Decree No. {[100..999]} of the High Circle of Minis…
    эффект: P2(Параметр номер 2) = {1000+[0..650]}
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Check account balance
       эффект: P1(ext_Money) = {[p1]+[p2]}

### Loc2 [УСПЕХ]

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
