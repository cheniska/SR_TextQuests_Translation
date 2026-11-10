# Квест (формат 1111111127)
Сложность 50; стартовая локация: [2]; путей по умолчанию: 0

## Параметры
- P1 'StoryNumber' [1..11] тип=обычный
    старт: [1]
    [1..11] Amazing story #<>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ShipName' [0..10] тип=обычный
    старт: [0]
    [0..0] Augustus
    [1..1] Perseus
    [2..2] Anaconda
    [3..3] Troya
    [4..4] Tacitus
    [5..5] Caesar
    [6..6] Shuttle
    [7..7] Yellow Fish
    [8..8] Hermes
    [9..9] Comet
    [10..10] Odysseus
    критическое: Сообщение достижения критического значения параметром 2
- P3 'shiptype' [0..2] тип=обычный
    старт: [0]
    [0..0] Consul
    [1..1] Starliner
    [2..2] Hauler
    критическое: Сообщение достижения критического значения параметром 3
- P4 'WarriorType' [0..1] тип=обычный
    старт: [0]
    [0..0] warship
    [1..1] flagship
    критическое: Сообщение достижения критического значения параметром 4
- P5 'WarriorRace' [1..10] тип=обычный
    старт: [1]
    [1..1] Geteoroge
    [2..2] Ekefar
    [3..3] Fighter
    [4..4] Sharakesh
    [5..5] Drakkar
    [6..6] Khaa-Monger
    [7..7] Kiofar
    [8..8] Battleship
    [9..9] Shiksa
    [10..10] Ravanger
    критическое: Сообщение достижения критического значения параметром 5
- P6 'WarriorName' [1..25] тип=обычный
    старт: [1]
    [1..1] Khaadjas
    [2..2] Boosga
    [3..3] Daalba
    [4..4] Shpaam
    [5..5] Gaal-Ra
    [6..6] Ayiltiya
    [7..7] Kilimay
    [8..8] Nimmliya
    [9..9] Yamiani
    [10..10] Falcon
    [11..11] Atlas
    [12..12] Punisher
    [13..13] Unbeatable
    [14..14] Steel
    [15..15] Excalibur
    [16..16] Cecetor
    [17..17] Rachetsish
    [18..18] Lepras
    [19..19] Tratsakish
    [20..20] Lepetseta
    [21..21] Rennarga
    [22..22] Ombargar
    [23..23] Ragnar
    [24..24] Aborrega
    [25..25] Bodbarga
    критическое: Сообщение достижения критического значения параметром 6
- P7 'ext_Money' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 7: <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'Параметр номер 8' [100000..1000000] тип=обычный
    старт: [100000..1000000]
    [100000..1000000] Параметр номер 8: <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'Бонус от пиратов' [0..2000] тип=обычный
    старт: [999..1800]
    [0..2000] Параметр номер 9: <>
    критическое: Сообщение достижения критического значения параметром 9

## Локации и переходы

