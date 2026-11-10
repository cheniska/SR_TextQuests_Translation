# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Hearing an incoming call alert, you press the button to accept the call. A Maloq in a military uniform appears on the big screen. He salutes and addresses you: …
  -> Path2 => Loc2  вер=1 порядок=5
       текст: I know that you and the world around me are not real. It's a digital projection. I also know how the Gralgar fight will end. I definitely don't need to go there…

### Loc2 [обычная]
    Loc2-1: "Yes? Well, I won't be bothering you anymore. I'm off."
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Communications closed!

### Loc3 [УСПЕХ]
    Loc3-1: "I'm aware of this."

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
