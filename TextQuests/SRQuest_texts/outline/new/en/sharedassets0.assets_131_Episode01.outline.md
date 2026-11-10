# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Hint' [0..1] тип=обычный
    старт: [0]
    [0..1] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: After completing the scan, you notice a weird glow next to the ship. Intrigued by the nature of this phenomenon, you guide your ship towards it.  / After a few …
    скрыт: P1,P2
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Rub your eyes

### Loc2 [обычная]
    Loc2-1: You find yourself sitting on a soft comfortable chair. In front of you, sitting on a pompous golden throne, you see one of your predecessors who disappeared wit…
  -> Path4 => Loc5  вер=1 порядок=5
       текст: Shake his hand
       эффект: P2(Text) = 1
  -> Path5 => Loc5  вер=1 порядок=5
       текст: Wave your hand
       эффект: P2(Text) = 3
  -> Path6 => Loc5  вер=1 порядок=5
       текст: Don't move. Greet him with words only
       эффект: P2(Text) = 2

### Loc3 [УСПЕХ]
    Loc3-1: You try to shake Carune's hand but your palm hits what feels like hard air (no matter how strange that may sound). After a moment, the purple fog surrounds you …

### Loc4 [обычная]
    Loc4-1: "What else can I tell you? It's not a typical Dominator. It's too kind, too understanding of our nature. It doesn't show any of the dispositions to expansionism…
  -> Path11 => Loc9  вер=1 порядок=5
       текст: Say "<clr>Yupana<clrEnd>" out loud, and at my signal the retrieval system will pull your consciousness back. Can you tell me where I can find the other two mess…
       эффект: P1(ext_Hint) = 1

### Loc5 [обычная]
    выбор описания: {[p2]}
    Loc5-1: "Ranger <Ranger>," you reply, shaking his hand. In surprise, you notice that the throne room is slowly transforming into a bright-green natural landscape: a pla…
    Loc5-2: "Ranger <Ranger>," you reply, waving your hand. In surprise, you notice that the throne room is slowly transforming into a bright-green natural landscape: a pla…
    Loc5-3: "Ranger <Ranger>," you reply, remaining seated. In surprise, you notice that the throne room is slowly transforming into a bright-green natural landscape: a pla…
  -> Path7 => Loc6  вер=1 порядок=5
       текст: Where are we now?

### Loc6 [обычная]
    Loc6-1: "Physically, we are at the same place: the Alliance Research Center. Mentally, we're inside one of the standard computer projections of this Dominator boss.  / …
  -> Path8 => Loc7  вер=1 порядок=5
       текст: Before the mission, they told me you'd been here for three months. Who do you call yourself 'Your Highness'?

### Loc7 [обычная]
    Loc7-1: "That's not too far from the truth. Before the beginning, the scientists implanted a kind of a set of tools into my mind. When I came here, I tried to use it to…
  -> Path9 => Loc8  вер=1 порядок=5
       текст: Two: a Peleng and a Maloq. I wonder if I have a "set of tools" in my head?

### Loc8 [обычная]
    Loc8-1: "I don't think so. I would've felt it right away. And before you ask: I can't share mine either. I haven't found a way to swap heads here. / So, a Peleng and a …
  -> Path10 => Loc4  вер=1 порядок=5
       текст: To save the messengers and to get some useful information about what's happening here. Care to share some?

### Loc9 [обычная]
    Loc9-1: "Easy. I'm opening the console now. Now, write this down: <Hint>. Next... / Uh-oh! I don't like that. It's just like the last time. I feel just the same way. Th…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Try to interfere

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
