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

## Olympiada
- **QuestDescription**: «Клерки без границ» → "Clerks without End"; «только первое место» → "fist place".
- **Loc80-1**: «команда планеты <ToPlanet>» → "a Peleng team" (раса додумана); **Loc80-3**: EN пустой.
- **Loc47-3**: «великий человек и творец Репин-Акваданский» → "Human architect Aquadan Matisse"; «следография» → "pathograthy"; «с живописью» → "visual arts".
- **Loc7-1**: «маленькими и худосочными» → "short"; «горошинами выкатываться» → "like hit balls".
- **Loc19-3**: «эрудиция нормальная» → "IQ is normal" (≠ знания/интеллект — разные параметры).
- **Loc47-1**: «Нет. Не рабоче-пролетарской» → "Not some trifling Sumo" (адаптация).
- **Loc96-2**: блатная песня → ирландская "Whiskey in the Jar" (адаптация).
- **Loc93-2**: «А мне на лишний ящик кинзы еженедельно капает» — пропущено.
- Par39-1: «трезвы как стёклышко» → "as sober as a monkey"; Par39-5 «мертвецки пьяны» → "stoned".
- Loc18-1: "Dress in cryonic gloves"; Loc1-1 «тихо летел» → "flying fast", "ready it" (read); Loc88-2 "Gleet all this for a lark"; Loc94-1 "By my mania"; Loc83-2 "fat bold Human"; Loc50-2 "loosing"; "penchekrayks… weight".

## Pachvarash
- **QuestDescription**: «вторым по тяжести преступлением после стукачества» → "after whistling" (бессмыслица; ср. Election "informer"); «change if sex».
- **Loc57-1/57-2**: «Никакого дроида за вашей спиной» → "no druid".
- **Loc60-1**: «вам и в голову не пришло искупаться… в болотце» — передано; «озеро раскалённой магмы» → "boiling lava" (ок); «it's great to be something but Peleng»; "soon we age going to steal".
- **Loc63-8**: «В вашей норе всё по-прежнему» → "Everything has changed" (обратный смысл).
- **Loc71-1**: «короткая нора» → "The hollow burrow".
- **Par3-x**: «Длина норы» → "Burrow depth" (а в Loc60-1 подчёркнуто, что рыть надо было под углом, а не вертикально — «длина», не «глубина»).
- **Par4-crit**: «потеряли сознание» → "lost conscience".
- Loc63-3: «гоняли по системам пиратов» → "run around pirate systems" (смысл искажён); Loc1-1: «в зелёной рясе» → "cloak" (а Loc64-1 "cassock").
- Опечатки: "You burrow", "al last", "You health", "waived", "get though it".

## Pilot
- **Loc89-1**: «добывать для пеленгов какой-то сертификат» → "some unofficial certificate for the Pelengs" (ок, добавлено "unofficial").
- **Loc1-1**: имена адаптированы ("Dalany Highbrow", "Snipeman Hogger") — RU «Заумий», «Тырь Захапыч»; «Лоо-Хэн» → "Loho-Khan".
- **Loc8-1**: «бежать в ближайший магазин за мешком носовых платков» — ок; "made a foozle to take it", "stringed himself up".
- **Loc14-1**: «очередной неудачник» → "next looser"; Loc53-1: «Варево из морских трепыхуний» → "Lorelai with sea slatters" (бессмыслица).
- **Loc59-1**: «Теперь осталось её дожать» → "Now we need to break the bridge".
- **Loc121-1**: «капитан должен сам определить» → "the cap must define himself".
- Loc120-x: "Stating point"; Loc1-1 "{2} scores minimum"; Loc81-1 «тренажёрный терминал» — "traini…" ок.
- Разнобой: gobzaurus (здесь) / gobsaurus.

