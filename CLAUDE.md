# QUESTS — перевод текстовых квестов Space Rangers (RU → EN)

Инструкции для новой сессии. Читать целиком, затем `Translation/TRANSLATION_GUIDE.md`.
Общение с пользователем — по-русски; текст квестов — английский (американская орфография).

## Где что
| Что | Где |
|---|---|
| Правила и методика | `Translation/TRANSLATION_GUIDE.md` (перевод), `KR1_REVIEW_GUIDE.md` (вычитка), `LORE_GUIDE.md` (лор) |
| Словарь терминов/имён | `Translation/GLOSSARY.md` (таблица `\| RU \| EN \| Квест \|`, дописывать в конец) |
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
- Токены (`<clr>…<clrEnd>`, `<Ranger>`, `<ToPlanet>`, `<FromPlanet>`, `<Date>`, `<Money>`, `<>`, `[pN]`, `{…}`) — дословно. В репликах прямые `"` и ` - `.
- Новый квест без указания пользователя не начинать; спорное — в notes и вопросом пользователю.
- КР1: оставшиеся квесты ПЕРЕВОДИТЬ С RU ЗАНОВО (решение пользователя 2026-10-02: английский КР1 машинный, вычитка не окупается — опыт Menzols). Английский КР1 — только справочник: сверка написания терминов/имён/названий (с проверкой по глоссарию) и подсказка в тёмных местах.
- Имена из КР1 не принимать на веру: проверять пол персонажа по RU и реальную форму имени (Rene/Renee, Jean/Jeanne), искать персонажа по всем квестам (напр. «Р. Маккалистер» в Bank = Рене Маккалистер в Menzols).
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

## Текущее состояние (2026-10-02)
- КР1 (SR1TextQuests): готово 25 из 25 (Penetrator, Bank, Boat, Menzols, Fishing, Bondiana, Casino, Commando, Diamond, Examen, Galaxy, Gobsaur, Hachball, Murder, Newflora, Poroda, Rush, Siege, Tomb, Gladiator, Diehard, Energy, Ikebana, Build, Spy).
- КР1 ЗАВЕРШЁН 2026-10-02 (все 25: check 0/0, qtr_struct 0).
- Перепроверка времён в Bank — выполнена 2026-10-02 (времена соответствуют RU, 4 мелкие правки). «гомока» → gomoka — принято пользователем.
- Структура всех готовых квестов КР1 проверена `qtr_struct.py` — 0 расхождений.
- АВТОРЕЖИМ 2026-10-02 завершён (КР1 доделан); спорное копилось ниже. Оформление: `python3 qfinish.py ...` (см. шапку файла).
- ВОПРОСЫ ПОЛЬЗОВАТЕЛЮ (накоплено): (1) [снят: в Build только племя Уги] (2) [удалён Eng/Menzolsrus.txt по решению пользователя] (3) Gladiator — РЕШЕНО: Dreadround, Dreaddy, TOLLOSOOOM; Ytsokhen/Grok — одобрено; (4) [РЕШЕНО: Fishing Loc165-1 → "invented clockwise"] (5) пародийные имена — РЕШЕНО 2026-10-02 (см. конец GLOSSARY.md): принцип «сохраняем отсылку, если звучание не меняется».
- ИМЕНА: перед каждым квестом сверять ВСЕ имена персонажей (и из глоссария КР1) со строгим транслитом (х→kh, ж→zh, ц→ts, й→y, ё→yo, -ский→-sky); 2026-10-02 исправлены Tomb, Diehard, Bank, Casino, Murder, Siege, Rush (см. конец GLOSSARY.md).
- МОДЫ: RevTextQuests (2026-10-02, по указанию пользователя): Cybersport и Massacri готовы (RevTextQuests завершён 2026-10-02). Лор модов — ОТДЕЛЬНО в `Translation/lore/LORE_FACTS_MODS.md`. Аббревиатуры (параметры и пр.) расшифровывать, в т.ч. по формулам qmm (только чтение) и контексту; сомнительное — вопрос пользователю. Старые англ. копии в корне репо (Cybersport.txt, Massacri.txt) — только справочник.
- SR2HD (2026-10-02): разложен по подпапкам `questsRus|questsEng/Untranslated` (38 квестов, НЕ переведённых разработчиками; список и условия — `questsEng/readme.txt`; Moi из них уже наш) и `.../DevTranslated` (42, переведены разработчиками). Заметки — `questsEng/notes/`. ПЕРЕВОД Untranslated начат 2026-10-02 (по указанию пользователя, по порядку STATUS.md): готово — Amnesia, Complex, Deadoralive, Kidnapped, Diver, Domoclan, Drugs, Easywork, Kiberrazum, Evilgenius, Mafia, Proprolog, GLAVRED, Colonization, Testing, Piratesnest, Forum, Gluki, Losthero, Bomber, Vulkan, Xenolog, Park, Tourists, Feipsycho, Taxist, Citadels (Easywork и Kiberrazum переведены с нуля по указанию пользователя: несовпадение записей — следствие машинного/иного перевода). РЕШЕНИЯ пользователя 2026-10-02: (а) сначала квесты, где число записей RU = Eng; 14 несовпадающих (Bomber, Colonization, Doomino, Easywork, Forum, GLAVRED, Gluki, Kiberrazum, Losthero, Piratesnest, Proprolog, Rvk, Taxist, Testing) — потом, после разбора версий; (б) прозвища: имя транслитом, прозвище переводим, если на нём держится шутка (Pulyay Crookhand); (в) «Ranger» в середине фразы — с заглавной, как у нас. (г) 2026-10-02: оставшиеся Untranslated переводить ПО РАЗМЕРУ от бОльших к меньшим (Mafia, Proprolog, GLAVRED, Colonization, Testing, Piratesnest, Maze, Forum, Gluki, Losthero, Bomber, Vulkan, Xenolog, Park, Tourists, Feipsycho, Taxist, Citadels, Doomino, Gaidnet, Filial, Rvk, Photorobot, Provoda, Pharaon, Faruk, Megatest), все С НУЛЯ с RU (в т.ч. несовпадающие и частично английские; старый EN — только справочник). Авторские псевдотеги с кириллицей (<Цензурой>) qtr.py допускает заменять латинскими <...>. Оформление: `python3 qfinish2.py ...` (см. шапку файла); пути RU `questsRus/Untranslated/X.txt` → EN `questsEng/Untranslated/X_eng.txt`. Машинные черновики `0_квесты кр 2 тхт/_преев*` — не использовать (сломанные токены).
- SR2HD DevTranslated разобран 2026-10-02 (глоссарий/лор/ревью, оф. файлы не правились). РЕШЕНИЕ пользователя: расхождения терминов — в пользу DevTranslated (разнобой оф. — по частоте). 2026-10-02 сверка с основной локализацией игры (Lang_Eng_Vanilla): РЕШЕНИЕ пользователя — приоритет ванилла > DevTranslated > наше; расы со строчной (peleng, maloq, faeyan, gaal/gaalian, human, klissan, dominator); замены ПРИМЕНЕНЫ во всех наших переводах (см. «РЕШЕНИЕ пользователя по сверке с ванилла» в конце GLOSSARY.md — актуальные формы).
- Дальше (по запросу пользователя): SR2HD Untranslated (см. STATUS.md), моды (Ref*, Shu*, Rev*, Xeno*…).
- Подробная сводка по всем квестам: `QUEST_STATUS.txt` (перегенерировать `py -3.14 qstatus.py < /dev/null`).
