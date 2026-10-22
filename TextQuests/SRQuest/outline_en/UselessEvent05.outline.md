# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Имя' [1..20] тип=обычный
    старт: [1..20]
    [1..1] Valery
    [2..2] Arkady
    [3..3] Onaemlak
    [4..4] Ekitarmissen
    [5..5] Ratsokkish
    [6..6] Lucky Han
    [7..7] Altikshan
    [8..8] O'Mallore
    [9..9] Johan
    [10..10] Gromkar
    [11..11] Zerogood
    [12..12] Gudareb
    [13..13] Kantebo
    [14..14] Naran
    [15..15] Kelobar
    [16..16] Raa Mathi
    [17..17] Johannes
    [18..18] Sub
    [19..19] Barogab
    [20..20] Orban
    критическое: Сообщение достижения критического значения параметром 1
- P2 'Издание' [1..10] тип=обычный
    старт: [1..10]
    [1..1] The Eipentak Komsomol
    [2..2] The Freedom Island
    [3..3] The Hercule Group
    [4..4] Tuesday++
    [5..5] The Daily Jail
    [6..6] The Skwelch Spoons
    [7..7] The Sea Goo
    [8..8] Patchrumba Kay
    [9..9] The Watchtower
    [10..10] Tape After Tape
    критическое: Сообщение достижения критического значения параметром 2
- P3 'Новость кратко' [1..10] тип=обычный
    старт: [1..10]
    [1..1] <clrEnd>unknown ships are attacking distant coalition systems<clr>
    [2..2] <clrEnd>there are 5-meter-long white roaches living under the Bolshoi Theater on planet <clr>Earth
    [3..3] <clrEnd>the Klissan lodge is preparing for a rematch<clr>
    [4..4] <clrEnd>our Galaxy will soon fall into the void<clr>
    [5..5] <clrEnd>a human research ship was destroyed by an unknown enemy<clr>
    [6..6] <clrEnd>there's high military activity in the <clr>Gralgar System
    [7..7] <clrEnd>the Galactic Council has raised excise taxes on fuel, alcohol, and cigarettes by <clr>146%
    [8..8] <clrEnd>groups of pirates are conducting attacks right at the center of the Galaxy<clr>
    [9..9] <clrEnd>the pirates want to leave the Coalition along with some inhabited worlds<clr>
    [10..10] <clrEnd>rangers nowadays are looters and extortioners<clr>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Реплика с новостью' [1..9] тип=обычный
    старт: [1..9]
    [1..1] <clrEnd>"Have you read the news? [d2] claims that [d3]! <br>The correspondents contacted the local g…
    [2..2] <clrEnd>"Something terrible has happened: [d3]... That's what [d2] claims. They say [d3]. <br>An off…
    [3..3] <clrEnd>"Trusted sources say that [d3], claims [d2]. In the chaos that followed the event, the journ…
    [4..4] <clrEnd>"The front pages of the newspapers, magazines, and Galanet news sites are all saying the sam…
    [5..5] <clrEnd>"Based on information from trusted sources, [d2] claims that [d3]. The newspaper staff addre…
    [6..6] <clrEnd>"According to unverified information [d3], claims [d2]."<clr>
    [7..7] <clrEnd>"Breaking news! [d3], informs [d2]. The information was received via a live broadcast. A cor…
    [8..8] <clrEnd>According to [d2], [d3]. Due to the sensational nature of the news, the journalists contacte…
    [9..9] <clrEnd>"Based on an analysis of open as well as closed and even secret sources, [d2] claims that [d…
    критическое: Сообщение достижения критического значения параметром 4
- P5 'Мнение' [1..3] тип=обычный
    старт: [1..3]
    [1..1] believes
    [2..2] doesn't believe
    [3..3] doesn't know
    критическое: Сообщение достижения критического значения параметром 5
