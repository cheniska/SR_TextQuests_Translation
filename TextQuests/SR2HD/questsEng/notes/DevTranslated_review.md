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

## Edelweiss
- `qtr.py check`: одинаковый RU переведён по-разному — Loc4-1/4-2/4-3, Loc26-3/Loc28-10, Path33/Path193 ("To the air lock" / "To the lock chamber").
- Path82: «Намекнуть на то, что геолог все же выходит наружу» → "Suggest that the geologist should come outside" (смысл другой: намекнуть, что он сам выходит).
- Loc41-4: «а мы уж разберёмся в обстоятельствах смерти» → "and investigate the circumstances" (поручено рейнджеру — неверно).
- Loc41-6: «рассказали про страшную находку» → "your careful discovery".
- Loc41-9: «для выхода на поверхность» → "to go under the surface".
- Loc41-5: "I huge worm attacked me!"; Loc29-3: "You hear a circular saw can heard".
- Loc82-2: «<Ranger>ерак» → "Little <Ranger>" (игра слов потеряна, допустимо).
- Разнобой: annulus / annelus creeper; Gaal / gaalian.

## Election
- **Path231**: «Я время от времени хожу в спортзал» → "I don't have time to go to the gym" (смысл обратный; реакция в Path231b — про «время от времени»).
- Path230b: «презиравшие физические упражнения фэяне» → "the Maloqs who despised all physical exercise" (раса перепутана).
- Path91b: «малоки, фэяне и гаальцы разделяют» → "Maloqs, Faes and Humans".
- Path72b: «другие расы разделяли ваше мнение о пеленгах» → "seemed to share the opinion of the Pelengs".
- Path252b: реплика Нуки Цыца приписана "Shooch Yaa".
- Loc104-3: «Охранникам (в основном малокам и людям)» → "Maloqs and Pelengs".
- Loc104-2: «предупреждали о низкой популярности» → "urging you to improve your positions".
- Loc107-1: названия животных (жвырклац, глинобрюх, пенчекряк, сварококк) заменены выдуманными англ. (veterbratosaur, anemonobrate, ducklapus, quackadile).
- Path206b: фэяне «приобрели лиловый оттенок» → "turned lily".
- Loc22-1: «предвыборная программа» → "plan of the election process"; Loc27-1: «чистый лист» → "black piece of paper".
- Loc66-1: "Advertising T-shits" (опечатка — нецензурно!).
- Loc79-7: «отреагировали довольно вяло» → "very distressing"; Loc83-6: «любящих разгульную жизнь» → "who enjoy racketing".
- Path115b: «с отсталыми расами» → "other races"; Path167: «до пяти лет» → "for five years"; Path168: «на планетах» → "countries"; Path223: будущее время → "has been reduced".
- Разнобой имён: Strangl/Strangle/Stangl Lee; Karra Bbach/Bach; Blubb/Blub Lubb; Od-dalani/Od-delani; plasmatank/plasmotank; hatch-ball/hatchball.
- Опечатки: "feasts" (feats), "Fist of all", "drag trafficking", "Maloiqs", "Malloqs", "Fayans", "Faeyns", "slow number", "stingy swamp mud".

## Elus
- Разнобой титулов: «далани / од-далани» → "Dalany / Od-dalany" (в Election — Od-dalani, Od-delani).
- Loc22-1: «присуждается всем, кто занял второе место вслед за Онайком» → "who came in a close second" (ок); «Книга Позора» → "Disgrace Book".
- Loc26-1: текст расширен неверно ("There is a number of figures in the lower part of the screen including those you need to choose").
- Loc29-4: "FORTH" (fourth); Loc32-1: «на душе стало легче» → "Your heart was higher".
- Loc2-1: «первая выбирается случайно» → "chosen occasionally".

