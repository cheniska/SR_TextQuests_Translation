#!/usr/bin/env python3
"""qreuse.py - перевод-память по готовому корпусу: что из нового RU-квеста уже переведено.

  python3 qreuse.py <RU.txt> <work_dir> [--prefer ПОДСТРОКА ...] [--only ПОДСТРОКА ...] < /dev/null

Память = все пары Eng/RU корпуса (qcheck_all.pairs, только с совпадающими типами записей): RU-текст записи -> EN.
Для первых вхождений уникальных RU-текстов квеста (как qtr.py todo) пишет:
  <work_dir>/<Name>.known.txt  - записи, найденные в памяти (готовый EN; формат todo_en)
  <work_dir>/<Name>.todo.txt   - только НЕнайденные (их переводить, qtr_partcheck работает с этим файлом)
--prefer: при разных EN для одного RU брать из файлов, чей путь содержит подстроку (напр. версию того же квеста);
--only: брать память только из этих файлов (по умолчанию - весь корпус).
Дальше: cat <Name>.known.txt <Name>.p??.txt > <Name>.todo_en.txt; qtr.py fill/pack как обычно.
"""
import sys, os, collections

ROOT = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, ROOT)
import qtr
import qcheck_all


def opt(args, key):
    out, cur = [], False
    for a in args:
        if a.startswith('--'):
            cur = a == key
        elif cur:
            out.append(a.lower())
    return out


def main(a):
    src, wd = a[0], a[1]
    prefer, only = opt(a, '--prefer'), opt(a, '--only')
    mem = collections.defaultdict(collections.Counter)  # ru -> Counter(en)
    pref = {}
    pairs, _ = qcheck_all.pairs()
    for en_p, ru_p in pairs:
        if not ru_p or os.path.abspath(ru_p) == os.path.abspath(src):
            continue
        rel = os.path.relpath(en_p, ROOT).lower()
        if only and not any(o in rel for o in only):
            continue
        try:
            en, ru = qtr.records(qtr.read_tge(en_p)), qtr.records(qtr.read_tge(ru_p))
        except ValueError:
            continue
        if [t for t, _ in en] != [t for t, _ in ru]:
            continue
        for (_, e), (_, r) in zip(en, ru):
            if r.strip() and not qtr.CYR.search(e):
                mem[r][e] += 1
                if prefer and any(p in rel for p in prefer):
                    pref.setdefault(r, e)
    recs = qtr.records(qtr.read_tge(src))
    todo, _ = qtr.first_occ(recs)
    known, unknown = [], []
    for t, x in todo:
        if x in pref:
            known.append((t, pref[x]))
        elif x in mem:
            known.append((t, mem[x].most_common(1)[0][0]))
        else:
            unknown.append((t, x))
    name = os.path.splitext(os.path.basename(src))[0]
    os.makedirs(wd, exist_ok=True)
    open(os.path.join(wd, name + '.known.txt'), 'w', encoding='utf-8', newline='\r\n').write(qtr.fmt_recs(known) if known else '')
    open(os.path.join(wd, name + '.todo.txt'), 'w', encoding='utf-8', newline='\r\n').write(qtr.fmt_recs(unknown) if unknown else '')
    chars = sum(len(x) for _, x in unknown)
    print('%s: уникальных %d, найдено в памяти %d, переводить %d (%d символов)' % (name, len(todo), len(known), len(unknown), chars))


if __name__ == '__main__':
    main(sys.argv[1:])
