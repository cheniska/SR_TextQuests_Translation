# Квест (формат 1111111127)
Комментарий: Добавлена динамическая сумма пожертвований и увеличена удача
Сложность 50; стартовая локация: [1]; путей по умолчанию: 0

## Параметры
- P1 'Описание' [0..3] тип=обычный
    старт: [0]
    [0..3] Description: <>
    критическое: Сообщение достижения критического значения параметром 1
- P2 'ext_Money' [0..1000000000] тип=обычный
    старт: [50000]
    [0..1000000000] ext_Money: <>
    критическое: Сообщение достижения критического значения параметром 2
- P3 'ext_Luck' [0..100] тип=обычный
    старт: [0]
    [0..100] ext_Luck: <>
    критическое: Сообщение достижения критического значения параметром 3
- P4 'Кратность денег' [0..100000000] тип=обычный
    старт: [0]
    [0..100000000] Кратность денег: <>
    критическое: Сообщение достижения критического значения параметром 4

## Локации и переходы

### Loc1 [СТАРТ]
    Loc1-1: Suddenly, the green light indicating an incoming call flashes on your intercom. A really mysterious someone is trying to get in touch with you: the radar isn't …
    эффект: P4(Кратность денег) = {(([p2]>25000)*([p2]*3/100))+(250*([p2]<=25000))} [скрыт]
    скрыт: P1,P2,P3
  -> Path2 => Loc2  вер=1 порядок=1
       текст: Down to business, dear sir!
       эффект: P1(Описание) = 1
  -> Path3 => Loc2  вер=1 порядок=2
       текст: Not even this very minute - this very second, I would say!
       эффект: P1(Описание) = 2

### Loc2 [обычная]
    выбор описания: {[p1]}
    Loc2-1: The Gaal on the screen sighs heavily: / "In short, we could use a small donation. Begging for money is dishonorable, but my soul is beyond saving already, and y…
    Loc2-2: "Yes, this very second... Erm, what was I talking about? Ah, right. I see you are a man capable of helping a fellow living creature in need."  / The Gaal takes …
  -> Path4 => Loc3  вер=1 [всегда видна] порядок=1
       текст: Donate {[p4] * 2} cr.
       условия: логика {[p2]>=[p4]*2}
       эффект: P2(ext_Money) = {[p2]-([p4]*2)}
       эффект: P1(Описание) = 1
       эффект: P3(ext_Luck) +10
  -> Path5 => Loc3  вер=1 [всегда видна] порядок=2
       текст: Donate [p4] cr.
       условия: логика {[p2]>=[p4]}
       эффект: P2(ext_Money) = {[p2]-[p4]}
       эффект: P1(Описание) = 1
       эффект: P3(ext_Luck) +4
  -> Path6 => Loc3  вер=1 порядок=3
       текст: Donate nothing
       эффект: P1(Описание) = 2
       эффект: P3(ext_Luck) -4

### Loc3 [УСПЕХ]
    выбор описания: {[p1]}
    Loc3-1: The Gaal's face brightens: / "Please accept my thanks on behalf of the Maloqi children that I represent! Success to you in all your efforts!" / Having said this…
    Loc3-2: The Gaal's face darkens: / "Well, you've made your choice! All donations are voluntary: we cannot force anyone to give us money by threatening to curse them, or…

## Анализ
- стартовых: [1]
- концовки: {3: 'УСПЕХ'}
- недостижимые локации: []
- тупики без концовки: []
- пути в несуществующую локацию: []
- параметры без использования: []
