# Квест (формат 1111111127)
Сложность 0; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Dialog' [0..2] тип=обычный
    старт: [0]
    [0..2] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 2: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Money' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: "Ranger <Ranger>, an unidentified Maloq is waiting for you in the hangar, banging his head on your ship. I repeat: Ranger <Player>, an unidentified Maloq is wai…
    скрыт: P1,P2,P3
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Proceed into the hangar... And hurry up!

### Loc2 [обычная]
    Loc2-1: Keeping in mind that the toughness rating of the average Maloq is much higher than that of your ship's hull, you rush into a hangar and stop short, stunned by t…
  -> Path4 => Loc4  вер=1 порядок=5
       текст: Listen carefully

### Loc3 [УСПЕХ]
    Loc3-1: Hearing the command, the Maloq troublemaker walks ten meters away from your ship, then runs at it, accelerating rapidly. You hear a deafening crash and see anot…

### Loc4 [обычная]
    Loc4-1: "Base to ranger, base to ranger. Get out of here, you're not doing it right. Here's how it's done: <Ranger>, can you hear me? Professor Ze-Braya speaking."
  -> Path5 => Loc5  вер=1 порядок=5
       текст: I hear, I hear... I believe the police will be interested in hearing this
  -> Path24 => Loc5  вер=1 порядок=3
       текст: You could be anyone, for all I care! Who will pay for the repairs?
  -> Path25 => Loc5  вер=1 порядок=8
       текст: Holy cats! A Maloq with a Gaal name. I wonder who your ancestors are. You look like a mucked-up genetic experiment to me...

### Loc5 [обычная]
    Loc5-1: "<Ranger>, calm down. And tell me, do you remember how you ended up in this <clr>virtual world<clrEnd> and the details of your mission?"
  -> Path26 => Loc16  вер=1 порядок=7
       текст: At the moment, my task is to test the new space ranger training program
  -> Path27 => Loc16  вер=1 порядок=3
       текст: No, I don't remember
  -> Path28 => Loc16  вер=1 порядок=5
       текст: Virtual?! I'm afraid you've been, erm... Crushing it for too long

### Loc6 [обычная]
    выбор описания: {[p2]}
    Loc6-1: "To accomplish a task. That's why you were sent here. I would like to remind you of the <clr>mission objectives<clrEnd>:  / Number one: you must try to <clr>sav…
    Loc6-2: "We're listening."
    Loc6-3: "To get them out, we must receive a return command code from them. This signal will, hypothetically, let us identify a clot of real consciousness among the mass…
    Loc6-4: "Soon we realized that the only possible transponders are virtual characters in direct contact with you, whose neural organization is as simple as possible - th…
    Loc6-5: "Exactly. Of course, we do have the option of cutting the power and destroying the dangerous object as the last resort, but we don't see the need to use that at…
    Loc6-6: "Thanks for reminding us. Our Gaal programmers were indeed able to find a breach in the security system of the object, which was closed almost immediately. Luck…
    Loc6-7: "Transmitting information in chronological order, by mission start date. Try to memorize these: / 1. A Faeyan named <clr>Nakiyaki<clrEnd>, scientist, expert in …
    Loc6-8: "Here's what I suggest: you do your very best to accomplish the mission, and we make every effort to get you and your colleagues out of here and to support you …
  -> Path6 => Loc7  вер=1
       текст: Thank you. I've learned everything I wanted to
       условия: логика {[p1]>=1}
  -> Path8 => Loc8  вер=1 порядок=3
       текст: Who are the messengers?
       условия: логика {[p1]<=1}
       эффект: P2(Text) = 3
       эффект: P1(Dialog) = 1
  -> Path9 => Loc9  вер=1 порядок=4
       текст: How did you manage to get in touch with me?
       условия: логика {[p1]<=1}
       эффект: P2(Text) = 4
  -> Path10 => Loc10  вер=1 порядок=5
       текст: How am I supposed to accomplish the second task?
       условия: логика {[p1]<=1}
       эффект: P2(Text) = 5
  -> Path11 => Loc11  вер=1 проходов<=1 порядок=6
       текст: Can you keep an eye on my actions and help me if I need it?
       условия: логика {[p1]=2}
       эффект: P2(Text) = 6
  -> Path12 => Loc12  вер=1 порядок=7
       текст: How many messengers were there?
       условия: логика {[p1]=2}
       эффект: P2(Text) = 7
  -> Path13 => Loc13  вер=1 порядок=8
       текст: You keep saying "likely," "hypothetically," etc., but how can you be sure that it will all work out?
       условия: логика {[p1]=2}
       эффект: P2(Text) = 8
  -> Path36 => Loc19  вер=1 порядок=9
       текст: Could you please repeat all of that introductory information on the Dominators' fourth command center for me?
       эффект: P2(Text) = 1

### Loc7 [обычная]
    выбор описания: {[p1]}
    Loc7-1: "If you want to end our communication session, just yell the '<clr>Charge!<clrEnd>' command, but remember: from that moment on, you're on your own. And please t…
    Loc7-2: "Then, as soon as you are ready to end our communication session, just yell the '<clr>Charge!<clrEnd>' command, but remember: from that moment on, you're on you…
  -> Path3 => Loc3  вер=1 порядок=1
       текст: Charge!
       эффект: P1(Dialog) = 1
  -> Path15 => Loc6  вер=1 порядок=5
       текст: Wait, I need to ask you something else.
       эффект: P2(Text) = 2
       эффект: P1(Dialog) = 2
  -> Path22 => Loc15  вер=1 проходов<=1 порядок=7
       текст: Could you please tell me more about the data center incident?
       эффект: P2(Text) = 2