## Evidence
- **Par25-crit**: «увлеклись дегустированием напитков… дёрнули лишнего» → "testing the narcotics… overdosed" (речь об алкоголе из бара).
- **Loc129-1**: «хозяин квартиры не полный идиот, чтобы оставлять наркотики…» → "The apartment's owner is such an idiot that he would leave narcotics…?" (смысл искажён).
- Loc1-1: «пласталь и стеклобетон» → "plastic and concrete"; "gigopolis".
- Loc34-1: «не нашли места, где можно припрятать улику» → "where rags might be stored".
- Loc52-1: «что-то вы увлеклись просмотром» → "something distracted your viewing" (обратный смысл).
- Loc28-2: «десятки децибел» → "gigawatt speakers".
- Loc74-1: «янвелб» → "ekup" (в Driver — janwelb).
- Loc111-2: «разминулся с полицейским» → "the police walked in" (ед. → мн., ок по смыслу).
- Loc124-1: игра слов «Типерь» → "Now I now" + 'k' (адаптация, ок).
- Loc127-1, Loc132-1, Loc109-1, Loc126-1: потеряны открывающие/закрывающие кавычки.
- Path306: «А что с уликами-то?» → "What? With the evidence?" (≠ Path305 при одинаковом RU); Path195 vs Path199 «Оставить шкаф в покое» → shelf / closet.
- Опечатки: "trama", "expect your lips", "Your are in", "solider", "at least one", "Of course, You", "managed too", "its plugged in", "a deeply".

## Fishingcup
- **Path24/Path26**: цены и качество перепутаны: «Фильтр плохого качества за 220» → "medium-quality Filter for 330"; «Вата среднего качества за 330» → "inferior-quality Cotton for 220".
- **Path582b**: «нашли [p24] марок» → "find nothing but a fishing manual" (потеряна находка денег и параметр).
- **Loc128-1/128-2**: «[p9] г, больше, чем у всех остальных» → "It is [p9] g more than the rest" (смысл: «на [p9] г больше»); в 128-2 добавлено вручение чека, которого в RU нет.
- Loc13-1: «поднялись вверх по дороге» → "walk down the road"; Loc62-1: «прошли по резкому спуску» → "along the gently sloping shore"; Loc63-1: «небольшие заросли» → "dense reeds".
- Loc44-1: «У тебя ничего не выйдет» → "Nothing works out for you"; Loc32-6: «Что бы ещё такого сделать?» → "You feel like doing something like this again".
- Армрестлинг (Path589–597b): приёмы перепутаны — «заломить кисть» → то press, то top-roll; Path592b «заломить» → "top-roll"; Path593b «рывок» → "hook".
- Loc37-1: правило ничьей пересказано неточно; Loc27-1: <clr> вокруг описания снастей частично потерян (check: Loc11-1 и Loc27-1 без <clr>, QuestDescription без второго <Ranger>).
- Par10-1: лишний разрыв строки "weight:\n: <>"; Par1-1 «у вас нет денег» → "You haven’t enough money".
- Опечатки: "decent" (descent), "waters dark", "he's is", "This is where you start" ок; типографские ’ вместо '.

## Foncers
- **QuestSuccessGovMessage**: «Доминаторам не устоять!!!» → "Dominators won't succumb!!!" (смысл обратный).
- **Par4-5**: «Хорошая маневренность» → "Average manoeuvrability" (≠ Par4-4 Normal); Par4-1 «Ужасная» → "Minimal"; Par2-2 «Очень плохой» → "The worst".
- **Loc19-2**: «на коротком участке можно выиграть или проиграть значительно быстрее» → "Your race time will change more on a longer segment" (искажено).
- Loc19-3: «Так как реакции живого существа недостаточно…» → "Due to a lack of friction… In the event that…" (додумано); «сойти с трассы» → "fall back".
- QuestDescription: «на планете <ToPlanet>» → "on a planet in the <ToStar> star system"; «подвергся нападению» → "pirates shot down".
- Loc18-1/18-3: «Ничья — это не проигрыш/не выигрыш» → "No side is losing/winning yet" (ок по смыслу, но непоследовательно с Loc18-2).
- Loc33-1: «траурное обрамление» → "penitential framing"; «устроители» → "sponsors"; Loc33-2 «корзина с шарами» → "basket with the pin palling lots" (бессмыслица).
- Loc29 Path29: «Забыть о скорости, максимально экономить защитное поле» → "Spend the power feeding your forcefield very carefully"; Path47 «про трассу» → "about the tournament".
- Path30b: «сошёл с дистанции» → "left the distance"; Loc9-4 → "couldn't keep up".
- Loc1-2/1-3: пробелы внутри кавычек `" Hurricane "`; Loc1-3 "asking::", "novice..".
- Разнобой имён: Gonzar / Gonsar; "forcer" (Loc33-3). Опечатки: "The forth day", "Number 17 parameters", "is purrs". Реплики через "- " вместо кавычек.

