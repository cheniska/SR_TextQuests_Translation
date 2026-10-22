# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Count' [0..10] тип=провал
    старт: [3]
    [0..10] Параметр номер 1: <>
    критическое: "Control system locked. Activating remote technical support mode. Transaction complete. Control syst…
- P2 'Text' [1..23] тип=успех
    старт: [1]
    [1..23] Параметр номер 2: <>
    критическое: "Access code accepted. Control system unlocked," the onboard computer says, reacting to your actions…
- P3 'ext_Money' [0..999999999] тип=обычный
    старт: [1000]
    [0..999999999] Параметр номер 3: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'MoneyNYAM' [0..999999999] тип=обычный
    старт: [0]
    [0..999999999] Параметр номер 4: <>
    критическое: Сообщение достижения критического значения параметром 4
- P5 'ext_Luck' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Параметр номер 5: <>
    критическое: Сообщение достижения критического значения параметром 5

## Локации и переходы

### Loc1 [СТАРТ]
    выбор описания: {[p2]}
    Loc1-1: You wake up on the flight deck ceiling, wearing a ripped <clr>Pucci<clrEnd> spacesuit and a handmade cap with the words <clr>"Textbook Penchequack"<clrEnd> writ…
    Loc1-2: In a desperate attempt to save your remaining drops of sanity, you bang your head on the ceiling. The flight deck begins whirling even faster, but the Faeyan vo…
    Loc1-3: After lying in an unnatural position for a few minutes you realize that the world is whirling before your eyes because the ship itself is spinning, and the arti…
    Loc1-4: You desperately rack your brain, trying to remember the events of the past few hours. Alas, this results in nothing but a prickly feeling in your rear.
    Loc1-5: You groan, mumble, and strain your mind as hard as you can. You even try to bite the cactus that has somehow materialized underneath you. However, the only posi…
    Loc1-6: This attempt results in two things.  / <clr>The good news<clrEnd> is that, as it turns out, you are as good at singing and talking falsetto as Homo de Pedro, th…
    Loc1-7: It doesn't work. Maybe you should try again.
    Loc1-8: Again, it doesn't work. Perhaps because the only way to reach the control panel is to jump.
    Loc1-9: You jump way too high. You knock your head on the protective head support. And now you are laying on the ceiling, resting, counting stars through the porthole a…
    Loc1-10: This attempt proves more successful: you grab the head support, pull yourself up, and mount the steering yoke. You take one last sad look at the head support wh…
    Loc1-11: "I've had enough! I'm not going to talk to you!" Your memory would have given this answer, if it could speak. Luckily, eloquence is not one of its strengths, so…
    Loc1-12: Luckily, your reflexes, independent of your memory, are happy to guide you to the bottle of <clr>Stoned Bastard<clrEnd>, vintage <clr>3268<clrEnd>, stashed in t…
    Loc1-13: Unfortunately, the dosage isn't written on the container. To get the desired effect as soon as you can, you drain the bottle in one big gulp, munching on the ca…
    Loc1-14: It doesn't work. Did you expect anything different? Well, at least you got some sleep. / When you wake up, you are happy to realize that the steering yoke has c…
    Loc1-15: Your memory decides to have mercy on you. It reminds you about the huge <clr>HINT<clrEnd> button on the panel screen located below the tiny access code input fi…
    Loc1-16: "Thank you for pressing the <clr>HINT<clrEnd> button - the last chance for a stoned, wasted, drunk dumbhead like you," the onboard computer notification system …
    Loc1-17: "Guess a number now, just do.  / Take the digit four times two / then just add one hundred-two. / Change the middle part to zero, / And divide it all by four. /…
    Loc1-18: "Wrong guess!" replies the computer.
    Loc1-19: "Wrong guess! Try again!" says the computer.
    Loc1-20: "Good try! But no cigar," the computer reacts to your miserable attempts.
    Loc1-21: "Try harder, and next time you'll succeed... Perhaps," muses the computer over your failure.
    Loc1-22: "What a mind! You don't belong out in space," the computer reacts to your answer immediately.
    Loc1-23: "Access code guessed correctly," the onboard computer reacts to your actions.
    скрыт: P1,P2,P3,P4,P5
  -> Path2 => Loc1  вер=1 порядок=5
       текст: Save your brain
       условия: логика {[p1]>=3 and [p2]=1}
       эффект: P2(Text) = 2
       эффект: P4(MoneyNYAM) = {[p3]/30+2}
  -> Path3 => Loc1  вер=1 порядок=5
       текст: Wait for the flight deck to stop whirling, then get your bearings
       условия: логика {[p1]>=3 and [p2]=2}
       эффект: P2(Text) = 3
  -> Path4 => Loc1  вер=1 порядок=5
       текст: Remember what happened
       условия: логика {[p1]>=3 and [p2]=3}
       эффект: P2(Text) = 4
  -> Path5 => Loc1  вер=1 порядок=5
       текст: Try very hard to remember what happened
       условия: логика {[p1]>=3 and [p2]=4}
       эффект: P2(Text) = 5
  -> Path6 => Loc1  вер=1 порядок=5
       текст: Try to activate voice control
       условия: логика {[p1]>=3 and [p2]=5}
       эффект: P2(Text) = 6
  -> Path7 => Loc1  вер=1 порядок=5
       текст: Try to reach the control panel
       условия: логика {[p1]>=3 and [p2]=6}
       эффект: P2(Text) = 7
  -> Path8 => Loc1  вер=1 порядок=5
       текст: Try to reach the control panel once again
       условия: логика {[p1]>=3 and [p2]=7}
       эффект: P2(Text) = 8
  -> Path9 => Loc1  вер=1 порядок=5
       текст: Try to jump up to the control panel
       условия: логика {[p1]>=3 and [p2]=8}
       эффект: P2(Text) = 9
  -> Path10 => Loc1  вер=1 порядок=5
       текст: Finish counting stars and try to jump up to the control panel again
       условия: логика {[p1]>=3 and [p2]=9}
       эффект: P2(Text) = 10
  -> Path11 => Loc1  вер=1 порядок=5
       текст: Realize that no voice sample will work this time. Howl in desperation. Then try to remember the code
       условия: логика {[p1]>=3 and [p2]=10}
       эффект: P2(Text) = 11
  -> Path12 => Loc1  вер=1 порядок=5
       текст: Try to booze up your mind
       условия: логика {[p1]>=3 and [p2]=11}
       эффект: P2(Text) = 12
  -> Path13 => Loc1  вер=1 порядок=5
       текст: Quit thinking and take the damn medicine
       условия: логика {[p1]>=3 and [p2]=12}
       эффект: P2(Text) = 13
  -> Path14 => Loc1  вер=1 порядок=5
       текст: Evaluate the effects of the drug
       условия: логика {[p1]>=3 and [p2]=13}
       эффект: P2(Text) = 14
  -> Path15 => Loc1  вер=1 порядок=5
       текст: Ask your memory to quit bitching and to give you at least one tiny important hint
       условия: логика {[p1]>=3 and [p2]=14}
       эффект: P2(Text) = 15
  -> Path16 => Loc1  вер=1 порядок=5
       текст: Silently call yourself a dumb Asasot sucker and press the sensor button that says <clr>HINT<clrEnd>
       условия: логика {[p1]>=3 and [p2]=15}
       эффект: P2(Text) = 16
  -> Path17 => Loc1  вер=1 порядок=5
       текст: Keep listening and reading
       условия: логика {[p1]>=3 and [p2]=16}
       эффект: P2(Text) = 17
       эффект: P1(Count) = 2
  -> Path18 => Loc1  вер=1 проходов<=1 порядок=3
       текст: Enter password: <clr>three<clrEnd>
       условия: логика {[p2]>=17 and [p2]<=23 and [p1]>0 and [p1]<=2}
       эффект: P2(Text) = 18
       эффект: P1(Count) -1
       эффект: P5(ext_Luck) -3
  -> Path19 => Loc1  вер=1 проходов<=1 порядок=4
       текст: Enter password: <clr>four<clrEnd>
       условия: логика {[p2]>=17 and [p2]<=23 and [p1]>0 and [p1]<=2}
       эффект: P2(Text) = 19
       эффект: P1(Count) -1
       эффект: P5(ext_Luck) -3
  -> Path20 => Loc1  вер=1 проходов<=1 порядок=8
       текст: Enter password: <clr>eight<clrEnd>
       условия: логика {[p2]>=17 and [p2]<=23 and [p1]>0 and [p1]<=2}
       эффект: P2(Text) = 20
       эффект: P1(Count) -1
       эффект: P5(ext_Luck) -3
  -> Path21 => Loc1  вер=1 проходов<=1 порядок=6
       текст: Enter password: <clr>six<clrEnd>
       условия: логика {[p2]>=17 and [p2]<=23 and [p1]>0 and [p1]<=2}
       эффект: P2(Text) = 21
       эффект: P1(Count) -1
       эффект: P5(ext_Luck) -3
  -> Path22 => Loc1  вер=1 проходов<=1 порядок=7
       текст: Enter password: <clr>seven<clrEnd>
       условия: логика {[p2]>=17 and [p2]<=23 and [p1]>0 and [p1]<=2}
       эффект: P2(Text) = 22
       эффект: P1(Count) -1
       эффект: P5(ext_Luck) -3
  -> Path23 => Loc1  вер=1 проходов<=1 порядок=5
       текст: Enter password: <clr>five<clrEnd>
       условия: логика {[p2]>=17 and [p2]<=23 and [p1]>0 and [p1]<=2}
       эффект: P2(Text) = 23
       эффект: P5(ext_Luck) +3
  -> Path24 => Loc1  вер=1 проходов<=1 порядок=5
       текст: Notice that the code input field has disappeared. Brace yourself and await that utter disaster
       условия: логика {[p1]<=0}
       эффект: P1(Count) = 10
       эффект: P3(ext_Money) = {[p3]-[p4]}

## Анализ
- стартовых: [1]
- концовки: {}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
