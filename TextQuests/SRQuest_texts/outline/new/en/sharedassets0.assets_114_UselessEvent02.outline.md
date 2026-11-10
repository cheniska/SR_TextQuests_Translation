# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'ext_Fuel' [0..100] тип=обычный
    старт: [0]
    [0..100] ext_Fuel <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Structure' [0..1000] тип=обычный
    старт: [500]
    [0..1000] ext_Structure <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Money' [0..1000000] тип=обычный
    старт: [10000]
    [0..1000000] ext_Money <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'ItemType' [0..20] тип=обычный
    старт: [0]
    [0..0] dive engine
    [1..1] singular engine
    [2..2] hyperfluid fuel tank
    [3..3] subtransferic radar
    [4..4] tracing scanner
    [5..5] vortex scanner
    [6..6] biotic droid
    [7..7] suspension droid
    [8..8] activator grabbing arm
    [9..9] telekinetic grabbing arm
    [10..10] perforated bar
    [11..11] protoplasm container
    [12..12] Vaa ship
    [13..13] blue box with lamp on top
    [14..14] box of red buttons
    [15..15] sack of swamp goo
    [16..16] hikke-bahna shaped keychain
    [17..17] synthetic rabbit
    [18..18] volcanic stone
    [19..19] Dalani Talmud
    [20..20] five-leaf clover
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ItemDescription' [0..20] тип=обычный
    старт: [0]
    [0..0] <clrEnd>jump distance: <clr>46<clrEnd> parsecs. Accelerates the ship up to <clr>900<clrEnd> points<c…
    [1..1] <clrEnd>jump distance: <clr>51<clrEnd> parsecs. Accelerates the ship up to <clr>1000<clrEnd> points<…
    [2..2] <clrEnd>volume: <clr>40<clrEnd> pts<clr>
    [3..3] <clrEnd>radius: <clr>5000<clrEnd> pts<clr>
    [4..4] <clrEnd>lets you scan objects shielded by a protective field of up to <clr>36<clrEnd> pts<clr>
    [5..5] <clrEnd>lets you scan objects shielded by a protective field of up to <clr>41<clrEnd> pts<clr>
    [6..6] <clrEnd>can repair up to <clr>50<clrEnd> structure per day<clr>
    [7..7] <clrEnd>can repair up to <clr>60<clrEnd> structure per day<clr>
    [8..8] <clrEnd>maximum grabbing volume: <clr>150<clrEnd> pts, maximum radius: <clr>175<clrEnd><clr>
    [9..9] <clrEnd>maximum grabbing volume: <clr>500<clrEnd> pts, maximum radius: <clr>200<clrEnd><clr>
    [10..10] <clrEnd>a <clr>sacred relic and masterpiece<clrEnd> of the Akabos people<clr>
    [11..11] <clrEnd>has been around since the Klissan war; contains original <clr>Klissan<clrEnd> parts<clr>
    [12..12] <clrEnd>as the last large object left behind by the <clr>Vaa<clrEnd> race, it has great historic val…
    [13..13] <clrEnd>origins are unknown; according to legend, <clr>it's bigger on the inside than on the outside
    [14..14] <clrEnd>its contents are required to create the control panel for the Maloqi <clr>Final Weapon
    [15..15] <clrEnd>according to Peleng legends, it can bring <clr>luck<clrEnd> to its owner<clr>
    [16..16] <clrEnd>according to Gaal legends, it can bring <clr>luck<clrEnd> to its owner<clr>
    [17..17] <clrEnd>according to human legends, it can bring <clr>luck<clrEnd> to its owner<clr>
    [18..18] <clrEnd>according to Maloqi legends, it can bring <clr>luck<clrEnd> to its owner<clr>
    [19..19] <clrEnd>according to Faeyan legends, it can bring <clr>luck<clrEnd> to its owner<clr>
    [20..20] <clrEnd>can bring <clr>incredible luck<clrEnd> to its owner. Other races of the Coalition have adopt…
    критическое: Сообщение достижения критического значения параметром 5
- P6 'ConspiracyLever' [0..3] тип=обычный
    старт: [0]
    [0..0] ConspiracyLever <>
    [1..1] No one knows about Acryn
    [2..2] Acryn is top secret
    [3..3] Everyone is wondering about Acryn
    критическое: Сообщение достижения критического значения параметром 6
- P7 'CurMoneyTmp' [0..100000] тип=обычный
    старт: [0]
    [0..100000] CurMoneyTmp <>
    критическое: Сообщение достижения критического значения параметром 7
- P8 'ItemCost' [0..100000] тип=обычный
    старт: [0]
    [0..100000] ItemCost <>
    критическое: Сообщение достижения критического значения параметром 8
- P9 'TraderMind' [0..2] тип=обычный
    старт: [0]
    [0..0] The merchant isn't thinking
    [1..1] The merchant has been bribed. He's friendly
    [2..2] The merchant hasn't been bribed. He's preparing for revenge
    критическое: Сообщение достижения критического значения параметром 9
- P10 'tmp' [0..10] тип=обычный
    старт: [1]
    [0..10] tmp <>
    критическое: Сообщение достижения критического значения параметром 10
- P11 'PirateMind' [0..3] тип=обычный
    старт: [0]
    [0..0] The pirates are chasing the player
    [1..1] The pirates don't like the player
    [2..2] The pirates are indifferent
    [3..3] The pirates like the player
    критическое: Сообщение достижения критического значения параметром 11
- P12 'WarriorMind' [0..3] тип=обычный
    старт: [0]
    [0..0] 
    [1..1] The officer is honest
    [2..2] The officer takes bribes
    [3..3] The officer wants to line his pockets
    критическое: Сообщение достижения критического значения параметром 12
- P13 'ItemStatus' [0..4] тип=обычный
    старт: [0]
    [0..0] the merchant has the [d4]
    [1..1] the player has the [d4]
    [2..2] the officer has the [d4]
    [3..3] the pirates have the [d4]
    [4..4] [d4] destroyed
    критическое: Сообщение достижения критического значения параметром 13
- P14 'WarriorStatus' [0..4] тип=обычный
    старт: [0]
    [0..0] The officer doesn't know about the player
    [1..1] The player escaped the officer
    [2..2] The player gave the [d4] to the officer
    [3..3] The player bribed the officer
    [4..4] The officer flew away\died
    критическое: Сообщение достижения критического значения параметром 14
- P15 'Tmp02' [0..1000] тип=обычный
    старт: [0]
    [0..1000] Параметр номер 15: <>
    критическое: Сообщение достижения критического значения параметром 15
- P16 'PirateStatus' [0..4] тип=обычный
    старт: [0]
    [0..0] The pirates don't know about the player
    [1..1] The player escaped from the pirates
    [2..2] The player gave the [d4] to the pirates
    [3..3] The player bribed the pirates
    [4..4] The pirates flew away\died
    критическое: Сообщение достижения критического значения параметром 16
- P17 'ItemCostMultiplier' [0..100000] тип=обычный
    старт: [0]
    [0..100000] ItemCostMultiplier <>
    критическое: Сообщение достижения критического значения параметром 17
- P18 'PiratesInSystemTxt' [0..1] тип=обычный
    старт: [0]
    [0..0] a gang of pirates flying behind one of the natural satellites<clrEnd> in a close-knit group<clr>
    [1..1] a natural satellite, <clrEnd>hanging lonely in space<clr>
    критическое: Сообщение достижения критического значения параметром 18
- P19 'WarroirInSystemTxt' [0..1] тип=обычный
    старт: [0]
    [0..0] a warship <clrEnd>moving <clr>
    [1..1] a loaf-shaped asteroid <clrEnd>floating slowly <clr>
    критическое: Сообщение достижения критического значения параметром 19
- P20 'tmp03' [0..100] тип=обычный
    старт: [0]
    [0..100] Параметр номер 20: <>
    критическое: Сообщение достижения критического значения параметром 20
- P21 'TalkTarget' [0..1] тип=обычный
    старт: [0]
    [0..0] the player talks to the pirate
    [1..1] the player talks to the officer
    критическое: Сообщение достижения критического значения параметром 21
- P22 'achievementStatus' [0..3] тип=обычный
    старт: [0]
    [0..0] No damn achievement
    [1..1] Achievement: the player sells the [d4] to the pirates
    [2..2] Achievement: the player reclaims the [d4]
    [3..3] Achievement earned!
    критическое: Сообщение достижения критического значения параметром 22
