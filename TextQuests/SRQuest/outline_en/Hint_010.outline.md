# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Money' [0..999999999] тип=обычный
    старт: [10000]
    [0..999999999] Money: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Коэффициент откусывания' [0..100] тип=обычный
    старт: [16..20]
    [0..100] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Итог откусывания' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 4

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: As soon as you exit hyperspace, a certain Maloq gets in touch with you. He's asking you to make a charitable donation (he has great trouble articulating this ph…
    эффект: P4(Итог откусывания) = {[p2] div [p3]} [скрыт]
    скрыт: P1,P2,P3
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Get on with your business
  -> Path3 => Loc3  вер=1 порядок=3
       текст: Donate to the cause
       эффект: P1(ext_Hint) = 1
       эффект: P2(ext_Money) = {[p2]-[p4]}

### Loc2 [ПРОВАЛ]
    Loc2-1: You decide this isn't the time to think about some veterans: you've got to take care of yourself. You log off and keep flying - not to the location where the st…

### Loc3 [УСПЕХ]
    Loc3-1: As soon as you transfer [p4] cr. to the account of the veteran organization, the Maloq's face brightens. He begins jumping with joy, saying:  / "Finally, after …

## Анализ
- стартовых: [1]
- концовки: {2: 'ПРОВАЛ', 3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