- P6 'Мнение подстановка в начале' [0..15] тип=обычный
    старт: [1]
    [0..0] selling house
    [1..1] <clrEnd>I think it's true<clr>
    [2..2] <clrEnd>Something tells me [d2] isn't lying<clr>
    [3..3] <clrEnd>I've been reading this paper for a while, so I trust it<clr>
    [4..4] <clrEnd>This news is really strange, but I believe it<clr>
    [5..5] <clrEnd>I believe that's actually how things are<clr>
    [6..6] <clrEnd>"The damn journalists are scaring people again!" he explains<clr>
    [7..7] <clrEnd>That's just nonsense<clr>
    [8..8] <clrEnd>Oh, I know [d2], they'll publish any rubbish<clr>
    [9..9] <clrEnd>Seems like secret Klissan agents are trying to divert our attention from our real problems<c…
    [10..10] <clrEnd>"The whole damn government blows everything out of proportion to distract the citizens of th…
    [11..11] <clrEnd>I really don't know if it's true or not<clr>
    [12..12] <clrEnd>I don't know whether I can believe this news or not<clr>
    [13..13] <clrEnd>I'd believe it, but it's the first time I've seen this paper, so I don't know if I can trust…
    [14..14] <clrEnd>I don't know much about this kind of thing, so I can't say if it's true or not<clr>
    [15..15] <clrEnd>It's totally unclear whether I can trust this information<clr>
    критическое: Сообщение достижения критического значения параметром 6
- P7 'Состояние собеседника' [1..3] тип=обычный
    старт: [1..3]
    [1..1] excited
    [2..2] calm
    [3..3] scared
    критическое: Сообщение достижения критического значения параметром 7
- P8 'Подстановка с состоянием собеседника' [1..9] тип=обычный
    старт: [1..9]
    [1..1] <clrEnd>[d1] looks pretty [d7], judging by his appearance<clr>
    [2..2] <clrEnd>Judging by [d1]'s behavior, he's quite [d7]<clr>
    [3..3] <clrEnd>You take a careful look and decide that [d1] seems quite [d7]<clr>
    [4..4] <clrEnd>Ranger apparently looks [d7]<clr>
    [5..5] <clrEnd>Judging from your vast experience of interacting with humanoids of all races and colors, you…
    [6..6] <clrEnd>[d1] behaves openly, showing that he's [d7]<clr>
    [7..7] <clrEnd>You take one look at [d7] and realize that he's your colleague<clr>
    [8..8] <clrEnd>You take a brief glance and realize that [d1] is very [d7]<clr>
    [9..9] <clrEnd>You can clearly see that [d1] is [d7]<clr>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'Реплика о мнении игрока' [1..9] тип=обычный
    старт: [1..9]
    [1..1] <clrEnd>"And what do you think, <Ranger>?" asks [d1].<clr>
    [2..2] <clrEnd>"Do you really think that [d3]?"<clr>
    [3..3] <clrEnd>"That's how it is. What are your thoughts on this, <Ranger>?" asks [d1].<clr>
    [4..4] <clrEnd>[d1] scratches his head and asks, <br>"What do you think about this?"<clr>
    [5..5] <clrEnd>"Nice flight deck, <Ranger>," [d1] says suddenly. "Well, what do you think about the news?"<…
    [6..6] <clrEnd>"<Ranger>, what can you say about this, as an experienced ranger and a generally wise man?"<…
    [7..7] <clrEnd>"<Ranger>, what does your ranger's gut tell you? Can we trust stories like this, or is it no…
    [8..8] <clrEnd>"Do you have an opinion on this?" suddenly asks [d1].<clr>
    [9..9] <clrEnd>[d1] asks, <br>"What do you think about these headlines?"<clr>
    критическое: Сообщение достижения критического значения параметром 9
- P10 'Мнение игрока' [0..3] тип=обычный
    старт: [0]
    [0..0] Параметр номер 10: <>
    [1..1] trust
    [2..2] don't trust
    [3..3] don't know
    критическое: Сообщение достижения критического значения параметром 10
- P11 'Переключение локаций' [0..10] тип=обычный
    старт: [0]
    [0..10] Параметр номер 11: <>
    критическое: Сообщение достижения критического значения параметром 11
- P12 'официальные данные?' [1..10] тип=обычный
    старт: [1..10]
    [1..1] <clrEnd>the authorities aren't ready to confirm<clr>
    [2..2] <clrEnd>the authorities confirm<clr>
    [3..3] <clrEnd>the authorities deny<clr>
    [4..4] <clrEnd>the authorities recommend that people don't trust this information<clr>
    [5..5] <clrEnd>the authorities claim that they don't know anything about it<clr>
    [6..6] <clrEnd>the authorities recommend that everybody forgets about the event as soon as possible<clr>
    [7..7] <clrEnd>the authorities are threatening the staff of [d2]<clr>
    [8..8] <clrEnd>the authorities have promised to check on the information<clr>
    [9..9] <clrEnd>the authorities promise to deal with the situation<clr>
    [10..10] <clrEnd>the authorities recommend that everybody tends to their own affairs instead of bothering the…
    критическое: Сообщение достижения критического значения параметром 12