### Loc1 [обычная]
    выбор описания: {[p1]}
    Loc1-1: You take a look at the control panel and realize you're in a tight situation: your supplies <clr>have run out<clrEnd>. / You rack your ranger's brains for a whi…
    Loc1-2: The intercom starts singing and quickly stops when you answer the call. A huge disgusting face appears. It barely fits on the screen. The massive caller informs…
    Loc1-3: You update your onboard computer data and are surprised to see that you don't have that many supplies left.  / You have barely had time to go from amazement to …
    Loc1-4: You find yourself in a difficult situation: you have <clr>run out<clrEnd> of supplies. / You rack your ranger's brains for a while and come to the conclusion th…
    Loc1-5: You check the data on your supplies and realize that you actually have <clr>very little<clrEnd> left. Saying "<clr>very little<clrEnd>" aloud doesn't help at al…
    Loc1-6: As you fly through the black cosmic abyss, you receive a message verified with the nanoelectronic signature of the Space Rangers Corps. /  / "Ranger <Ranger>, O…
    Loc1-7: You have barely had time to take a look at your ship's diagnostic data when you're contacted by [d6][d5]<clr>-<clrEnd>{[1..99]}<clr>-<clrEnd>, a huge [d4] patro…
    Loc1-8: Your ship's flight is unusually rocky, and it shakes and turns over several times, as if struck by something invisible.  / You've barely had time to recover and…
    Loc1-9: You update your onboard computer data and are surprised to see that you don't have that many supplies left.  / To be precise, you have <clr>none<clrEnd> left. T…
    Loc1-10: You suddenly notice a blinking light on the panel that displays the amount of your remaining resources. You double-check the stats and realize that <clr>your su…
    Loc1-11: You make sure that nobody's around and decide to figure out how to carefully ration out your remaining resources.  / You're so absorbed in your tactical plannin…
    эффект: P6(WarriorName) = {([p5]-([p4]*5))*5-4+[0..4]}
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Express deliberate surprise at how horrible all of this is
       условия: логика {[p1]=2}
  -> Path6 => Loc3  вер=1 порядок=5
       текст: Study the radar readings
       условия: логика {[p1]=1}
  -> Path9 => Loc3  вер=1 порядок=5
       текст: Burn a hole in the hatch with your blaster
       условия: логика {[p1]=4}
  -> Path11 => Loc3  вер=1 порядок=5
       текст: Attack the [d2][d3]
       условия: логика {[p1]=5}
  -> Path13 => Loc3  вер=1 порядок=5
       текст: Wait for your escort
       условия: логика {[p1]=6}
  -> Path14 => Loc3  вер=1 порядок=5
       текст: Say goodbye to the crew of the [d5][d6] and leave
       условия: логика {[p1]=7}
  -> Path16 => Loc3  вер=1 порядок=5
       текст: Say you're <Ranger>
       условия: логика {[p1]=8}
  -> Path18 => Loc3  вер=1 порядок=5
       текст: Shoot up space garbage in search of valuables
       условия: логика {[p1]=9}
  -> Path20 => Loc3  вер=1 порядок=5
       текст: Direct your ship to the unknown planet
       условия: логика {[p1]=10}
  -> Path22 => Loc3  вер=1 порядок=5
       текст: Contact the pirate leader
       условия: логика {[p1]=11}

### Loc2 [СТАРТ]
    эффект: P4(WarriorType) = {[0..1]}
    эффект: P1(StoryNumber) = {[1..11]}
    эффект: P2(ShipName) = {[0..10]}
    эффект: P3(shiptype) = {[0..2]}
  -> Path2 => Loc1  вер=1 порядок=5
       условия: логика {[p1]<>3}
       эффект: P5(WarriorRace) = {([p4]*5)+[1..5]}
  -> Path27 => Loc8  вер=1 порядок=5
       условия: логика {[p1]=3}
       эффект: P5(WarriorRace) = {([p4]*5)+[1..5]}

