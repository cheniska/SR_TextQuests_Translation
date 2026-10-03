#!/usr/bin/env python3
"""qbuild.py <RU.txt> <EN.txt> - сборка квеста из work: <Name>.known.txt + <Name>.p??.txt -> todo_en -> fill -> pack -> struct.
Запуск: python3 qbuild.py TextQuests/RefQuest/Rus/X.txt TextQuests/RefQuest/Eng/X.txt < /dev/null"""
import sys, os, glob, subprocess
ROOT = os.path.dirname(os.path.abspath(__file__))
ru, en = sys.argv[1], sys.argv[2]
name = os.path.splitext(os.path.basename(ru))[0]
W = os.path.join(ROOT, 'Translation', 'work')
parts = [os.path.join(W, name + '.known.txt')] + sorted(glob.glob(os.path.join(W, name + '.p[0-9][0-9].txt')))
txt = ''.join(open(p, encoding='utf-8').read().replace('\r\n', '\n').rstrip('\n') + '\n' for p in parts if os.path.exists(p) and open(p, encoding='utf-8').read().strip())
todo_en = os.path.join(W, name + '.todo_en.txt')
open(todo_en, 'w', encoding='utf-8', newline='\r\n').write(txt)
work = os.path.join(W, name + '.work.txt')
py = sys.executable
for cmd in (['qtr.py', 'fill', ru, todo_en, work], ['qtr.py', 'pack', work, ru, en], ['qtr_struct.py', en, ru]):
    r = subprocess.run([py] + cmd, cwd=ROOT, stdin=subprocess.DEVNULL, capture_output=True, text=True)
    print(r.stdout.strip().splitlines()[-1] if r.stdout.strip() else '', r.stderr.strip()[-300:])
    if r.returncode:
        print(r.stdout[-3000:]); sys.exit(1)
