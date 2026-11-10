# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Fuel' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Fuel: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'больше топлева!' [0..50] тип=обычный
    старт: [25..45]
    [0..50] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Approaching the system, you notice three Maloq bambays trying to blow a Faeyan merchant ship out of the sky. It was Fate that brought you here! You have a rare …
    скрыт: P1,P2
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Flee
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Help the Faeyan
       эффект: P1(ext_Hint) = 1
  -> Path4 => Loc4  вер=1 порядок=5
       текст: Help the bambays
       эффект: P2(ext_Fuel) = {[p2]+[p3]}

### Loc2 [ПРОВАЛ]
    Loc2-1: You decide that the conflict participants can sort it out themselves. Quietly, trying not to ruin the intimacy of the moment with the impulses of your targeting…

### Loc3 [УСПЕХ]
    Loc3-1: As soon as you join the combat, the bambays turn to flee! Soon you see nothing but the glimmer of their rear engine nozzles.  / The Faeyan hauler gets in touch …

### Loc4 [ПРОВАЛ]
    Loc4-1: Realizing that this Faeyan haggler with its couple of paltry guns is about to destroy the three poor bambays armed with their missile launchers, you rush headlo…

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 3: 'УСПЕХ', 4: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [3]