- P23 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] ext_Luck <>
    критическое: Сообщение достижения критического значения параметром 23
- P24 'Множитель цены предмета у странника' [0..200] тип=обычный
    старт: [130..160]
    [0..200] Параметр номер 24: <>
    критическое: Сообщение достижения критического значения параметром 24
- P25 'Множитель инфо о предмете у странника' [0..100] тип=обычный
    старт: [40..60]
    [0..100] Параметр номер 25: <>
    критическое: Сообщение достижения критического значения параметром 25

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: The unpleasant beeping of the communicator disturbs the peace and quiet of your interstellar journey. / "Good afternoon, ranger <Ranger>. Do you wish to purchas…
    эффект: P4(ItemType) = {[0..20]}
    эффект: P6(ConspiracyLever) = {[1..3]}
    эффект: P8(ItemCost) = {[p3]/40*[8..13]+[155..888]}
    эффект: P9(TraderMind) = {[0..2]}
    эффект: P17(ItemCostMultiplier) = {[8..22]}
    эффект: P11(PirateMind) = {[1..3]}
    эффект: P12(WarriorMind) = {[1..3]}
  -> Path2 => Loc2  вер=1 порядок=5
       текст: No
  -> Path3 => Loc3  вер=1 порядок=1
       текст: What is this item?
       эффект: P5(ItemDescription) = {[p4]}
       эффект: P10(tmp) = {[1..5]}
       эффект: P7(CurMoneyTmp) = {[p8]}

### Loc2 [УСПЕХ]

