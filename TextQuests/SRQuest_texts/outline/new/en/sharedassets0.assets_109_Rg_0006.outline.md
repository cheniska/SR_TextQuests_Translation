# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Text' [1..10] тип=обычный
    старт: [1..5]
    [1..10] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Money' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Расчётная' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Расчётная 2' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 4: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_Luck' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 5: <>
    критическое: Сообщение достижения критического значения параметром 5

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: A light is blinking on a panel, indicating an incoming short-range transmission. Curious, you do the following...
    эффект: P4(Расчётная 2) = {[20..50]} [скрыт]
    скрыт: P5,P3,P2,P1
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Answer the call
       эффект: P3(Расчётная) = {([p2] div [p4])+6}

### Loc2 [УСПЕХ]
    выбор описания: {[p1]}
    Loc2-1: An unknown Faeyan appears on the screen and starts pattering: / "<Ranger>, you forgot to pay your bill of [p3] cr. for painting and polishing your ship at the p…
    Loc2-2: An unfamiliar Peleng wearing an expensive formal suit appears on the screen and gets right to the point: / "Tsk tsk, <Ranger>. A great hero of the galaxy and ye…
    Loc2-3: A strange Gaal appears before you. / "Good day, and a safe flight to you! How about some music?" He starts singing. You sit through the first verse. When he sta…
    Loc2-4: A Maloq holding a big strange apparatus appears on the screen. / "Smile!" he cries and blinds you with a bright flash for several minutes. When you can finally …
    Loc2-5: A person wearing a uniform appears on the screen. / "Captain Tostriper. I'm guessing you're <Ranger>, the pilot who tried to fly into the station through the op…
    эффект: P2(ext_Money) = {[p2]-[p3]}
    эффект: P5(ext_Luck) -5

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
