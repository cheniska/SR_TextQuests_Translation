# Проверка официального перевода SR2HD (DevTranslated), 2026-10-02

Сверка `questsEng/DevTranslated/<Name>_eng.txt` с `questsRus/DevTranslated/<Name>.txt` (файлы НЕ менялись).
Автопроверка `qtr.py check` + чтение всех уникальных записей RU/EN подряд.
В списке только существенное: смысловые ошибки, пропуски, потерянные/лишние токены, разнобой терминов.
Мелкую стилистику и вольности, не меняющие смысл, не выписываю.
Формат: `запись` — что не так → как по RU.


## Badday
- Par10-1: "Your body is bedeviled" → «тело страшно истерзано»: horribly mangled.
- Loc4-1: «гнусная компания» → "run-of-the-mill companies" (смысл потерян: vile/sleazy); «хелдас их раздери» → "confounded" (ругательство-реалия опущено); «Не будь я славный малок» → "or I'm a lying maloq" (вольно).
- Loc5-1: «вода минеральная, полезная — ужасть!» → "blasted mineral water" (неверно: «ужасно полезная»); "96% proof" — proof ≠ процент.
- Loc3-2: ударились подбородком о стойку → "on the floor".
- Loc21-1: «галопроектор» → "halo-protector" (опечатка: holoprojector).
- Loc27-2: «Уходи, пока он не пришёл» → "Go away until after he's gone" (смысл обратный).
- Loc31-1: дверь «втянулась в стену» → "hit the wall".
- Loc52-1, Loc52-2: «одна из них была сделана из металла» → "One of them is made of wood" (противоречит дальнейшему тексту).
- Loc54-4: «паук едва не схватил вас» → "hardly nips you".
- Loc62-5: «почудилась вмятина на месте попадания» → "instant hemorrhaging".
- Path139b: колпак раскрылся «со звоном» → "with a click" (мелочь).
- Разнобой: gaal/gaalian, fae/faeyan в одном тексте; "Ranger"/"ranger"; "check"/"cheque" (Loc66-1).

## Banket
- Структура: в EN лишняя запись `Loc15-1` (первая фраза RU `Loc16-1` вынесена в отдельную запись) — `qtr.py check`: «типы записей не совпадают». В самих `Loc16-1..3` фраза «Юный малок снова предложил вам подшутить над своим братом» отсутствует.
- Par9-1: не переведено («Параметр номер 9: <>» кириллицей).
- Loc1-1: «предварительная разведка с элементом внезапности» → "with some trepidation".
- Loc5-1: «салют в честь победы над доминаторами» → "victory of the Dominators" (смысл обратный); «насупившихся юных малока» → "dark-skinned".
- Loc6-2: «удар невооружённой рукой» → "jab with an open hand".
- Loc6-4: "Several ministers later" (опечатка: minutes); "Letting out a loud battle cry" — добавлено.
- Loc12-1: «по три раза в неделю» → "every second day of the week".
- Loc13-1: "I rushed out" — 1-е лицо вместо 2-го.
- Loc16-1: «подмигивавшую его сыну…» — токен <ToPlanet> переставлен ("one of his sons <ToPlanet>").
- Loc16-2: «стакан с тёплой кровью хаббата» → "warm habbath milk" (неверно).
- Loc19-1: предложение испорчено ("the bodyguards and the quicker manhandled you to the ground - or the braver - part…").
- Loc25-1..5: "The quests were just starting" (опечатка: guests).
- Loc33-1: "prevocational question" (provocative).
- Loc45-1, Loc48-*, Loc49-*, Loc51-*: кинза — то "Kinza", то "Chins" (опечатка).
- Loc46-1..7, Loc47-1: Цыга → "Taiga" (в Loc13-4 — Tsiga).
- Loc46-6: «два биослотовых корпуса фэянской конструкции» → "two aquadane hulls of Gaalian design" (изменено по существу — видимо, под англ. версию игры?); «31 декабря» → "December 25" (адаптация).
- Loc46-7: в EN нет последней части про СНК-геймз и «Космические рейнджеры: Революция» (2013) — RU дописан позже.
- Loc48-*: «диметилхлорановый» → "diethylmethylchlorane"; «дисциллятик» (Loc48-2..4) везде → "absorblob".
- Path139: игра слов «Комических Рейнджеров» потеряна; Path144 "Meat the Maloq embassy" (опечатка); Path72 "strong brings" (drinks).
- Разнобой внутри оф. перевода между квестами: принц «Тардым Бабах» (Badday: Tardim Babach) / «Тардым ба'Бах» (здесь: Tardym Ka'Boom); гобзавр gobsaurus/gobzaurus; Махпелла Machpella/Makhpella; пенчекряк penchekryak.