### Loc3 [обычная]
    выбор описания: {[p10]}
    Loc3-1: The stranger smirks and speaks on: / "By sheer accident, I happen to have this [d4], [d5], and I'm eager to part with it for the modest sum of [p8] cr."
    Loc3-2: The stranger sighs deeply, adopts a business-like attitude, and informs you: / "I happen to have this [d4] onboard, obtained with great difficulty. You don't ne…
    Loc3-3: Your conversation partner runs his skilled hands over the ship's controls, closes the shutters, <clr>turns on a mystical <clrEnd> light and begins to speak: / "…
    Loc3-4: "Through incredible effort, I managed to obtain a [d4]," the stranger continues. "Not an ordinary one: this <clr>is the<clrEnd>[d4], [d5], and its price, which …
    Loc3-5: "I have a remarkable [d4]; most remarkable about it is that [d5]. / Another remarkable quality of this [d4] is its price: just [p8] cr."
    Loc3-6: "You can put it on display on your flight deck, or you can install it <clr>if the ship's systems are compatible<clrEnd> - there are many ways to put such a wond…
    Loc3-7: "I'm an honest vendor of all sorts of legal and not-so-legal goods!" he says, indignant. "My prices are the most reasonable in the Galaxy! [p8] cr. for this [d4…
    Loc3-8: "No, unfortunately, I cannot operate at a loss and give discounts, especially on such merchandise as this [d4]. Keep in mind that [d5]. It really is worth the […
    Loc3-9: Normally, I don't give discounts - after all, my prices are the most reasonable in the Galaxy," says the merchant "However, I've never met such a famous ranger …
  -> Path4 => Loc4  вер=1 проходов<=1
       текст: But the stats of a shop-bought [d4] are less impressive! What's the catch?
       условия: логика {[p4]<10}
  -> Path30 => Loc3  вер=1 порядок=1
       текст: Ask for a discount
       условия: логика {[p10]<6 and [p9]=0 and [p7]>=[p8]}
       эффект: P10(tmp) = 8
  -> Path31 => Loc3  вер=1 порядок=1
       текст: Ask for a discount
       условия: логика {[p10]<6 and [p9]=1 and [p7]>=[p8]}
       эффект: P10(tmp) = 9
       эффект: P7(CurMoneyTmp) = {[p8]*95/100}
  -> Path32 => Loc3  вер=1 порядок=1
       текст: Ask for a discount
       условия: логика {[p10]<6 and [p9]=0 and [p7]>=[p8]}
       эффект: P9(TraderMind) = 2
       эффект: P10(tmp) = 7
  -> Path33 => Loc18  вер=1 [всегда видна] порядок=4
       текст: It's a good [d4], and the price of [p7] cr. is affordable. I'm taking it!
       условия: логика {[p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P13(ItemStatus) = 1
  -> Path35 => Loc3  вер=1 проходов<=1 порядок=2
       текст: What am I supposed to do with it?
       эффект: P10(tmp) = 6
  -> Path36 => Loc2  вер=1 порядок=5
       текст: No, thanks. I'm not interested in that sort of junk

### Loc4 [обычная]
    Loc4-1: "You see, <Ranger>, this isn't just a [d4]. It's not a modern replica: it's <clr>the very same<clrEnd>[d4] that was manufactured during the <clr>Klissan war<clr…
  -> Path5 => Loc5  вер=1 порядок=5
       текст: You mean equipment produced three hundred years ago is more efficient than modern designs?
  -> Path6 => Loc6  вер=1 проходов<=1 порядок=5
       текст: Perhaps it's thanks to the effect of Acryn components?
       эффект: P7(CurMoneyTmp) = {[p3]/40*[8..15]/10}

### Loc5 [обычная]
    Loc5-1: "Yes, that is right. Certainly you have seen on the news that private hyperjumps lead to space warps and ruptures known as wormholes. Traditionally, laymen call…
  -> Path7 => Loc7  вер=1 порядок=5
       текст: And what did the pseudo-experts invent?

### Loc6 [обычная]
    выбор описания: {[p6]}
    Loc6-1: "What do you mean, Acryn components?" your conversation partner is puzzled by the question. "I've never heard of those."
    Loc6-2: "How do you know about Acryn?!" your conversation partner blurts out. "That's classified information! Only those involved in the research itself know about this…
    Loc6-3: "You know about Acryn technologies?" your conversation partner looks surprised, but quickly gets his emotions under control. "I've only heard a few rumors, and …
  -> Path15 => Loc5  вер=1 порядок=5
       текст: You mean this [d4], despite its old age, is much more powerful than its modern counterparts?
       условия: логика {[p6]=2}
       эффект: P9(TraderMind) +2
  -> Path16 => Loc15  вер=1 порядок=5
       текст: Tell the truth about Acryn for [p7] cr.
       условия: логика {[p6]=3}
       эффект: P9(TraderMind) = 1
  -> Path17 => Loc6  вер=1 проходов<=3 порядок=5
       текст: Ask for more money for your information
       условия: логика {[p6]=3}
       эффект: P7(CurMoneyTmp) = {[p7]*[11..15]/10}
  -> Path18 => Loc16  вер=1 порядок=5
       текст: Ask for more money for your information
       условия: логика {[p6]=3}
  -> Path25 => Loc17  вер=1 порядок=5
       текст: Pay [p7] cr. for the mean extortioner to keep silent.
       условия: логика {[p6]=2}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P9(TraderMind) = 1
  -> Path28 => Loc17  вер=1 порядок=5
       текст: Refuse to pay
       условия: логика {[p6]=2}
       эффект: P9(TraderMind) = 2
  -> Path29 => Loc5  вер=1 порядок=5
       текст: You mean this [d4], despite its old age, is much more powerful than its modern counterparts?
       условия: логика {[p6]<>2}

### Loc7 [обычная]
    Loc7-1: "They thought of nothing better than to <clr>limit the power of the engines being manufactured<clrEnd>. Here's how it works: they have come up with a special co…
  -> Path8 => Loc8  вер=1 порядок=5
       текст: But everyone knows that by the end of the war there were engines that let ships cover over 50 parsecs in a single jump!

### Loc8 [обычная]
    Loc8-1: "Yes, it was the war that triggered the development of such equipment," he continues. "Back then, no one cared about the remote prospect of sending the whole ar…
  -> Path9 => Loc9  вер=1 порядок=5
       текст: But where did all the powerful equipment go?

### Loc9 [обычная]
    Loc9-1: "As had been initially planned, the ban was resumed, and the Ranger Corps, which had fulfilled its purpose, ceased to exist in its original form. Naturally, the…
  -> Path10 => Loc10  вер=1 порядок=5
       текст: Why didn't they invent new engines, then - spacetime-friendly ones?

### Loc10 [обычная]
    Loc10-1: "Who needs them now that the war is over? Like in ancient times, the merchants are more interested in ship capacity than in speed. Back when pirates and the Kli…
  -> Path11 => Loc11  вер=1 порядок=5
       текст: Weren't there any sly merchants who decided to sell fast, illegal engines at sky-high prices? Say, to the pirates, for example?

### Loc11 [обычная]
    Loc11-1: "Are you listening to me at all? I'm telling you that the overall speed of all ships began to decrease, and buying quick engines became too expensive and pointl…
  -> Path12 => Loc12  вер=1 порядок=5
       текст: But the modern equipment even looks different!

### Loc12 [обычная]
    Loc12-1: "Of course, an attractive appearance increases the chance of goods being sold! And the secret decree {1377} on <clr>18.12.3109<clrEnd> ordered that all devices …
  -> Path14 => Loc14  вер=1 порядок=5
       текст: Why, isn't the Coalition doing anything besides destroying dissenters?

### Loc13 [обычная]
    Loc13-1: The man smirks and looks down. Obviously, he is flattered by your question. / "I'm a free merchant, unburdened by moral or Galactic law. And information, as we …
  -> Path23 => Loc3  вер=1 порядок=5
       текст: What purchase were you suggesting?
       эффект: P7(CurMoneyTmp) = {[p8]}
       эффект: P10(tmp) = {[1..5]}

### Loc14 [обычная]
    Loc14-1: "<clr>Word has it<clrEnd> that for three centuries scientists have been dissecting Klissan equipment in the Coalition's secret laboratories, looking for hyperen…
  -> Path13 => Loc13  вер=1 порядок=5
       текст: How do you know all this?

### Loc15 [обычная]
    Loc15-1: You make sure that your account has grown by [p7] cr., grunt contently, clear your throat, and begin reciting:  / "<clr>Acryn<clrEnd> is a cutting-edge unique s…
    эффект: P3(ext_Money) = {[p3]+[p7]}
  -> Path21 => Loc5  вер=1 порядок=5
       текст: What? This item that's been around for three centuries is still in great condition?
  -> Path22 => Loc3  вер=1 порядок=5
       текст: What were you saying about buying my [d4]?
       эффект: P10(tmp) = {[1..5]}
       эффект: P7(CurMoneyTmp) = {[p8]}

### Loc16 [обычная]
    Loc16-1: "That's outrageous. [p7] cr. and no more! If you don't want to share the information, just say so," the man says, sounding offended. He is definitely interested…
  -> Path19 => Loc15  вер=1 порядок=5
       текст: Agree to tell everything for [p7] cr.
       эффект: P9(TraderMind) = 1
  -> Path20 => Loc5  вер=1 порядок=5
       текст: Keep asking if the ancient [d4] is really better than its modern equivalents
       эффект: P9(TraderMind) = 2
  -> Path24 => Loc3  вер=1 порядок=5
       текст: What were you saying about buying my [d4]?
       эффект: P10(tmp) = {[1..5]}
       эффект: P7(CurMoneyTmp) = {[p8]}

### Loc17 [обычная]
    выбор описания: {[p9]}
    Loc17-1: "Now that's better," smirks your disgusting conversation partner, obviously delighted at the sound of your money being transfered into his account. / "Anything …
    Loc17-2: "Well, as you say, <Ranger>," he says, with a hint of disappointment. / "Anything else?"
  -> Path26 => Loc2  вер=1 порядок=5
       текст: No
  -> Path27 => Loc3  вер=1 порядок=5
       текст: We were talking about buying the [d4]
       эффект: P10(tmp) = {[1..5]}
       эффект: P7(CurMoneyTmp) = {[p8]}
  -> Path56 => Loc5  вер=1 порядок=5
       текст: What? This [d4] that's been around for three centuries is still in great condition?

### Loc18 [обычная]
    Loc18-1: "Great! I'm going to drop the [d4] for you to pick up. And <Ranger> - don't confuse the grabbing arm activation button with your weapon controls, or you might j…
    эффект: P7(CurMoneyTmp) = {[p2]/[5..20]+[5..9]}
  -> Path37 => Loc19  вер=1 порядок=5
       текст: Pick up the cargo
       условия: логика {[p9]=2}
       эффект: P10(tmp) = 2
       эффект: P2(ext_Structure) = {[p2]-[p7]}
  -> Path38 => Loc19  вер=1 порядок=5
       текст: Pick up the cargo
       эффект: P10(tmp) = 1

### Loc19 [обычная]
    выбор описания: {[p10]}
    Loc19-1: You pick up the [d4] and proceed into the cargo hold to examine the newly bought item. / The merchant wasn't lying: in a huge steel crate, you see your new [d4]…
    Loc19-2: After picking the [d4] up, you are about to proceed into the cargo hold to examine the newly bought item. Suddenly you hear an <clr>explosion<clrEnd> somewhere …
  -> Path39 => Loc20  вер=1 порядок=5
       текст: Wait, <clr>the ship structure is equal to zero<clrEnd>, which means...
       условия: логика {[p2]=0}
  -> Path40 => Loc21  вер=1 порядок=5
       условия: логика {[p2]>0}
       эффект: P7(CurMoneyTmp) = {[2..20]}
       эффект: P10(tmp) -1

### Loc20 [УСПЕХ]

### Loc21 [пустая]
  -> Path41 => Loc22  вер=1 проходов<=1 порядок=2
       текст: Try to plug in the [d4]
       условия: логика {[p4]<10}
  -> Path42 => Loc50  вер=1 порядок=9
       текст: Keep looking for the messengers
  -> Path43 => Loc23  вер=1
       текст: Check for ships in the system
  -> Path46 => Loc24  вер=1 проходов<=1 порядок=4
       текст: Use the [d4] to decorate the ship
  -> Path53 => Loc25  вер=1 проходов<=1 порядок=3
       текст: Check the [d4] for fuel
       условия: логика {[p4]=2 and [p10]=0}

### Loc22 [обычная]
    Loc22-1: You try to connect the [d4] to your ship's systems, but to no avail: its size, shape, and connectors simply don't fit anywhere.  / You'll need to find other way…
    Loc22-2: As your are trying once again to plug the [d4] into your ship's system (<clr>and failing<clrEnd>), you manage to break off a few clips on the device itself. Wel…
    Loc22-3: As you are trying once again to plug the [d4] in, you remember that you've already done this, <clr>to no avail<clrEnd>. / Perhaps you should put your strength t…
  -> Path51 => Loc21  вер=1 порядок=5

### Loc23 [обычная]
    выбор описания: {[1..3]}
    Loc23-1: After pushing a few buttons and pulling a few levers, you see a huge panoramic view of the stellar system rolling into view through the flight deck window. You …
    Loc23-2: You decide to examine your surroundings more closely and take a look at the radar screen. It informs you that here in the system you can find [d18], and there i…
    Loc23-3: Remembering that your ship has a navigation system, you give the onboard computer a command to activate it. However, the soulless machine refuses to accept your…
  -> Path45 => Loc22  вер=1 проходов<=1 порядок=2
       текст: Try to plug in the [d4]
       условия: логика {[p4]<10 and [p13]=1}
  -> Path49 => Loc24  вер=1 проходов<=1 порядок=4
       текст: Use the [d4] to decorate the ship
       условия: логика {[p13]=1}
  -> Path50 => Loc50  вер=1 проходов<=1 порядок=9
       текст: Go back to searching for the messengers
  -> Path54 => Loc25  вер=1 проходов<=1 порядок=3
       текст: Check the [d4] for fuel
       условия: логика {[p4]=2 and [p10]<0 and [p13]=1}
  -> Path57 => Loc23  вер=4
       текст: Check for ships in the system
  -> Path58 => Loc26  вер=1 порядок=1
       текст: Fly towards the group of pirates
       условия: логика {[p16]<>1 and [p16]<>4}
       эффект: P10(tmp) = {[1..3]}
  -> Path59 => Loc27  вер=1 порядок=1
       текст: Fly towards the warship
       условия: логика {[p14]<>1 and [p14]<>4}
       эффект: P10(tmp) = 1
       эффект: P21(TalkTarget) = 1
  -> Path63 => Loc29  вер=2 порядок=1
       текст: Fly towards the warship
       условия: логика {[p9]=2 and [p6]=2 and [p14]<>1 and [p14]<>4}
       эффект: P10(tmp) = {[p12]}
       эффект: P7(CurMoneyTmp) = {[p8]/8}
       эффект: P21(TalkTarget) = 1
  -> Path152 => Loc47  вер=1
       текст: Check for ships in the system
       условия: логика {[p14]=4 or [p14]=1 and [p16]=4 or [p16]=1 and [p13]=1}
       эффект: P10(tmp) = 1
  -> Path153 => Loc47  вер=1
       текст: Check for ships in the system
       условия: логика {[p14]=1 and [p16]=1 and [p13]=1}
       эффект: P10(tmp) = 1
  -> Path155 => Loc47  вер=1
       текст: Check for ships in the system
       условия: логика {[p14]=4 or [p14]=1 and [p16]=4 or [p16]=1 and [p13]<>1}
       эффект: P10(tmp) = 2
  -> Path156 => Loc47  вер=1
       текст: Check for ships in the system
       условия: логика {[p14]=1 and [p16]=1 and [p13]<>1}
       эффект: P10(tmp) = 2

### Loc24 [обычная]
    Loc24-1: You decide that the [d4] will make a great centerpiece for your flight deck's interior design. You place it in plain view, on your own wall of fame, <clr>side b…
  -> Path52 => Loc21  вер=1 порядок=5

### Loc25 [обычная]
    Loc25-1: You knock on the <clr>hyperfluid fuel tank<clrEnd>, only to realize that there's still <clr>some fuel<clrEnd> inside. You scan the tank and find out that it con…
    эффект: P10(tmp) = 0
    эффект: P1(ext_Fuel) = {[p1]+[p7]}
  -> Path55 => Loc21  вер=1 порядок=5

### Loc26 [обычная]
    выбор описания: {[p10]}
    Loc26-1: Remembering that the merchant mentioned the possibility of selling the [d4] to the pirates, you head towards them. / You establish contact with the biggest ship…
    Loc26-2: "What do you want, <Ranger>? Spill it out and be quick about it," replies the pilot of the pirate ship.
    Loc26-3: You read the system information carefully, identify the pirates' hiding place on the map, and head towards them.  / Judging by his rumpled look and bad mood, yo…
    Loc26-4: "Everything's fine, the [d4] has been loaded on board," reports the pirate. "It's been nice doing business with you, <Ranger>."
    Loc26-5: "Well, whatever," he replies. "Drop by if you change your mind."
    Loc26-6: "What's Acryn? Never heard of it. I don't need this information." /  Looks like you're <clr>the only person<clrEnd> in this universe who knows about Acryn. Or p…
    Loc26-7: "Ha! <clr>Another one<clrEnd>? Hey, guys, get ready to fry this bastard!" a voice comes from the speakers. "Get out, or you'll get it good!" /  Looks like the r…
    Loc26-8: "Do you really have information about Acryn?" your conversation partner asks in an extremely skeptical manner. "All right, spill it out, for [p7] cr., but remem…
    Loc26-9: Seeing the [d4] drifting in space, your conversation partner's ship immediately <clr>snatches<clrEnd> the container with its manipulator ray and drags the cargo…
    Loc26-10: "Now that's better! What the hell made you think that starting a space fight was a good idea?" the red snout in the intercom window seems even redder than befor…
  -> Path97 => Loc41  вер=1 порядок=5
       текст: Do you know that there's a military patrol nearby?
       условия: логика {[p14]<4}
       эффект: P10(tmp) = 1
  -> Path98 => Loc37  вер=1 порядок=3
       текст: I have this [d4] that I'd like to sell.
       условия: логика {[p11]>1 and [p13]=1}
       эффект: P7(CurMoneyTmp) = {[p8]*[p17]/10}
       эффект: P10(tmp) = 2
  -> Path100 => Loc26  вер=1 проходов<=1 порядок=2
       текст: I have information about Acryn
       условия: логика {[p10]<6}
       эффект: P10(tmp) = {[p6]+5}
       эффект: P7(CurMoneyTmp) = {[p3]/40*[8..15]/10}
  -> Path102 => Loc37  вер=1 порядок=3
       текст: I have this [d4] that I'd like to sell.
       условия: логика {[p11]<2 and [p13]=1}
       эффект: P10(tmp) = {[p11]}
       эффект: P7(CurMoneyTmp) = {[p8]*7/10}
  -> Path107 => Loc23  вер=1 порядок=9
       текст: Break communication and refresh your radar data
  -> Path113 => Loc26  вер=1
       текст: Ask for more money for your information
       условия: логика {[p10]=8}
       эффект: P7(CurMoneyTmp) = {[p7]*[11..15]/10}
  -> Path114 => Loc38  вер=1
       текст: Ask for more money for your information
       условия: логика {[p10]=8}
  -> Path117 => Loc41  вер=1 [всегда видна] порядок=6
       текст: There's a ship that has to be destroyed
       эффект: P10(tmp) = 2
  -> Path138 => Loc41  вер=1 проходов<=1 порядок=5
       текст: Did you know that there <clr>was<clrEnd> a military patrol nearby?
       условия: логика {[p14]=4}
       эффект: P10(tmp) = 3
       эффект: P11(PirateMind) = 3
       эффект: P7(CurMoneyTmp) = {[p8]/7}
       эффект: P3(ext_Money) = {[p3]+([p8]/7)}
  -> Path161 => Loc40  вер=1
       текст: Agree to tell everything for [p7] cr.
       условия: логика {[p10]=8}
       эффект: P3(ext_Money) = {[p3]+[p7]}
       эффект: P16(PirateStatus) = 3

### Loc27 [обычная]
    выбор описания: {[p10]}
    Loc27-1: Determined to talk to the local official, you head towards the <clr>warship<clrEnd>. You approach close enough to start a dialog and initiate a communication se…
    Loc27-2: "Now you're talking. That's where you should have started, <Ranger>!" says the officer sarcastically. "Anything else?"
    Loc27-3: Seeing the [d4] drifting in space, your conversation partner's ship immediately <clr>snatches<clrEnd> the container with its manipulator ray and drags the cargo…
    Loc27-4: Seeing the [d4] drifting in space, your conversation partner's ship immediately <clr>incinerates<clrEnd> the container with a salvo from its guns. Looks like yo…
    Loc27-5: Seeing the [d4] drifting in space, your conversation partner's ship immediately <clr>snatches<clrEnd> the container with its manipulator ray and drags the cargo…
    Loc27-6: "<Ranger>, this is a military ship, not a cargo vessel. We are not buying up other pilots' junk." / When you mention that the [d4] on offer is really unusual, […
    Loc27-7: Remembering that the <clr>merchant's ship is heading to the hyperjump point<clrEnd>, you make sure to mention that in your conversation with the interstellar la…
    Loc27-8: "{[p8]/5*7} here." replies the voice in the communicator. "My goal is to protect the citizens of the Coalition and its allies. At the moment I'm<clr> patrolling…
    Loc27-9: "{[p8]/5*7} here." replies the voice in the communicator. "My goal is to protect the citizens of the Coalition and its allies. At the moment I'm<clr> patrolling…
    эффект: P7(CurMoneyTmp) = {[p3]*[5..8]/100}
  -> Path60 => Loc23  вер=1 порядок=9
       текст: Break communication and refresh your radar data
       эффект: P19(WarroirInSystemTxt) = {[p14]-3}
  -> Path61 => Loc28  вер=1
       текст: I have this [d4] onboard, and I'd like to offer it to you
       условия: логика {[p4]<10 and [p14]<2 and [p13]=1}
       эффект: P10(tmp) = {[p12]}
  -> Path62 => Loc28  вер=1
       текст: I have this [d4] onboard, and I'd like to offer it to you
       условия: логика {[p4]>9 and [p14]<2 and [p13]=1 and [p2]>0}
       эффект: P10(tmp) = {[p12]+3}
  -> Path92 => Loc27  вер=1 порядок=2
       текст: I have this [d4] onboard, and I'd like to offer it to you
       условия: логика {[p14]=3 and [p13]=1}
       эффект: P10(tmp) = 6
  -> Path93 => Loc27  вер=1 порядок=1
       текст: Why are you here?
       условия: логика {[p12]<3}
       эффект: P10(tmp) = 8
  -> Path94 => Loc27  вер=1 проходов<=1 порядок=7
       текст: They're robbing a merchant at the edge of the system
       эффект: P10(tmp) = 7
       эффект: P14(WarriorStatus) = 4
       эффект: P11(PirateMind) = 3
       эффект: P19(WarroirInSystemTxt) = {[p16]-3}
  -> Path95 => Loc39  вер=1 [всегда видна] порядок=5
       текст: There are pirates
       условия: логика {[p16]<4}
       эффект: P10(tmp) = {[p12]}
  -> Path96 => Loc39  вер=1 [всегда видна] порядок=5
       текст: I've been robbed
       условия: логика {[p13]=3}
       эффект: P10(tmp) = {3+[1..3]}
  -> Path112 => Loc27  вер=1 порядок=1
       текст: Why are you here?
       условия: логика {[p12]=3}
       эффект: P10(tmp) = 9

### Loc28 [обычная]
    выбор описания: {[p10]}
    Loc28-1: "<Ranger>, this is a military ship, not a cargo vessel. We are not buying up other pilots' junk." / When you mention that the [d4] on offer is really unusual, […
    Loc28-2: "<Ranger>, this is a military ship, not a cargo vessel. We are not buying up other pilots' junk." / When you mention that the [d4] on offer is really unusual, […
    Loc28-3: "<Ranger>, this is a military ship, not a cargo vessel. We are not buying up other pilots' junk." / When you mention that the [d4] on offer is really unusual, […
    Loc28-4: "<Ranger>, this is a military ship, not a cargo vessel. We are not buying up other pilots' junk." / When you mention that the [d4] on offer is really unusual, […
    Loc28-5: "<Ranger>, this is a military ship, not a cargo vessel. We are not buying up other pilots' junk." / When you mention that the [d4] on offer is really unusual, […
    Loc28-6: "<Ranger>, this is a military ship, not a cargo vessel. We are not buying up other pilots' junk." / When you mention that the [d4] on offer is really unusual, […
    Loc28-7: You decide that there's nothing more to do here and make a hasty retreat. Looks like your enemy <clr>was ready for this turn of events<clrEnd> - he uses his cha…
    Loc28-8: "What's [p7] cr. nowadays? Give me more!" says the attacker, with a malicious gleam in his eyes.
    Loc28-9: You think through your finances and decide that you can spare [p7] cr. as a bribe.  / Will that be enough for the greedy blackmailer?
    эффект: P15(Tmp02) = {[1..5]}
  -> Path65 => Loc30  вер=1 порядок=6
       текст: Offer the [d4] in exchange for silence
       условия: логика {[p12]=3 and [p13]=1 and [p21]=1}
       эффект: P10(tmp) = 1
  -> Path66 => Loc31  вер=1 порядок=5
       текст: Stop the conversation and try to escape
       условия: логика {[p2]>0 and [p21]=1}
       эффект: P14(WarriorStatus) = 1
  -> Path70 => Loc28  вер=1 порядок=5
       текст: Stop the conversation and try to escape
       условия: логика {[p2]>0}
       эффект: P10(tmp) = 7
       эффект: P2(ext_Structure) = {[p2]-[p15]}
       эффект: P20(tmp03) = {[p15]}
  -> Path71 => Loc27  вер=1 порядок=2
       текст: Offer [p7] cr.
       условия: логика {[p12]>1 and [p7]>[p8]/3 and [p2]>0 and [p21]=1}
       эффект: P10(tmp) = 2
       эффект: P14(WarriorStatus) = 3
       эффект: P3(ext_Money) = {[p3]-[p7]}
  -> Path74 => Loc28  вер=1 порядок=1
       текст: Double the amount
       условия: логика {[p12]>1 and [p14]<2 and [p7]*2<=[p3] and [p2]>0}
       эффект: P7(CurMoneyTmp) +100%
       эффект: P10(tmp) = 9
  -> Path76 => Loc28  вер=1 порядок=2
       текст: Offer [p7] cr.
       условия: логика {[p14]<2 and [p12]>1 and [p7]<=[p8]/3 and [p2]>0 and [p21]=1}
       эффект: P10(tmp) = 8
  -> Path86 => Loc34  вер=1 порядок=5
       текст: Agree to the destruction
       условия: логика {[p2]>0}
       эффект: P10(tmp) = 1
  -> Path87 => Loc27  вер=1 порядок=5
       текст: Drop the [d4], as you've been asked
       условия: логика {[p12]=1 and [p2]>0 and [p21]=1}
       эффект: P10(tmp) = 4
       эффект: P13(ItemStatus) = 4
  -> Path88 => Loc27  вер=1 порядок=5
       текст: Drop the [d4], as you've been asked
       условия: логика {[p12]>1 and [p2]>0}
       эффект: P10(tmp) = 5
       эффект: P13(ItemStatus) = 2
  -> Path90 => Loc28  вер=1 порядок=3
       текст: Cut the amount in half
       условия: логика {[p12]>1 and [p14]<2 and [p7]/2>=5 and [p2]>0}
       эффект: P10(tmp) = 9
       эффект: P7(CurMoneyTmp) -50%
  -> Path162 => Loc20  вер=1 порядок=5
       текст: Wait, <clr>the ship structure is equal to zero<clrEnd>, which means...
       условия: логика {[p2]=0}
  -> Path164 => Loc26  вер=1 порядок=2
       текст: Offer [p7] cr.
       условия: логика {[p21]=0 and [p7]>=([p8]*[p17])/10 and [p2]>0 and [p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P16(PirateStatus) = 3
       эффект: P10(tmp) = 10
  -> Path166 => Loc30  вер=1 порядок=6
       текст: Offer to take the [d4] for free
       условия: логика {[p21]=0 and [p13]=1}
       эффект: P10(tmp) = 3
  -> Path167 => Loc28  вер=1 порядок=2
       текст: Offer [p7] cr.
       условия: логика {[p21]=0 and [p7]<=[p8]*[p17]/10 and [p2]>0}
       эффект: P10(tmp) = 8
  -> Path168 => Loc31  вер=1 порядок=5
       текст: Stop the conversation and try to escape
       условия: логика {[p2]>0 and [p21]=0}
       эффект: P16(PirateStatus) = 1
  -> Path169 => Loc28  вер=1 порядок=3
       текст: Cut the amount in half
       условия: логика {[p21]=0 and [p7]/2>=5 and [p2]>0}
       эффект: P10(tmp) = 9
       эффект: P7(CurMoneyTmp) -50%
  -> Path170 => Loc28  вер=1 порядок=1
       текст: Double the amount
       условия: логика {[p21]=0 and [p7]*2<=[p3] and [p2]>0}
       эффект: P7(CurMoneyTmp) +100%
       эффект: P10(tmp) = 9

### Loc29 [обычная]
    выбор описания: {[p10]}
    Loc29-1: You notice that you're not flying anywhere - the <clr>warship<clrEnd> is approaching you: / "Got you, <Ranger>! As you doubtless know, information on <clr>Acryn…
    Loc29-2: You notice that you're not flying anywhere - the <clr>warship<clrEnd> is approaching you: / "Got you, <Ranger>! As you doubtless know, information on <clr>Acryn…
    Loc29-3: You notice that you're not flying anywhere - the <clr>warship<clrEnd> is approaching you: / "Got you, <Ranger>! As you doubtless know, information on <clr>Acryn…
    Loc29-4: You decide that there's nothing more to do here and make a hasty retreat. Looks like your enemy <clr>was ready for this turn of events<clrEnd> - he uses his cha…
    Loc29-5: "What's [p7] cr. nowadays? Offer me more!" says the warship pilot, with a malicious gleam in his eyes.
    Loc29-6: You think through your finances and decide that you can spare [p7] cr. as a bribe.  / Will that be enough for the greedy bribetaker?
    эффект: P15(Tmp02) = {[1..5]}
  -> Path64 => Loc30  вер=1 порядок=5
       текст: Offer the [d4] in exchange for silence
       условия: логика {[p12]>1 and [p13]=1}
       эффект: P10(tmp) = 1
  -> Path67 => Loc31  вер=1 порядок=5
       текст: Stop the conversation and try to escape
       эффект: P14(WarriorStatus) = 1
  -> Path69 => Loc29  вер=1 порядок=5
       текст: Stop the conversation and try to escape
       эффект: P10(tmp) = 4
       эффект: P2(ext_Structure) = {[p2]-[p15]}
  -> Path72 => Loc27  вер=1 порядок=2
       текст: Offer [p7] cr.
       условия: логика {[p12]>1 and [p7]>[p8]/3}
       эффект: P10(tmp) = 2
       эффект: P14(WarriorStatus) = 3
  -> Path73 => Loc29  вер=1 [всегда видна]
       текст: Double the amount
       условия: логика {[p7]*2<=[p3] and [p12]>1}
       эффект: P7(CurMoneyTmp) +100%
       эффект: P10(tmp) = 6
  -> Path75 => Loc29  вер=1 [всегда видна] порядок=2
       текст: Offer [p7] cr.
       условия: логика {[p12]>1 and [p7]<=[p8]/3}
       эффект: P10(tmp) = 5
  -> Path85 => Loc34  вер=1 порядок=5
       текст: Agree to the arrest
       эффект: P10(tmp) = 2
  -> Path91 => Loc29  вер=1 [всегда видна] порядок=3
       текст: Cut the amount in half
       условия: логика {[p7]/2>5 and [p12]>1}
       эффект: P7(CurMoneyTmp) -50%
       эффект: P10(tmp) = 6

### Loc30 [обычная]
    выбор описания: {[p10]}
    Loc30-1: "Of course we could do that," replies the warship pilot to your offer, smirking. He is obviously interested in the [d4] you mentioned. "Dump the [d4] into space…
    Loc30-2: "Why should we pay you at all, you bloody vulture?" he suddenly explodes, "We can always take the [d4] from you by force!" /  / Looks like you <clr>failed to im…
    Loc30-3: "I offered that from the start!" He is furious. But he is obviously interested in the [d4] you mentioned. / Looks like you <clr>failed to impress the pirates fa…
  -> Path77 => Loc31  вер=1 порядок=7
       текст: Stop the conversation and try to escape
       условия: логика {[p10]=1}
       эффект: P14(WarriorStatus) = 1
  -> Path78 => Loc27  вер=1 порядок=5
       текст: Drop the container as agreed
       условия: логика {[p10]=1}
       эффект: P10(tmp) = 3
       эффект: P14(WarriorStatus) = 2
       эффект: P13(ItemStatus) = 2
  -> Path79 => Loc32  вер=1 порядок=1
       текст: Drop the container and get ready to shoot it with your onboard guns
       эффект: P13(ItemStatus) = 4
       эффект: P7(CurMoneyTmp) = 2
  -> Path80 => Loc32  вер=1 порядок=2
       текст: Drop an <clr>empty<clrEnd> container
       эффект: P7(CurMoneyTmp) = 1
  -> Path83 => Loc33  вер=1 порядок=4
       текст: Drop <clr>several empty<clrEnd> containers
  -> Path110 => Loc31  вер=1 порядок=7
       текст: Stop the conversation and try to escape
       условия: логика {[p10]>1}
       эффект: P16(PirateStatus) = 1
  -> Path133 => Loc26  вер=1 порядок=5
       текст: Drop the container as agreed
       условия: логика {[p10]=2}
       эффект: P10(tmp) = 9
       эффект: P13(ItemStatus) = 3
       эффект: P16(PirateStatus) = 2
  -> Path165 => Loc28  вер=2 порядок=7
       текст: Stop the conversation and try to escape
       эффект: P2(ext_Structure) = {[p2]-[p15]}
       эффект: P20(tmp03) = {[p15]}
       эффект: P10(tmp) = 7

### Loc31 [обычная]
    Loc31-1: You decide that there's nothing more to do here and make a hasty retreat. Looks like your opponent <clr>wasn't ready for this turn of events: you manage to shak…
  -> Path68 => Loc23  вер=1 порядок=5
       текст: Check for ships in the system
       эффект: P19(WarroirInSystemTxt) = {[p14]-3}
       эффект: P18(PiratesInSystemTxt) = {[p16]-3}

### Loc32 [обычная]
    выбор описания: {[p7]}
    Loc32-1: Seeing the [d4] drifting in space, your conversation partner's ship immediately <clr>snatches<clrEnd> the container with its manipulator ray and drags the cargo…
    Loc32-2: Seeing the [d4] drifting in space, your conversation partner's ship immediately <clr>snatches<clrEnd> the container with its manipulator ray and drags the cargo…
  -> Path81 => Loc31  вер=2 порядок=5
       текст: Throttle up and fly as far away as you can
       условия: логика {[p10]=1}
       эффект: P14(WarriorStatus) = 1
  -> Path82 => Loc28  вер=1 порядок=5
       текст: Throttle up and fly as far away as you can
       условия: логика {[p10]=1}
       эффект: P10(tmp) = 7
       эффект: P2(ext_Structure) = {[p2]-[p15]}
  -> Path111 => Loc31  вер=1 порядок=5
       текст: Throttle up and fly as far away as you can
       условия: логика {[p10]=2}
       эффект: P16(PirateStatus) = 1

### Loc33 [обычная]
    Loc33-1: You pick out a dozen spare containers, large enough to hold the [d4], and dump them all together into space. / Seeing <clr>a dozen drifting containers<clrEnd>, …
  -> Path84 => Loc31  вер=1 порядок=5
       текст: Throttle up and fly as far away as you can
       условия: логика {[p10]=1}
       эффект: P14(WarriorStatus) = 1
  -> Path109 => Loc31  вер=1 порядок=5
       текст: Throttle up and fly as far away as you can
       условия: логика {[p10]=2}
       эффект: P16(PirateStatus) = 1

### Loc34 [обычная]
    выбор описания: {[p10]}
    Loc34-1: Believing that the [d4] means everything to you in this virtual world, you are determined to perish with it. You inform the pilot of the hostile ship of your de…
    Loc34-2: Believing that a ranger who still remembers the meaning of honor must face the punishment he deserves for his horrible deeds, you decide to follow the warship t…
  -> Path89 => Loc35  вер=1 порядок=5
       текст: And so the great ranger's life is over...
       эффект: P2(ext_Structure) = 0

### Loc35 [УСПЕХ]

### Loc37 [обычная]
    выбор описания: {[p10]}
    Loc37-1: At first, the pirate is surprised why you're offering him the [d4]. However, when he learns that [d5], he refuses to buy the [d4] even for [p8] cr. Instead, he …
    Loc37-2: At first, the pirate is surprised why you're offering him this [d4]. However, when he learns that [d5], he offers you [p7] cr. According to the merchant, it's <…
    Loc37-3: After conferring with the others, the space corsair informs you that he's ready to add {[p7]-([p8]*[p17]/10)} cr. to his initial offer, which makes for a total …
    Loc37-4: "No, there won't be a better deal," replies the pirate's snout in the intercom window. "We are honest pirates, not the moneybags of this Galaxy. We can only giv…
  -> Path101 => Loc37  вер=1 порядок=1
       текст: Ask for more
       условия: логика {[p11]>1 and [p10]<3}
       эффект: P7(CurMoneyTmp) = {[p7]+[500..1000]}
       эффект: P10(tmp) = 3
  -> Path103 => Loc37  вер=1 порядок=1
       текст: Ask for more
       условия: логика {[p11]<3}
       эффект: P10(tmp) = 4
  -> Path105 => Loc26  вер=1 порядок=5
       текст: Sell the [d4] for [p7] cr.
       эффект: P3(ext_Money) = {[p3]+[p7]}
       эффект: P13(ItemStatus) = 3
       эффект: P10(tmp) = 4
       эффект: P22(achievementStatus) = 1
  -> Path106 => Loc30  вер=1 порядок=5
       текст: Sell the [d4] for [p7] cr.
       условия: логика {[p11]=1 and [p16]<>3}
       эффект: P10(tmp) = 2
       эффект: P21(TalkTarget) = 0
       эффект: P15(Tmp02) = {[1..5]}
       эффект: P7(CurMoneyTmp) = {[p8]/2}
  -> Path108 => Loc26  вер=1 порядок=8
       текст: Refuse to sell
       эффект: P10(tmp) = 5

### Loc38 [обычная]
    Loc38-1: "That's outrageous. Your information is worth no more than [p7] cr. If you don't want to tell me anything, the hell with you!" the man explodes.
  -> Path115 => Loc40  вер=1 порядок=2
       текст: Agree to tell everything for [p7] cr.
       эффект: P16(PirateStatus) = 3
       эффект: P3(ext_Money) = {[p3]+[p7]}
  -> Path160 => Loc26  вер=1 порядок=5
       текст: Refuse
       эффект: P10(tmp) = 5
       эффект: P11(PirateMind) = 1

### Loc39 [обычная]
    выбор описания: {[p10]}
    Loc39-1: Remembering that you saw something resembling a group of pirate ships sheltered behind an object resembling a natural satellite on your radar, you give this inf…
    Loc39-2: Remembering that you saw something resembling a group of pirate ships sheltered behind an object resembling a natural satellite on your radar, you give this inf…
    Loc39-3: Remembering that you saw something resembling a group of pirate ships sheltered behind an object resembling a natural satellite on your radar, you give this inf…
    Loc39-4: You give the pilot of the patrol ship a vivid account of where and how you were robbed of the [d4] and wait for his reaction. His reaction is rather unhasty, ev…
    Loc39-5: After telling the tragic story of your misfortunes and of losing the [d4], you notice a look of bewildered surprise on the face of the patrol ship's pilot. You …
    Loc39-6: You decide that, despite your experience and heroic past, you can't handle the situation yourself, and appeal to the captain of the patrol ship with your proble…
  -> Path135 => Loc44  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p11]=1 and [p12]>1 and [p10]<>3}
       эффект: P10(tmp) = 2
  -> Path137 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]<3 and [p12]>1}
       эффект: P10(tmp) = 1
       эффект: P16(PirateStatus) = 4
  -> Path139 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]<3 and [p12]<3}
       эффект: P10(tmp) = 2
       эффект: P14(WarriorStatus) = 4
       эффект: P16(PirateStatus) = 4
  -> Path140 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]<3 and [p12]<3}
       эффект: P16(PirateStatus) = 4
       эффект: P10(tmp) = 3
  -> Path141 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]<3 and [p12]<3 and [p13]=3}
       эффект: P10(tmp) = 3
       эффект: P13(ItemStatus) = 4
  -> Path142 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]<>3 and [p13]=3}
       эффект: P10(tmp) = 4
       эффект: P13(ItemStatus) = 4
       эффект: P14(WarriorStatus) = 4
       эффект: P16(PirateStatus) +4
  -> Path143 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]>3 and [p13]=3 and [p22]<>1}
       эффект: P16(PirateStatus) = 4
       эффект: P13(ItemStatus) = 1
       эффект: P10(tmp) = 5
  -> Path144 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]>3 and [p13]=3 and [p22]<>1}
       эффект: P13(ItemStatus) = 1
       эффект: P16(PirateStatus) = 4
       эффект: P10(tmp) = 6
  -> Path146 => Loc27  вер=1 порядок=5
       текст: Ask something else
       условия: логика {[p12]=3 and [p10]=3}
       эффект: P10(tmp) = 1
  -> Path171 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]>3 and [p13]=3 and [p22]=1}
       эффект: P10(tmp) = 6
       эффект: P13(ItemStatus) = 1
       эффект: P16(PirateStatus) = 4
       эффект: P22(achievementStatus) = 2
  -> Path172 => Loc45  вер=1 порядок=5
       текст: Watch the officer's actions
       условия: логика {[p10]>3 and [p13]=3 and [p22]=1}
       эффект: P10(tmp) = 5
       эффект: P13(ItemStatus) = 1
       эффект: P16(PirateStatus) = 4
       эффект: P22(achievementStatus) = 2