## PirateClanPrison
- **Главное**: EN — копия перевода Prison; 10 записей, где RU пиратской версии отличается, НЕ переведены заново (EN = Prison): Par4-crit, **Par7-crit** (радио: «с зоны откидывается…» → текст про досрочное освобождение), **Loc1-1** («продажные пиратские присяжные» → "The jury"), **Loc3-1** (речь начальника: «так было, пока наша планета была частью Коалиции…» → речь из Prison про исправление), Loc37-1 («за штурвалом корабля» → "attacking the Dominators"), Loc62-1 (сочинение «Наши бравые пираты»), **Loc105-1** (амнистия из-за захвата систем Коалиции пиратами → "re-election of the beloved president"), Path58b («заключённый» → "ranger"), Path90b («вензеля» → "ranger badge"), Path319b («знакомых» → "ranger friend").
- check: Loc166-1, Path393b — потерян <Ranger>; Path391b — {40} → {100}.
- Par9-2: «опущенный тип» → "a downcast"; Par5-2 "a wonky"; Path242 «Судью на мыло!!!» → "Show'em boy!!!" (вольно).
- Loc3-1 (и в Prison): речь начальника переведена, но не совпадает по смыслу с RU (добавлено про книги и работу).
- Loc17-1: «без света читать можешь» → "pass for a Batman" (адаптация).
- Опечатки: "You health", "You whole body", "You intellect", "send a bullet", "you're your conduct", "intro non-traditional medicine", "a sent his bullet", "Penchekyrak".

## Prison
- RU = PirateClanPrison без пиратских правок; EN совпадает с EN PirateClanPrison (кроме записи Loc28-1). Те же опечатки и check-ошибки (Loc166-1: потерян <Ranger>).
- Loc3-1: речь начальника тюрьмы переведена не по RU (EN добавляет про книги, работу, азартных игроков).

## Pizza
- **Loc10-6**: «Раньше фэяне питались неоном и минералами» → "Earlier on the Pelengs used to eat only neon and minerals" (раса перепутана; дальше в той же записи — Faeyans).
- **Loc3-1**: «Народ и пицца неразделимы!!!» → "Freedom and pizzas for all!!!" (вольно); «палац» → "palace", но Path28 → "hotel".
- **Loc10-1**: «Путаны» → "The prostates" (опечатка, нецензурный смысл!).
- **QuestDescription**: «Для этого нужно, чтобы представитель… занял» → "In order to facilitate that a representative… won" (неграмотно).
- Loc4-5: «Слушаю-с» → "Sire"; Loc10-4: "you call for the water" (waiter); Loc4-4: "beef stake".
- check: Loc4-3 — лишний <ToPlanet>; Path78b — <clr> без <clrEnd>.
- Par25-5 "You almost fed up"; Loc31-1 "What you reaction will be?"; Loc29-x «вы выиграли второй/третий приз!» → "!!!".

## Player
- Перевод в целом точный. Loc2-1: «если есть хоть малейшая вероятность того, что обертон определён неправильно» → "if there is just a small possibility of damaging it" (близко); "unicity".
- Loc8-1: «показания… не позволяют точно определить» → "don't allow us to define" (потеряно «точно»); Loc8-2 «ткнём наугад» → "push by guess".
- QuestDescription: «в течение <Day> дней» → "in <Day> days" (двусмысленно); Loc1-1 «как обычно, пропустили мимо ушей» ок.
- Опечатки/пунктуация: "failed your mission..", "Your mission is failed", "Let's chose", "defining the overtone type.(that is".

## Rally
- **Имена**: «Егорыч» → "Igorych" (неверно; Yegorych); «Михаэль Шульман» → "Michael Schulmann" (≠ Foncers "Mikhael Shulman").
- **Loc3-3**: «Только молодые очень, не вышло бы чего» → "They're just really young; it won't work" (искажено).
- **Loc8-4**: «за двенадцатое место» → "twentieth place".
- **Loc3-7**: «то пеленга интересного встречу» → "an interesting date with a peleng" (додумано).
- **Loc8-1**: «Сверхбыстрый зверь для подготовленных пилотов» → "for training drivers".
- **Loc10-3**: «Так бы и запустил ракету в дюзу» → "It's like launching a nozzle-tipped rocket" (бессмыслица); «пару штрихов» → "two racing stripes".
- **Loc7-2**: «Парни придут ближе к началу» → "The guys are getting closer to the start line".
- Loc3-6: «Если обходится без Адских Машин и роботов-убийц» → "We could really do without…" (смысл изменён).
- Loc3-4: «Чего есть, того не миновать!» и пр. — шутки переданы вольно; Loc3-1 «как два пальца в бензобаке» → "As easy as fondling a gas tank".
- Опечатки: "Here are you <Money> cr.", "you stammered as you took as you sat", "You cars", "doesn't your car needs", "highly morale image", "250-000 cr".

