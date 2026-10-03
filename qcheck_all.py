#!/usr/bin/env python3
"""qcheck_all.py - проверка ВСЕХ английских квестов против русских оригиналов одной командой.

  python3 qcheck_all.py [ПОДСТРОКА ...] [-v] < /dev/null      (Windows: py -3.14)

Для каждого Eng-файла (TextQuests/*/Eng, SR2HD/questsEng/*) находит русский оригинал
(Eng->Rus, questsEng->questsRus, суффикс _eng убирается, регистр имени не важен) и запускает:
  * структуру qtr_struct (BOM, CRLF, типы/порядок записей, число строк, пустые абзацы);
  * проверку qtr.compare (токены разметки, пустые переводы, согласованность повторов; предупреждения - кириллица и пр.).
Печатает таблицу и итог; -v - подробности по файлам с ошибками. Код возврата 1, если есть
структурные расхождения или ошибки check. Внизу - русские файлы без английской пары (не переведены).
"""
import sys, os, glob, re, io, contextlib

ROOT = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, ROOT)
import qtr
import qtr_struct

CYR = re.compile(r'[А-Яа-яЁё]')


def pairs():
    eng = glob.glob(os.path.join(ROOT, 'TextQuests', '*', 'Eng', '*.txt')) + \
          glob.glob(os.path.join(ROOT, 'TextQuests', '*', 'questsEng', '*', '*.txt'))
    out, used = [], set()
    for e in sorted(eng):
        if os.path.basename(os.path.dirname(e)) == 'notes':
            continue
        if CYR.search(os.path.basename(e)):          # «...rus - 59 тыс.txt» - справочные копии
            continue
        d = os.path.dirname(e)
        rd = d.replace(os.sep + 'questsEng', os.sep + 'questsRus')
        rd = os.path.join(os.path.dirname(rd), 'Rus') if os.path.basename(rd) == 'Eng' else rd
        name = re.sub(r'_eng$', '', os.path.basename(e)[:-4], flags=re.I).lower()
        cand = [r for r in glob.glob(os.path.join(rd, '*.txt')) if os.path.basename(r)[:-4].lower() == name]
        out.append((e, cand[0] if cand else None))
        if cand:
            used.add(cand[0])
    rus = glob.glob(os.path.join(ROOT, 'TextQuests', '*', 'Rus', '*.txt')) + \
          glob.glob(os.path.join(ROOT, 'TextQuests', '*', 'questsRus', '*', '*.txt'))
    return out, sorted(set(rus) - used)


def rel(p):
    return os.path.relpath(p, ROOT)


def main(args):
    verbose = '-v' in args
    only = [a.lower() for a in args if a != '-v']
    ps, untranslated = pairs()
    if only:
        ps = [p for p in ps if any(o in rel(p[0]).lower() for o in only)]
    bad = 0
    print('%-62s %6s %6s %6s %6s' % ('файл', 'запис', 'струк', 'ошиб', 'предуп'))
    for en, ru in ps:
        if not ru:
            print('%-62s  НЕТ РУССКОГО ОРИГИНАЛА' % rel(en)); bad += 1
            continue
        try:
            n, serr = qtr_struct.struct_errors(en, ru)
            with contextlib.redirect_stdout(io.StringIO()):
                cerr, cwarn = qtr.compare(qtr.read_tge(en), qtr.read_tge(ru))
        except Exception as ex:                       # нечитаемый файл (строка без TAB и т.п.)
            print('%-62s  ОШИБКА ЧТЕНИЯ: %s' % (rel(en), ex)); bad += 1
            continue
        mark = '' if not serr and not cerr else '  <<<'
        print('%-62s %6d %6d %6d %6d%s' % (rel(en), n, len(serr), len(cerr), len(cwarn), mark))
        if serr or cerr:
            bad += 1
            if verbose:
                for x in serr[:20]:
                    print('      СТРУКТУРА:', x)
                for x in cerr[:20]:
                    print('      ОШИБКА:', x)
    print('\nфайлов: %d, с проблемами: %d' % (len(ps), bad))
    if untranslated and not only:
        print('русские без английской пары (%d): %s' % (
            len(untranslated), ', '.join(rel(r) for r in untranslated)))
    return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
