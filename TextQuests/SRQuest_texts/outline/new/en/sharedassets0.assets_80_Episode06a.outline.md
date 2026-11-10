# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Text' [1..10] тип=обычный
    старт: [1]
    [1..10] Параметр номер 1: <>
    критическое: Сообщение достижения критического значения параметром 1

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: A black dot appears straight ahead of your ship, slowly growing bigger and bigger. A couple of minutes later, you realize that it's located inside the flight de…
    скрыт: P1
  -> Path2 => Loc2  вер=1 порядок=5
       текст: ALLUSION!

### Loc2 [обычная]
    Loc2-1: "Huh? What? Are we there yet?" sounds a familiar voice, bringing you back to life. A moment later, the black veil is lifted from your mind. Once again, you find…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: I remember this place. There used to be a system here...

### Loc3 [обычная]
    выбор описания: {[p1]}
    Loc3-1: "You could be right, <Ranger>. In your virtual world, it's a memorable location. In mine, it's the place where the visualization ends and nonbeing begins. Unend…
    Loc3-2: "<clr>Nakiyaki<clrEnd> spent a long time persuading me to join him and the Transcoders, in that very order. Trying to prove all the benefits of the new world or…
    Loc3-3: "They are pretty similar to ours. As I have already told you, to solve the compatibility problem, the transcoders had to downgrade to our level of development, …
  -> Path4 => Loc4  вер=1 проходов<=1 порядок=5
       текст: I wonder how you managed to find this place.
       условия: логика {[p1]=1}
       эффект: P1(Text) = 2
  -> Path5 => Loc5  вер=1 проходов<=1 порядок=4
       текст: One more question: where did you learn so much about the operating principles of the Transcoders' command center?
       условия: логика {[p1]>=2}
       эффект: P1(Text) = 3
  -> Path6 => Loc6  вер=1 порядок=5
       текст: Time to decide who does what
       условия: логика {[p1]>=2}

### Loc4 [пустая]
  -> Path8 => Loc3  вер=1 порядок=5

### Loc5 [пустая]
  -> Path9 => Loc3  вер=1 порядок=5

### Loc6 [обычная]
    Loc6-1: "We don't have any options. My consciousness is looped. It would be fair to say that I'm part of this machine already. Even if we hack its defense systems, I ca…
  -> Path7 => Loc7  вер=1 порядок=5
       текст: What am I to do, then?

### Loc7 [УСПЕХ]

## Анализ
- стартовых: [1]
- концовки: {7: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
