import re, sys
sys.path.insert(0, 'E:/disasm2500/QUESTS')
import qtr

src, dst = sys.argv[1], sys.argv[2]
recs = qtr.records(open(src, encoding='utf-8').read())

CLR = re.compile(r'([ \t]*)<clr>([ \t]*)(.*?)([ \t]*)<clrEnd>([ \t]*)', re.S)


def fix_clr(t):
    def rep(m):
        pre, ip, inner, it, post = m.groups()
        start = m.start()
        at_start = start == 0 or t[start - 1] == '\n'
        nxt = t[m.end():m.end() + 1]
        sb = bool(pre or ip) and not at_start
        sa = bool(it or post) and nxt not in ('', '\n', ',', '.', ';', ':', '!', '?', ')', '"')
        if at_start and pre:
            pass
        return (' ' if sb else '') + '<clr>' + inner + '<clrEnd>' + (' ' if sa else '')
    return CLR.sub(rep, t)


out = []
for t, x in recs:
    x = fix_clr(x)
    x = re.sub(r'(?m)^ +(- )', r'\1', x)
    out.append((t, x))
open(dst, 'w', encoding='utf-8', newline='\r\n').write(qtr.fmt_recs(out))
print('postfix ok', len(out))