## Jumper
- **QuestSuccessGovMessage**: «И бывают же такие хамы среди рейнджеров» → "How can a ranger be such a can?!" (бессмыслица).
- **Loc2-2**: «полтора десятка платформ» → "half a dozen"; «не спешить» → "drag your heels".
- **Loc2-4**: «Последние трое совершенно не пострадали» → "The last took stuntmen"; «смазывают жиром края платформы» — передано неверно по смыслу ("force… to grease").
- **Loc22-1**: «подошва правого ботинка… ушла налево» → "flew off to the right" (шутка потеряна).
- **Loc25-1**: песня про малока, который «больше не сможет играть в хэчбол» → "song about a lustful Maloq" (смысл изменён).
- **Loc38-1**: «оформить заявку вполне можно и без этого» → "we can prepare" (сбивка лица); Loc47-1: «отсчитал вам 1000 cr» → "was glad to tell you 1000 cr".
- **Loc50-1**: «Институт Инновационных Изобретений и Исследований» → "the Inventions and Innovations" (пропущено «Institute of»).
- Path5: «пособие по инвалидности не настолько велико» → "not big enough to affect grasshopper" (бессмыслица).
- Loc5-1: «Не дождётесь, крысы нафталиновые» → "Snooks, lab rats"; Loc12-2: «в антипропагандистских журналах» → "unofficial magazines"; Loc17-1: «ушибленным достоинством» → "injured manhood… no self-maiming".
- Loc50-2: "I hate cursors"; Loc11-1: «чтобы не упасть» → "to miss falling down".
- Адаптации песен (Loc16-1, Loc24-1, Loc20-1 «ТУ-1034» → "Boeing 737") — допустимо.
- Par10-1: meters / metres разнобой; Par1-2 "№1" vs "No 1"; Path63 "TO Blue-2"; Loc25-2 "tree hundred", "a urn"; Loc21-2 "<Ranger> have been"; Loc25-1 "signed with relief"; Loc26-1 "half of my yearly salary" (RU полугодовое).
- check: Par9-1 / Par9-2 разнобой ("Teleport is spent/charged" — ок, ложное предупреждение).

## Leonardo
- **QuestDescription**: «системы <ToStar>» → "in the <ToStar> galaxy"; «целых <Money> cr» → "up to <Money> cr".
- **Loc7-2**: перевод обрезан — нет первой фразы про зал; **Loc51-1**: пропущен второй абзац (зал, служка, краски); **Loc51-5**: в EN текст Loc51-2 («вынули руку из кармана») вместо «Не стоит рисковать!»; **Loc83-2**: EN пустой; **Path152b**: EN пустой.
- **Loc87-1**: «в отличие от своего оппонента» → "one of his opponents" (RU: единственный оппонент).
- Loc2-2, Loc2-4, Loc5-1, Loc49-1: потеряны <clr> (check).
- Loc2-5: пропущено «Кроме того, эти параметры отвечают и за некоторые другие навыки»; Loc2-6: "a cubist tree an impressionistic gravicar" (пропущено "or").
- Loc76-5/96-5: «Без всяких там "мастихинов"» → "Know in comprehensible words like 'spatula'" (опечатка "Know in" = "No incomprehensible").
- Loc84-1: «светло-фиолетового» → "violet blue".
- Path62b: «Ужасная работа. Мазня какая-то!» → "How disgusting!" (сокращено); Path58b — потеряна открывающая кавычка.
- Path215b: порядок абзацев переставлен (реплика провожатого перед описанием); «устаревшая ещё тысячу лет назад» — пропущено.
- Path10 "But the book aside"; Loc87-1 "has answer incorrectly"; Path170b "rough out and eye and then and the pupil"; закрывающие «» вместо " (Loc88-1, Path90b).
- Разнобой: Machpella (здесь) / Makhpella (Banket); gobsaurus / gobzaurus.