- P13 'Имя селебрити' [1..15] тип=обычный
    старт: [1..15]
    [1..1] Orkogrue
    [2..2] Aborag
    [3..3] Reguntag
    [4..4] Khanachish
    [5..5] Tseepishan
    [6..6] Tsotskekesh
    [7..7] Odysseus
    [8..8] Apollo
    [9..9] Diogenes
    [10..10] Fayanee
    [11..11] Watalkee
    [12..12] Elikanee
    [13..13] Arah-At
    [14..14] Roodonga
    [15..15] Persaaneya
    критическое: Сообщение достижения критического значения параметром 13
- P14 'Должность' [1..10] тип=обычный
    старт: [1..10]
    [1..1] <clrEnd>a minister<clr>
    [2..2] <clrEnd>a singer<clr>
    [3..3] <clrEnd>a songwriter<clr>
    [4..4] <clrEnd>an author<clr>
    [5..5] <clrEnd>an actor<clr>
    [6..6] <clrEnd>a civic activist<clr>
    [7..7] <clrEnd>a spaceport administrator<clr>
    [8..8] <clrEnd>a scientist<clr>
    [9..9] <clrEnd>a professor<clr>
    [10..10] <clrEnd>a presidential candidate<clr>
    критическое: Сообщение достижения критического значения параметром 14
- P15 'что заявил' [1..10] тип=обычный
    старт: [1..10]
    [1..1] <clrEnd>it's true<clr>
    [2..2] <clrEnd>it's a lie<clr>
    [3..3] <clrEnd>[d2] is blatantly lying<clr>
    [4..4] <clrEnd>[d2] journalists should be crucified<clr>
    [5..5] <clrEnd>their own sources confirm it's true<clr>
    [6..6] <clrEnd>now's not the time to let such little things distract us; society can only be saved from col…
    [7..7] <clrEnd>this is blatant propaganda from outsiders who wish to destroy the Interstellar Coalition<clr…
    [8..8] <clrEnd>everybody should mind their own business instead of writing such nonsense, let alone reading…
    [9..9] <clrEnd>he has nothing to do with it, plus nobody could prove his involvement anyway<clr>
    [10..10] <clrEnd>the ancients warned us about this, and now it's the time to repent and to study <clr>Ga-Stor…
    критическое: Сообщение достижения критического значения параметром 15
- P16 'Рандом переходов 1-7' [1..7] тип=обычный
    старт: [1..7]
    [1..7] Параметр номер 16: <>
    критическое: Сообщение достижения критического значения параметром 16
- P17 'Рандом переходов 1-5-00' [1..5] тип=обычный
    старт: [1..5]
    [1..5] Параметр номер 17: <>
    критическое: Сообщение достижения критического значения параметром 17
- P18 'Рандом переходов 1-5-01' [1..5] тип=обычный
    старт: [1..5]
    [1..5] Параметр номер 18: <>
    критическое: Сообщение достижения критического значения параметром 18
- P19 'Рандом переходов 1-5-02' [1..5] тип=обычный
    старт: [1..5]
    [1..5] Параметр номер 19: <>
    критическое: Сообщение достижения критического значения параметром 19
- P20 'Рандом переходов 1-5-03' [1..5] тип=обычный
    старт: [1..5]
    [1..5] Параметр номер 20: <>
    критическое: Сообщение достижения критического значения параметром 20
- P21 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 21: <>
    критическое: Сообщение достижения критического значения параметром 21

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[1..5]}
    Loc1-1: The chirping of the communicator intrudes into your daydreaming among the black abyss of space. You push the button to accept the call. / "Well, <Ranger>, have …
    Loc1-2: Rocking on your pilot's chair like Sherlock Holmes, you think about the messengers and where they could be. As you're deep in thought and already close to enlig…
    Loc1-3: "Hello, <Ranger>," says a voice from the flight deck. You quickly understand that it's that humanoid who is [d7]. You glance at the intercom and learn his name.…
    Loc1-4: Fate brought you and Ranger [d1] together; in fact, it slammed you together when he crashed into your ship at full speed. / After a short examination, it become…
    Loc1-5: The intercom display suddenly flashes. Ranger [d1] wants to contact you. / "[d6]."  / You can't understand anything at first and try to ask the caller about his…
    эффект: P6(Мнение подстановка в начале) = {([p5]-1)*5+[1..5]}
  -> Path12 => Loc11  вер=1 порядок=5