### Loc40 [обычная]
    Loc40-1: You make sure that your account has grown by [p7] cr., grunt contently, clear your throat, and begin reciting:  / "<clr>Acryn<clrEnd> is a cutting-edge unique s…
  -> Path116 => Loc26  вер=1 порядок=5
       текст: Motivate your conversation partner
       эффект: P10(tmp) = 2

### Loc41 [обычная]
    выбор описания: {[p10]}
    Loc41-1: "Of course we do!" your new acquaintance brightens. "It's thanks to that patrol we have to <clr>hide behind this satellite<clrEnd>. / If only you could help us …
    Loc41-2: "And who is your intended victim?"
    Loc41-3: "Now that was smart, the way you made him fly away!" says your pirate friend excitedly. "Thanks, bro, that's worth a lot. [p7] credits, to be precise. <clr>Help…
  -> Path118 => Loc42  вер=1 порядок=4
       текст: A warship, not far from here
       условия: логика {[p14]>0 and [p14]<4 and [p10]=2}
       эффект: P10(tmp) = 2
  -> Path119 => Loc42  вер=1 порядок=5
       текст: A merchant who sells Menzol trinkets. He's already gotten pretty far, though
       условия: логика {[p10]=2}
       эффект: P10(tmp) = 1
  -> Path120 => Loc26  вер=1 порядок=8
       текст: Nah, we won't destroy anyone right now
       условия: логика {[p10]=2}
       эффект: P10(tmp) = 5
  -> Path121 => Loc26  вер=1 порядок=5
       текст: I'll think of something
       условия: логика {[p10]=1}
       эффект: P10(tmp) = {[1..3]}
  -> Path131 => Loc42  вер=1 порядок=5
       текст: A warship, not far from here. The main goal is to get the cargo out of its hold
       условия: логика {[p13]=2 and [p14]<>4 and [p10]=2}
       эффект: P10(tmp) = 3
       эффект: P13(ItemStatus) = 2
  -> Path148 => Loc26  вер=1 порядок=5
       текст: Of course
       условия: логика {[p10]=3}
       эффект: P10(tmp) = {[1..3]}

