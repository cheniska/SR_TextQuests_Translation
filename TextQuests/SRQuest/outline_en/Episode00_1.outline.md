# Квест (формат 1111111127)
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Hearing an incoming call alert, you press the button to accept the call. A figure appears on the big screen. His face seems familiar. As you're trying to rememb…
  -> Path2 => Loc2  вер=1 порядок=5
       текст: As always, 24/7, no holida... Gref?! I saw you killed by the Dominators in 3302, in the Atria system!

### Loc2 [обычная]
    Loc2-1: "Oh, really? Interesting. Thanks for the warning. I'll try to be careful in 3302 and stay clear of Atria. Now, please excuse me, Ranger <Ranger> – I've been cle…
  -> Path3 => Loc3  вер=1 порядок=5
       текст: Gref, wait!

### Loc3 [УСПЕХ]
    Loc3-1: Session ended.

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