### Loc2 [пустая]
  -> Path5 => Loc8  вер=1 порядок=5
       условия: логика {[p10]<>[p5]}
       эффект: P11(Переключение локаций) = {[p7]-1}
       эффект: P21(ext_Luck) = {[p21]-2}
  -> Path6 => Loc6  вер=1 порядок=5
       условия: логика {[p10]=[p5]}
       эффект: P11(Переключение локаций) = {[p7]-1}
       эффект: P21(ext_Luck) = {[p21]+2}

### Loc4 [обычная]
    выбор описания: {[p11]*3+[1..3]}
    Loc4-1: "You lost your goddamn mind, ranger?! You disagree with me?! I'm [d1], not some lousy skwelch!" He's apparently displeased at your disagreement with his opinion…
    Loc4-2: "Hey, did you say on purpose that you [d10] that [d3]? Just to be different from me? You're such a narcissist, <Ranger>!" [d1] is apparently annoyed with your a…
    Loc4-3: "Did you have to do that? You listened to me and just started saying right away how wrong I am and how right you are, because you obviously [d10] what [d2] wrot…
    Loc4-4: Still feeling [d7], [d1] replies: / "So, which of us is right? Since you [d10] what the article says, but I don't. You got any ideas about the fact that [d3]? Y…
    Loc4-5: [d1] scratches his head, rubs his arms together and then replies: / "Well, if you [d10] it, then so be it. Any other ideas? Or is your mind made up about this?"
    Loc4-6: "I totally disagree, dear colleague," begins [d1], "Even though I respect your opinion and the fact that you [d10][d2]. / Do you have any other ideas about this…
    Loc4-7: "Hmm, I dont' even know why you [d10] it," says [d1]. / "Well, <Ranger>, it's up to you, even though I disagree. But I can't really argue with as great a ranger…
    Loc4-8: "Strange. I believe the opposite, but if you [d10] it... / So, you definitely [d10] it, no other ideas?"
    Loc4-9: "Yes? You [d10] that [d3]? That may be right, I don't know."
  -> Path19 => Loc11  вер=1 порядок=5

### Loc5 [обычная]
    выбор описания: {[p11]*3+[1..3]}
    Loc5-1: "Ha-ha, well, that's something! <Ranger> is a real interstellar warrior and thinks just like me!" exclaims [d1] excitedly. "Well, nice talking to you, and see y…
    Loc5-2: "I can clearly see you're one of us! Indeed, this information that [d3] is a serious business, and [d2] has written many important articles!" says [d1].
    Loc5-3: "I hope you aren't saying you [d10] that the news is true just because of my importance and my authority!" laughs [d1], "That'd be awkward." / You deny this, th…
    Loc5-4: "Exactly!" exclaims [d1], "You, <Ranger>, are a real professional, and you clearly understand what I mean and agree with me. This makes me happy! Well, I don't …
    Loc5-5: "Great, ranger! My gut tells me you're right when you say you [d10] this story by [d2]. It really sounds weird. Anyway, thanks for confirming my guess!"
    Loc5-6: "That's what I've always said!" answers [d1], "You simply [d10] the information that [d3], not even because of the facts themselves but because of how it's writ…
    Loc5-7: "R-really? Well, thank you for your answer, I now feel more confident about my opinion!" answers [d1] with timid excitement.
    Loc5-8: "Come on, seriously?" The speaker looks very surprised. "I didn't think that such a great and well-known ranger as <Ranger> would have the same opinion as me! T…
    Loc5-9: "Great! You [d10][d2], just like me! Well, now that you have supported my opinion, I'm ready to go do some great deeds!"
  -> Path25 => Loc23  вер=1 порядок=5

### Loc6 [пустая]
  -> Path7 => Loc5  вер=1 порядок=5
       условия: логика {[p10]<3}
  -> Path8 => Loc7  вер=1 порядок=5
       условия: логика {[p10]=3}