### Loc8 [обычная]
    Loc8-1: "I guess I'll have to start from the very beginning. The <clr>messengers<clrEnd> are agents sent, through the method of mental symbiosis of consciousness, into …
  -> Path16 => Loc6  вер=1 порядок=5
       текст: How can I save them?

### Loc9 [обычная]
    Loc9-1: "The contact with your consciousness was lost immediately after your mission began. We recorded and decoded your brain action currents to discover that you are …
  -> Path17 => Loc6  вер=1 порядок=5
       текст: Why did you choose this object as the communication channel?

### Loc10 [обычная]
    Loc10-1: "We have no specific instructions for you regarding that. Observe, explore, and pass information to us for further analysis whenever you can."
  -> Path18 => Loc6  вер=1 порядок=5
       текст: If I'm getting this right, you aren't giving me any recommendations on how to neutralize the Dominators' command center?

### Loc11 [обычная]
    Loc11-1: "Our possibilities are greatly limited, and we cannot expect rapid progress in this area, but there are a few things we can do to help you right now."
  -> Path19 => Loc14  вер=1 порядок=5
       текст: How, I wonder? By giving me a super-powerful ship hull?
       эффект: P3(ext_Money) = {[p3]+5000}

### Loc12 [обычная]
    Loc12-1: "Five, excluding you."
  -> Path20 => Loc6  вер=1 порядок=5
       текст: Who are they?

### Loc13 [обычная]
    Loc13-1: "I'll be honest: I'm not sure about anything. The ability to talk to you now is great progress for us. Until now, all contact with the messengers was lost soon …
  -> Path21 => Loc6  вер=1 порядок=5
       текст: You mean to say that there might be no further communication sessions?

### Loc14 [обычная]
    Loc14-1: "I appreciate your sense of humor, <Ranger>, but... Actually, it's a good idea. The thing is that after the Klissan war was over, the Coalition scientists start…
  -> Path14 => Loc6  вер=1 [всегда видна] порядок=9
       текст: That's all well and good, but you were talking about helping me somehow.

### Loc15 [обычная]
    Loc15-1: "Everything happened so rapidly: suddenly, a Maloqi data center on the planet of Dagod started sending out commands to disable the planetary computer systems. F…
  -> Path23 => Loc7  вер=1 порядок=5
       текст: I don't think so

### Loc16 [обычная]
    Loc16-1: "Oh, I see. At the moment, you are experiencing the consequences of fragmentary amnesia, one of the side effects of mental symbiosis. Listen to me. I know it's …
  -> Path29 => Loc17  вер=1 порядок=7
       текст: Hey, bro, I'm afraid you're hallucinating. Don't worry, the local doctors can handle that, and even worse. I'll go get them now...
  -> Path30 => Loc17  вер=1 порядок=3
       текст: Great story! I'll give you a quarter off the total cost of the repairs, but no more than that
  -> Path31 => Loc17  вер=1 порядок=5
       текст: Sounds a bit like science fiction. Too much like science fiction, I'd say. I'm already interested. How can you prove that you're telling the truth?

### Loc17 [обычная]
    Loc17-1: "I expected something like this. It would be best if you convinced yourself of the truth of my words. First of all, tell me: what day is it today?"
  -> Path32 => Loc18  вер=1 порядок=5
       текст: That's easy. Let me think. Today is <Date>

### Loc18 [обычная]
    Loc18-1: "Now tell me: you fought a war that ended recently. What was this war, and how did it end?"
  -> Path7 => Loc19  вер=1 порядок=5
       текст: The war with the Dominators. We defeated those mechanical beasts back in 33... Ooooh... So I really am in a virtual world?! But how did that happen?

### Loc19 [обычная]
    выбор описания: {[p2]}
    Loc19-1: "I hope you remember that during the war with the Dominators, one of the systems, Bakhar, kept changing hands. Later, we realized why the enemy protected it so …
    Loc19-2: "Alas, no. If you fling yourself off of a skyscraper, for instance, the machine will evaluate the situation and produce a set of signals similar to a real-life …
    Loc19-3: "This program was developed by us and planted in your consciousness before the start of your mission to facilitate your integration into the virtual world. Of c…
    Loc19-4: "You are studying the Dominators' command center, and it's studying you. By creating a virtual world based on your memories and giving you tasks, the machine wa…
  -> Path33 => Loc6  вер=1 порядок=3
       текст: What must I do?
       эффект: P2(Text) = 1
  -> Path34 => Loc20  вер=1 порядок=4
       текст: If this is a virtual world, does that mean I'm immortal here?
       эффект: P2(Text) = 2
  -> Path37 => Loc20  вер=1 порядок=7
       текст: Should I continue testing the program for the young rangers?
       эффект: P2(Text) = 3
  -> Path38 => Loc20  вер=1 порядок=8
       текст: How should I exist in this world, and what do the tasks given by the system governments have to do with anything?
       эффект: P2(Text) = 4

### Loc20 [пустая]
  -> Path35 => Loc19  вер=1 порядок=5

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
