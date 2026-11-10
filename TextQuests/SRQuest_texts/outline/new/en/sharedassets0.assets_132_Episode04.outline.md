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

### Loc1 [СТАРТ]
    Loc1-1: "Scanning complete. My congratulations. You've found <clr>Nakiyaki<clrEnd>," says the onboard computer's notification system in a musical voice. You barely have…
    скрыт: P1,P3,P2
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Perhaps you would like some coffee?

### Loc2 [обычная]
    Loc2-1: "Exactly! Coffee, sure. I always forget and confuse important things. I suppose you've already guessed that I'm <clr>Nakiyaki<clrEnd>. Don't try to find a trans…
  -> Path4 => Loc4  вер=1 порядок=5
       текст: Me too, Nakiyaki! I've finally met somebody I can actually talk to. There's so much I want to ask you...

### Loc3 [УСПЕХ]
    Loc3-1: "Landown... Landown... Is that the name of that ancient general who wasn't especially smart? To be honest, I didn't expect to hear such trivial and untrue insul…

### Loc4 [обычная]
    выбор описания: {[p2]}
    Loc4-1: "Let's not waste any time. Ask away."
    Loc4-2: "I don't know. You probably know that the flow of time here is different from the flow in the real world. I feel like I've been here for several years, even tho…
    Loc4-3: "Easy. Put your hand inside your pocket, think about something you'd like to take out of it, and do it." You like the sound of this idea. In less than a minute,…
    Loc4-4: "There are many? I don't know that. When I started, everything was so chaotic, and there was only one option: the 'universal' tool. It had noticeable defects in…
    Loc4-5: "A lot. But I doubt that you're that good at the physics of the quantum singularity... Or the singularity of quantum physics. / As you can see, I've been here s…
    Loc4-6: "Enough to understand nature here, its motives, and its laws of this world. Look, I can do this." After these words, you and the Faeyan are suddenly in space wi…
  -> Path5 => Loc6  вер=1 проходов<=1 порядок=2
       текст: Have you been here long?
       эффект: P2(Text) = 2
  -> Path7 => Loc7  вер=1 проходов<=1 порядок=1
       текст: I've managed to save all the messengers except you and another one - a Gaal. Do you know where to look for him?
       условия: логика {[p3]=0}
       эффект: P2(Text) = 1
  -> Path8 => Loc8  вер=1 проходов<=1 порядок=3
       текст: Could you share a trick with me?
       эффект: P2(Text) = 3
  -> Path9 => Loc9  вер=1 проходов<=1 порядок=4
       текст: I know that all messengers had a set of mental "tools" implanted into their minds. What's yours?
       эффект: P2(Text) = 4
  -> Path10 => Loc10  вер=1 проходов<=1 порядок=5
       текст: What can you tell me about this machine?
       эффект: P2(Text) = 5
  -> Path16 => Loc11  вер=1 порядок=1
       текст: I've learned everything I wanted to. It was nice talking to you. Now please say "<clr>Yupana<clrEnd>" aloud, and in a few seconds you'll find yourself inside yo…
       условия: логика {[p3]=1}
       эффект: P2(Text) = 1
  -> Path18 => Loc12  вер=1 проходов<=1 порядок=6
       текст: How deep did you get inside this thing's brains?
       эффект: P2(Text) = 6

### Loc5 [обычная]
    Loc5-1: "You won't be able to tell anyone about this anyway; the machine will loop your consciousness and you'll be stuck in your memories for a while. At least until t…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: You... You know who you are? You're <clr>Landown<clrEnd>!

### Loc6 [пустая] визитов<=1
  -> Path6 => Loc4  вер=1 проходов<=1 порядок=5

### Loc7 [обычная] визитов<=1
    Loc7-1: "The Gaal? I don't remember. Although recently, when I was digging around in the logical circuits of the digital world, I came across a very weird piece of data…
    эффект: P1(ext_Hint) = {1}
  -> Path14 => Loc4  вер=1 порядок=4
       текст: Yes
       эффект: P3(Параметр номер 3) = 1
  -> Path15 => Loc11  вер=1 порядок=5
       текст: No. I've learned everything I wanted to. It was nice talking to you. Now please say "<clr>Yupana<clrEnd>" aloud, and in a few seconds you'll find yourself insid…

### Loc8 [пустая] визитов<=1
  -> Path12 => Loc4  вер=1 проходов<=1 порядок=5

### Loc9 [пустая] визитов<=1
  -> Path11 => Loc4  вер=1 проходов<=1 порядок=5

### Loc10 [пустая] визитов<=1
  -> Path13 => Loc4  вер=1 проходов<=1 порядок=5

### Loc11 [обычная]
    Loc11-1: "Why should I go back?"
  -> Path17 => Loc14  вер=1 порядок=5
       текст: Thank you for trying to help me, but you're needed much more out there - outside. The scientists need data. Please say "<clr>Yupana<clrEnd>" out loud to return.

