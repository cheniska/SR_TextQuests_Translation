# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Text: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..999999999] тип=обычный
    старт: [35]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 3

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p2]}
    Loc1-1: As you contemplate the bad habits of certain individuals, you drop the pencil you were still peacefully chewing just a few seconds ago. The ancient writing devi…
    скрыт: P1,P2,P3
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Get out of the antigravity chair and pick up the pencil
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Relax and forget it

### Loc2 [УСПЕХ]
    выбор описания: {[p2]}
    Loc2-1: Picking up the pencil, you bang your head on the control panel pretty badly. The world goes black before your eyes... But then you have <clr>an "aha" moment<clr…
    эффект: P1(ext_Hint) = 1

### Loc3 [ПРОВАЛ]
    Loc3-1: That's a sound decision! Bad habits must be eliminated! / But what are you going to occupy yourself with in the coming time?

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ', 3: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