### Loc7 [обычная]
    выбор описания: {[p11]*3+[1..3]}
    Loc7-1: "Well, thank you very much, <Ranger>! So now who can tell me whether this is true or not?"
    Loc7-2: "What do you mean you don't know? You're <Ranger>, the great ranger!"
    Loc7-3: "Are you kidding me? Why did I ask you if you don't know? Maybe you're hiding what you know!"
    Loc7-4: "Too bad you have neither an opinion nor thoughts on the matter. It must be a difficult life when you can't separate the wheat from the chaff."
    Loc7-5: "Too bad. It's actually important news, and I highly recommend that you follow the news carefully in the future so that such incidents don't happen again."
    Loc7-6: "<Ranger>, it's terrible when a fully-developed adult individual can't separate truth from lies."
    Loc7-7: "What?!" cries [d1] in terror, "Even the ranger <Ranger> doesn't know if it's true or false? So, what do I do now when a ranger, a moral leader, doesn't know? D…
    Loc7-8: "Oh, that's so sad," sighs [d1], almost ready to cry. "Well, thank you for that, and I'm sorry I bothered you, <Ranger>."
    Loc7-9: [d1]'s face is completely still and expressionless, but then you notice a tear running down his cheek.  / Pulling himself together, he says: / "That's too bad, …
  -> Path14 => Loc13  вер=1 порядок=5
       текст: It's the first time I've heard that [d3].
       условия: логика {[p16]=4}
  -> Path27 => Loc13  вер=1 порядок=5
       текст: You'd better contact the source that published the news
       условия: логика {[p16]=5}
  -> Path28 => Loc13  вер=1 порядок=5
       текст: You should ask the experts on these matters
       условия: логика {[p16]=3}
  -> Path29 => Loc13  вер=1 порядок=5
       текст: Look for proof from other sources
       условия: логика {[p16]=6}
  -> Path30 => Loc13  вер=1 порядок=5
       текст: Just go there and find out everything yourself
       условия: логика {[p16]=2}
  -> Path31 => Loc13  вер=1 порядок=5
       текст: You're asking me? Really?
       условия: логика {[p16]=7}
  -> Path32 => Loc13  вер=1 порядок=5
       текст: I never really bothered finding out if [d3]
       условия: логика {[p16]=1}

### Loc8 [пустая]
  -> Path9 => Loc4  вер=1 порядок=5
       условия: логика {[p5]<3 and [p10]<3}
  -> Path10 => Loc9  вер=1 порядок=5
       условия: логика {[p5]=3}
  -> Path11 => Loc10  вер=1 порядок=5
       условия: логика {[p5]<3 and [p10]=3}

### Loc9 [обычная]
    выбор описания: {[p11]*3+[1..3]}
    Loc9-1: "You [d10] this? Even when it's [d2] telling you about it? Well, alright, but I'll find you if it turns out that you were wrong. The fact is that [d3] is not ju…
    Loc9-2: "A thousand redbelly smellies, you [d10] that [d3]?! Alright, if this turns out to be wrong, you watch yourself, <Ranger>! You know me, I'm young, hot-headed an…
    Loc9-3: "Are you sure? You really [d10] that [d3]? I'll be really disappointed if it turns out to be the other way around. And I'll let you know. You know what I mean,"…
    Loc9-4: "That's great, <Ranger>. I hope you weighed all pros and cons before saying that you [d10] that this article is true.  / I still haven't decided myself, so I'm …
    Loc9-5: "Hm, you actually [d10] this, <Ranger>? Of course, [d2] is a well-known paper. It's quite sleazy too, though you can find a couple of true headlines sometimes."
    Loc9-6: "What are you talking about, <Ranger>? [d2]'s reputation is well-known, and you [d10] that [d3]. Of course, that's your personal opinion, but I hope you really …
    Loc9-7: "Yeah, you really [d10] this headline? No kidding? Hmm, that's an interesting opinion. I might even have to listen to it. / But you really [d10] that [d3], for …
    Loc9-8: "Thanks a lot for your answer, <Ranger>! You actually [d10] that [d3]? I value your opinion on this important topic, because I don't have my own yet."
    Loc9-9: "So, you really [d10] this news, huh? Despite [d2]'s reputation?"
  -> Path20 => Loc11  вер=1 порядок=5

