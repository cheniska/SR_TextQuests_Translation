# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Text' [1..10] тип=обычный
    старт: [1..5]
    [1..10] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: A light is blinking on a panel, indicating an incoming short-range transmission. Curious, you do the following...
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Answer the call

### Loc2 [УСПЕХ]
    выбор описания: {[p1]}
    Loc2-1: You see a weird Maloq wearing a spacesuit from the waist up and an adult diaper with antigravitational lining from the waist down. / "Sr... srrryy, I accidental…
    Loc2-2: An unfamiliar Peleng appears on the screen: / "Greetings, Ranger. Some pirates have set a trap for traders at the system's border. Unless you want to fall into …
    Loc2-3: A man whose face seems vaguely familiar appears on the screen. / "<Ranger>? Fancy meeting you here! Do you know that here they have the lowest prices on luxury …
    Loc2-4: An unfamiliar Faeyan appears on the screen: / "Bows, grooves, bands, intimate Maloqi jewelry, gloves for Pelengs, glasses for Gaals, transparent kilts, memo pla…
    Loc2-5: A Gaal wearing the uniform of the Alliance Navigation Service appears on the screen. / "Welcome! Be careful - two asteroids collided here recently, and there is…

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [1]
