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
- P3 'Параметр номер 3' [0..20] тип=обычный
    старт: [0]
    [0..20] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3

## Локации и переходы

### Loc1 [СТАРТ] визитов<=1
    Loc1-1: A sudden bright flash makes you shut your eyes tight. A happy thought comes into your mind: perhaps it's the fifth messenger! Waiting for your eyes to adjust to…
  -> Path2 => Loc2  вер=1 проходов<=1 порядок=5
       текст: Hey...

### Loc2 [обычная] визитов<=1
    Loc2-1: "Disappointed with this interior? Then just reshape it according to your idea of beauty," says the fifth messenger, before you can even greet him. Seems he can …
  -> Path4 => Loc4  вер=1 проходов<=1 порядок=5
       текст: Is this OK?

### Loc3 [УСПЕХ]
    Loc3-1: "When you're ready, head for the <Hint> system. We'll meet there. That's all for now." At this, the Gaal and his world start to swiftly shrink into a tiny ball …

### Loc4 [обычная] визитов<=1
    Loc4-1: The mediation room is now an old wooden house, and a fire is crackling in the fireplace. You're sitting in a rocking chair by the fire with a thick book of fair…
  -> Path5 => Loc5  вер=1 проходов<=1 порядок=5
       текст: Can you read my thoughts?

### Loc5 [обычная]
    выбор описания: {[p2]}
    Loc5-1: "Since this is my digital projection, I see nothing strange about it. We can even converse via direct exchange of thoughts. But don't bury me in questions too q…
    Loc5-2: "Faeyans are rational. Don't take that the wrong way, but he might've thought you not only dangerous but also useless."
    Loc5-3: "Seems like the masters of this world are afraid that during our meeting I might pass you some information that would hinder their plans. But what information e…
    Loc5-4: "Haven't you guessed? The third stage is taking over the modified minds of Alliance citizens. What's the point of making more enemies in the Universe if you can…
    Loc5-5: "Based on the memory of the ancients and my own conclusions, I can only say that this is an expansion that will soon switch from 'stealth' mode into aggressive …
  -> Path6 => Loc6  вер=1 проходов<=1 порядок=2
       текст: One of the goals of my mission is to rescue the messengers. Which of them have you met here?
       эффект: P2(Text) = 2
  -> Path8 => Loc8  вер=1 проходов<=1 порядок=3
       текст: You said I'm not a mental projection. Are they bothering you much?
       эффект: P2(Text) = 3
  -> Path9 => Loc9  вер=1 порядок=1
       текст: The main question is: can we prevent the Transcoders' expansion?
       условия: логика {[p3]>=14}
       эффект: P2(Text) = 1
       эффект: P3(Параметр номер 3) = 0
  -> Path10 => Loc10  вер=1 проходов<=1 порядок=4
       текст: Don't think I'm some stupid Maloq, but what is so bad about the evolution that the Transcoders plan? I mean, besides the fact that they are making this choice f…
       эффект: P2(Text) = 4
  -> Path12 => Loc12  вер=1 проходов<=1 порядок=5
       текст: Who are the masters of this world?
       эффект: P2(Text) = 5

### Loc6 [обычная] визитов<=1
    Loc6-1: "Before me, they sent a Faeyan named <clr>Nakiyaki<clrEnd>. I talked to him. He offered me a chance to participate in 'the greatest evolutionary experiment of a…
  -> Path13 => Loc5  вер=1 проходов<=1 порядок=5
       текст: He didn't make any suggestions. I wonder why?
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc7 [обычная]
    выбор описания: {[p2]}
    Loc7-1: "That's also not certain. It's not such a bad fate to become the control center of a huge machine. It's unclear what'll happen to the 'hacker.' As a result of t…
    Loc7-2: "ALL of this space is alien territory. Its real owner can change the rules of the game at any time. But we could try to trick him. That's why, after we finish o…
    Loc7-3: "Planet Eluana, where my favorite park for meditations used to be. I suppose our mutual friend <clr>Nakiyaki<clrEnd> is at some prestigious academy now. To ensu…
  -> Path3 => Loc3  вер=1 порядок=1
       текст: Where's the point of access for the control center?
       условия: логика {[p3]>=5}
       эффект: P1(ext_Hint) = 1
  -> Path17 => Loc13  вер=1 проходов<=1 порядок=2
       текст: How should we assign roles?
       эффект: P2(Text) = 2
  -> Path19 => Loc14  вер=1 проходов<=1 порядок=3
       текст: I've always wanted to ask: why did the command center choose this virtual world for us?
       эффект: P2(Text) = 3

### Loc8 [обычная] визитов<=1
    Loc8-1: "Yes, there've been a lot lately, in many forms. Their thoughts were pretty unoriginal, though, like the Faeyans'. I was able to analyze them fully in a couple …
  -> Path14 => Loc5  вер=1 проходов<=1 порядок=5
       текст: What did they want to achieve?
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc9 [обычная]
    Loc9-1: "There's no such thing as a perfect system. Even transcoders have their weak points. I've determined the location of one of these vulnerabilities. To take advan…
  -> Path11 => Loc11  вер=1 порядок=5
       текст: Let me guess: the Transcoders' systems are too complex to be understood by our underdeveloped species. Sorry, I didn't want to offend you.

### Loc10 [обычная] визитов<=1
    Loc10-1: "This should be enough to classify the initiators of these changes as aggressors. Each race has the right to self-identification, which has already been infring…
  -> Path15 => Loc5  вер=1 проходов<=1 порядок=5
       текст: What's the third stage?
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc11 [обычная]
    Loc11-1: "Apology accepted. During expansion, the Transcoders' systems take on all features and disadvantages of an element in order to achieve maximum compatibility wit…
  -> Path7 => Loc7  вер=1 порядок=5
       текст: So... You're saying that only one of us will be able to return into his body?

### Loc12 [обычная] визитов<=1
    Loc12-1: "I don't have much information about this. <clr>Nakiyaki<clrEnd> said that this command center was sent to the Alliance races, as they were quite highly-develop…
  -> Path16 => Loc5  вер=1 проходов<=1 порядок=5
       текст: But you don't think so, do you?
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc13 [обычная] визитов<=1
    Loc13-1: "It's too soon to say. I don't want to be overly dramatic, but first we'll have to reach the necessary location. I suspect that'll be more difficult than usual,…
  -> Path18 => Loc7  вер=1 проходов<=1 порядок=5
       текст: I think we were talking on your territory. Is there a reason to be worried?
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc14 [обычная] визитов<=1
    Loc14-1: "You might be surprised by this, but the machine creates a different virtual reality for each consciousness. For instance, what did you see beyond the boundarie…
  -> Path20 => Loc7  вер=1 проходов<=1 порядок=5
       текст: The galaxy at the very beginning of the war with the Dominators. And you?
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
