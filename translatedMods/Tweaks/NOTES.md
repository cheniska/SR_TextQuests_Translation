# Tweaks — заметки (36 модов собрано)

## Состав
- С текстом на русском (переведено): AHundredTrancsOnMarshalsChest, AltStart, AltStart_new, AutoBot, BlockPirates, DevKit, EndlessGame, ExtraArtSlots, FemsBugs, ImperialFlagship* (6), MusicControl, RevolutionDelayed, SR2Dominators, SR2DominatorsBalance, SR2PQuestStyle, SR2Reboot, SR2RebootBalance, SR2RebootMenu, TechnicalIssuesFixer, UtilityFunctionsPack.
- Без кириллицы (собраны как копии исходника): BlockDShipQ, BlockDSystemQ, BlockKillShipQ, BlockMailQ, BlockTextQ, CheatTitleOff, German, Spanish, KlaxonsStationsBG, QuestNoPriority, SR2RebootQuestsOff. German/Spanish — большие готовые локализации, не RU→EN.

## Решения
- Вступительные тексты (AltStart*, BlockPirates, RevolutionDelayed, SR2Dominators/Reboot) строятся по ванильному EN (ближайшие RU-аналоги из tm), переписаны только изменённые куски; те же фразы — одинаково во всех модах (проверка consist.py: конфликтов 0).
- «Гралгар» = Gralgar, «Гралгарская бойня/битва» = Gralgar massacre / Battle of Gralgar; Блазер/Келлер/Террон = Blazer/Keller/Terron.
- Силы-рейтинг: «Dominators are weaker than / stronger than / much stronger than the Coalition», «Dominator and Coalition forces are equal» (по образцу ванильного «Pirates are weaker than the Coalition», «Klissan and Coalition forces are equal»); старый Redux («Dominators are weaker than Coalitions.») не использован.
- AltStart_new собирает вступление из кусков (Text1–6, Period, Attacking, Was, Positions, Tradition, Pirates). Порядок склейки известен только по русским пробелам: Text2 + пробел + Period + Text3 + пробел + Attacking + Text4 + пробел + Text5. Английские куски написаны под этот порядок («…there must» + Was «also» + «exist brain centers…»). Слот Was («были», предположительно «должны были быть») передан нейтральным «also», иначе не сходится время; если в игре порядок иной — править руками.
- «<TerronName>ской Бойни» → «the <TerronName> Massacre»; «в битве у <TerronName>a» → «at the Battle of <TerronName>».
- DevKit: ГТУ = GTL, ТУ = TL, ПБ = PB, ММ = MM/micromodule, юзлесс = useless, ХП = HP; идентификаторы (Lang.dat, GenerateMergedCFG.bat, имена модулей) оставлены латиницей; «Мезонный плазмомёт (NewGun)» = Meon Plasma Thrower (так же, как «Меонный» в OtherMods/NewGun).
- «Характер» (личность рейнджера) = personality (как в ванилле); «Повысить коалиционное/пиратское/научное» = Raise Coalition/pirate/science rank.
- ImperialFlagship*: база — ванильный текст «Thanks to modern technologies…» + «Camouflage module activated. Holographic model: …» (Kheophar, Huu-Monger, Katauri, Ravanger, Shiksa, Battleship).

## Открытые вопросы пользователю
- AltStart_new: верный ли порядок склейки кусков (см. выше) и что вставляется в слот Was.
- DevKit: «ПБ Свободная Бухта» — это сообщество планетарных боёв? Оставлено PB "Free Bay".
- DevKit 289: «кр. Артемиды, Оплота, Технотрона» — Artemis, Bulwark, Technotron (названия крейсеров, по смыслу).
- Список мелких: «ШуНюки» (FixShuNukes) = ShuNukes; «Тень империи» в MusicControl — как плейлист «Shadow of the Empire».
