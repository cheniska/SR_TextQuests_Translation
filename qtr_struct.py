r"""Проверка структуры английского txt относительно русского (TGE).
  python3 qtr_struct.py <eng.txt> <rus.txt>       (на Windows: py -3.14 qtr_struct.py ... < /dev/null)
Проверяет: BOM UTF-16LE, только CRLF (нет одиночных LF/CR), каждая строка с TAB,
те же типы записей в том же порядке, то же число строк в каждой записи,
пустые строки-абзацы (`*<TAB>`) на тех же местах. Код возврата 1 при расхождениях."""
import sys
sys.path.insert(0, '.')
import qtr


def raw_check(path):
    err = []
    b = open(path, 'rb').read()
    if b[:2] != b'\xff\xfe':
        err.append('нет BOM UTF-16LE')
        return err
    s = b[2:].decode('utf-16-le')
    lone_lf = s.replace('\r\n', '').count('\n')
    lone_cr = s.replace('\r\n', '').count('\r')
    if lone_lf or lone_cr:
        err.append('одиночных LF: %d, CR: %d' % (lone_lf, lone_cr))
    if not s.endswith('\r\n'):
        err.append('файл не заканчивается CRLF')
    for i, ln in enumerate(s.split('\r\n'), 1):
        if ln and '\t' not in ln and ln != '*':
            err.append('строка %d без TAB: %r' % (i, ln[:50]))
    return err


def main(en_p, ru_p):
    err = raw_check(en_p)
    en, ru = qtr.records(qtr.read_tge(en_p)), qtr.records(qtr.read_tge(ru_p))
    if [t for t, _ in en] != [t for t, _ in ru]:
        err.append('типы/порядок записей не совпадают (EN %d, RU %d)' % (len(en), len(ru)))
    else:
        for (t, a), (_, b) in zip(en, ru):
            la, lb = a.split('\n'), b.split('\n')
            if len(la) != len(lb):
                err.append('%s: строк %d, в RU %d' % (t, len(la), len(lb)))
            elif [not x.strip() for x in la] != [not x.strip() for x in lb]:
                err.append('%s: пустые строки-абзацы не на тех местах' % t)
    for e in err:
        print('СТРУКТУРА:', e)
    print('%s: записей %d, расхождений структуры: %d' % (en_p, len(ru), len(err)))
    return 1 if err else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1], sys.argv[2]))