### Loc42 [обычная]
    Loc42-1: "Great! For just [p7] cr., a team of professionals will vaporize those damned merchants. We'll scatter his remains across the Universe!  / We will get down to i…
    Loc42-2: "Great! For just [p7] cr., a team of professionals will vaporize that damned war dog. We'll scatter his remains across the Universe!  / We will get down to it a…
    Loc42-3: "Great! For just [p7] cr., a team of professionals will beat the cargo out of the damned war dog. We'll scatter his remains across the Universe!  / We will get …
    эффект: P7(CurMoneyTmp) = {[p8]/2}
  -> Path123 => Loc43  вер=1 порядок=5
       текст: Buy the merchant's death for [p7] сr.
       условия: логика {[p11]=1 and [p10]=1 and [p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P16(PirateStatus) = 4
       эффект: P10(tmp) = 2
  -> Path124 => Loc43  вер=1 порядок=5
       текст: Buy the merchant's death for [p7] сr.
       условия: логика {[p11]>1 and [p10]=1 and [p14]<>4 and [p3]>=[p7]}
       эффект: P10(tmp) = 1
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P16(PirateStatus) = 4
  -> Path125 => Loc26  вер=1 порядок=7
       текст: Nah, we won't destroy anyone right now
       эффект: P10(tmp) = 5
  -> Path126 => Loc44  вер=1 порядок=5
       текст: Buy the officer's death for [p7] сr.
       условия: логика {[p11]=1 and [p10]=2 and [p12]>1 and [p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P10(tmp) = 1
  -> Path127 => Loc43  вер=1 порядок=5
       текст: Buy the officer's death for [p7] сr.
       условия: логика {[p11]>1 and [p10]>1 and [p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P10(tmp) = 3
       эффект: P14(WarriorStatus) = 4
       эффект: P16(PirateStatus) = 4
  -> Path128 => Loc43  вер=1 порядок=5
       текст: Buy the merchant's death for [p7] сr.
       условия: логика {[p11]>1 and [p10]=1 and [p14]=4 and [p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P10(tmp) = 1
       эффект: P16(PirateStatus) = 4
  -> Path129 => Loc43  вер=1 порядок=5
       текст: Buy the merchant's death for [p7] сr.
       условия: логика {[p11]>1 and [p10]=1 and [p14]<>4 and [p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P10(tmp) = 1
       эффект: P14(WarriorStatus) +4
       эффект: P16(PirateStatus) = 4
  -> Path130 => Loc43  вер=1 порядок=5
       текст: Buy the officer's death for [p7] сr.
       условия: логика {[p11]=1 and [p10]>1 and [p3]>=[p7]}
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P10(tmp) = 4
       эффект: P16(PirateStatus) = 4
  -> Path134 => Loc43  вер=1 порядок=5
       текст: Buy the officer's death for [p7] сr.
       условия: логика {[p11]=1 and [p10]>1 and [p3]>=[p7]}
       эффект: P10(tmp) = 5
       эффект: P3(ext_Money) = {[p3]-[p7]}
       эффект: P13(ItemStatus) = 2
       эффект: P16(PirateStatus) = 4
       эффект: P14(WarriorStatus) = 4

### Loc43 [обычная]
    выбор описания: {[p10]}
    Loc43-1: "Great, we got the money," replies your newly-bought killer in a booming voice. / "The merchant has already flown off, so <clr>we'll have to switch to afterburn…
    Loc43-2: "Great, we got the money," replies your newly-hired killer in a booming voice: / "The merchant has already flown off, so <clr>we'll have to switch to afterburne…
    Loc43-3: "Great, we got the money," replies your newly-hired killer in a booming voice: / "Listen here: <clr>we're going to lure the warship out of its hiding place<clrE…
    Loc43-4: "Great, we got the money," replies your newly-hired killer in a booming voice: / "Listen here: <clr>we're going to lure the warship out of its hiding place<clrE…
    Loc43-5: "Great, we got the money," replies your newly-hired killer in a booming voice: / "Listen here: <clr>we're going to lure the warship out of its hiding place<clrE…
    эффект: P16(PirateStatus) = 4
  -> Path122 => Loc23  вер=1 порядок=5
       текст: Examine the radar data
       эффект: P19(WarroirInSystemTxt) = {[p14]-3}
       эффект: P18(PiratesInSystemTxt) = {[p16]-3}

### Loc44 [обычная]
    выбор описания: {[p10]}
    Loc44-1: "Great, we got the money," replies your newly-hired killer in a booming voice: / "Listen here: <clr>we will lure the ship to the far side of the satellite<clrEn…
    Loc44-2: As promised, the <clr>warship<clrEnd> sails across space, to the pirates' hiding place. / You watch as one of the pirate ships emerges from the shadow of the na…
    эффект: P14(WarriorStatus) = 1
    эффект: P16(PirateStatus) = 1
  -> Path136 => Loc23  вер=1 порядок=5
       текст: Throttle up and fly as far away as you can, keeping an eye on your radar

### Loc45 [обычная]
    выбор описания: {[p10]}
    Loc45-1: As promised, the <clr>warship<clrEnd> sails across space, to the pirates' hiding place. / The following events unfold in a precise military manner: as soon as t…
    Loc45-2: As promised, the <clr>warship<clrEnd> sails across space, to the pirates' hiding place. / The following events unfold in a precise military manner: as soon as t…
    Loc45-3: Following the warship, you fall behind and lose sight of the leading ship in your makeshift convoy disappear over the edge of the natural satellite. Soon, you s…
    Loc45-4: You listen to the professional's advice and proceed to the pirates' hiding place. Indeed, they are still there, but you fail to catch them by surprise. A short …
    Loc45-5: Preparing for a serious fight, you follow the <clr>warship<clrEnd> to the site of the impending battle. However, the pirates are not as simple as they might see…
    Loc45-6: Entrusting delicate matters to the professional, you follow the warship to the pirates' location. / Just as expected, your companion turns out to be a professio…
  -> Path147 => Loc23  вер=2 порядок=2
       текст: Go back to the radar data
       эффект: P19(WarroirInSystemTxt) = {[p14]-3}
       эффект: P18(PiratesInSystemTxt) = {[p16]-3}
  -> Path151 => Loc46  вер=1 порядок=5
       текст: Go back to the radar data
       условия: логика {[p12]<3 and [p14]<4}
       эффект: P3(ext_Money) = {[p3]+(([p8]/[p12])+42)}
       эффект: P7(CurMoneyTmp) = {[p8]/[p12]+42}

### Loc46 [обычная]
    Loc46-1: You barely manage to get a hold on your steering yoke before the <clr>warship pilot<clrEnd> gets in touch with you again: / "Wait, <Ranger>! Thank you for helpi…
  -> Path150 => Loc23  вер=1 порядок=5
       текст: Go back to the radar data
       эффект: P18(PiratesInSystemTxt) = {[p16]-3}
       эффект: P19(WarroirInSystemTxt) = {[p14]-3}

### Loc47 [обычная]
    Loc47-1: A sudden flash on the starboard side of your ship interrupts your exciting pastime. When the bright circles stop flashing before your eyes, you see a blinking c…
  -> Path154 => Loc48  вер=1 порядок=5
       текст: Yes, it was me who bought the [d4]
       эффект: P7(CurMoneyTmp) = {([p8]*[p24])/100}

### Loc48 [обычная]
    Loc48-1: "Great," says the stranger. "My name is <clr>Adric<clrEnd><Ranger><clr>IV<clrEnd>, and I'm a ranger just like you, <Ranger>. I was on a secret mission for the g…
  -> Path158 => Loc49  вер=1 порядок=5
       текст: Unfortunately, I don't have the [d4] anymore
       условия: логика {[p13]<>1}
       эффект: P7(CurMoneyTmp) = {([p7]*[p25])/100}
       эффект: P10(tmp) = 2
  -> Path159 => Loc49  вер=1 порядок=5
       текст: Of course - you can have it for [p7]!
       условия: логика {[p13]=1 and [p22]<>2}
       эффект: P10(tmp) = 1
  -> Path173 => Loc49  вер=1 порядок=5
       текст: Of course - you can have it for [p7]!
       условия: логика {[p13]=1 and [p22]=2}
       эффект: P10(tmp) = 1
       эффект: P22(achievementStatus) = 3
  -> Path174 => Loc49  вер=1 порядок=5
       текст: Unfortunately, I don't have the [d4] anymore
       условия: логика {[p4]=20 and [p13]=1}
       эффект: P7(CurMoneyTmp) = {([p7]*[p25])/100}
       эффект: P10(tmp) = 3
       эффект: P23(ext_Luck) = {[p23]+20}
  -> Path175 => Loc49  вер=1 порядок=5
       текст: Unfortunately, I don't have the [d4] anymore
       условия: логика {[p4]>14 and [p4]<20 and [p13]=1}
       эффект: P7(CurMoneyTmp) = {([p7]*[p25])/100}
       эффект: P10(tmp) = 3
       эффект: P23(ext_Luck) = {[p23]+10}

### Loc49 [обычная]
    выбор описания: {[p10]}
    Loc49-1: You talk to the ranger a while longer, give him the [d4], and get [p7] cr. for the deal. / You exchange pleasantries and go your separate ways.  / The <clr>merc…
    Loc49-2: When he learns that you <clr>no longer have<clrEnd> the [d4], your conversation partner's face darkens. "Too bad. Perhaps you wouldn't mind informing me where i…
    Loc49-3: When he learns that you <clr>no longer have<clrEnd> the [d4], your conversation partner's face darkens. "Too bad. Perhaps you wouldn't mind informing me where i…
    эффект: P3(ext_Money) = {[p3]+[p7]}
  -> Path157 => Loc20  вер=1 порядок=5
       текст: Go back to searching for the messengers

### Loc50 [пустая]
  -> Path176 => Loc51  вер=1 порядок=5
       условия: логика {[p4]<15 or [p13]<>1}
       эффект: P10(tmp) = 1
  -> Path177 => Loc51  вер=1 порядок=5
       условия: логика {[p13]=1 and [p4]>14 and [p14]<20}
       эффект: P10(tmp) = 2
       эффект: P23(ext_Luck) = {[p23]+10}
  -> Path178 => Loc51  вер=1 порядок=5
       условия: логика {[p13]=1 and [p4]=20}
       эффект: P10(tmp) = 2
       эффект: P23(ext_Luck) = {[p23]+20}

### Loc51 [обычная]
    выбор описания: {[p10]}
    Loc51-1: You decide you have no time to waste on this crazy business and leave the scene. / You did the right thing: the mission of saving the Universe is your top prior…
    Loc51-2: You decide you have no time to waste on this crazy business. Besides, you might as well keep the [d4]. With that, you leave the scene. Who knows, this [d4] migh…
  -> Path179 => Loc20  вер=1 порядок=5
       текст: Start searching

## Анализ
- стартовых: [1]
- концовки: {2: 'УСПЕХ', 20: 'УСПЕХ', 35: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: [24, 25]
