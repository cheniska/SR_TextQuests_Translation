# Квест (формат 1111111127)
Сложность 50; стартовая локация: [11]; путей по умолчанию: 0

## Параметры
- P1 'Имя' [1..10] тип=обычный
    старт: [1..10]
    [1..1] Raa Mathi
    [2..2] Loborvi
    [3..3] Antanaar
    [4..4] Thraak
    [5..5] Fontaami
    [6..6] Pleenor-Ga
    [7..7] Loborvi
    [8..8] Na-Alklari
    [9..9] Zalos
    [10..10] Soolamis
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Текст локации' [1..2] тип=обычный
    старт: [1]
    [1..2] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ext_Money' [0..9999999] тип=обычный
    старт: [100]
    [0..9999999] Параметр номер 4: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Найдено' [0..10000] тип=обычный
    старт: [0]
    [0..10000] Found <>
    критическое: Сообщение достижения критического значения параметром 5

## Локации и переходы

### Loc1 [обычная]
    Loc1-1: "Okay, listen up, <Ranger>," starts [d1], coughing expressively and rolling his eyes. / "Our whole world was created, every creature in it was born, every law w…
  -> Path2 => Loc2  вер=1 порядок=5
       текст: What happened next?

### Loc2 [обычная]
    Loc2-1: "Everything was going well: the world didn't simply exist anymore, it was actually evolving and taking care of itself. In the end, <clr>Gusdim's<clrEnd> five be…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: So, did everybody just make peace after the signing?

### Loc3 [обычная]
    Loc3-1: "No, unfortunately the Coalition was a nominal alliance. It didn't unite our world. So the Holy Triad resorted to drastic measures: <clr>they arranged the Kliss…
  -> Path4 => Loc4  вер=1 порядок=5
       текст: What else?

### Loc4 [обычная]
    Loc4-1: "The great <clr>Ga-Story<clrEnd> contains predictions about the future that have multiple possible interpretations. Today there are many dedicated humanoids on …
  -> Path5 => Loc5  вер=1 порядок=5
       текст: What were the others doing at that time?

### Loc5 [обычная]
    Loc5-1: "Like <clr>Gusdim<clrEnd> and <clr>Dorl<clrEnd>, other creators also united their forces. For instance, Saint <clr>Yokhan<clrEnd> along with the spectacular <cl…
  -> Path6 => Loc6  вер=1 порядок=5
       текст: What does it say about "the fight against absolute evil" and the upcoming dark times?

### Loc6 [обычная]
    Loc6-1: "Yes, about the future. The sacred <clr>Ga-Story<clrEnd> says that hordes and swarms of metal soldiers will enter our world in the year {1301} from the Creation…
  -> Path7 => Loc7  вер=1 порядок=5
       текст: What will happen to the Holy Triad?

### Loc7 [обычная]
    Loc7-1: "The Holy Triad will break apart, as was foretold. Some researchers believe this <clr>has already happened<clrEnd>, and that it and its followers have nearly fi…
  -> Path8 => Loc8  вер=1 порядок=5
       текст: What will happen after the great exodus?

### Loc8 [обычная]
    Loc8-1: "<clr>Ga-Story<clrEnd> doesn't speak of this directly; however, it says that the rangers, who will save the Galaxy once again and take responsibility for our ho…
  -> Path9 => Loc9  вер=1 порядок=5
       текст: Just so that the citizens of the Galaxy can see that everything is in their hands?

### Loc9 [обычная]
    Loc9-1: "Yes, precisely. So that every person of every race, age, and social status will understand that they are the architect of their own fortunes and they can chang…
  -> Path10 => Loc10  вер=1 порядок=5
       текст: So, does that mean that this final war will end and everything will be fine?

### Loc10 [обычная]
    Loc10-1: "If only," says [d1], sighing sadly, "Some of the prophets will share the fate of their creators: there will be a great exodus, but they will leave to look for …
  -> Path11 => Loc11  вер=1 порядок=5
       текст: What will be the outcome of the battle?
       эффект: P2(Текст локации) = 2

### Loc11 [СТАРТ]
    выбор описания: {[p2]}
    Loc11-1: The harmony of silent space is broken by an incoming call: / "Good day to you, Ranger <Ranger>! My name is [d1]. Do you have time to talk about the Creation of …
    Loc11-2: "It's currently unknown.  Unfortunately, <clr>Ga-Story<clrEnd> has so far been only partially decrypted."  / "So, will you take the brochure?" asks [d1] again.
    эффект: P5(Найдено) = {[p3]*5+5}
  -> Path12 => Loc1  вер=1 проходов<=1 порядок=2
       текст: Tell me about the creation of the world
  -> Path13 => Loc13  вер=1 порядок=5
       текст: Yes, please send me the brochure and I'll take a look
       условия: логика {[p2]=2}
       эффект: P2(Текст локации) = 1
       эффект: P4(ext_Money) = {[p4]+[p5]}
  -> Path14 => Loc13  вер=1 порядок=5
       текст: Yes, please send me the brochure and I'll take a look
       условия: логика {[p2]=1}
       эффект: P2(Текст локации) = 2
  -> Path15 => Loc14  вер=1 порядок=7
       текст: Cut off communications

### Loc13 [УСПЕХ]
    выбор описания: {[p2]}
    Loc13-1: [d1] sends you a brochure via teleport and quickly leaves. / The "brochure" turned out to be a massive paper tome. Something this heavy surely contains the trut…
    Loc13-2: [d1] sends you a brochure via teleport and quickly leaves. / The "brochure" turned out to be a massive paper tome. Something this heavy surely contains the trut…

### Loc14 [УСПЕХ]

## Анализ
- стартовых: [11]
- концовки: {13: 'УСПЕХ', 14: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [1, 3]