### Loc10 [обычная]
    выбор описания: {[p11]*3+[1..3]}
    Loc10-1: "No, no, <Ranger> I don't think you got me. I asked you specifically whether <clr>is [d2] lying or not<clrEnd>, and you're saying you '<clr>don't know<clrEnd>.'…
    Loc10-2: "<Ranger>, do you think I'm some kind of idiot? I asked you: is it true that [d3]? If I wanted a vague answer, I'd ask my onboard computer. It's really good at …
    Loc10-3: "Answer me clearly!" roars [d1], "Who made you a ranger with your '<clr>don't know<clrEnd>' nonsense, huh, <Ranger>? Tell me, do you believe it's true that [d3]…
    Loc10-4: Trying to stay calm, [d1] asks again, "<Ranger>, I want to hear a specific opinion about the news that [d3], as [d2] claims. That's why I'm asking you. I don't …
    Loc10-5: "He-he," smiles [d1], "Seriously, <Ranger>, have some respect for who you're talking to! I meet a person sometimes who [d5] the news that [d3], just like me; ot…
    Loc10-6: "Come on, <Ranger>, be a ranger! Choose a specific answer. Is it really that hard for a hardened space dog to decide if the news that [d3] is true or not?"
    Loc10-7: "What's that? The great <Ranger> doesn't know the answer to a simple question?" cries [d1] in terror, "Perhaps you want to say 'probably true' or 'probably fals…
    Loc10-8: "Come on, really, <Ranger>?" says [d1] sadly, "Even I, a simple space pilot who [d5] that [d3], even I took a side."
    Loc10-9: "Unbelievable!" cries [d1], "The great <Ranger> can't decide! What's going to happen to us?! Who's going to save our Galaxy from indecisiveness of its protector…
  -> Path13 => Loc11  вер=1 порядок=5

### Loc11 [пустая]
  -> Path2 => Loc15  вер=1 проходов<=1 порядок=5
       текст: That's crap. Who would believe that [d3]? That makes no sense.
       условия: логика {[p18]=3}
  -> Path3 => Loc17  вер=1 проходов<=1 порядок=5
       текст: I think it's true
       условия: логика {[p20]=3}
  -> Path4 => Loc16  вер=1 проходов<=1 порядок=5
       текст: I don't know
       условия: логика {[p19]=3}
  -> Path15 => Loc24  вер=1 порядок=5
       текст: Sure! Who'd think [d3]? That's nonsense!
       условия: логика {[p10]=2 and [p17]=3}
  -> Path21 => Loc25  вер=1 порядок=5
       текст: Of course it's true! It's only logical that [d3].
       условия: логика {[p10]=1 and [p17]=3}
  -> Path22 => Loc22  вер=1 порядок=7
       текст: Cut off communications
       условия: логика {[p10]=0}
  -> Path43 => Loc24  вер=1 порядок=5
       текст: Just imagine this headline: "[d3]." Makes no sense
       условия: логика {[p10]=2 and [p17]=4}
  -> Path46 => Loc24  вер=1 порядок=5
       текст: Listen, I've seen a lot, and that's why I <clr>don't believe it<clrEnd>
       условия: логика {[p10]=2 and [p17]=2}
  -> Path47 => Loc24  вер=1 порядок=5
       текст: Even a child wouldn't believe this
       условия: логика {[p10]=2 and [p17]=5}
  -> Path48 => Loc24  вер=1 порядок=5
       текст: This is definitely a hoax, and [d2] is just a sleazy tabloid paper
       условия: логика {[p10]=2 and [p17]=1}
  -> Path49 => Loc25  вер=1 порядок=5
       текст: There's certainly no doubt that [d3]
       условия: логика {[p10]=1 and [p17]=5}
  -> Path50 => Loc25  вер=1 порядок=5
       текст: Yes, I'm sure it's true
       условия: логика {[p10]=1 and [p17]=2}
  -> Path51 => Loc25  вер=1 порядок=5
       текст: My decades of ranger experience tell me this information is true
       условия: логика {[p10]=1 and [p17]=4}
  -> Path52 => Loc25  вер=1 порядок=5
       текст: I may be wrong sometimes, but not this time! I'm sure it's <clr>true<clrEnd>
       условия: логика {[p10]=1 and [p17]=1}
  -> Path53 => Loc17  вер=1 проходов<=1 порядок=5
       текст: A serious source like [d2] wouldn't lie
       условия: логика {[p20]=4}
  -> Path54 => Loc17  вер=1 проходов<=1 порядок=5
       текст: Sounds very probable - it must be true
       условия: логика {[p20]=2}
  -> Path55 => Loc17  вер=1 проходов<=1 порядок=5
       текст: Yes, I heard about that somewhere, it's true
       условия: логика {[p20]=5}
  -> Path56 => Loc17  вер=1 проходов<=1 порядок=5
       текст: That's absolutely true. No exaggeration!
       условия: логика {[p20]=1}
  -> Path57 => Loc16  вер=1 проходов<=1 порядок=5
       текст: How should I know?
       условия: логика {[p19]=4}
  -> Path58 => Loc16  вер=1 проходов<=1 порядок=5
       текст: I have no idea - I'm no expert in this area
       условия: логика {[p19]=2}
  -> Path59 => Loc16  вер=1 проходов<=1 порядок=5
       текст: It's the first time I've heard of it
       условия: логика {[p19]=5}
  -> Path60 => Loc16  вер=1 проходов<=1 порядок=5
       текст: I have no idea if it's true or not
       условия: логика {[p19]=1}
  -> Path61 => Loc15  вер=1 проходов<=1 порядок=5
       текст: People publish all kinds of crap nowadays! Of course it's all <clr>lies<clrEnd>
       условия: логика {[p18]=4}
  -> Path62 => Loc15  вер=1 проходов<=1 порядок=5
       текст: I wouldn't believe it even if I saw it myself
       условия: логика {[p18]=2}
  -> Path63 => Loc15  вер=1 проходов<=1 порядок=5
       текст: I don't really trust what sources like [d2] say
       условия: логика {[p18]=5}
  -> Path64 => Loc15  вер=1 проходов<=1 порядок=5
       текст: Trust my personal experience: it's all crap and provocation
       условия: логика {[p18]=1}

