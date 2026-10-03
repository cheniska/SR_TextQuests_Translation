#!/usr/bin/env python3
"""qrudiff.py <RU_new.txt> <RU_old.txt> <EN_old.txt> [типы...] - для изменённых записей новой версии квеста:
словный дифф RU (старое -> новое) и старый EN; новые записи - целиком. Для доперевода версий-модов. < /dev/null"""
import sys, os, difflib
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import qtr
new, old, en = (dict(qtr.records(qtr.read_tge(p))) for p in sys.argv[1:4])
only = set(sys.argv[4:])
for t, s in qtr.records(qtr.read_tge(sys.argv[1])):
    if only and t not in only:
        continue
    if t not in old:
        print('=== НОВАЯ %s\n%s\n' % (t, s)); continue
    if old[t] == s:
        continue
    a, b = old[t].split(' '), s.split(' ')
    out = []
    for op, i1, i2, j1, j2 in difflib.SequenceMatcher(None, a, b, autojunk=False).get_opcodes():
        if op == 'equal':
            seg = a[i1:i2]
            out.append(' '.join(seg) if len(seg) <= 6 else ' '.join(seg[:3]) + ' … ' + ' '.join(seg[-3:]))
        else:
            out.append('[-%s-]{+%s+}' % (' '.join(a[i1:i2]), ' '.join(b[j1:j2])))
    print('=== %s\nRU: %s\nEN: %s\n' % (t, ' '.join(out), en.get(t, '?')))