## Borzukhan
- Loc2-1: потерян `<Money>` (`qtr.py check`: ошибка); «база пеленга, известного как лякуша Борзухан» → "a secret Peleng base, known as Lyakusha Borzukhan" (известна база, а не пеленг); опечатка "Borzuklhan".
- Loc39-1: «лазерная винтовка» → "laser shotgun".
- Loc67-2: "prison sells" (cells).
- Loc72-1: фраза «But the base was only damaged… However the base was only damaged» повторена дважды.
- Loc107-2: "grabbed the stunned" (stunner).
- Path168b: "stand the his hands" — испорчено.
- Path202, Path223: «к развилке» → "to the fortification" (furcation); в других местах — crossing / ramification / furcation (разнобой).
- Path75: «Лесник я» → "I am forester, me" (стилизация).

## Codebox
- **Path187**: «Никакой, ключ собран» → "The password has not been put together." — смысл обратный (должно быть: "None, the password is complete").
- Loc41-1: «четыре месяца назад» → "some months ago"; "the Coronation the Great Maloqarch" (пропущен of); кавычки в реплике Иксса сбиты.
- Loc29-1: «и тогда на церемонии Коронации не будет черепа... со всеми вытекающими» → "but there will be lots of consequences" (вольно).
- Par7-crit / Loc37-2: "Unfortunately, <Ranger>. You haven't…" — оборванная фраза.

## Depth
- Loc37-2: «P I-00-Ж… имел меньшую глубину погружения» → "R I-00-F, which had a larger diving depth" (обратный смысл); «скорость можно уменьшать или увеличивать» → только "increased".
- Loc8-1: «плавучая база» → "naval base"; "Cattle filled with…" (kettle); "not some spoiled brat" (нежная девица — ок).
- Loc8-8: «не выше чем в 10 метрах от дна» → "no less than 10 metres" (смысл обратный).
- Loc27-1: «Кажется, [p24] cr...» → "Looks like it was closing, [p24] cr..." (непонятно).
- Path97b: «вы не заметили» → "you did notice" (обратный смысл).
- Par15-crit: "I was becoming impossible" (It).
- Path148b: "Now the bathyscaph's will be less" (пропущено weight).
- Разнобой мер: meters/metres в одном тексте.

## Disk
- Loc1-1: бар «Сладкая тина» → "Sweet Tina" (тина = slime); в EN разрыв строки перед "Is it true" и нет пробела "<Ranger>means".
- Loc6-2: «пеленг… небезуспешно пытался доказать свою правоту» → "unsuccessfully tried" (смысл обратный).
- QuestDescription: пароль «Жареный перепеленок» → "Fried chicken" — игра слов с «пеленг» потеряна (допустимо).
- Разнобой: penchekryacus / penchekryak; gaal / gaalian.

## Driver
- Path129b: в EN добавлен лишний `<Ranger>` (`qtr.py check`: ошибка токенов).
- Loc12-3: «до образования галактического содружества» → "Interstellar Coalition".
- Loc111-1, Loc111-2: «мосты на западную и северную стороны» → "northern and eastern" (ошибка).
- Path486b: «Очнулись вы на дороге, возле своей машины» → "No truck, no money, nothing..." (скопировано из Loc153-1, противоречит дальнейшему тексту).
- Path375: «Вернуться к ферме» → "Return back to the car".
- Par4-1: «Перед глазами всё плывёт» → "You are hearing voices".
- Loc10-1: «на развилке» → "drove up to a road"; Path141 «на развилку» → "fortification".
- Loc113-3: «тяпка» → "rake"; Loc182-*: «в серой форме» → "blue uniform"; Loc163-1: «червонец» → "gold piece".
- Опечатки: "Time t leave", "a trifle to difficult", "buy that time", "A steal building", "several Suva" (SUVs), "stranding", "welding a spear" (wielding), "Layer" (Lair), "He was bold" (bald), "It off from there", "pretty tired to go to sleep", "Shipck", "Stopping the car toy stepped".
- Разнобой: Stoltz / Stilt; guanawa (в др. квестах guanava).
- Предупреждения check: Path220/Path585, Path115/Path584 — одинаковые RU-формулы переведены по-разному (несущественно).