### Loc13 [УСПЕХ]
    выбор описания: {[1..5]}
    Loc13-1: "Well, okay, that'll have to do," mumbles [d1] and ends the call.
    Loc13-2: "<Ranger>, sorry for wasting your time, but I gotta go. Good luck!" finishes [d1].
    Loc13-3: "I'm really, really sorry that I can't find out whether it's true that [d3]. Thanks for nothing. I'll go ask somebody else," says [d1] and ends the transmission…
    Loc13-4: "Seems like it's true what they say: not all rangers are prodigies," says [d1] somewhat sadly, "Well, as the folks used to say in my home settlement, so long, a…
    Loc13-5: "Is everybody on board here? It's like everybody's trying to lead me on. I'm glad I still have my money. I should leave before anything happens. Good luck and g…

### Loc15 [пустая]
    эффект: P10(Мнение игрока) = 2
  -> Path16 => Loc2  вер=1 порядок=5

### Loc16 [пустая]
    эффект: P10(Мнение игрока) = 3
  -> Path17 => Loc2  вер=1 порядок=5

### Loc17 [пустая]
    эффект: P10(Мнение игрока) = 1
  -> Path18 => Loc2  вер=1 порядок=5

### Loc18 [УСПЕХ]
    выбор описания: {[p11]*3+[1..3]}
    Loc18-1: "You're so insistent! I can clearly see you're a real space ranger! Three hundred years ago, it was guys like you who kicked those Klissan asses!" [d1] is appar…
    Loc18-2: "Well, if you [d10] this news, that's how it is. Don't think I'm just trying to copy you! No way!" / [d1] looks at the dashboard. "It's time. Enough talk, time …
    Loc18-3: "Well, okay, if you [d10] what they write, I have nothing to talk to you about!" Apparently [d1] isn't happy about your answer. / "<clr>Addivelerci<clrEnd>, as …
    Loc18-4: "You really seem sure about this, <Ranger>," says [d1] in reply to your statement, "Looks like you really trust [d2] that [d3]. I'll keep that in mind, thanks,"…
    Loc18-5: "You [d10] this? That's exactly what I needed! Thanks for your opinion. I'll remember it and when I see you again I'll tell you if you were right. Bye!"
    Loc18-6: "You actually [d10][d2]'s claims that [d3]? I had a better opinion of you, <Ranger>," says [d1] and terminates the transmission without saying goodbye. Pilots t…
    Loc18-7: "Alright, <Ranger>, you convinced me," says [d1], "If you say you [d10] the news, then that's how it is. I hope you're right about this."  / "Me too," you reply…
    Loc18-8: "Well, if you [d10] this, it must be so, right?" asks [d1] timidly. "Can I say that you told me that, if anybody asks?"  / You agree, and the caller disconnects…
    Loc18-9: "Well, you really [d10] this, and I don't doubt your opinion, <Ranger>!" answered [d1]. He praises you for a while after that, but soon you grow tired and finis…

