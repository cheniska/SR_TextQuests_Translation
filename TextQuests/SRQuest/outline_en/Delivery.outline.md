# Квест (формат 1111111127)
Комментарий: За предмет и двор - стреляю в упор. / А так-то косяки после корректуры остались, внезапно.
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Delivery' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] ext_Delivery <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_DeliveryPayment' [0..9999999] тип=обычный
    старт: [0]
    [0..9999999] ext_DeliveryPayment <>
    критическое: Сообщение достижения критического значения параметром 6
- P3 'ext_Money' [0..99999999] тип=обычный
    старт: [0]
    [0..99999999] ext_Money <>
    критическое: Сообщение достижения критического значения параметром 8
- P4 'ext_Fuel' [0..1000] тип=обычный
    старт: [0]
    [0..1000] ext_Fuel <>
    критическое: Сообщение достижения критического значения параметром 12
- P5 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] ext_Luck <>
    критическое: Сообщение достижения критического значения параметром 11
- P6 'Сценарий-Номер' [0..8] тип=обычный
    старт: [0]
    [0..0] Pirates have attacked
    [1..1] can't make it myself
    [2..2] major, for the good of the Coalition
    [3..3] derogatory information on a holocrystal
    [4..4] exhibition of household items: the museum ship broke down
    [5..5] give the package to my in-law
    [6..6] forgotten item
    [7..7] smuggled goods
    [8..8] extremely valuable cargo
    критическое: Сообщение достижения критического значения параметром 15
