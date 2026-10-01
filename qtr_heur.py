"""qtr_heur.py <RU.txt> <EN.txt>
Эвристики для проверки готового EN против RU: цифры, число абзацев, соотношение длин,
число предложений, финальная точка, парность кавычек. Печатает подозрительные записи."""
import sys, re
sys.path.insert(0, 'E:/disasm2500/QUESTS')
import qtr

ru = qtr.records(qtr.read_tge(sys.argv[1]))
en_p = sys.argv[2]
en = qtr.records(open(en_p, encoding='utf-8').read() if en_p.endswith('.work.txt') else qtr.read_tge(en_p))
seen = set()
for (t, r), (t2, e) in zip(ru, en):
    if r in seen:
        continue
    seen.add(r)
    out = []
    dr = [x.replace('.', '') for x in re.findall(r'\d+', re.sub(r'<[^>]*>', '', r))]
    de = re.findall(r'\d+', re.sub(r'<[^>]*>', '', e))
    if sorted(dr) != sorted(de):
        out.append('digits %s vs %s' % (dr, de))
    if r.count('\n') != e.count('\n'):
        out.append('paras %d vs %d' % (r.count('\n'), e.count('\n')))
    lr, le = len(r), len(e)
    if lr > 60 and not (0.85 < le / lr < 1.5):
        out.append('len %d vs %d (%.2f)' % (lr, le, le / lr))
    sr = len(re.findall(r'[.!?…]+(\s|$)', r))
    se = len(re.findall(r'[.!?…]+(\s|$)', e))
    if abs(sr - se) >= 2:
        out.append('sent %d vs %d' % (sr, se))
    if lr <= 120:
        if r.rstrip().endswith('.') != e.rstrip().endswith('.'):
            out.append('final-period')
        if (r.count('"') % 2) != (e.count('"') % 2):
            out.append('quotes')
    if out:
        print(t, '|', ', '.join(out))
