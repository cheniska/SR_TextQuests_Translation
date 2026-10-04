# QUESTS — перевод текстовых квестов Space Rangers (RU → EN)

Инструкции для новой сессии. Читать целиком, затем `Translation/TRANSLATION_GUIDE.md`.
Общение с пользователем — по-русски; текст квестов — английский (американская орфография).

## Где что
| Что | Где |
|---|---|
| Правила и методика | `Translation/TRANSLATION_GUIDE.md` (перевод), `KR1_REVIEW_GUIDE.md` (вычитка), `LORE_GUIDE.md` (лор) |
| Словарь терминов/имён | `Translation/GLOSSARY.md` (таблица `\| RU \| EN \| Квест \|`, дописывать в конец) |
| Словарь модов | `Translation/GLOSSARY_MODS.md` (термины/имена модовых квестов: Rev*, Ref*, Shu*, Xeno*…; канон — в GLOSSARY.md) |
| Лор | `Translation/lore/LORE_FACTS.md` («## Индекс по квестам» + раздел квеста в конец) |
| Очередь/журнал | `Translation/STATUS.md`; авто-сводка `QUEST_STATUS.txt` (генерит `qstatus.py`, ручной словарь MANUAL внутри) |
| Тексты | `TextQuests/<Мод>/Rus/<Name>.txt` (НЕ менять) → `Eng/<Name>.txt`; заметки `Eng/notes/<Name>_notes.txt` |
| Рабочие файлы | `Translation/work/` (в git не попадает; после квеста всё удалять) |

## Жёсткие правила (решения пользователя)
- Только txt (UTF-16LE+BOM, CRLF). **qmm не трогать. Русские txt никогда не менять.**
- Новые термины/имена — сообщить пользователю в ответе и сразу занести в GLOSSARY.md. Лор — в LORE_FACTS.md с квестом-источником.
- Одинаковые/почти одинаковые RU-фразы → одинаковый EN (check ловит: ошибка/предупреждение).
- Имена людей ТРАНСЛИТЕРИРУЕМ (не адаптируем). Название фразы-танца и т.п. — как решил пользователь (напр. lyalyakush).
- Время глаголов — по контексту RU-записи; внутри записи единое. Эвристика: `py -3.14 tense.py <Rus.txt> <N> < /dev/null`.
- Токены (`<clr>…<clrEnd>`, `<Ranger>`, `<ToPlanet>`, `<FromPlanet>`, `<Date>`, `<Money>`, `<>`, `[pN]`, `{…}`) — дословно. В репликах прямые `"` и ` - `; оформление реплик — КАК В RU ДАННОГО КВЕСТА (в RU тире → в EN тире `- Text, - said X.`, не кавычки; решение пользователя 2026-10-04; проверка `python3 qdialog.py < /dev/null`, исправление `--write`; тексты разработчиков SR2HD приведены так же 2026-10-04 — `--dev`). Имена авторов в титрах не переводим (латиница как есть, кириллица — транслит в авторском порядке).
- Новый квест без указания пользователя не начинать; спорное — в notes и вопросом пользователю.
- КР1: оставшиеся квесты ПЕРЕВОДИТЬ С RU ЗАНОВО (решение пользователя 2026-10-02: английский КР1 машинный, вычитка не окупается — опыт Menzols). Английский КР1 — только справочник: сверка написания терминов/имён/названий (с проверкой по глоссарию) и подсказка в тёмных местах.
- Имена из КР1 не принимать на веру: проверять пол персонажа по RU и реальную форму имени (Rene/Renee, Jean/Jeanne), искать персонажа по всем квестам (напр. «Р. Маккалистер» в Bank = Рене Маккалистер в Menzols).
- ЭПОХИ (решение пользователя 2026-10-03): действие КР1 (SR1TextQuests) — около 3000 г., SR2HD (DevTranslated и Untranslated) — около 3300 г., т.е. на ~300 лет позже. Учитывать в лоре, глоссарии и персонажах: персонажи КР1 и SR2HD — разные люди (кроме явно долгоживущих/исторических упоминаний); одноимённых не отождествлять; события КР1 для SR2HD — история «~300 лет назад» (напр. Клисанская война ~3000 г.); факты о расах/быте одной эпохи для другой — «ср.», а не «то же самое»; моды — по эпохе своей базовой игры (если неясно — уточнять по тексту и помечать [неясно]).
- ГРАММАТИКА (2026-10-03): `python3 qgrammar.py run [sr1 sr2 mods dev] [--files X] < /dev/null` — офлайн LanguageTool по всему корпусу (первый запуск сам ставит его через Maven в ~/.cache/qgrammar, ~1.5 мин на корпус). Читать только `Translation/work/grammar_report.txt`; ложные срабатывания — в `Translation/GRAMMAR_IGNORE.txt` (после разбора отчёта: `--learn`). После каждого нового квеста — прогон по нему (`--files X`). Орфография — американская ВЕЗДЕ, включая тексты разработчиков (решение пользователя 2026-10-03).
- СТРУКТУРА ВСЕГО КОРПУСА (2026-10-03): `python3 qcheck_all.py [подстрока...] [-v] < /dev/null` — для каждого Eng-файла находит RU-оригинал и прогоняет qtr_struct + qtr.compare; таблица, итог, список RU без английской пары. Сейчас все 110 — 0 проблем (Pizza Path78b: в RU непарный `<clrEnd>Белые<clrEnd>`, в EN исправлено на `<clr>white<clrEnd>` — qtr.py это допускает; ShuQuest Colonization собран из нашего SR2HD Colonization + Par49-1, 2026-10-03).
- Попутно с переводом/вычиткой: любые лорные факты из RU — в LORE_FACTS.md, любые новые термины — в GLOSSARY.md; после сборки — `qtr_struct.py` (структура txt = RU).

## Среда
- Python ТОЛЬКО `py -3.14 файл.py < /dev/null` (никогда `py -3.14 -`); в Bash `export PYTHONUTF8=1`.
  В облачной сессии (Linux) лаунчера `py` нет — те же скрипты запускать `python3 файл.py ... < /dev/null`.
- Очень длинный перевод передавать через Write в файл-скрипт/текст (в командной строке Bash лимит длины — ENAMETOOLONG).
- Пути КР1: `R=TextQuests/SR1TextQuests`, `W=Translation/work`.

## Быстрый цикл (проверен на ~15 квестах КР1)
```
cd QUESTS; export PYTHONUTF8=1; R=TextQuests/SR1TextQuests; W=Translation/work
py -3.14 qtr.py unpack $R/Rus/X.txt $W < /dev/null
py -3.14 qtr.py todo   $R/Rus/X.txt $W/X.todo.txt < /dev/null     # уникальные RU
# Read todo кусками ~110-250 строк -> перевод в $W/X.pNN.txt (каждая часть начинается с типизированной записи;
#   `*<TAB>` — продолжение, пустой абзац — `*<TAB>`); либо один Write-скрипт, пишущий X.todo_en.txt
py -3.14 qtr_partcheck.py X < /dev/null                           # если делал по частям; потом cat X.p??.txt > X.todo_en.txt
py -3.14 qtr.py fill $R/Rus/X.txt $W/X.todo_en.txt $W/X.work.txt < /dev/null   # раскладка на точные повторы
py -3.14 qtr.py pack $W/X.work.txt $R/Rus/X.txt $R/Eng/X.txt < /dev/null       # check должен быть 0/0
py -3.14 qtr_struct.py $R/Eng/X.txt $R/Rus/X.txt < /dev/null                  # структура: BOM, CRLF, типы, строки/абзацы = RU; должно быть 0
```
Затем: `Eng/notes/X_notes.txt` (термины, сомнения, смысл), строка в `Translation/STATUS.md`
(`| Имя | дата | N (M уникальных) | переписан заново | время по контексту RU; check 0/0 |`), запись в `MANUAL` в `qstatus.py`
(`('SR1TextQuests','X'): ('ВЫЧИТАН','дата','да','переписан заново; check 0/0')`) + `py -3.14 qstatus.py < /dev/null`,
GLOSSARY.md, LORE_FACTS.md, удалить файлы `X.*` из `Translation/work`.
Правка готового Eng-файла (UTF-16): Python-скрипт: decode utf-16 → replace → писать `b'\xff\xfe'+s.encode('utf-16-le')`, затем `qtr.py check`.

## Работа нескольких агентов / передача (2026-10-04)
- Источник истины — ветка `main`. Перед началом: `git pull origin main`; работать в своей ветке, коммит+push после каждой единицы работы; в `main` сливать только по указанию пользователя (fast-forward/merge, без force-push). Два агента НЕ правят один квест одновременно — квест «занимается» строкой `wip` в STATUS.md (закоммитить сразу).
- Перед коммитом любой правки Eng-файлов: `python3 qcheck_all.py < /dev/null` (весь корпус ~2–3 мин; лучше в фоне или с подстрокой, напр. `qcheck_all.py SR2HD`), `python3 qdialog.py < /dev/null` (0 строк), по изменённым — `qgrammar.py run ... --files X`. Должно быть 0 проблем.
- Облачная сессия (Linux): `python3 - <<EOF ... </dev/null` НЕ работает (поздний `< /dev/null` подменяет heredoc) — писать скрипт в файл и запускать `python3 файл.py < /dev/null`. Массовые удаления — только с защитой переменных (`"${d:?}/${s:?}"`). Текст разработчиков бывает с фигурными кавычками (“ ” ’) — у нас везде прямые.
- Что осталось (НЕ начинать без указания пользователя): моды ExpBeerQuest (TheBeerQuest), RefLongerPrison (Prison), XenoZeroSignalQuest (ZeroSignal), ShuQuest (LongLiveTheRanger, PirateClanPrison, Prison, PrisonMenu, mark05 — сначала сверить с уже готовыми RefQuest/LongLiveTheRanger, ShuPrison, DevTranslated Prison/PirateClanPrison через `qreuse.py`). Всё остальное (КР1, SR2HD целиком, AdvancedQuests, RefQuest, RevTextQuests, ShuPrison, ShuQuest/Colonization) — готово.
- `SR1TextQuests/Eng/*rus - NN тыс.txt` — старые справочные файлы, не квесты (qcheck_all их не сопоставляет); не удалять без указания.

## Текущее состояние (2026-10-02; актуальный итог — раздел выше и STATUS.md)
- КР1 (SR1TextQuests): готово 25 из 25 (Penetrator, Bank, Boat, Menzols, Fishing, Bondiana, Casino, Commando, Diamond, Examen, Galaxy, Gobsaur, Hachball, Murder, Newflora, Poroda, Rush, Siege, Tomb, Gladiator, Diehard, Energy, Ikebana, Build, Spy).
- КР1 ЗАВЕРШЁН 2026-10-02 (все 25: check 0/0, qtr_struct 0).
- AdvancedQuests (мод): Yahtzee переведён 2026-10-03 — мод завершён.
- RefQuest (мод) ЗАВЕРШЁН 2026-10-03: Yahtzee_pravki, Muzon, Siege, Hospital, SpaceCraft, Abandoned, GS, LongLiveTheRanger (все с RU; check 0/0, struct 0, грамматика). Цикл модов: `qreuse.py` → части в `Translation/work/X.pNN.txt` → `qtr_partcheck.py X` → `qbuild.py RU EN` → check/struct/`qgrammar.py run mods --files X.txt` → `qfinish_mod.py` → `qcheck_all.py`.
- Перепроверка времён в Bank — выполнена 2026-10-02 (времена соответствуют RU, 4 мелкие правки). «гомока» → gomoka — принято пользователем.
- Структура всех готовых квестов КР1 проверена `qtr_struct.py` — 0 расхождений.
- АВТОРЕЖИМ 2026-10-02 завершён (КР1 доделан); спорное копилось ниже. Оформление: `python3 qfinish.py ...` (см. шапку файла).
- ВОПРОСЫ ПОЛЬЗОВАТЕЛЮ (накоплено): (1) [снят: в Build только племя Уги] (2) [удалён Eng/Menzolsrus.txt по решению пользователя] (3) Gladiator — РЕШЕНО: Dreadround, Dreaddy, TOLLOSOOOM; Ytsokhen/Grok — одобрено; (4) [РЕШЕНО: Fishing Loc165-1 → "invented clockwise"] (5) пародийные имена — РЕШЕНО 2026-10-02 (см. конец GLOSSARY.md): принцип «сохраняем отсылку, если звучание не меняется».
- ИМЕНА: перед каждым квестом сверять ВСЕ имена персонажей (и из глоссария КР1) со строгим транслитом (х→kh, ж→zh, ц→ts, й→y, ё→yo, -ский→-sky); 2026-10-02 исправлены Tomb, Diehard, Bank, Casino, Murder, Siege, Rush (см. конец GLOSSARY.md).
- МОДЫ: RevTextQuests (2026-10-02, по указанию пользователя): Cybersport и Massacri готовы (RevTextQuests завершён 2026-10-02). Лор модов — ОТДЕЛЬНО в `Translation/lore/LORE_FACTS_MODS.md`. Термины/имена модов — ОТДЕЛЬНО в `Translation/GLOSSARY_MODS.md` (решение пользователя 2026-10-02). Аббревиатуры (параметры и пр.) расшифровывать, в т.ч. по формулам qmm (только чтение) и контексту; сомнительное — вопрос пользователю. Старые англ. копии в корне репо (Cybersport.txt, Massacri.txt) — только справочник.
- SR2HD: с 2026-10-04 (решение пользователя) ВСЕ квесты лежат в одной папке `questsRus/` → `questsEng/` (без подпапок). «Untranslated» — 38 квестов, НЕ переведённых разработчиками (список и условия — `questsEng/readme.txt`; Moi из них наш); «DevTranslated» — 42 квеста разработчиков, их список — `DEV` в `qcheck_all.py` (`is_dev()`; используют qdialog.py `--dev`, qgrammar.py группы sr2/dev). Заметки — `questsEng/notes/`. ПЕРЕВОД Untranslated начат 2026-10-02 (по указанию пользователя, по порядку STATUS.md): готово — Amnesia, Complex, Deadoralive, Kidnapped, Diver, Domoclan, Drugs, Easywork, Kiberrazum, Evilgenius, Mafia, Proprolog, GLAVRED, Colonization, Testing, Piratesnest, Forum, Gluki, Losthero, Bomber, Vulkan, Xenolog, Park, Tourists, Feipsycho, Taxist, Citadels, Doomino, Gaidnet, Filial, Rvk, Photorobot, Provoda, Pharaon, Faruk, Megatest, Maze (Easywork и Kiberrazum переведены с нуля по указанию пользователя: несовпадение записей — следствие машинного/иного перевода). РЕШЕНИЯ пользователя 2026-10-02: (а) сначала квесты, где число записей RU = Eng; 14 несовпадающих (Bomber, Colonization, Doomino, Easywork, Forum, GLAVRED, Gluki, Kiberrazum, Losthero, Piratesnest, Proprolog, Rvk, Taxist, Testing) — потом, после разбора версий; (б) прозвища: имя транслитом, прозвище переводим, если на нём держится шутка (Pulyay Crookhand); (в) «Ranger» в середине фразы — с заглавной, как у нас. (г) 2026-10-02: оставшиеся Untranslated переводить ПО РАЗМЕРУ от бОльших к меньшим (Mafia, Proprolog, GLAVRED, Colonization, Testing, Piratesnest, Maze, Forum, Gluki, Losthero, Bomber, Vulkan, Xenolog, Park, Tourists, Feipsycho, Taxist, Citadels, Doomino, Gaidnet, Filial, Rvk, Photorobot, Provoda, Pharaon, Faruk, Megatest), все С НУЛЯ с RU (в т.ч. несовпадающие и частично английские; старый EN — только справочник). Авторские псевдотеги с кириллицей (<Цензурой>) qtr.py допускает заменять латинскими <...>. Оформление: `python3 qfinish2.py ...` (см. шапку файла); пути RU `questsRus/X.txt` → EN `questsEng/X_eng.txt`. Машинные черновики `0_квесты кр 2 тхт/_преев*` — не использовать (сломанные токены).
- SR2HD DevTranslated разобран 2026-10-02 (глоссарий/лор/ревью); 2026-10-02 по указанию пользователя ошибки из `questsEng/notes/DevTranslated_review.md` ИСПРАВЛЕНЫ в оф. файлах (check 0 ошибок, struct 0 у всех, кроме Pizza Path78b — баг RU; адаптации разработчиков и расы с заглавной не трогались). РЕШЕНИЕ пользователя: расхождения терминов — в пользу DevTranslated (разнобой оф. — по частоте). 2026-10-02 сверка с основной локализацией игры (Lang_Eng_Vanilla): РЕШЕНИЕ пользователя — приоритет ванилла > DevTranslated > наше; расы со строчной (peleng, maloq, faeyan, gaal/gaalian, human, klissan, dominator); замены ПРИМЕНЕНЫ во всех наших переводах (см. «РЕШЕНИЕ пользователя по сверке с ванилла» в конце GLOSSARY.md — актуальные формы).
- Дальше (по запросу пользователя): SR2HD Untranslated (см. STATUS.md), моды (Ref*, Shu*, Rev*, Xeno*…).
- Подробная сводка по всем квестам: `QUEST_STATUS.txt` (перегенерировать `py -3.14 qstatus.py < /dev/null`).