- P7 'Сценарий-Первая подстановка' [0..26] тип=обычный
    старт: [24]
    [0..0] "<clrEnd>- <Ranger>, hurry! Pirates are on my tail. I've got to get rid of my cargo – it's a [d12]. …
    [1..1] "<clrEnd>Ranger <Ranger>, I'm [d8]! Can you hear me?" You answer affirmatively. "<br>At last, someon…
    [2..2] <clrEnd>"What took you so long, <Ranger>? I almost got blown out of the sky waiting for your reply."…
    [3..3] "<clrEnd>Greetings, <Ranger>!" A deep voice fills your ship. "<br>I'm Ranger [d8], and I have a requ…
    [4..4] "<clrEnd><Ranger>, I'm so glad to have run into you! Will you help me? I've taken way more tasks tha…
    [5..5] "<clrEnd><Ranger>, I finally found you! You're pretty hard to catch," says [d8], shouting cheerfully…
    [6..6] "<clrEnd><Ranger>, you are greatly privileged to play your part in our victory over the aggressor!" …
    [7..7] "<clrEnd>Stand up when you're talking to one of your superiors, Ranger. Superiors such as myself!" […
    [8..8] "<clrEnd><Ranger>, my regards," says [d8], tilting his head. "I represent the headquarters of the In…
    [9..9] "<clrEnd><Ranger>, I'm so lucky to have run into you! I've been looking for you everywhere, and here…
    [10..10] <clrEnd>"Glory be to all the gods and their prophets," clacks [d8].<br>"I have little time, so liste…
    [11..11] <clrEnd>"At last, I'm in luck!" [d8] spits out. "<Ranger>, our time is short: a whole fleet is after…
    [12..12] <clrEnd>"Aha, Ranger <Ranger>, outstanding!" A sleepy face appears in the intercom window. <br>"Want…
    [13..13] <clrEnd>"At last, Ranger." The face that you identify as [d8] appears in the communicator window.<br…
    [14..14] <clrEnd>"Wandering aimlessly through space again, huh, <Ranger>?" [d8] sounds rather annoyed. <br>"W…
    [15..15] <clrEnd>"Who do we have here? <Ranger> has honored our neck of the woods!" [d8] sounds amazed by you…
    [16..16] <clrEnd>"What's up, <Ranger>?" croaks [d8]'s voice in the communicator . <br>"I'm doing fine, too. I…
    [17..17] <clrEnd>"Greetings, <Ranger>, good to see you. Renowned humanoids such as yourself don't visit our <…
    [18..18] <clrEnd>"Aha, you finally answered," a voice says from the speakers.<br>"I was starting to think you…
    [19..19] <clrEnd>"Ranger! <Ranger>, coffee, tea, or a secret mission? Hey, don't be so startled. You do remem…
    [20..20] <clrEnd>"Greetings, <Ranger>. Are you heading to <DeliveryToStar> by any chance? When are you planni…
    [21..21] <clrEnd>"Greetings, Ranger. You have a tantalizing prospect: earn [p2] cr. with hardly any effort. W…
    [22..22] <clrEnd>"I'm so happy to talk to you, <Ranger>! I'm a big fan of yours! But I need help. Nah, I'm no…
    [23..23] <clrEnd>"Great, <Ranger>, I've been looking for you. I hope your famous luck and your skills smuggli…
    [24..24] <clrEnd>"May the power of the Stars abide with you," the caller proclaims. "<br> - <Ranger>, here's …
    [25..25] "<clrEnd>Salutations, ranger!" A voice calls from the speakers. Looks like [d8] is used to starting …
    [26..26] <clrEnd>"I'm so fortunate to have run into you, <Ranger>. I could really use your help." Just the ot…
    критическое: Сообщение достижения критического значения параметром 16
- P8 'имя отправителя' [0..9] тип=обычный
    старт: [0]
    [0..0] Onnoreich
    [1..1] Alicius
    [2..2] Fannyan
    [3..3] Lama Ani
    [4..4] Rtaatok
    [5..5] Urbagan
    [6..6] Quadrinaros
    [7..7] Cedila
    [8..8] Hendrich
    [9..9] Patrick
    критическое: Сообщение достижения критического значения параметром 14
- P9 'роль получателя' [0..9] тип=обычный
    старт: [0]
    [0..0] uncle
    [1..1] spiritual guide
    [2..2] brother
    [3..3] friend
    [4..4] colleague
    [5..5] comrade
    [6..6] grandpa
    [7..7] agent
    [8..8] old acquaintance
    [9..9] sworn brother
    критическое: Сообщение достижения критического значения параметром 3
- P10 'имя получателя' [0..9] тип=обычный
    старт: [5]
    [0..0] Liao Bao
    [1..1] Rybbon
    [2..2] Azichak
    [3..3] Nihao
    [4..4] Ammarack
    [5..5] Valentine
    [6..6] Tautvan
    [7..7] Alimatsan
    [8..8] Wrion
    [9..9] Azorinal
    критическое: Сообщение достижения критического значения параметром 2
- P11 'подстановка об отправке' [0..9] тип=обычный
    старт: [0..9]
    [0..0] <clrEnd>- said [d8].<clr>
    [1..1] <clrEnd>[d8] nods to emphasize his serious attitude about the matter and logs off.<clr>
    [2..2] "<clrEnd>," your conversation partner informs you absently.<clr>
    [3..3] "<clrEnd>," [d8] said with a fatigued air, looking at you. Obviously, it is up to you to close this …
    [4..4] "<clrEnd>," declares [d8] as he looks at the control panel of his ship.<clr>
    [5..5] <clrEnd>From his voice, it is obvious that [d8] is extremely worried about the [d12].<clr>
    [6..6] <clrEnd>[d8] salutes you and logs off.<clr>
    [7..7] <clrEnd>The caller practically growls through his clenched teeth.<clr>
    [8..8] <clrEnd>[d8] drawls haughtily, examining you closely.<clr>
    [9..9] <clrEnd>[d8] declares and ends the call.<clr>
    критическое: Сообщение достижения критического значения параметром 4
- P12 'предмет' [10..44] тип=обычный
    старт: [10]
    [10..10] cardboard box
    [11..11] leather suitcase
    [12..12] suede backpack
    [13..13] ruler's statue
    [14..14] bust of a revolutionary
    [15..15] crate of cigars
    [16..16] toy vacuum cleaner
    [17..17] left boot
    [18..18] cluster safe
    [19..19] kettle
    [20..20] plasma torch
    [21..21] jetpack
    [22..22] sack of nuts
    [23..23] quantum computer
    [24..24] beetle keychain
    [25..25] mithril signet
    [26..26] beeborat
    [27..27] carnelian medallion
    [28..28] pouch of powder
    [29..29] syringe of blue liquid
    [30..30] lichy fruit
    [31..31] crate of papers
    [32..32] programmer
    [33..33] tube case of designs
    [34..34] chest
    [35..35] tin drum
    [36..36] membrane compressor
    [37..37] crab carapace
    [38..38] fuel tank
    [39..39] fresh clover
    [40..40] fuel cylinder
    [41..41] mechanoid prototype
    [42..42] repair kit
    [43..43] ancient holocrystal
    [44..44] nanomachines container
    критическое: Сообщение достижения критического значения параметром 5
- P13 'описание предмета' [10..44] тип=обычный
    старт: [10]
    [10..10] <clrEnd>made of cardboard and wrapped in electrical tape<clr>
    [11..11] <clrEnd>a typical container for transporting important papers<clr>
    [12..12] <clrEnd>looks like an ordinary backpack covered with expensive material<clr>
    [13..13] <clrEnd>he looks like a shaven-headed humanoid, his outstretched hand clutches a cap<clr>
    [14..14] <clrEnd>his crude features look as if they have been carved with an axe<clr>
    [15..15] <clrEnd>contains electronic smoking devices<clr>
    [16..16] <clrEnd>looks like an ordinary Earth-made dust removal appliance<clr>
    [17..17] <clrEnd>its appearance tells a sad life story of some leather footwear<clr>
    [18..18] <clrEnd>the most perfect device for storing something extremely valuable<clr>
    [19..19] <clrEnd>pretty bruised, with a few rusty stains<clr>
    [20..20] <clrEnd>consists of a plasma emitter and a handle<clr>
    [21..21] <clrEnd>an ordinary backpack with extraordinary flying capacity<clr>
    [22..22] <clrEnd>an ordinary sack filled with one ordinary walnut that had great difficulty fitting into the …
    [23..23] <clrEnd>made of cheap plastic and looks like a piece of paper-mache<clr>
    [24..24] <clrEnd>glows in the light, letting the viewer examine the beetle caught in the amber from any angle…
    [25..25] <clrEnd>consists of a thin steel ring and a huge purple stone<clr>
    [26..26] <clrEnd>a strange-looking creature; legend says it came from the Chain of Worlds<clr>
    [27..27] <clrEnd>its appearance clearly demonstrates its superiority over other jewelry of this type<clr>
    [28..28] <clrEnd>contains a white substance protected with cellophane wrapping<clr>
    [29..29] <clrEnd>a cylindrical object with a needle, with luminescent blue liquid splashing around inside<clr…
    [30..30] <clrEnd>looks just like ordinary fruit<clr>
    [31..31] <clrEnd>contains some folders and papers<clr>
    [32..32] <clrEnd>consists of a screen and a processing unit, with wires sticking out of it<clr>
    [33..33] <clrEnd>contains drafts and designs on paper or an equivalent medium<clr>
    [34..34] <clrEnd>its whole appearance creates the impression that its contents possess ultimate luxury and sa…
    [35..35] <clrEnd>looks like a shining cylinder<clr>
    [36..36] <clrEnd>looks like a device for creating high pressure<clr>
    [37..37] <clrEnd>looks like the shell of a giant Earthian crustacean<clr>
    [38..38] <clrEnd>looks like a huge oiled barrel<clr>
    [39..39] <clrEnd>consists of <clr>six<clrEnd> petals<clr>
    [40..40] <clrEnd>looks like a container divided into six soft segments, with the word "<clr>fuel<clrEnd>" scr…
    [41..41] <clrEnd>looks like a non-typical space drone<clr>
    [42..42] <clrEnd>a standard equipment kit for fixing malfunctions<clr>
    [43..43] <clrEnd>a purple crystal-shaped object<clr>
    [44..44] <clrEnd>looks like a nanorobot docking cradle<clr>
    критическое: Сообщение достижения критического значения параметром 13
- P14 'Подстановка о сроках' [0..9] тип=обычный
    старт: [0..9]
    [0..0] <clrEnd>This has to be done fast: the delivery must not take longer than [p36] days.<clr>
    [1..1] <clrEnd>On one condition: you need to get the cargo to the addressee in no more than [p36] days.<clr…
    [2..2] <clrEnd>You need to give this [d12] with signature confirmation to a certain [d10] in no later than …
    [3..3] <clrEnd>You must make it within [p36] days.<clr>
    [4..4] <clrEnd>The delivery must be completed in no more than [p36] days.<clr>
    [5..5] <clrEnd>The time of delivery is limited: [p36] days – and not a day later!<clr>
    [6..6] <clrEnd>The delivery time is very important: you have no more than [p36] days.<clr>
    [7..7] <clrEnd>Important notice: the [d12] must make it to the addressee in no more than [p36] days.<clr>
    [8..8] <clrEnd>[p36] days should be enough for delivery.<clr>
    [9..9] <clrEnd>The cargo must be delivered in no more than [p36] days.<clr>
    критическое: Сообщение достижения критического значения параметром 17
- P15 'Бонус0' [0..10000] тип=обычный
    старт: [0]
    [0..10000] Bonus <>
    критическое: Сообщение достижения критического значения параметром 7
- P16 'Подстановка - берешься?' [0..9] тип=обычный
    старт: [0..9]
    [0..0] <clrEnd>Well, will you do this delivery?<clr>
    [1..1] <clrEnd>Will Ranger <Ranger> agree to do the job?<clr>
    [2..2] <clrEnd>Come on, <Ranger>, say yes! Where else will you find a way to earn [p2] cr. in just [p36] da…
    [3..3] <clrEnd>Ranger, you can be certain that there are other candidates willing to make a little cash on …
    [4..4] "<clrEnd>Ready to take the [d12] and venture on a dangerous journey? Or maybe you're too scared?" [d…
    [5..5] <clrEnd>You need to decide right now whether you're fine with these terms or not.<clr>
    [6..6] <clrEnd>Come on, make up your mind, <Ranger> – we're wasting time.<clr>
    [7..7] <clrEnd>Come on, make up your mind.<clr>
    [8..8] <clrEnd>Well, are you ready to deliver the [d12] to <DeliveryToStar> within [p36] days or not?<clr>
    [9..9] <clrEnd>Make up your mind, <Ranger>. My time is limited, and so is yours.<clr>
    критическое: Сообщение достижения критического значения параметром 18
- P17 'Доставка\\приветствие' [0..9] тип=обычный
    старт: [0..9]
    [0..0] "<clrEnd><Ranger>, finally, I was beginning to get worried!" says [d10], swallowing a handful of pil…
    [1..1] "<clrEnd>Oh, <Ranger>, you're a sight for sore eyes. I've been waiting for a chance to see you for s…
    [2..2] "<clrEnd>Ah, finally, you're here. What's up with <DeliveryFromStar>?" asks [d10]. You briefly expla…
    [3..3] "<clrEnd>Why did it take you so long to accept the call?" [d10]'s voice carries a hint of annoyance,…
    [4..4] "<clrEnd>You're just in time, Ranger." [d10] sounds very serious, ready to hold you accountable shou…
    [5..5] "<clrEnd>The joyful news is making us sing for you, Ranger <Ranger>!" [d10] sounds really <clr>excit…
    [6..6] "<clrEnd>You have arrived on time, <Ranger>," [d10] informs you, consulting a tiny calendar.<clr>
    [7..7] "<clrEnd>Finally! And I was about to believe that you have perished in the depths of space," [d10] s…
    [8..8] "<clrEnd>Ranger, you are {30} days late! Get out of here!," [d10] yells. <br>Flabbergasted, you chec…
    [9..9] "<clrEnd>Excellent, <Ranger>, I was getting tired of waiting for you," the red-cheeked [d10] replies…
    критическое: Сообщение достижения критического значения параметром 19
- P18 'Ну что, привез?' [0..9] тип=обычный
    старт: [0..9]
    [0..0] <clrEnd>Well, have you brought the [d12]?<clr>
    [1..1] <clrEnd>Have you kept the [d12] intact?<clr>
    [2..2] <clrEnd><Ranger>, I hope you haven't dumped the [d12] along the way.<clr>
    [3..3] <clrEnd>Have you brought my [d12]?<clr>
    [4..4] <clrEnd>Well, have you brought the [d12], <Ranger>?<clr>
    [5..5] <clrEnd>Have you brought my [d12]?<clr>
    [6..6] <clrEnd>I hope you haven't sold my [d12] along the way, heh.<clr>
    [7..7] <clrEnd>Is the [d12] still intact after all your maneuvers?<clr>
    [8..8] <clrEnd>I hope you've brought the [d12]?<clr>
    [9..9] <clrEnd>[d8] was supposed to send the [d12]. You brought it, right? <clr>
    критическое: Сообщение достижения критического значения параметром 20
- P19 'Сценарий-награда' [0..26] тип=обычный
    старт: [1]
    [0..0] <clrEnd>[d18] I hope you're not being tailed. Because, you know, all sorts of things happen: <clr>ad…
    [1..1] <clrEnd>These blasted interstellar flights, damn them! When will they finally learn to dig tunnels i…
    [2..2] "<clrEnd>Please forgive me for all the confusion, there's just too much to do, and, to top it all of…
    [3..3] <clrEnd>It's amazing how you rangers can work as a team, ready to help each other out at any moment …
    [4..4] <clrEnd>"It's too bad that [d8] couldn't come, I really wanted to talk to him." [d10] seems rather d…
    [5..5] <clrEnd>"Well, <Ranger>, I'm glad you foud the time to bring me this [d12], unlike the infamous gent…
    [6..6] <clrEnd>"<Ranger>, it's too bad you decided to become a ranger, not a military man: your punctuality…
    [7..7] <clrEnd>"[d18] All right, everything is just like [d8] said. Perhaps, you'd like to be of more use t…
    [8..8] <clrEnd>"You were clearly told that the [d12] must be delivered on time. [d18] Ah, all right, then. …
    [9..9] <clrEnd>"[d18] That is good news. Too bad [d8] did not survive to hear it. Yes, [d8] stayed in the <…
    [10..10] <clrEnd>"We got the good news, <Ranger>. [d8] informed that you were bringing the [d12]. [d8] himsel…
    [11..11] <clrEnd>"Come on, <Ranger>. [d18][d8] will be happy to hear this! Of course [d8] managed to escape f…
    [12..12] <clrEnd>"Great job, <Ranger>! I don't believe we need to explain why this [d12] is so important to u…
    [13..13] <clrEnd>"Your contribution to history is commendable, Ranger. [d18] You're just on schedule: we stil…
    [14..14] <clrEnd>"Ah, <Ranger>, at last! [d18] You doubtless understand how important this relic is for us. I…
    [15..15] "<clrEnd>Oh brother, that [d8] guy keeps trying to tell everyone how to live their lives," the man s…
    [16..16] <clrEnd>"Remarkable! <Ranger>, finally, the cargo is here. It's no ordinary [d12], there's quite a s…
    [17..17] <clrEnd>"I've been waiting for you, <Ranger>! [d18] Outstanding. How is [d8] doing? Still building t…
    [18..18] <clrEnd>"[d18] Excellent! You should know that I'm having certain doubts concerning my forgetfulness…
    [19..19] <clrEnd>"Thanks, <Ranger>, for arriving so soon. [d18] This forgetfulness will be the end of me one …
    [20..20] <clrEnd>"<Ranger>, it's remarkable that you managed to get here from <DeliveryFromStar> on time. [d1…
    [21..21] <clrEnd>"[d18]So, through some superhuman effort, you managed to protect the valuable cargo from the…
    [22..22] <clrEnd>"Well, <Ranger>, aren't you a sly piece of work! [d18] Outstanding! I'm amazed at your skill…
    [23..23] <clrEnd>"<Ranger>, you're really as good as they say. [d18] Not everyone is able to smuggle a [d12] …
    [24..24] <clrEnd>"[d18] The value of this [d12] is truly great, <Ranger>. To be more specific, it's priceless…
    [25..25] <clrEnd>"If I had a hat, I'd take it off to you, <Ranger>. None of the couriers could agree to deliv…
    [26..26] <clrEnd>"Now that took some skill, <Ranger>, covering the distance from <DeliveryFromStar> in such a…
    критическое: Сообщение достижения критического значения параметром 21
- P20 'Осмотр груза' [0..9] тип=обычный
    старт: [0..9]
    [0..0] <clrEnd>You say yes, accept the coordinates the man gives you, point the teleporter ray at the [d12]…
    [1..1] <clrEnd>You nod, point the teleporter ray at the cargo, and run your fingers over the control panel.…
    [2..2] <clrEnd>Stretching lazily, you request the coordinates of where [d10] wants his cargo, and teleport …
    [3..3] <clrEnd>Anticipating your payment of [p2] cr., you teleport the [d12] to the coordinates received fr…
    [4..4] <clrEnd>Looking prim and professional, you slowly and solemnly begin transporting the cargo to the a…
    [5..5] <clrEnd>You follow the instructions and teleport the cargo to the addressee. After inspecting the go…
    [6..6] <clrEnd>You teleport the [d12]. The recipient examines the cargo and, with an air of satisfaction, t…
    [7..7] <clrEnd>[d10] asks you to teleport the [d12], which you do. The recipient disappears from the commun…
    [8..8] <clrEnd>You teleport the cargo to the addressee and wait for him to check if it's intact. For quite …
    [9..9] <clrEnd>You re-read the teleporter manual just in case and send the [d12] to the addressee. He claim…
    критическое: Сообщение достижения критического значения параметром 22
- P21 'Оплата' [0..9] тип=обычный
    старт: [0..9]
    [0..0] <clrEnd>[d10] runs his fingers over this terminal, transferring [p2] cr. to your account.<clr>
    [1..1] <clrEnd>"Yes, everything is fine, here's your {[p2]/2} cr.," says [d10] and quickly runs his fingers…
    [2..2] <clrEnd>After a short pause, [d10] starts mumbling something under his nose. Ten minutes later, the …
    [3..3] <clrEnd>Still throwing sideways glances at the [d12], [d10] transfers the [p2] cr. to your account -…
    [4..4] <clrEnd>[d10] offers you a payment in kind, then suggests you trade the [d12] for another item, but …
    [5..5] <clrEnd>Still looking confused, [d10] says that the [p2] cr. have been transfered to your account. Y…
    [6..6] <clrEnd>[d10] says that he would like to pay you, and does it promptly. [p2] cr. have been transferr…
    [7..7] <clrEnd>[d10] asks for an account number to transfer your payment to. A few seconds after your reply…
    [8..8] <clrEnd>"[p2] cr. for the delivery, is that right?" [d10] asks. You nod. A few seconds later, you ge…
    [9..9] <clrEnd>[d10] begins to run his fingers over the terminal, then suddenly stops. You don't immediatel…
    критическое: Сообщение достижения критического значения параметром 23
- P22 'Прощание\\доп. опции' [0..9] тип=обычный
    старт: [0..7]
    [0..0] <clrEnd>"Everything's great, <Ranger>, thanks for your work!" says [d10].<clr>
    [1..1] <clrEnd>"It's a pleasure working with professionals, <Ranger>!" [d10] says his pompous goodbyes.<clr…
    [2..2] <clrEnd>"That's all I need from you, Ranger, now beat it!" [d10] says in his ever polite and elegant…
    [3..3] <clrEnd>"Good luck in all your endeavors, <Ranger>! I'll be seeing you!" says [d10], waving at you.<…
    [4..4] <clrEnd>"<Ranger>, thanks for your work - you did well. I'll get in touch with you if I ever need to…
    [5..5] <clrEnd>"Wait, <Ranger>, do you want to earn [p15] more cr.? As you can see, this [d12] is packed ti…
    [6..6] <clrEnd>"Ah, one more thing: as you can see, <Ranger>, this [d12] is packed in a cellophane cocoon. …
    [7..7] <clrEnd>"What's the code, <Ranger>? What do you mean, you don't know? [d12] is packed in a solid con…
    [8..8] Параметр номер 22: <>
    [9..9] Параметр номер 22: <>
    критическое: Сообщение достижения критического значения параметром 24
- P23 'tmp01' [0..100000] тип=обычный
    старт: [0]
    [0..100000] tmp01 <>
    критическое: Сообщение достижения критического значения параметром 9
- P24 'tmp02' [0..100000] тип=обычный
    старт: [0]
    [0..100000] tmp02 <>
    критическое: Сообщение достижения критического значения параметром 10
- P25 'В какой системе разговор с кораблем' [0..1] тип=обычный
    старт: [0]
    [0..0] <clrEnd><DeliveryFromStar><clr>
    [1..1] <clrEnd><DeliveryToStar><clr>
    критическое: Сообщение достижения критического значения параметром 25
- P26 'Имя корабля + тип' [0..2] тип=обычный
    старт: [0..2]
    [0..0] Starliner <clrEnd>[d27]<clr>
    [1..1] Consul <clrEnd>[d27]<clr>
    [2..2] Hauler <clrEnd>[d27]<clr>
    критическое: Сообщение достижения критического значения параметром 26
- P27 'Имя корабля' [0..9] тип=обычный
    старт: [0..9]
    [0..0] Tacitus
    [1..1] Prometheus
    [2..2] Wanderer
    [3..3] Phoenix
    [4..4] Labor
    [5..5] Arbiter
    [6..6] Chronos
    [7..7] Senator
    [8..8] Anubis
    [9..9] Augustus
    критическое: Сообщение достижения критического значения параметром 27
- P28 'специальное описание' [0..44] тип=обычный
    старт: [0]
    [0..36] 
    [37..37] <clrEnd><br>Plus, you stumble upon information telling you that the [d12] can bring luck to its owne…
    [38..38] <clrEnd><br>You also remember that the [d12] contains [p24] fuel.<clr>
    [39..39] <clrEnd><br>Plus, you suddenly remember an old tale that claims that the [d12] brings luck to its ow…
    [40..40] <clrEnd><br>Oh, and you remember that [d12] contains [p24] fuel.<clr>
    [41..41] <clrEnd><br>Plus, on the Galanet you stumble upon the information that the [d12] is an experimental …
    [42..42] <clrEnd><br>Plus, you assess the capacities of the [d12] and decide that repairing [p24] structure i…
    [43..43] 
    [44..44] <clrEnd><br>You examine the [d12] and realize that it contains [p24] fuel.<clr>
    критическое: Сообщение достижения критического значения параметром 28
- P29 'Тип шифра' [1..4] тип=обычный
    старт: [1..4]
    [1..1] copying
    [2..2] subtraction
    [3..3] inversion
    [4..4] digit swapping
    критическое: Сообщение достижения критического значения параметром 29
- P30 'Код восстановления' [0..9999] тип=обычный
    старт: [1000..8888]
    [0..9999] Параметр номер 30: <>
    критическое: Сообщение достижения критического значения параметром 30
- P31 'Сложность' [1..3] тип=обычный
    старт: [2]
    [1..1] Easy
    [2..2] Normal
    [3..3] Hard
    критическое: Сообщение достижения критического значения параметром 31
- P32 'Размер бонуса' [0..100] тип=обычный
    старт: [10]
    [0..100] Параметр номер 32: <>
    критическое: Сообщение достижения критического значения параметром 32
- P33 'Шаг бонуса' [0..10] тип=обычный
    старт: [2]
    [0..10] Параметр номер 34: <>
    критическое: Сообщение достижения критического значения параметром 34
- P34 'ext_BaseDeliveryPayment' [0..9999999] тип=обычный
    старт: [0]
    [0..9999999] Параметр номер 33: <>
    критическое: Сообщение достижения критического значения параметром 33
- P35 'ext_BaseDeliveryTime' [0..9999] тип=обычный
    старт: [0]
    [0..9999] Параметр номер 35: <>
    критическое: Сообщение достижения критического значения параметром 35
- P36 'ext_DeliveryTime' [0..9999] тип=обычный
    старт: [0]
    [0..9999] Параметр номер 36: <>
    критическое: Сообщение достижения критического значения параметром 36
- P37 'ext_Structure' [0..1000] тип=обычный
    старт: [0]
    [0..1000] Параметр номер 37: <>
    критическое: Сообщение достижения критического значения параметром 37

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {0}
    Loc1-2: {[p1] mod 1000} / {[p1] mod 10} / {[p1] mod 100 div 10} / {[p1] mod 1000 div 100} /  /  / {[p1] mod 100} - to the left / {[p1] div 10} - to the right
    эффект: P10(имя получателя) = 0
    эффект: P9(роль получателя) = 0
    эффект: P11(подстановка об отправке) = 0
    эффект: P12(предмет) = 0
    эффект: P13(описание предмета) = 0
    эффект: P19(Сценарий-награда) -30
    эффект: P6(Сценарий-Номер) = 0
    эффект: P36(ext_DeliveryTime) = {[p35]}
    эффект: P32(Размер бонуса) = {10}
  -> Path2 => Loc2  вер=1 порядок=2
       условия: логика {[p1]=0}
       эффект: P10(имя получателя) = {[0..9]}
       эффект: P9(роль получателя) = {[0..9]}
       эффект: P11(подстановка об отправке) = {[0..9]}
       эффект: P12(предмет) = {[10..44]}
       эффект: P6(Сценарий-Номер) = {[0..8]}
       эффект: P8(имя отправителя) = {[0..9]}
       эффект: P2(ext_DeliveryPayment) = {[p34]}
  -> Path15 => Loc29  вер=1 порядок=5
       условия: логика {[p1]>0}
       эффект: P8(имя отправителя) = {[p1] mod 100 div 10}
       эффект: P6(Сценарий-Номер) = {[p1] mod 10}
       эффект: P9(роль получателя) = {[p1] mod 1000 div 100}
       эффект: P10(имя получателя) = {[p1] mod 10000 div 1000}
       эффект: P12(предмет) = {[p1] mod 1000000 div 10000}
       эффект: P24(tmp02) = {[10..20]}
       эффект: P31(Сложность) = {[p1] div 1000000}

### Loc2 [обычная]
    выбор описания: {[1..10]}
    Loc2-1: Life, as we all find out sometimes, is full of surprises. At one time or another, every ranger experiences a moment when a bright flash in the porthole and a ho…
    Loc2-2: Bored by the routine of the interstellar flights, you start counting stars, just like you did when you were a kid. You've always wondered about the meaning of t…
    Loc2-3: As you are doing a routine check of the onboard computer data, you notice an incoming signal notification. You take the call without hesitation. / [d7]" your co…
    Loc2-4: Information analysis and design is the predominant activity for any humanoid, especially for a space ranger - who spends his days and nights analyzing informati…
    Loc2-5: Reading the Galanet news feed, you hear the intercom ringing. Looks like someone is eager to talk to you. You see the name [d8] on the screen. / [d7]" [d8] fall…
    Loc2-6: Using the opportunity to look back on what people were reading at the end of the third millenium, you open a book entitled <clr><i>House on Fire.</i><clrEnd> As…
    Loc2-7: To kill time and prepare for your new adventures, you decide to adjust the settings of the onboard computer.  / You are greatly surprised to find out that all n…
    Loc2-8: Now that you have a rare stretch of free time, you decide to rest. You order the onboard computer to turn on relaxing music with the sound of ocean waves in the…
    Loc2-9: Flying through the boundless blackness of space, you notice a remote object approaching you at high speed. It turns out to be a ship, and it uses all its lights…
    Loc2-10: Taking advantage of a gap in your schedule, you decide to overhaul your ventilation system: it's recently been making lots of noise but doing hardly any practic…
    эффект: P13(описание предмета) = {[p12]}
    эффект: P7(Сценарий-Первая подстановка) = {[p6]*3+[0..2]}
    эффект: P28(специальное описание) = {[p12]}
  -> Path63 => Loc26  вер=1 порядок=5

### Loc3 [обычная]
    Loc3-1: [d17] / [d19] / [d20] / [d21] / [d22]
    эффект: P3(ext_Money) = {[p3]+[p2]}
    эффект: P13(описание предмета) = {[p12]}
    эффект: P19(Сценарий-награда) = {[p6]*3+[0..2]}
    эффект: P1(ext_Delivery) = 0
  -> Path9 => Loc6  вер=4 порядок=7
       текст: End the call
  -> Path10 => Loc7  вер=1 порядок=4
       текст: Unpack
       условия: логика {[p22]=5 or [p22]=6}
  -> Path38 => Loc15  вер=1 порядок=5
       текст: End the call
       условия: логика {[p5]<55}
  -> Path51 => Loc24  вер=1 порядок=5
       текст: I'm a master lockpicker. Give it to me.
       условия: логика {[p22]=7}

### Loc4 [обычная]
    выбор описания: {[1..20]}
    Loc4-1: "A deal's a deal, Ranger; stay safe!" [d11]
    Loc4-2: "Great! Now hurry - [d10] is waiting for his [d12]!"[d11]
    Loc4-3: "It's a deal, then. Good luck, <Ranger>, and I'll be on my way." [d11]
    Loc4-4: "Good job, <Ranger>! Take this [d12] and set a course to the <DeliveryToStar> star - you only have [p36] days left!" [d11]
    Loc4-5: "Outstanding! I have already teleported the [d12] on board your ship, <Ranger>. Now I must beg your forgiveness: I'm pressed for time, so I'll be off."[d11]
    Loc4-6: "Deal. Please keep in mind that you only have [p36] days to accomplish the mission, which is not as long as it might seem. Though, as an experienced space pilot…
    Loc4-7: "Deal. But keep in mind: if in [p36] days [d10] hasn't gotten his [d12], you won't get paid at all, even if you do deliver the cargo after the time is up." [d11…
    Loc4-8: "I love doing business with capable people like yourself, <Ranger>! Good luck in your travels!" [d11]
    Loc4-9: "We've reached a consensus, which is great! The cargo is aready in your hold, <Ranger> - I just received notification that the teleportation has been completed.…
    Loc4-10: "Thanks for agreeing to help, <Ranger>, but keep in mind: the way to <DeliveryToStar> might be dangerous and hard. Be prepared for anything and stay alert. Oh, …
    Loc4-11: "<Ranger>, working with a professional like you is a pleasure! The recipient is already waiting to reward you for the delivery, so you'd better hurry!" [d11]
    Loc4-12: "Well, you didn't let me down, <Ranger> - they told me you'd say yes. Now let's see if you can really reach <DeliveryToStar> in time." [d11]
    Loc4-13: "Thanks for saying yes! But keep in mind that the way to <DeliveryToStar> is long and dangerous, <Ranger>. Stay safe and keep the [d12] intact." [d11]
    Loc4-14: "Our deal takes effect as of this very moment. Now hurry, <Ranger> - you know that reputational loss always hurts more than financial losses." [d11]
    Loc4-15: "A deal is a deal. Keep in mind: only if you deliver the cargo within [p36] days will you get your [p2] cr. Good luck now!" [d11]
    Loc4-16: "So the rumors about you are true, <Ranger>, and you are willing to help someone in need for the modest amount of [p2] cr.  That is commendable, but you still n…
    Loc4-17: "All right, our agreement takes effect immediately. Try not to break our deal, <Ranger>, and do everything as we've agreed." [d11]
    Loc4-18: "Well, I thought the stories of the rangers' valor were exaggerated, but it looks like they're true, after all. However, I'll only be able to believe all of the…
    Loc4-19: "The cargo is already aboard your ship, <Ranger>. Keep in mind: you only have [p36] days. Don't dishonor the ranger community by failing!" [d11]
    Loc4-20: "Outstanding. You know the terms of the deal. As long as you have no other questions, I suggest you begin your great mission of delivering this [d12] to <Delive…
  -> Path8 => Loc5  вер=1 порядок=5
       текст: Go on your way
  -> Path20 => Loc11  вер=1 порядок=5
       текст: Examine the [d12]
       эффект: P25(В какой системе разговор с кораблем) = 0
       эффект: P23(tmp01) = {1}

### Loc5 [УСПЕХ]

### Loc6 [УСПЕХ]

### Loc7 [обычная]
    выбор описания: {[1..3]}
    Loc7-1: It took some meddling with the container protecting the [d12], but finally you manage to open it and remove its contents. / "Thanks, <Ranger>, I'd never have ma…
    Loc7-2: You madly kick the container protecting the [d12]. At last you are able to get it open and take the cargo out. / "Thank you so much, <Ranger>, I'd never have ma…
    Loc7-3: A couple of well-aimed shots at the container get it open. / "Erm, thanks, <Ranger>. That was pretty neat, what you just did! By the way, here's your [p15] cr.,…
    эффект: P3(ext_Money) = {[p3]+[p15]}
  -> Path11 => Loc6  вер=1 порядок=5
       текст: End the comm session
       эффект: P5(ext_Luck) = {[p5]-5}

### Loc8 [обычная]
    выбор описания: {[1..11]}
    Loc8-1: You exit hyperspace and enter normal space to note with satisfaction that you've made it to <DeliveryToStar>.  / An incoming call from somewhere within the syst…
    Loc8-2: You are floating in the bottomless abyss of space when the communicator starts singing. It informs you that a creature named [d10] has a burning desire to get i…
    Loc8-3: You are awakened by a horrible howling coming from the communicator: it's almost bursting, trying to inform you of an incoming call.
    Loc8-4: As your working day draws to a close, and you are preparing for a good night's rest, you hear the communicator notifying you of an incoming call. / Obviously [d…
    Loc8-5: Your meditation session is interrupted by the communicator singing: it's notifying you that [d10] is wanting to talk. / You are beginning to suspect that the Un…
    Loc8-6: You devote your spare time for self-education: using a virtual flight trainer, you learn new tricks and techniques and practice the ones that you already know. …
    Loc8-7: You use a spare minute to hop on to the Galanet and check what's new online. / An incoming call from someone named [d10] brings you back into working mode.
    Loc8-8: An incoming call from someone named [d10] interrupts your contemplations of such eternal things as Creation, art, the class struggle, and social justice. The ve…
    Loc8-9: Your wanderings through the interstellar void of our arm of the Galaxy are interrupted by a terrible beeps of your communicator: looks like someone is trying ve…
    Loc8-10: It's never too late to learn something new. Taking up this motto, you plunge deep into self-education and try to increase your cultural depth by studying the cl…
    Loc8-11: Having arrived at the <DeliveryToStar> system and spent some time here, you begin to worry that the addressee is not here at all, and you'll have to keep the [d…
    эффект: P15(Бонус0) = {[p2]/20+[10..50]}
  -> Path13 => Loc3  вер=1 порядок=5
       текст: Answer the call
  -> Path31 => Loc11  вер=1 порядок=5
       текст: Examine the [d12]
       эффект: P25(В какой системе разговор с кораблем) = {1}
       эффект: P23(tmp01) = {1}

### Loc9 [обычная]
    выбор описания: {[1..3]}
    Loc9-1: "Aha, my dear, I got you," [d8] says with a hint of malice in his voice. "Please forgive me for misleading you: my name is really [d8], but, in fact, I represen…
    Loc9-2: "Aren't you ashamed of yourself, <Ranger>?!" Suddenly, [d8]'s attitude changes completely. "You do know that only pilots holding a trade license - which you don…
    Loc9-3: "Well, well, <Ranger>, what do I see here? A respectable person violating the law in such a blatant, primitive manner! What do you mean, how? Didn't you know th…
  -> Path47 => Loc20  вер=1 порядок=5

### Loc10 [обычная]
    выбор описания: {[p23]}
    Loc10-1: "Outstanding, <Ranger>. Your fine of [p15] cr. has been paid. In any case, I respect your choice and strongly advise you against engaging in this sort of activi…
    Loc10-2: "I hope you have considered the consequences, <Ranger>. In any case, I respect your choice and strongly advise you against engaging in this sort of activity aga…
    эффект: P1(ext_Delivery) = {0}
  -> Path19 => Loc5  вер=1 порядок=5
       текст: Close the window

### Loc11 [пустая]
  -> Path71 => Loc31  вер=1 порядок=5
       условия: логика {[p12]=40}
       эффект: P24(tmp02) = {[p4]/8+2}
  -> Path72 => Loc31  вер=1 порядок=5
       условия: логика {[p12]=38}
       эффект: P24(tmp02) = {[p4]/4+2}
  -> Path73 => Loc31  вер=1 порядок=5
       условия: логика {[p12]=44}
       эффект: P24(tmp02) = {20+[p16]}
  -> Path74 => Loc31  вер=1 порядок=5
       условия: логика {[p12]=42}
       эффект: P24(tmp02) = {20+[p16]*3}
  -> Path75 => Loc31  вер=1 порядок=5
       условия: логика {[p12]<>38 and [p12]<>40 and [p12]<>42 and [p12]<>44}

### Loc12 [обычная]
    выбор описания: {[p23]}
    Loc12-1: "Greetings, ranger. What can I do for you?" you hear [d26] reply. / You briefly describe the situation and explain that you've seen the ad. [d26] assures you th…
    Loc12-2: "Welcome to our humble abode, <Ranger>. What's up, and what do you want? What can I do for you?" you hear [d26] reply. / You briefly describe the situation and …
    Loc12-3: "Yeah, hello, come on now, I'm pressed for time," you hear [d26] reply. / You briefly describe the situation and explain that you've seen the ad. [d26] assures …
    Loc12-4: "All right, I'll take it for [p24] cr. if you give it to me right away."
    Loc12-5: "Now that is ridiculous! [p24] cr., and not a credit more!"
    Loc12-6: "It's nice doing business with you, <Ranger>! Be sure to contact me if you ever come across something like this again."  / Happy about the [p24] cr. earned, you…
  -> Path24 => Loc12  вер=1 проходов<=5 порядок=5
       текст: Ask for more
       условия: логика {[p5]>=50 and [p1]>0}
       эффект: P24(tmp02) = {[p24]+[p24]*0,2}
       эффект: P23(tmp01) = {4}
  -> Path25 => Loc12  вер=1 порядок=5
       текст: Ask for more
       условия: логика {[p1]>0}
       эффект: P23(tmp01) = {5}
  -> Path26 => Loc12  вер=1 порядок=6
       текст: Sell for [p24] cr.
       условия: логика {[p1]>0}
       эффект: P23(tmp01) = {6}
       эффект: P1(ext_Delivery) = {0}
       эффект: P5(ext_Luck) = {[p5]-[10..20]}
       эффект: P3(ext_Money) = {[p3]+[p24]}
  -> Path27 => Loc11  вер=1 порядок=7
       текст: Break the comm session and go back to inspecting the cargo
       условия: логика {[p1]>0}
       эффект: P23(tmp01) = {1}
  -> Path28 => Loc5  вер=1 порядок=8
       текст: Break the comm session and go on your way
       условия: логика {[p25]=0 or [p25]=1 and [p1]=0}
  -> Path33 => Loc3  вер=1 порядок=5
       текст: Break the comm session with [d26] and take the incoming call
       условия: логика {[p25]=1 and [p1]>0}

### Loc13 [обычная]
    выбор описания: {[p23]}
    Loc13-1: Reasoning that this [d12] is too good for a common resident of <DeliveryToStar>, you keep the cargo for yourself.[d28] / You can only guess the impact this act …
    Loc13-2: Reasoning that the [d12] is too good for a common resident of <DeliveryToStar>, you keep the cargo to yourself. / You think a little more and decide that the [d…
    эффект: P1(ext_Delivery) = {0}
    эффект: P5(ext_Luck) = {[p5]-[1..10]}
  -> Path30 => Loc5  вер=1 порядок=5
       текст: Close the window

### Loc14 [пустая]
  -> Path34 => Loc16  вер=1 порядок=5
       условия: логика {[p12]<37 or [p12]=43}
  -> Path35 => Loc16  вер=1 порядок=5
       условия: логика {[p12]=37}
       эффект: P5(ext_Luck) = {[p5]+[15..25]}
  -> Path36 => Loc16  вер=1 порядок=5
       условия: логика {[p12]=38 or [p12]=40 or [p12]=44}
       эффект: P4(ext_Fuel) = {[p4]+[p24]}
  -> Path62 => Loc16  вер=1 порядок=5
       условия: логика {[p12]=39}
       эффект: P5(ext_Luck) = {[p5]+[25..35]}
  -> Path76 => Loc16  вер=1 порядок=5
       условия: логика {[p12]=42}
       эффект: P37(ext_Structure) = {[p37]+[p24]}
  -> Path81 => Loc16  вер=1 порядок=5
       условия: логика {[p12]=41}
       эффект: P5(ext_Luck) = {[p5]+[1..15]}
  -> Path82 => Loc16  вер=1 порядок=5
       условия: логика {[p12]=41}
       эффект: P5(ext_Luck) = {[p5]-[1..15]}

### Loc15 [обычная]
    Loc15-1: Suddenly you receive a notification. It contains rather depressing information: the unscrupulous [d10]<clr>has canceled<clrEnd> the transfer of [p2] cr., claimi…
    эффект: P3(ext_Money) = {[p3]-[p2]}
  -> Path39 => Loc6  вер=1 порядок=5
       текст: Start searching for the messengers

### Loc16 [пустая]
  -> Path77 => Loc32  вер=1 порядок=5
       условия: логика {[p12]<37 or [p12]=43}
       эффект: P23(tmp01) = {2}
  -> Path78 => Loc32  вер=1 порядок=5
       условия: логика {[p12]>36 and [p12]<>43}
       эффект: P23(tmp01) = {1}

### Loc17 [пустая]
    эффект: P28(специальное описание) = {[p12]}
  -> Path41 => Loc8  вер=4 порядок=5
  -> Path42 => Loc19  вер=1 порядок=5
       условия: логика {[p5]<40}
       эффект: P15(Бонус0) = {[p24]}
  -> Path48 => Loc22  вер=1 порядок=5
       условия: логика {[p5]<=30 and [p6]<>7}
       эффект: P15(Бонус0) = {[p2]/8}
       эффект: P23(tmp01) = {[1..3]}
  -> Path50 => Loc22  вер=1 порядок=5
       условия: логика {[p5]<=50 and [p6]=7}
       эффект: P15(Бонус0) = {[p2]/8+([p2]/100+2)*8}
       эффект: P23(tmp01) = {4}

### Loc18 [обычная]
    выбор описания: {[p23]}
    Loc18-1: You arrive at the <DeliveryToStar> system and wait for [d10] to get in touch with you. Then you start looking for him, but your search is futile. / Alas, you on…
    Loc18-2: You arrive at the <DeliveryToStar> system and wait for [d10] to get in touch with you. Then you start looking for him, but your search is futile. / Alas, you on…
  -> Path45 => Loc5  вер=1 порядок=5
       текст: Start searching for the messengers

### Loc19 [пустая]
  -> Path43 => Loc19  вер=1 порядок=5
       условия: логика {[p24]>0}
       эффект: P24(tmp02) = {[p24]-1}
  -> Path44 => Loc14  вер=1 порядок=5
       условия: логика {[p24]=0}
       эффект: P1(ext_Delivery) = {0}
       эффект: P24(tmp02) = {[p4]/8+2}

### Loc20 [пустая]
  -> Path17 => Loc10  вер=1 [всегда видна] порядок=2
       текст: Pay the fine of [p15] cr.
       условия: логика {[p3]>=[p15]}
       эффект: P23(tmp01) = {1}
       эффект: P3(ext_Money) = {[p3]-[p15]}
       эффект: P5(ext_Luck) = {[p5]-[1..5]}
  -> Path18 => Loc10  вер=1 порядок=5
       текст: Refuse to pay
       эффект: P5(ext_Luck) = {[p5]-[10..30]}
       эффект: P23(tmp01) = {2}

### Loc22 [обычная]
    выбор описания: {[p23]}
    Loc22-1: "Aha, my dear, I got you," [d8] says with a hint of malice in his voice. "Please forgive me for misleading you: my name is really [d8], but, in fact, I represen…
    Loc22-2: Someone wants to get in touch with you. It seems incredible at first, but, judging from the caller ID information, [d8] wants to talk to you again. / "Aren't yo…
    Loc22-3: A familiar face that you identify as [d8] appears on the communicator screen: / "Well, well, <Ranger>, what do I see here? A respectable person violating the la…
    Loc22-4: "Aha, my dear boy, got you," you hear [d8] say with a hint of malice in his voice. "Yes, I have been following you all the way from <DeliveryFromStar>. You know…
  -> Path49 => Loc20  вер=1 порядок=5

### Loc23 [обычная]
    выбор описания: {[p23]}
    Loc23-1: "Well, <Ranger>, attaboy," [d10] begins to praise you, hearing the container lock click open. You open the container and reveal the [d12] in its monstrous splen…
    Loc23-2: "Well, <Ranger>, attaboy," [d10] begins to praise you, hearing the container lock click open. You try to open the lid, but it won't budge. <clr>The container is…
  -> Path56 => Loc6  вер=1 порядок=5
       текст: Go back to searching for the messengers

### Loc24 [обычная]
    Loc24-1: You examine the container and notice a strange code on one of the sides: [p30]. Something about the [d29] of this code was written in very fine print. / You dec…
  -> Path52 => Loc25  вер=1 порядок=5
       текст: {[p30]+1111}
       эффект: P24(tmp02) = {4}
  -> Path53 => Loc25  вер=1 порядок=5
       текст: {9999-[p30]}
       эффект: P24(tmp02) = {2}
  -> Path54 => Loc25  вер=1 порядок=5
       текст: {[p30] mod 10}{[p30] mod 100 div 10}{[p30] mod 1000 div 100}{[p30] mod 10000 div 1000}
       эффект: P24(tmp02) = {3}
  -> Path55 => Loc25  вер=1 порядок=5
       текст: {[p30]}
       эффект: P24(tmp02) = {1}

### Loc25 [пустая]
  -> Path57 => Loc23  вер=1 порядок=5
       условия: логика {[p29]=[p24]}
       эффект: P23(tmp01) = {1}
       эффект: P3(ext_Money) = {[p3]+[p15]}
       эффект: P5(ext_Luck) = {[p5]+[1..5]}
  -> Path58 => Loc23  вер=1 порядок=5
       условия: логика {[p29]<>[p24]}
       эффект: P23(tmp01) = {2}
       эффект: P5(ext_Luck) = {[p5]-[1..5]}

### Loc26 [пустая]
    эффект: P14(Подстановка о сроках) = {[0..9]}
    эффект: P16(Подстановка - берешься?) = {[0..9]}
  -> Path6 => Loc4  вер=5 порядок=5
       текст: Yes, I'm in, give me the [d12]
       эффект: P1(ext_Delivery) = {[p6]+([p8]*10)+([p9]*100)+([p10]*1000)+([p12]*10000)+([p31]*1000000)}
  -> Path7 => Loc5  вер=1 порядок=7
       текст: No, I'm not interested.
  -> Path16 => Loc9  вер=1 порядок=5
       текст: Yes, I'm in, give me the [d12]
       условия: логика {[p5]<70}
       эффект: P15(Бонус0) = {[p2]/8+12}
  -> Path64 => Loc27  вер=1 порядок=2
       текст: Harder
       условия: логика {[p31]<>3}
       эффект: P31(Сложность) +1
       эффект: P32(Размер бонуса) = {[p32]+[p33]}
       эффект: P36(ext_DeliveryTime) = {[p36]-([p35]/(10/[p33]))}
  -> Path65 => Loc27  вер=1 порядок=6
       текст: Easier
       условия: логика {[p31]<>1}
       эффект: P31(Сложность) -1
       эффект: P32(Размер бонуса) = {[p32]-[p33]}
       эффект: P36(ext_DeliveryTime) = {[p36]+([p35]/(10/[p33]))}

### Loc27 [обычная]
    выбор описания: {(([p31]-1)*5)+[1..5]}
    Loc27-1: "Well, as you wish, <Ranger>: the longer time you take, the less you get. You need to deliver the [d12] to the <DeliveryToStar> system. [d14] If you can't make …
    Loc27-2: "I thought you were a faster pilot, <Ranger>. But keep in mind that the <DeliveryToStar> system is pretty remote." [d14] / "I'm eager to pay as much as [p2] сr.…
    Loc27-3: "<Ranger>, you don't like to hurry, I see. Perhaps that's the right approach. Well, you know that I need you to take this [d12] to the <DeliveryToStar> system."…
    Loc27-4: "Well, <Ranger>, I don't know why you're refusing the chance to earn a few extra credits and want to extend the delivery deadline. Well, the heck with you. If y…
    Loc27-5: "Well, <Ranger>, it's good to see that you aren't overestimating your capabilities. Of course, the [d12] must make its way to the <DeliveryToStar> system, where…
    Loc27-6: "Quit beating around the bush, <Ranger>," says [d8], annoyed. "Either agree to deliver the cargo to <DeliveryToStar> or refuse." [d14] / "I'll pay you [p2] cr.,…
    Loc27-7: "You need to make up your mind, <Ranger>, whether you can meet the deadline or not," [d8] snaps. "Agree to take the cargo to <DeliveryToStar>, and let's get thi…
    Loc27-8: "Well, easier or harder? Yes or no? Or what, <Ranger>? Make up your mind. I'm telling you: this [d12] has to make it to <DeliveryToStar>." [d14] / "You will get…
    Loc27-9: "Well, <Ranger>, I wouldn't overestimate my capabilities if I were you. You need to decide what's more important: the money or the delivery time. Anyone can tak…
    Loc27-10: "Right you are, <Ranger> - everything has to be balanced. [p2] cr. and [p36] is quite a balanced offer for delivering cargo to the <DeliveryToStar> system." / […
    Loc27-11: "Right you are, <Ranger>: the faster you go, the more you get! You need to deliver the [d12] to the <DeliveryToStar> system. [d14] I'll pay [p2] сr. instead of …
    Loc27-12: "The quicker the delivery, the bigger your reward, <Ranger>! Remember that you need to deliver this [d12] to the <DeliveryToStar> system. [d14] I'm ready to pay…
    Loc27-13: "Well, <Ranger>, you're too fast for your own good. Don't overstrain yourself. Although I haven't ever heard about anyone breaking down from too much work, have…
    Loc27-14: "Well, <Ranger>, you're no fool - you never miss the chance to earn some extra cash! If you can deliver the [d12] to the <DeliveryToStar> system, in place of [p…
    Loc27-15: "You're pretty apt, <Ranger>! But keep in mind that the <DeliveryToStar> system is pretty remote." [d14] / "I'm eager to pay [p2] сr. for an express delivery!" …
    эффект: P2(ext_DeliveryPayment) = {([p34]*[p32])/10}
  -> Path66 => Loc26  вер=1 порядок=5

### Loc29 [пустая]
    эффект: P32(Размер бонуса) = {[p32]+(([p31]-2)*[p33])}
  -> Path69 => Loc17  вер=1 порядок=5

### Loc31 [обычная]
    выбор описания: {[p23]}
    Loc31-1: Just as you expected, the [d12] looks rather typical: [d13].  / You open some catalogs on the Galanet to see how much an item like this can cost. A quick search…
    Loc31-2: Alas, [d26] isn't replying. You can always try again, of course.
  -> Path21 => Loc5  вер=1 порядок=5
       текст: Go on your way
       условия: логика {[p25]=0}
  -> Path22 => Loc31  вер=3 порядок=2
       текст: Try to get in touch with [d26]
       эффект: P23(tmp01) = {2}
  -> Path23 => Loc12  вер=1 порядок=2
       текст: Try to get in touch with [d26]
       условия: логика {[p5]>40}
       эффект: P24(tmp02) = {[p2]/8}
       эффект: P23(tmp01) = {[1..3]}
  -> Path29 => Loc14  вер=1 порядок=5
       текст: Decide that the [d12] will be of more use to you than to the addressee
       условия: логика {[p1]>0}
  -> Path32 => Loc3  вер=1 порядок=5
       текст: Answer the call
       условия: логика {[p25]=1}

### Loc32 [пустая]
  -> Path79 => Loc13  вер=1 порядок=5
       условия: логика {[p1]>0}
  -> Path80 => Loc18  вер=1 порядок=5
       условия: логика {[p1]=0}

## Анализ
- стартовых: [1]
- концовки: {5: 'УСПЕХ', 6: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [17, 18, 20, 21, 22, 26, 27, 29, 30, 33, 34, 35]
