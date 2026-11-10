# Квест (формат 1111111127)
Комментарий: В трех местах теперь 11524311
Сложность 10; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Money' [0..-159383552] тип=обычный
    старт: [-159383552]
    [0..159383550] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Правильные ответы' [0..10] тип=обычный
    старт: [0]
    [0..10] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Ваше состояние' [0..5] тип=обычный
    старт: [0]
    [0..0] You're confused
    [1..1] You're worried
    [2..2] You're nervous
    [3..3] You're bewildered
    [4..4] You're focused
    [5..5] You're calm
    критическое: Сообщение достижения критического значения параметром 3

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: The spaceport on <ToPlanet> is impressive. Transport cars flying everywhere, humanoids of all races rushing around in all directions - a lot of hustle and bustl…
    скрыт: P1,P2
    показ: P3
  -> Path2 => Loc2  вер=1 порядок=1
       текст: Stay and wait. They promised to meet you
       ответ: You stay and look around for the representative. Everyone around you is moving with purpose. Everybody looks busy and nobody is paying any attention to you. Out…
       эффект: P3(Ваше состояние) +1
  -> Path3 => Loc2  вер=1 порядок=2
       текст: Exit to the central hall of the spaceport
       ответ: You run out into the central hall of the spaceport and almost crash into a large Maloq female. It's hard to image what running into her would cost you, but in a…
       эффект: P3(Ваше состояние) +1
  -> Path4 => Loc2  вер=1 порядок=5
       текст: Go back to the ship – perhaps the representative decided to meet you there
       ответ: You slip into a side hallway and exit to the landing areas. Although there are fewer people rushing around here, moving through the spaceport is pretty hard due…
       эффект: P3(Ваше состояние) +1

### Loc2 [пустая]
  -> Path5 => Loc4  вер=1 порядок=9
       текст: Go to the administrator.
       ответ: You make your way through the crowd and reach the information center, where you soon learn the location of the administrator. After about 3 minutes, a blonde fe…
  -> Path6 => Loc3  вер=1 порядок=1
       текст: Continue looking for the representative

### Loc3 [обычная]
    Loc3-1: You keep on looking for the person that was supposed to meet you, when you feel somebody's hand on your shoulder. Your instincts wake immediately, and, turning …
    эффект: P3(Ваше состояние) +1
  -> Path7 => Loc4  вер=1 порядок=1
       текст: Visit the administrator
       ответ: At least these guys know what they're doing. Despite the high density of people in the spaceport, a bubble of space seems to somehow appear around the Pelengs, …

### Loc4 [пустая]
    эффект: P3(Ваше состояние) = 3
  -> Path8 => Loc5  вер=1 порядок=5
       текст: What is so amazing?
       ответ: "Amazing how much you look alike!" The Faeyan stands to the right of you, then moves to the left, the whole time openly examining you. "Spitting image!" / "But …

### Loc5 [пустая]
  -> Path9 => Loc6  вер=1 порядок=9
       текст: Let's get started right away!
       эффект: P3(Ваше состояние) = 4
  -> Path10 => Loc5  вер=1 проходов<=1 порядок=1
       текст: So you conduct experiments on living humanoids?!
       ответ: "No, no experiments. Just tests. I'll ask questions and you'll answer them, then the computer will analyze your answers, and voila." / "Can't you just use my DN…

### Loc6 [обычная]
    Loc6-1: "Great." The Faeyan takes out a portable computer and starts reading the tasks, "So, here's your first test. Listen carefully. <clr>Twenty-three million seven h…
  -> Path11 => Loc7  вер=1 порядок=5
       текст: Enter {11524315}
  -> Path12 => Loc7  вер=1 порядок=5
       текст: Enter {11524411}
  -> Path13 => Loc7  вер=1 порядок=5
       текст: Enter {11514311}
  -> Path14 => Loc7  вер=1 порядок=5
       текст: Enter {11524313}
  -> Path15 => Loc7  вер=1 порядок=5
       текст: Enter {11524309}
  -> Path31 => Loc7  вер=1 порядок=5
       текст: Enter {11524311}
       эффект: P2(Правильные ответы) +1

### Loc7 [обычная]
    Loc7-1: "Very well, let's continue. Also, please memorize this number: {11524311}. You'll need it later. So, here's the second question: ' There is a certain number of …
  -> Path16 => Loc8  вер=1 порядок=5
       текст: Two plus two equals four, I remember that much
  -> Path17 => Loc8  вер=1 порядок=7
       текст: Three. I don't know why, but I feel like this is a trick question
       эффект: P2(Правильные ответы) +1
  -> Path18 => Loc8  вер=1 порядок=9
       текст: There are two people in the room: their sons and fathers are in another room
  -> Path19 => Loc8  вер=1 порядок=1
       текст: There are hundreds of them; it's just that only these four are related

### Loc8 [обычная]
    Loc8-1: "Hmm, okay. Next question: "Treton costs {2000} cr., Treton and Lezka together cost {3000} cr., and Lezka and Industrial Laser together cost {1500} cr. How much…
  -> Path20 => Loc9  вер=1 порядок=1
       текст: A good Treton never costs less than 2,500 cr.
  -> Path21 => Loc9  вер=1 порядок=2
       текст: 2,000 cr. is top dollar for it
       эффект: P2(Правильные ответы) +1
  -> Path22 => Loc9  вер=1 порядок=3
       текст: I know for sure that a Treton costs 1,500 cr. I have a ranger's discount card
  -> Path23 => Loc9  вер=1 порядок=5
       текст: A wholesaler I know buys them for 1,000 cr.

### Loc9 [обычная]
    Loc9-1: "Answer accepted. Now for the last question. Do you remember that number I asked you to memorize? Enter it again."
  -> Path30 => Loc10  вер=1 порядок=5
       текст: Enter {11524311}
       эффект: P2(Правильные ответы) +1
  -> Path32 => Loc10  вер=1 порядок=5
       текст: Enter {11524313}
  -> Path33 => Loc10  вер=1 порядок=5
       текст: Enter {11524411}
  -> Path34 => Loc10  вер=1 порядок=5
       текст: Enter {11524315}
  -> Path35 => Loc10  вер=1 порядок=5
       текст: Enter {11514311}
  -> Path36 => Loc10  вер=1 порядок=5
       текст: Enter {11524309}

### Loc10 [пустая]
    эффект: P3(Ваше состояние) = 5
  -> Path29 => Loc11  вер=1 порядок=5

### Loc11 [УСПЕХ]
    выбор описания: {1+([p2]>2)}
    Loc11-1: "Just a second; processing the results." / The computer in the Faeyan's hands starts to blink and glow and finally emits red light. / "Well, ranger <Ranger>, I'…
    Loc11-2: "Just a second; processing the results." / The computer in the Faeyan's hands starts to blink and glow and finally emits red light. / "Well, ranger <Ranger>, I'…
    эффект: P1(ext_Money) = {[p1]+500}

## Анализ
- стартовых: [1]
- концовки: {11: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
