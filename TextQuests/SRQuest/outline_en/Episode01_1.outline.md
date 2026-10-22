# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Hearing an incoming call alert, you press the button to accept the call. A Peleng appears on the big screen. Judging by his looks, it's a long-distance pilot wh…
  -> Path2 => Loc2  вер=1 порядок=5
       текст: What happened here?

### Loc2 [обычная]
    Loc2-1: "A space station, a big company party, a huge asteroid, lots of debris. That's the official version. Now we'll just have to hang here like rotting pears until t…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Wait, don't log off!

### Loc3 [УСПЕХ]
    Loc3-1: Session ended.

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
