# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Hearing an incoming call alert, you press the button to accept the call. An aging man appears on the big screen and addresses you. / "<Ranger>, what a lucky mee…
  -> Path2 => Loc2  вер=1 порядок=5
       текст: Uncle Benny?! What are you doing here?

### Loc2 [обычная]
    Loc2-1: "They made me an offer I couldn't refuse. You know, eternal life is a pretty rare thing, even life like this. Anyway, they're asking for me. Talk to you another…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Wait, tell me, why are you here?

### Loc3 [УСПЕХ]
    Loc3-1: Session ended.

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
