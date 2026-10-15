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

## Обновление 2026-10-15 (новый ToTranslate_2026_10_15.zip)
Мод сильно расширен (959 → 2113 строк): новые анклавы Junkmongers («Барахольщики»), Second Line («Вторая линия»), Whalers («Китобои»), Subsoil Wardens («Стражи Недр»), новые услуги ЦН (сбор трофеев, вывоз добычи, крупная цель, освобождение системы, гарнизон, блокада, разведка, поиск артефакта, элитный эскорт), микромодули, книги. Переведено 220 новых уникальных RU, остальное — прежние переводы (по пути/значению).
- Имена (строгий транслит): Kvashshyrk Zhabbul, Lioel Meyron, Skryzhg Harpoon (прозвище переведено), Pavlin Tret-Yakov.
- NameGen — атрибутивная форма (Junkmonger, Whaler, Second Line, Subsoil Warden): «<OrgGen> mercenaries». Фразы с @O/<Org> построены нейтрально к числу (will only…, is kept by @O).
- «Стражи Недр» → Subsoil Wardens, «Каратель Глубин» → Depth Punisher (мой вариант, на проверку). «Барахольщики» → Junkmongers (мой вариант).
- Звания в «Рейд»: кадет/юнга → Rookie/Ship Boy (по ванилле).
- Исправлено в старом переводе: апострофы в JS-строках MessageBox (FeiMessages) — needn't/I'm/It's → без сокращений.
- ShuMercsHQ: 3 изменённых строки (<OrgList>) — «As you know, at the moment in the Galaxy <OrgList>.»; в OrgList* добавлены глагольные формы («the following mercenary factions are active»). Там же `couldn't` → `could not` в JS-строке DurableAluminumCase.
