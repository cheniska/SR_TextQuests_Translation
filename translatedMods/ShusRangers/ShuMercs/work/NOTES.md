# ShuMercs RU→EN: заметки (2026-10-11)
Пайплайн как у ShuMercsHQ (`tools/ext.py`→`mk.py`→`w/pNN.txt`→`pc.py`→`ap.py`); 506 строк, 449 уникальных RU. `w/p00.txt` — 25 строк, взятых готовыми из ShuMercsHQ (ранги, «Mercenary Center», «Over and out» и пр.); остальное — p01–p03.
Проверено: 1294 строки = RU, ключи/структура те же, кириллицы нет, токены (`<…>`, `@X`, cnt/cost/date, `\"`) сохранены.

## Сверка
- Ванилла: Attack/Mobility/Technology/Commerce/Charisma/Leadership skill, Gripper power/range, Scanner power; в p01 ShuMercsHQ «Maneuverability skill» исправлено на «Mobility skill» (в готовом Lang HQ этой строки нет).
- Организации/термины — по ShuMercsHQ: Atlant private security firm, "Red Hatchets" squad, Faeyangelion Corporation, Mercenary Center, Free Port.

## Решения (предварительные, на проверку)
- Имена: Kaylo Nort, Elayma Fey, Bordyurg Yebryn (строгий транслит; «Фэй» не «Fei»).
- Названия ЦН по историческим наёмникам: Exchange, Jager, Hessian, Landsknecht, Condottiere, Hoplite, Varangian, Alan, Routier, Almogavar, Stratiote, Grenzer, Reiter, Haiduk, Streltsy, Genoese, Venetian, Buccaneer, Phoenician, Ronin.
- Корабли: Elendar, Haag-nor, Drak'ror, Shukryamba, Hatchet, Atlant, Wanderer, Fey. «Мерценарий» → "Mercenarius" Hull.
- «облёт» → survey flight; «премии» → "bonuses"; «Кодекс Потребителя» → Consumer Code; «Ваш Б.Г.» → Your B.G. (инициалы оставлены); «Компромат» → Kompromat.
- Лидер «Красных топоров»: «Ебрын» — грубая этимология; оставлен транслит (как «Всрат» в HQ).

## Решено пользователем (2026-10-11)
- «Ваш Б.Г.» → Your B.G. (инициалы) — да. «Бродяга» → Wanderer — да.
- Red Hatchets проверено по ванилле (везде Hatchets); в Logic_eng «Red Axes» исправлено на Red Hatchets, имя командира в квестах (Бедилаш, TheBeerQuest) не менять.

## Мелочи без решения
- Строки 236/237 («контракт на убийство (<0>) дней») в RU обрывочны; переведено буквально: "kill contract (<0>) days".
- «Kompromat» оставлено как калька; можно "Dirt on Nort", если не нравится.