## Robots
- **Loc76-5**: «Трибуны разразились аплодисментами… манёвр вашего противника» → EN другой записи ("Though the torpedo passed by due to the generator…") — подмена текста (check: Loc70-5/Loc76-5).
- **Loc43-4/44-4/45-2**: «торпеды с улучшенной системой наведения, которой иногда удаётся преодолеть помехи» → "which causes more noise" (смысл искажён); «тепло распрощавшись с собутыльниками» → "giving your competitors a warm clasp".
- **Loc1-1**: имена соперников адаптированы ("John "God" O'Damned", "Zen Cha-Cha") — RU «Жакло КаакДам», «Дзен Кочан».
- Loc53-1: «Насадка на торпедный аппарат» → "Heading for the torpedo tube"; Loc53-2: перевод п. 2 испорчен ("when 2 will volley your enemy or 3 rockets").
- Loc50-1: «ЧЕМПИОНА ВСЕЛЕННОЙ» → "THE GALAXY CHAMP"; QuestSuccessGovMessage: «смотрело репортажи» → "listening to the sportscasts".
- Опечатки: "tree types", "he's till able", "The bar is namely empty", "absent once", "the Peeling's answer", "You stroke the fans dumb", "drawback", "kept their breath".

## STQ_Ataman1
- Loc4-1: «стоит тем начать замечать нестыковки» → "It's time to take note of the disparity" (смысл изменён: в RU — избавляются от тех, кто начинает замечать).
- Loc5-1: «работая на них» → "working in them"; «атаман» → "warlord".
- Path5: «Но можешь ли ты за них ответить?» → "But can you say anything against them?" (обратный смысл).
- Path3: «Так и есть» → "Very well".

## STQ_Ataman2
- check: одинаковый RU (Loc2-1, Loc7-1, Loc8-1) переведён по-разному ("didn't look its best" / "didn't look very good"). "It's case" (its).
- Loc4-1: «валю жестянку» → "throw down a tin can"; «медиков-психиатров, после чего вернулись» → "who then return" (субъект перепутан).
- Loc16-1: «изящным оскорблением на древнем малокском диалекте "сливки"» → "Responding to the know-it-all's fine insult in an old maloq dialect" (кто кого оскорбил — перепутано, название диалекта опущено); «ничуть не смущаясь» → "almost laughing"; Loc15-1 «Верный своей задумке» → "True to your dream".

## STQ_Baron1
- Loc5-2: «оброненный атакующими вас военными» → "had probably been defended by the soldiers" (неверно).
- Loc1-1: «Из ворот налево» → "though the gates on the left"; «шагать навстречу улепётывающим… пиратам» → "move in the opposite direction" (обрезано по смыслу).
- Loc12-1: «Однажды о вашей победе напишут» → "However, they'll write"; Loc5-1 «пиратского синдиката» → "pirate enterprise".
- Par1-crit: "levels fell off" (levers).

## STQ_Baron2
- Loc18-1: «грузоподъёмность… 120 бугневиллей. Больше в него физически не влезет» → "120 bug… will not fly".
- Loc25-1: «Вы уже подумали, было» → "I believed" (1-е лицо).
- Loc4-1: "You look left and right and noticed" (времена); Loc16-6: «Дозаправка вам явно не помешает» → "Refueling clearly won't bother you" (смысл).

## STQ_Baron3
- Loc15-2: «дёрнули дорожку за край» → "kept to the edge of the path" (неверно; ковровая дорожка); Loc15-3 «дёрнули дорожку на себя» → "took to the path".
- Loc23-5: «меня тут каждый сварокок знает» → "Every swarokok here knows me"; «Вы обвели пустой ангар широким жестом» → "You walked around the empty hangar with a stately air".
- Loc23-6: «Сход - развал!» → "The landing area is a disaster!"; «доминатор подери!» → "dang it!!".
- Loc22-1: «который вы про себя идентифицировали» → "quietly named aloud"; Loc23-4 "The maloq smile broadly".

## STQ_Baron4
- Loc3-1: «ханы и бароны» → "dons and barons".
- Loc4-1: «сдамасской стали» → "Damascus steel" (ок); "Shush your weapons, boys" — пропущена открывающая кавычка.

## STQ_Headhunter
- QuestSuccessGovMessage: «Кроме имеющих более высокое звание пиратов» → "Except pirates who know more than you" (неверно — речь о звании).
- Loc3-1: «стоило после этого сделать шаг вперёд» → "But it cost you to take a step forward" (ложный друг «стоило»); Loc8-1 «стоило вам разоружиться» → "so it was worth it to disarm yourself" (та же ошибка).
- Loc5-1: «не дали себя сломить даже повторением малокских скороговорок за одним из охранников» → "you even repeated maloq tongue-twisters" (смысл перевёрнут).
