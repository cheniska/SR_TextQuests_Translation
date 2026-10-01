"""qtr_apply.py <orig_work> <fixes.txt> <ru.txt> <out_work>
Формат fixes.txt (UTF-8), по строке на правку:
  old ==> new                  глобальная замена подстроки во всех записях
  [Type] old ==> new           только в записях, у которых русский текст совпадает с Type
  @Type ==> полный текст       запись целиком (абзацы через ' ¶ '), + все записи с тем же русским
  # комментарий
Пустая old недопустима. Если old не найден - сообщение NOFIND."""
import sys, re
sys.path.insert(0, 'E:/disasm2500/QUESTS')
import qtr

orig, fixes, rus, out = sys.argv[1:5]
ru = qtr.records(qtr.read_tge(rus))
en = qtr.records(open(orig, encoding='utf-8').read())
assert [t for t, _ in ru] == [t for t, _ in en]
ru_of = {t: r for t, r in ru}
texts = [e for _, e in en]
types = [t for t, _ in en]
rus_txt = [r for _, r in ru]
bad = 0
for ln, line in enumerate(open(fixes, encoding='utf-8').read().split('\n'), 1):
    line = line.rstrip('\r')
    if not line.strip() or line.lstrip().startswith('#'):
        continue
    if ' ==> ' not in line:
        print('BADLINE', ln, line[:80]); bad += 1; continue
    old, new = line.split(' ==> ', 1)
    new = new.replace(' ¶ ', '\n')
    if old.startswith('@'):
        t = old[1:]
        if t not in ru_of:
            print('NOTYPE', ln, t); bad += 1; continue
        for i in range(len(texts)):
            if rus_txt[i] == ru_of[t]:
                texts[i] = new
        continue
    scope = None
    m = re.match(r'\[([^\]]+)\] ', old)
    if m:
        scope = ru_of[m.group(1)]
        old = old[m.end():]
    old = old.replace(' ¶ ', '\n')
    hit = 0
    for i in range(len(texts)):
        if scope is not None and rus_txt[i] != scope:
            continue
        if old in texts[i]:
            texts[i] = texts[i].replace(old, new)
            hit += 1
    if not hit:
        print('NOFIND', ln, old[:70]); bad += 1
res = list(zip(types, texts))
open(out, 'w', encoding='utf-8', newline='\r\n').write(qtr.fmt_recs(res))
print('applied; problems:', bad)
