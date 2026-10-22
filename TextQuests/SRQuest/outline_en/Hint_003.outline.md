# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Fuel' [0..999999999] тип=обычный
    старт: [21]
    [0..999999999] Fuel: <>
    критическое: Сообщение достижения критического значения параметром 2

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: <clr>Incoming message<clrEnd>: / "Hey, bro, help me out with some fuel, will you? Got stuck in this hellhole like an idiot. I don't need much. <clr>Twenty<clrEn…
    скрыт: P1,P2
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Ignore the plea for help
  -> Path3 => Loc3  вер=1 [всегда видна] порядок=5
       текст: Offer help (-{20} fuel)
       условия: логика {[p2]>=20}
       эффект: P1(ext_Hint) = 1

### Loc2 [ПРОВАЛ]
    Loc2-1: You suddenly remember that you don't give anything to beggars on Fridays or Saturdays. Or on other days of the week. So you end the transmission and try to get …

### Loc3 [УСПЕХ]
    Loc3-1: You give the poor lad some fuel and find out that the rescued pilot possesses some valuable information. He is happy to share it with you. Now you know that: / …
    эффект: P2(ext_Fuel) = {[p2]-20}

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