### Loc19 [УСПЕХ]

### Loc20 [обычная]
    выбор описания: {[1..9]}
    Loc20-1: "I bet my ranger friend {[1000..5000]} cr. that you [d10][d3]. / And I won, thanks to you! See you!"
    Loc20-2: "Oh, Ranger <Ranger> is well-known in the inhabited arm of the Galaxy. It was very interesting to meet you and learn your opinion on this matter. I found out ev…
    Loc20-3: "The fact that [d3] is important news to me," says [d1], his face darkening, "And it was very important for me to know the opinion of an experienced ranger like…
    Loc20-4: "Yes, it's another one of my works," replies [d1], "I was hired by [d2] to conduct a poll among the citizens and find out how much they trust the paper. By the …
    Loc20-5: "I was bored, you see, so I decided to have a chat with another living soul," he explains rather shyly, "And then I thought of this interesting topic!"
    Loc20-6: "Got bored, so I popped on the Galanet to look at <clr>cats<clrEnd> — you know, earth animals, all covered in feathers and on two legs. They also quack, but you…
    Loc20-7: "See, I just wanted to talk to an experienced pilot but couldn't think of anything except discussing the latest news," explains [d1], slightly embarrassed.
    Loc20-8: "There's a funny story here, you see!" starts [d1], "Among my friends I'm the only one who [d5] that [d3]. Nobody agrees with me. I was starting to think I was …
    Loc20-9: "The [d2] people seem like shady folk, so that's why I wanted to ask an experienced ranger like you if I should trust them," says [d1] immediately, "The informa…
  -> Path26 => Loc23  вер=1 порядок=5

### Loc22 [УСПЕХ]
    выбор описания: {[1..3]}
    Loc22-1: "Sorry, [d1], I can't hear you very well, could you repeat that?" you say and then start loudly crumpling up a piece of vacuum packing that's lying around. / "I…
    Loc22-2: "Oh, [d1], it's kind of a bad time!" you exclaim with feigned concern, "I'm almost out of power, so I may be signed off any moment now! Please, tell the folks o…
    Loc22-3: "You know, [d1], I really don't have time to talk now. I have to save the Galaxy," you say and sign off.

### Loc23 [пустая]
  -> Path23 => Loc20  вер=1 проходов<=1 порядок=5
       текст: Why did you ask then?
       условия: логика {[p17]=3}
  -> Path24 => Loc19  вер=1 порядок=9
       текст: End conversation
       условия: логика {[p16]=4}
  -> Path33 => Loc19  вер=1 порядок=5
       текст: End the comm session
       условия: логика {[p16]=3}
  -> Path34 => Loc19  вер=1 порядок=8
       текст: Finish conversation
       условия: логика {[p16]=5}
  -> Path35 => Loc19  вер=1 порядок=9
       текст: Over and out
       условия: логика {[p16]=2}
  -> Path36 => Loc19  вер=1 порядок=9
       текст: Start searching for the messengers
       условия: логика {[p16]=6}
  -> Path37 => Loc19  вер=1 порядок=9
       текст: End the call
       условия: логика {[p16]=1}
  -> Path38 => Loc19  вер=1 порядок=9
       текст: Finish talking
       условия: логика {[p16]=7}
  -> Path39 => Loc20  вер=1 проходов<=1 порядок=5
       текст: What was the point of this whole conversation?
       условия: логика {[p17]=2}
  -> Path40 => Loc20  вер=1 проходов<=1 порядок=5
       текст: Why did you ask me then?
       условия: логика {[p17]=4}
  -> Path41 => Loc20  вер=1 проходов<=1 порядок=5
       текст: Why do you want to know my opinion on this?
       условия: логика {[p17]=1}
  -> Path42 => Loc20  вер=1 проходов<=1 порядок=5
       текст: What was the point of asking me?
       условия: логика {[p17]=5}

### Loc24 [пустая]
  -> Path44 => Loc18  вер=1 порядок=5

### Loc25 [пустая]
  -> Path45 => Loc18  вер=1 порядок=5

## Анализ
- стартовых: [1]
- концовки: {13: 'УСПЕХ', 18: 'УСПЕХ', 19: 'УСПЕХ', 22: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [1, 2, 3, 4, 5, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 20]