### Loc3 [обычная]
    выбор описания: {[p1]}
    Loc3-1: You take a quick glance at the radar and realize that a [d4] weirdly named [d5][d6]<clr>-<clrEnd>{[1..99]}<clr>-<clrEnd> has just appeared next to you. Apparent…
    Loc3-2: "What are we going to do, Mister [d6]?" you ask, finishing up your mini-performance. / "We're going to uncover shady individuals at the law enforcement agency. …
    Loc3-3: With an expression of thinly veiled disappointment, [d5]'s captain reads you your rights, which are mainly to keep quiet and make no trouble while he escorts yo…
    Loc3-4: Although spaceships are pretty sturdy, a regular handheld blaster can easily make a hole in a hull big enough for Ranger <Ranger> to get in. / Perhaps up until …
    Loc3-5: A burst of plasma leaves a bunch of dark splotches on the victim's hull, but it seems like the [d2][d3] didn't notice the hell that just rained down on it. You …
    Loc3-6: You spend {[2..4]} days waiting for your escort and start to think they've forgotten about you, but then [d5][d6]<clr>-<clrEnd>{[1..99]}<clr>-<clrEnd> appears o…
    Loc3-7: Things don't go very smoothly. You <clr>don't have enough<clrEnd> supplies to escape from your pursuer. That's no surprise since a whole [d4] is after you!  / T…
    Loc3-8: "A-ha!" the pilot cries happily, "The suspect confirmed his identity! <Ranger> is short for <clr>Monoko<clrEnd><Ranger><clr>Jahgod<clrEnd>, who we've been looki…
    Loc3-9: A bright flash of light follows. As it turns out, you're on the planet [d5][d6]<clr>-<clrEnd>{[1..99]}<clr>-<clrEnd> tugged you to. As a result of a panic attac…
    Loc3-10: You wake up in a chair that you immediately identify as <clr>not yours<clrEnd>. Your ship's interior looks entirely different. Among other suspicious things, yo…
    Loc3-11: "I have an offer for you, Ranger <Ranger>. One of my mates is locked up in the slammer. They wanna lock him up for robbing a liner named [d2][d3]. The line was …
  -> Path5 => Loc4  вер=1 порядок=5
       текст: Agree and go to prison
       условия: логика {[p1]=2}
  -> Path7 => Loc4  вер=1 порядок=5
       текст: Allow yourself to be escorted
       условия: логика {[p1]=1 or [p1]=3}
  -> Path10 => Loc4  вер=1 порядок=5
       текст: Go serve your sentence
       условия: логика {[p1]=4}
  -> Path12 => Loc4  вер=1 порядок=5
       текст: Land on the planet and stand trial
       условия: логика {[p1]=5 or [p1]=6}
  -> Path15 => Loc4  вер=1 порядок=5
       текст: Give yourself up to justice
       условия: логика {[p1]=7}
  -> Path17 => Loc4  вер=1 порядок=5
       текст: Land your ship to clear up the confusion
       условия: логика {[p1]=8}
  -> Path19 => Loc4  вер=1 порядок=5
       текст: So I'm the one who'll end up in the slammer?
       условия: логика {[p1]=9}
  -> Path21 => Loc4  вер=1 порядок=5
       текст: Accept the guilt for your unintentional genocide
       условия: логика {[p1]=10}
  -> Path24 => Loc5  вер=1 порядок=5
       текст: Can I refuse?
       условия: логика {[p1]=11}

### Loc4 [УСПЕХ]

### Loc5 [обычная]
    Loc5-1: "Sure! But expect a kiss from our torpedoes. You don't look like an idiot, so I'm sure you know we can't miss at this distance. But if you change your mind and …
  -> Path23 => Loc7  вер=1 порядок=5
       текст: Agreed. Deal!
       эффект: P7(ext_Money) = {[p7]+[p9]}
  -> Path25 => Loc6  вер=1 порядок=6
       текст: Oh, go to hell...

### Loc6 [СМЕРТЬ]
    Loc6-1: You fail to say the address in time. A salvo of torpedoes turns your ship into a huge bright sphere illuminating the dark cosmic abyss.

### Loc7 [обычная]
    Loc7-1: "The cash is yours, and here's a little something just so you don't change your mind. Alright, lads, let's haul ass!" With this, the leader shoots some kind of …
  -> Path26 => Loc4  вер=1 порядок=5
       текст: Land on the nearest planet

### Loc8 [обычная]
    Loc8-1: You update your onboard computer data and are surprised to see that you don't have that many supplies left.  / You have barely had time to go from amazement to …
    эффект: P6(WarriorName) = {([p5]-([p4]*5))*5-4+[0..4]}
  -> Path8 => Loc3  вер=1 порядок=5
       текст: Refuse to give a bribe
       условия: логика {[p1]=3}
  -> Path28 => Loc4  вер=1 [всегда видна] порядок=6
       текст: Bribe
       условия: логика {[p7]>=[p8]}

## Анализ
- стартовых: [2]
- концовки: {4: 'УСПЕХ', 6: 'СМЕРТЬ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [8, 9]