### Loc12 [пустая] визитов<=1
  -> Path23 => Loc4  вер=1 проходов<=1 порядок=5

### Loc13 [обычная]
    Loc13-1: "No luck, huh? Don't count on it. The retrieval code is blocked. I can say '<clr>Yupana<clrEnd>' as many times as I want, and nothing will happen!"
  -> Path20 => Loc15  вер=1 порядок=5
       текст: Don't worry, Nakiyaki, we'll think of something
       эффект: P3(Параметр номер 3) = 0

### Loc14 [обычная]
    Loc14-1: "Sure. <clr>Yupana<clrEnd>." For a few minutes after that, you and <clr>Nakiyaki<clrEnd> stand watching each other in silence. Nothing happens. Feeling more and…
  -> Path19 => Loc13  вер=1 порядок=5
       текст: I don't understand. It worked before...

### Loc15 [обычная]
    выбор описания: {[p2]}
    Loc15-1: "That's unlikely. I have to explain something: the place we're currently located in has nothing to do with the Dominators. Everything you can see and sense righ…
    Loc15-2: "To put it simply, they're a highly-developed technological race which consists of a physical block, the command center, and universal cybermodules which are hi…
    Loc15-3: "No. They're actually real. And each one has a personal unique flaw.  / <clr>One<clrEnd> of them, armed with his 'tools,' could have been a problem, but he want…
    Loc15-4: "Aren't you tired yet? Use your brains for once and try answering this question: why was the system where this artifact was found free during most of the war, e…
  -> Path21 => Loc16  вер=1 проходов<=1 порядок=5
       текст: How are the Dominators connected with all of this?
       эффект: P2(Text) = 4
  -> Path22 => Loc17  вер=1 проходов<=1 порядок=5
       текст: Who are these Transcoders?
       эффект: P2(Text) = 2
  -> Path24 => Loc18  вер=1 проходов<=1 порядок=5
       текст: The messengers I saved – are they a projection too?
       эффект: P2(Text) = 3
  -> Path28 => Loc19  вер=1 проходов<=1
       текст: How are the Alliance races related to the Transcoders?
       условия: логика {[p3]>=9}
       эффект: P2(Text) = 1
       эффект: P3(Параметр номер 3) = 0

### Loc16 [пустая] визитов<=1
  -> Path27 => Loc15  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc17 [пустая] визитов<=1
  -> Path26 => Loc15  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc18 [пустая] визитов<=1
  -> Path25 => Loc15  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc19 [обычная]
    выбор описания: {[p2]}
    Loc19-1: "Directly. After entering our arm of the galaxy at the beginning of the war with the Dominators, the command center found the best point of access to the Galane…
    Loc19-2: "This is where it gets really interesting. Having reprogrammed all computer systems, the transcoders' cybermodules will make these systems generate special radi…
    Loc19-3: "Unfortunately, the war with the Dominators ended before the Transcoders could solve all of their compatibility issues - plus the system engineers became really…
    Loc19-4: "Haven't you guessed? We're acquiring the Transcoders' unique abilities. This will open up new opportunities for us. Not only for us Faeyans. Other races will a…
    Loc19-5: "In this new era, material wealth will have no value. Everyone will be equal, although some will be more equal than others. I'll be perfectly content with my fa…
    Loc19-6: "Time in this world is a relative notion. I developed the show myself with only one goal: to neutralize the threat to our plans. Simply put, a command is only e…
  -> Path29 => Loc20  вер=1 проходов<=1 порядок=2
       текст: What is the second phase?
       эффект: P2(Text) = 2
  -> Path30 => Loc22  вер=1 проходов<=1 порядок=3
       текст: I wonder – has the first phase been completed yet?
       эффект: P2(Text) = 3
  -> Path31 => Loc21  вер=1 проходов<=1 порядок=4
       текст: What's the point of all of this?
       эффект: P2(Text) = 4
  -> Path35 => Loc5  вер=1 порядок=1
       текст: Don't you think you're being a little too honest with me? What if your plans and the goals of these Transcoders don't align well with mine?
       условия: логика {[p3]>=20}
  -> Path36 => Loc23  вер=1 проходов<=1 порядок=5
       текст: What do you get out of all of this?
       эффект: P2(Text) = 5
  -> Path38 => Loc24  вер=1 проходов<=1 порядок=5
       текст: Then why did you arrange all of that nonsense with the government building? You could just skip straight to this "terrifying secret" and save us a lot of time!
       эффект: P2(Text) = 6

### Loc20 [пустая] визитов<=1
  -> Path32 => Loc19  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc21 [пустая] визитов<=1
  -> Path34 => Loc19  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc22 [пустая] визитов<=1
  -> Path33 => Loc19  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc23 [пустая] визитов<=1
  -> Path37 => Loc19  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

### Loc24 [пустая] визитов<=1
  -> Path39 => Loc19  вер=1 проходов<=1 порядок=5
       эффект: P3(Параметр номер 3) = {[p3]+[p2]}

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
