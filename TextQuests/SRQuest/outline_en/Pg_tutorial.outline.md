# Квест (формат 1111111127)
Сложность 10; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Текстовая' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: You admire the endless expanse of space, the abyss full of billions of twinkling stars, and then suddenly out of the corner of your eye notice a dot on your rad…
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Watch the dot on the radar closely
       эффект: P1(Текстовая) = 0
  -> Path3 => Loc2  вер=1 порядок=9
       текст: Run as far as possible
       эффект: P1(Текстовая) = 1

### Loc2 [УСПЕХ]
    выбор описания: {[p1]+1}
    Loc2-1: You hold your breath and watch. The object on the screen is... weird. First of all, its shape is unusual. You mentally compliment the newest Faeyan scanning sys…
    Loc2-2: You switch to afterburner and pull the yoke back. Despite everything, the object on the radar still seems dangerously close. However, after another attempt to d…

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
