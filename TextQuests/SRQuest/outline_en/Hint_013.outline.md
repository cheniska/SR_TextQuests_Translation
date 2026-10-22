# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Hint: <>
    критическое: Сообщение достижения критического значения параметром 1
- P6 'ext_Structure' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Structure: <>
    критическое: Сообщение достижения критического значения параметром 6
- P8 'Процент повреждений' [10..90] тип=обычный
    старт: [12..28]
    [10..90] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'Контрольное значение' [2..5] тип=обычный
    старт: [2..5]
    [2..5] Параметр номер 0: <>
    критическое: Сообщение достижения критического значения параметром 9

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p9]-1}
    Loc1-1: You see a wrecked ship. Judging by its charred remains, a horrible catastrophe happened here. A strange signal is coming from the nose of the ship.  / Do you wa…
    Loc1-2: You see a wrecked ship. Judging by its charred remains, a horrible catastrophe happened here. A strange signal is coming from the port side of the ship.  / Do y…
    Loc1-3: You see a wrecked ship. Judging by its charred remains, a horrible catastrophe happened here. A strange signal is coming from the stern of the ship.  / Do you w…
    Loc1-4: You see a wrecked ship. Judging by its charred remains, a horrible catastrophe happened here. A strange signal is coming from the starboard side of the ship.  /…
    скрыт: P1,P2,P6,P8,P9
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Approach the wrecked ship
  -> Path15 => Loc8  вер=1 порядок=3
       текст: Choose not to take the risk

### Loc2 [обычная]
    Loc2-1: You approach the <clr>nose of the ship<clrEnd>, which is surrounded in a cloud of tiny crystals. A terrible realization hits your mind: "That's frozen air!"
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Continue flying around
  -> Path10 => Loc6  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]<>2}
  -> Path11 => Loc7  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]=2}

### Loc3 [обычная]
    Loc3-1: You move slowly along the <clr>left side<clrEnd> of the wrecked ship. Amazingly, the hull is well preserved. Looks like the black trash collectors haven't reach…
  -> Path4 => Loc4  вер=1 порядок=5
       текст: Continue flying around
  -> Path12 => Loc6  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]<>3}
  -> Path13 => Loc7  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]=3}

### Loc4 [обычная]
    Loc4-1: Here's the <clr>aft end of the ship<clrEnd>. It looks almost intact, except for a strange figure tangled in wires, like a marionette. Most likely, the ejection …
  -> Path5 => Loc5  вер=1 порядок=5
       текст: Continue flying around
  -> Path6 => Loc6  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]<>4}
  -> Path7 => Loc7  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]=4}

### Loc5 [обычная]
    Loc5-1: You fly slowly along the <clr>left side<clrEnd>. You see at once that the ship has suffered a fatal blow at the front: everything is shattered, and the torso of…
  -> Path8 => Loc6  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]<>5}
  -> Path9 => Loc7  вер=1 порядок=5
       текст: Examine the ship from this side
       условия: логика {[p9]=5}
  -> Path14 => Loc2  вер=1 порядок=5
       текст: Continue flying around

### Loc6 [ПРОВАЛ]
    Loc6-1: Your search yields nothing. Disappointed, you bang your hand on something with an oblong shape, causing a countdown timer to appear. You make a hasty retreat, n…
    эффект: P6(ext_Structure) = {([p6]-[p6]/100*[p8])+1}

### Loc7 [УСПЕХ]
    Loc7-1: You've been searching. For a long time. For a very long time. Then you find it. A tablet. With some writing in an unknown language. As if it were left for you b…
    эффект: P1(ext_Hint) = 1

### Loc8 [ПРОВАЛ]
    Loc8-1: Not wishing to waste your precious time on nonsense, you leave this gloomy place.

## Анализ
- стартовых: [1]
- концовки: {6: 'ПРОВАЛ', 7: 'УСПЕХ', 8: 'ПРОВАЛ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
