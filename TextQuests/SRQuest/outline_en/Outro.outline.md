# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: You wake up at a research center, and deep inside you understand that this is how real victory should feel. Your victory. Somebody puts their arm on your should…
  -> Path2 => Loc2  вер=1 порядок=3
       текст: I'm Ranger <Ranger>, and I was fulfilling your req... Professor Ze-Braya, disable all main data centers immediately!

### Loc2 [обычная]
    Loc2-1: "Unthinkable! Do you realize what would happen if the Galanet went down? Do you know how many problems we faced when we had to disable the Dagod Data Center due…
  -> Path4 => Loc4  вер=1 порядок=5
       текст: You've got to understand that this X-crap wants to take control over all of the computers in the Galaxy via the Galanet! The Dagod data center is immune to its …

### Loc3 [УСПЕХ]
    Loc3-1: "I think we'll soon find a way to answer these and other questions. Get well, ranger <Ranger>. A new missions awaits..." / Hey, look, the show's about to begin!

### Loc4 [обычная]
    Loc4-1: "Even so, this decision would have to be properly arranged and coordinated with the Galactic Council! Uhhh, why did the lights go out? I guess that's our power …
  -> Path5 => Loc5  вер=1 порядок=5
       текст: But I understand everything now. As a ranger, I order you all to leave the laboratory right now! NOW! Otherwise you'll end up staying here forever!

### Loc5 [обычная]
    Loc5-1: The moment you and the scientists leave the room, the first rockets launched by the robofliers hit the laboratory. For the next few minutes, everything is shaki…
  -> Path6 => Loc6  вер=1 порядок=5
       текст: They want Allusion. He's trying to take over the command center. If we don't save him, everything is lost. Hurry!

### Loc6 [обычная]
    Loc6-1: At that moment the robofliers launch another salvo of rockets which hit the target after a few seconds. You're thrown back by the blast. You hit your head on so…
  -> Path7 => Loc7  вер=1 порядок=5
       текст: Wake up

### Loc7 [обычная]
    Loc7-1: You open your eyes slightly and see that you're lying on a hospital bed. Professor Ze-Braya is sitting on a chair next to you, checking some data on his hologra…
  -> Path8 => Loc8  вер=1 порядок=5
       текст: What about Allusion? Is he alive?

### Loc8 [обычная]
    Loc8-1: "What could possibly happen to him inside an autonomous armored sarcophagus? By the way, he told us about the transcoders and explained how to eradicate the pla…
  -> Path3 => Loc3  вер=1 порядок=3
       текст: Thank you. All this is well and good, but many questions still bother me: how did the transcoders get onto our world? Is the command center actually the governi…

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
