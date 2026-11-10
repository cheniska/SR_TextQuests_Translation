# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Luck' [0..999999999] тип=обычный
    старт: [80]
    [0..999999999] Luck: <>
    критическое: Сообщение достижения критического значения параметром 2

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: As you watch your autopilot complete the perfect ascent to the space body's orbit, you start thinking about life and the essence of humanity. Suddenly, a though…
    скрыт: P1,P2
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Keep contemplating

### Loc2 [УСПЕХ]
    Loc2-1: You're still daydreaming when a familiar sound fills the flight deck, accompanied by a comment from your onboard computer: / "Incoming message." / Puzzled by wh…
    эффект: P1(ext_Hint) = 1

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
