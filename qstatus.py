# -*- coding: utf-8 -*-
"""Строит QUEST_STATUS.txt: сводка по всем текстовым квестам (txt) в TextQuests.
Запуск: py -3.14 qstatus.py < /dev/null   (результат: QUESTS\\QUEST_STATUS.txt)
Статусы переведено/проверено задаются словарями MANUAL ниже (обновлять вручную после каждого квеста);
остальные статусы определяются автоматически по содержимому английского файла."""
import os, re, sys, datetime

ROOT = os.path.dirname(os.path.abspath(__file__))
TQ = os.path.join(ROOT, 'TextQuests')

# (мод, квест) -> (статус, дата, лор, примечание)
# ПЕРЕВЕДЁН = наш перевод с русского; ВЫЧИТАН = переписан/проверен по русскому (КР1)
MANUAL = {
    ('SR2HD', 'Amnesia'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Complex'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Deadoralive'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Kidnapped'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Diver'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Domoclan'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Drugs'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Easywork'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Kiberrazum'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Evilgenius'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Mafia'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU; check 0/0'),
    ('SR2HD', 'Moi'): ('ПЕРЕВЕДЁН', '2026-09-30', 'да', 'check 0/0'),
    ('SR1TextQuests', 'Penetrator'): ('ПЕРЕВЕДЁН', '2026-10-01', 'да', 'КР1-файл был наполовину русским; check 0/0'),
    ('SR1TextQuests', 'Bank'): ('ВЫЧИТАН', '2026-09-30', 'да', 'check 0/0'),
    ('SR1TextQuests', 'Hachball'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Casino'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Examen'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Siege'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Poroda'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Gobsaur'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Murder'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Rush'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Newflora'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Bondiana'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Galaxy'): ('ВЫЧИТАН', '2026-10-01', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Diamond'): ('ВЫЧИТАН', '2026-10-02', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Commando'): ('ВЫЧИТАН', '2026-10-02', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Boat'): ('ВЫЧИТАН', '2026-10-02', 'да', 'переписан заново; check 0/0'),
    ('SR1TextQuests', 'Tomb'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('SR1TextQuests', 'Gladiator'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('SR1TextQuests', 'Diehard'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('SR1TextQuests', 'Energy'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('SR1TextQuests', 'Ikebana'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('SR1TextQuests', 'Build'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('RevTextQuests', 'Cybersport'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU (мод); check 0/0'),
    ('RevTextQuests', 'Massacri'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён с RU (мод); check 0/0'),
    ('SR1TextQuests', 'Spy'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('SR1TextQuests', 'Fishing'): ('ПЕРЕВЕДЁН', '2026-10-02', 'да', 'переведён заново с RU; check 0/0'),
    ('SR1TextQuests', 'Menzols'): ('ВЫЧИТАН', '2026-10-02', 'да', 'вычитка КР1 + 0-98 заново; check 0/0'),
}


def read_txt(path):
    raw = open(path, 'rb').read()
    for enc in ('utf-16', 'utf-8-sig', 'cp1251'):
        try:
            return raw.decode(enc)
        except Exception:
            pass
    return raw.decode('utf-8', 'replace')


def records(path):
    """Возвращает список (тип, текст) записей (склеивает '*'-продолжения)."""
    out = []
    for line in read_txt(path).replace('\r\n', '\n').split('\n'):
        if not line:
            continue
        if '\t' not in line:
            if out:
                out[-1][1] += '\n' + line
            continue
        t, x = line.split('\t', 1)
        if t == '*' and out:
            out[-1][1] += '\n' + x
        else:
            out.append([t, x])
    return out


CYR = re.compile('[а-яА-ЯёЁ]')


def stats(path):
    try:
        recs = records(path)
    except Exception:
        return 0, 0
    cyr = sum(1 for t, x in recs if CYR.search(x))
    return len(recs), cyr


def stem_keys(fn):
    s = os.path.splitext(fn)[0]
    s = re.sub(r'_eng$', '', s, flags=re.I)
    s = re.sub(r'\s*-\s*\d+\s*тыс\.?$', '', s)
    return s


def list_txt(d):
    """txt-файлы папки и её подпапок первого уровня (SR2HD: Untranslated/DevTranslated), кроме notes."""
    out = []
    for fn in sorted(os.listdir(d)):
        p = os.path.join(d, fn)
        if os.path.isdir(p):
            if fn.lower() != 'notes':
                out += [(p, f) for f in sorted(os.listdir(p)) if f.lower().endswith('.txt')]
        elif fn.lower().endswith('.txt'):
            out.append((d, fn))
    return sorted(out, key=lambda x: x[1].lower())


def main():
    rows = []
    for mod in sorted(os.listdir(TQ)):
        mp = os.path.join(TQ, mod)
        if not os.path.isdir(mp):
            continue
        # папки с русским и английским
        rus_dirs = [d for d in os.listdir(mp) if d.lower() in ('rus', 'questsrus')]
        eng_dirs = [d for d in os.listdir(mp) if d.lower() in ('eng', 'questseng')]
        eng = {}
        for d in eng_dirs:
            for fd, fn in list_txt(os.path.join(mp, d)):
                if fn.lower() == 'readme.txt':
                    continue
                eng[stem_keys(fn).lower()] = os.path.join(fd, fn)
        rus_names = []
        for d in rus_dirs:
            for fd, fn in list_txt(os.path.join(mp, d)):
                rus_names.append((os.path.splitext(fn)[0], os.path.join(fd, fn)))
        rus_stems = {n.lower() for n, _ in rus_names}
        for name, rp in rus_names:
            n_rus, _ = stats(rp)
            ep = eng.get(name.lower())
            if ep is None and (name.lower() + 'rus') in eng:
                ep = eng[name.lower() + 'rus']
            if ep is None:
                n_en, cyr = 0, 0
            else:
                n_en, cyr = stats(ep)
            man = MANUAL.get((mod, name))
            if man:
                status, date, lore, note = man
            else:
                date, lore, note = '', '', ''
                if ep is None:
                    status = 'НЕТ ПЕРЕВОДА'
                elif n_en == 0:
                    status = 'НЕТ ПЕРЕВОДА'
                    note = 'файл не читается'
                elif cyr <= 3:
                    status = 'АНГЛ. ЕСТЬ (не проверен)'
                    if cyr:
                        note = 'кириллица в %d зап.' % cyr
                elif cyr >= 0.9 * n_en:
                    status = 'НЕТ ПЕРЕВОДА'
                    note = 'в Eng лежит русский текст'
                else:
                    status = 'ЧАСТИЧНО (доперевести)'
            rows.append((mod, name, n_rus, n_en, cyr, status, date, lore, note))
    order = {'ПЕРЕВЕДЁН': 0, 'ВЫЧИТАН': 1}
    lines = []
    ts = datetime.date.today().isoformat()
    lines.append('СТАТУС ТЕКСТОВЫХ КВЕСТОВ (txt) — переведено / проверено')
    lines.append('Сгенерировано qstatus.py %s. Ручные статусы — словарь MANUAL в qstatus.py.' % ts)
    lines.append('')
    lines.append('Статусы:')
    lines.append('  ПЕРЕВЕДЁН   — наш перевод с русского, check 0 ошибок/0 предупреждений')
    lines.append('  ВЫЧИТАН     — английский (КР1) сверен с русским и исправлен/переписан, check 0/0')
    lines.append('  АНГЛ. ЕСТЬ (не проверен) — в Eng английский текст без кириллицы (КР1/оф.), нашей вычитки ещё не было')
    lines.append('  ЧАСТИЧНО    — в Eng часть записей русская (нужно доперевести)')
    lines.append('  НЕТ ПЕРЕВОДА — Eng отсутствует или содержит русский текст')
    lines.append('')
    from collections import Counter, defaultdict
    cnt = Counter(r[5] for r in rows)
    lines.append('ИТОГО квестов: %d' % len(rows))
    for k in ('ПЕРЕВЕДЁН', 'ВЫЧИТАН', 'АНГЛ. ЕСТЬ (не проверен)', 'ЧАСТИЧНО (доперевести)', 'НЕТ ПЕРЕВОДА'):
        lines.append('  %-26s %d' % (k, cnt.get(k, 0)))
    lines.append('')
    bymod = defaultdict(list)
    for r in rows:
        bymod[r[0]].append(r)
    for mod in sorted(bymod):
        rs = bymod[mod]
        c = Counter(r[5] for r in rs)
        lines.append('=' * 100)
        lines.append('%s  (квестов: %d; переведён %d, вычитан %d, англ.есть %d, частично %d, нет %d)' % (
            mod, len(rs), c.get('ПЕРЕВЕДЁН', 0), c.get('ВЫЧИТАН', 0), c.get('АНГЛ. ЕСТЬ (не проверен)', 0),
            c.get('ЧАСТИЧНО (доперевести)', 0), c.get('НЕТ ПЕРЕВОДА', 0)))
        lines.append('=' * 100)
        lines.append('%-26s %6s %6s %6s  %-26s %-11s %-4s %s' % ('Квест', 'RU зап', 'EN зап', 'EN кир', 'Статус', 'Дата', 'Лор', 'Примечание'))
        for r in sorted(rs, key=lambda r: (order.get(r[5], 2), r[1].lower())):
            lines.append('%-26s %6d %6d %6d  %-26s %-11s %-4s %s' % (r[1][:26], r[2], r[3], r[4], r[5], r[6], r[7], r[8]))
        lines.append('')
    lines.append('Примечания: «EN кир» — число EN-записей, содержащих кириллицу. Лор — внесён ли лор в Translation\\lore\\LORE_FACTS.md.')
    lines.append('Квесты только в qmm (без txt) и копии в корне QUESTS (Cybersport.txt, Massacri.txt, TGE, Cat_Meowplants) сюда не входят.')
    out = os.path.join(ROOT, 'QUEST_STATUS.txt')
    open(out, 'w', encoding='utf-8-sig', newline='\r\n').write('\n'.join(lines) + '\n')
    print('записано', out, 'квестов', len(rows))


main()
