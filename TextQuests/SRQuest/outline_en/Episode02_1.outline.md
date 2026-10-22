# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Hearing an incoming call alert, you press the button to accept the call. A weirdly-dressed Faeyan appears on the screen. Without giving you any time to properly…
  -> Path2 => Loc2  вер=1 порядок=5
       текст: What?

### Loc2 [обычная]
    Loc2-1: "Don't trust anyone. Got it? Good! / By the way, a personal request for you: take off that badge with your name and other information. Makes you look silly. / A…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Wait, was your message a joke? Or is it true?

### Loc3 [УСПЕХ]
    Loc3-1: Session ended.

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