## Logic
- **QuestSuccessGovMessage**: «более тысячи заявок» → "over 100 applications".
- **QuestDescription**: «после чего везде и всегда пропагандировать эту игру как самую умную» → "Then everyone will call our game the most intellectual" (смысл: пропагандировать должен рейнджер).
- **Loc17-1/17-3**: пропущена фраза про пистолеты и винтовки, которые малоки дарят спортсменам; «Гордясь собой» → "Pounding your chest".
- **Loc23-2**: «потерпел поражение» → "has surrendered" (≠ Loc23-1, где «признал поражение» → "has recognized"; перепутано).
- Loc3-2: «весьма посредственный ход» → "that's an okay move"; Loc3-3: «костей, похожих на фэянские» — пропущено.
- Loc2-1: «выжженного поля» → "bright game field"; «В зале принялись отчаянно свистеть» → "The crowd goes wild" (ок).
- Loc24-1: <clr> потерян (check).
- Опечатки: "This must Uralban", "one felt closer", "your opponent here is the commentator's hints", "I haven't a match like that", "pass by", "impales itself on it The".

## Ministry
- **Loc121-1, Loc153-6**: имя «Ко Чегара» → "Ge Chevara" (оф. переделал отсылку; RU-форма иная).
- **Loc117-1/117-2**: «Справа небольшая лестница» → "To the left" (а команданте тоже слева); "small stares doing down".
- **Loc129-6/133-1**: пропущено правило «если я с двух карт не наберу 21, а ты наберёшь — победа за тобой».
- **Loc129-8**: «Оформите бумаги в канцелярии» → "Obtain the papers from the Registry"; «установит квоты» → "define quotes".
- **Loc132-1**: «Попробовал бы сказать иначе. Расколола бы башку» → "You were right you did not try another comment" (неуклюже).
- **Loc155-1**: «Занято» → "Interesting" (≠ Loc144-2 "Taken").
- **Loc145-4**: «янвелб с кинзой» → "ekup with dill".
- Loc125-1: «по отлову блох» → "catching flies"; Loc127-5: «укусила вас за руку» → "by the leg"; Path531b: «С серьёзной физиономией» → "With a serious grin"; Path746: «через две секунды» → "in a couple of minutes".
- Loc141-x: жаргонное «на» передано непоследовательно ("dude", "like", "that").
- QuestSuccessGovMessage: «Да вас просто так не проведёшь!» → "Indeed, you are not that easy!".
- Опечатки: "bold head", "loose", "buts" (butts), "toiled", "Secretarial", "go it", "I rather have", "A came here", "You mission is failed", "run" (ran), "waived".

## Muzon
- Перевод очень вольный (адаптация шуток и пародий: Letallica → Alumminica, Blin 182 → Drink 182, «Мурка» → "Smoke On The Water", Бин-Лааден → Bing) — допустимо, но отходит от RU.
- **Path324b/325b**: «с диким криком обворованного мензола» → "battle cry of a penchekryak in heat"; Path325b: «врезали гитарой по колонке» → "smashed… against the floor" / «вместо гитары сломалась колонка» — расширено.
- **Loc71-1**: «двадцатью семью струнами» передано, но «фэянской сборки» → "custom-made Faeyan" (ок).
- **Loc199-1**: «древнего обитателя человеческих планет» → "an inhabitant of Human planets" (потеряно «древнего»).
- **Loc62-1**: «На столе» → "on the bedside table"; стереовизор «висит над кроватью» → "hovering".
- **QuestSuccessGovMessage**: «прямую трансляцию» → "the show on the stereovision"; «Рок-н-ролл ЖИВ!!!» → "Rock on!!!".
- **Par5-crit**: «Все мутанты!», «Виват анархия!» → "Your problem is you!", "I wanna be an Anarchist!" (адаптация).
- **Loc237-1**: почтовый адрес адаптирован ("@hotmale.com"); Loc73-9 ".spama.net" → ".spam.no".
- Loc73-2/73-8/73-10: <clr> сдвинуты ("system of <clrEnd>").
- Par2-2: «<> день» → "days"; Loc302-1: «так и не подали заявку» → "You forgot to check in".
- Опечатки: "You lied in your room", "it least", "right a better", "witch allowed", "the crowed", "tow persons", "greet got the better", "You rating ahs", "You had a chance over a pint" (chat), "to very the performance", "You ear is pierced", "local hoodlums in you cell".
