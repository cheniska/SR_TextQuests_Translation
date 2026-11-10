# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Hearing an incoming call alert, you press the button to accept the call. An aging man that you already know appears on the big screen. / "I'm glad to see you're…
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Uncle Benny, how could you?

### Loc2 [обычная]
    Loc2-1: "Don't interrupt me. I've made my choice, and it's too late to change it. But the way is open for you. So wipe that absurd despair from your face and think for …
  -> Path3 => Loc3  вер=1 порядок=5
       текст: But how? Well, it was silly to expect an actual answer instead of a standard service message...

### Loc3 [УСПЕХ]
    Loc3-1: "Perhaps our communication is over, but I'll give you a piece of advice: go with the flow, and it'll lead you to the truth. I'm sure that along the way, you'll …

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
