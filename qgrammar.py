#!/usr/bin/env python3
"""qgrammar.py - автоматическая проверка грамматики/орфографии английского корпуса (LanguageTool, офлайн).

  python3 qgrammar.py setup                 -> скачать LanguageTool (Maven) в ~/.cache/qgrammar и собрать запускатель
  python3 qgrammar.py run [группы] [--files ПОДСТРОКА,...]
        группы: sr1 sr2 mods dev (по умолчанию все: sr1 sr2 mods dev; dev = квесты SR2HD, переведённые разработчиками (qcheck_all.DEV))
        --learn: внести ВСЕ текущие находки в GRAMMAR_IGNORE.txt (только после разбора отчёта!)
        --all: показать и советы по стилю/запятым
        -> Translation/work/grammar_report.txt  (сводка по правилам, находки с контекстом, список «опечаток»)
           Translation/work/grammar_matches.tsv (все находки, для скриптов)

Запускать как `python3 qgrammar.py ... < /dev/null` (Windows: `py -3.14`). Нужны java (17+) и mvn (только для setup).
Шум отсекается:
  * токены игры заменяются нейтральными словами (<Ranger> -> Smith, {формула}/[pN] -> 5, разметка -> пусто);
  * все слова EN-колонки GLOSSARY.md / GLOSSARY_MODS.md считаются верными;
  * Translation/GRAMMAR_IGNORE.txt - ручные исключения (формат - в шапке файла);
  * отключены правила, противоречащие нашим конвенциям (OFF_RULES ниже).
Одинаковые абзацы проверяются один раз (в отчёте - число повторов и первое место).
"""
import sys, os, re, glob, subprocess, collections, difflib

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import qtr, qcheck_all

ROOT = os.path.dirname(os.path.abspath(__file__))
CACHE = os.path.join(os.path.expanduser('~'), '.cache', 'qgrammar')
LT_VERSION = '6.8'
WORK = os.path.join(ROOT, 'Translation', 'work')
IGNORE = os.path.join(ROOT, 'Translation', 'GRAMMAR_IGNORE.txt')

GROUPS = {
    'sr1': ['TextQuests/SR1TextQuests/Eng/*.txt'],
    'sr2': ['TextQuests/SR2HD/questsEng/*.txt'],  # без квестов разработчиков (qcheck_all.DEV)
    'mods': ['TextQuests/[!S]*/Eng/*.txt', 'TextQuests/Shu*/Eng/*.txt'],  # все моды (кроме SR1TextQuests/SR2HD)
    'dev': ['TextQuests/SR2HD/questsEng/*.txt'],  # только qcheck_all.DEV
}

# Правила, противоречащие конвенциям проекта (прямые кавычки, " - " вместо тире, стиль) или чистый шум.
OFF_RULES = [
    'EN_QUOTES', 'DASH_RULE', 'WHITESPACE_RULE', 'CONSECUTIVE_SPACES', 'COMMA_PARENTHESIS_WHITESPACE',
    'UPPERCASE_SENTENCE_START', 'PUNCTUATION_PARAGRAPH_END', 'EN_UNPAIRED_BRACKETS', 'EN_UNPAIRED_QUOTES',
    'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'MULTIPLICATION_SIGN', 'PLUS_MINUS', 'ELLIPSIS',
    'TOO_LONG_SENTENCE', 'TOO_LONG_PARAGRAPH', 'SENTENCE_WHITESPACE', 'DOUBLE_PUNCTUATION',
    'EN_COMPOUNDS', 'ARROWS', 'SPACE_BEFORE_PARENTHESIS', 'NUMBERS_IN_WORDS', 'EN_SPECIFIC_CASE',
    'APOS_ARE', 'NON_STANDARD_WORD', 'PROFANITY', 'TO_NON_BASE', 'FIRST_OF_ALL',
    'CAFE_DIACRITIC', 'ER', 'HYPHEN_TO_EN', 'INTERJECTIONS_PUNCTUATION',
]
# Категории-советы (стиль, избыточность, «упростите»); запятые — предпочтение, не ошибка. Показывает `--all`.
OFF_CATEGORIES = {'STYLE', 'REDUNDANCY', 'PLAIN_ENGLISH', 'AMERICAN_ENGLISH_STYLE', 'WIKIPEDIA', 'GENDER_NEUTRALITY'}


def soft(rule, cat):
    return cat in OFF_CATEGORIES or (cat == 'PUNCTUATION' and 'COMMA' in rule and rule != 'COMMA_PERIOD_CONFUSION')

POM = """<project xmlns="http://maven.apache.org/POM/4.0.0"><modelVersion>4.0.0</modelVersion>
<groupId>q</groupId><artifactId>qgrammar</artifactId><version>1</version>
<dependencies><dependency><groupId>org.languagetool</groupId><artifactId>language-en</artifactId>
<version>%s</version></dependency></dependencies></project>
""" % LT_VERSION

JAVA = r'''import org.languagetool.*;
import org.languagetool.rules.RuleMatch;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.stream.*;

/** stdin: id\ttext. stdout: id\trule\tcategory\tfrom\tto\tmessage\treplacements. args: отключённые правила. */
public class QG {
  public static void main(String[] a) throws Exception {
    BufferedReader r = new BufferedReader(new InputStreamReader(System.in, StandardCharsets.UTF_8));
    List<String[]> in = r.lines().map(l -> l.split("\t", 2)).filter(p -> p.length == 2).collect(Collectors.toList());
    Set<String> off = new HashSet<>(Arrays.asList(a));
    Language lang = Languages.getLanguageForShortCode("en-US");
    ThreadLocal<JLanguageTool> tl = ThreadLocal.withInitial(() -> {
      JLanguageTool t = new JLanguageTool(lang);
      for (String id : off) t.disableRule(id);
      return t;
    });
    String[] out = new String[in.size()];
    IntStream.range(0, in.size()).parallel().forEach(i -> {
      StringBuilder sb = new StringBuilder();
      try {
        for (RuleMatch m : tl.get().check(in.get(i)[1])) {
          List<String> rep = m.getSuggestedReplacements();
          sb.append(in.get(i)[0]).append('\t').append(m.getRule().getId()).append('\t')
            .append(m.getRule().getCategory().getId()).append('\t').append(m.getFromPos()).append('\t')
            .append(m.getToPos()).append('\t').append(m.getMessage().replace('\t', ' ').replace('\n', ' '))
            .append('\t').append(String.join("|", rep.subList(0, Math.min(3, rep.size())))).append('\n');
        }
      } catch (IOException e) { throw new UncheckedIOException(e); }
      out[i] = sb.toString();
    });
    PrintStream ps = new PrintStream(new FileOutputStream(FileDescriptor.out), true, "UTF-8");
    for (String s : out) ps.print(s);
  }
}
'''


def setup():
    os.makedirs(os.path.join(CACHE, 'src'), exist_ok=True)
    open(os.path.join(CACHE, 'pom.xml'), 'w').write(POM)
    open(os.path.join(CACHE, 'src', 'QG.java'), 'w').write(JAVA)
    if not glob.glob(os.path.join(CACHE, 'lib', 'language-en-*.jar')):
        subprocess.run(['mvn', '-q', 'dependency:copy-dependencies', '-DoutputDirectory=lib'],
                       cwd=CACHE, check=True, stdin=subprocess.DEVNULL)
    subprocess.run(['javac', '-cp', os.path.join('lib', '*'), '-d', 'classes', os.path.join('src', 'QG.java')],
                   cwd=CACHE, check=True, stdin=subprocess.DEVNULL)
    print('LanguageTool готов:', CACHE)


# --- подготовка текста ---------------------------------------------------------------------------
NAME_TOK = {'<Ranger>': 'Smith', '<Player>': 'Smith', '<ToPlanet>': 'Earth', '<FromPlanet>': 'Earth',
            '<ToStar>': 'Sun', '<FromStar>': 'Sun', '<Money>': '500', '<Date>': 'May 5',
            '<CurDate>': 'May 5', '<Day>': 'May 5'}
FORMULA = re.compile(r'\{[^{}\r\n]*\}|\[p\d+\]|\[d\d+\]')
TAG = re.compile(r'<[^<>\t\r\n]{0,40}>')


def clean(s):
    s = FORMULA.sub('5', s)
    s = s.replace('<br>', '\n')
    for k, v in NAME_TOK.items():
        s = s.replace(k, v)
    return TAG.sub('', s)


def corpus(groups, only):
    """-> {текст_абзаца: [места]} ; место = 'Файл Тип#абзац'"""
    files = []
    for g in groups:
        for pat in GROUPS[g]:
            fs = sorted(glob.glob(os.path.join(ROOT, pat)))
            if g in ('sr2', 'dev'):
                fs = [f for f in fs if os.path.basename(f).lower() != 'readme.txt' and qcheck_all.is_dev(f) == (g == 'dev')]
            files += fs
    files = [f for f in files if not qtr.CYR.search(os.path.basename(f))]  # «...rus - 59 тыс.txt» - справочные
    if only:
        files = [f for f in files if any(o.lower() in os.path.basename(f).lower() for o in only)]
    paras = collections.OrderedDict()
    for f in files:
        name = os.path.basename(f)[:-4].replace('_eng', '')
        for t, s in qtr.records(qtr.read_tge(f)):
            for i, p in enumerate(clean(s).split('\n')):
                p = p.strip()
                if len(re.findall(r'[A-Za-z]', p)) < 3:
                    continue
                paras.setdefault(p, []).append('%s %s#%d' % (name, t, i))
    return files, paras


# --- исключения ----------------------------------------------------------------------------------
WORD = re.compile(r"[^\W\d_][\w'’.\-]*")


def load_ignore():
    words, rules, exact = set(), set(), set()
    for g in ('GLOSSARY.md', 'GLOSSARY_MODS.md'):
        p = os.path.join(ROOT, 'Translation', g)
        if not os.path.exists(p):
            continue
        for ln in open(p, encoding='utf-8'):
            if ln.startswith('|'):
                cols = ln.split('|')
                if len(cols) > 2:
                    words.update(w.lower() for w in WORD.findall(cols[2]))
    if os.path.exists(IGNORE):
        for ln in open(IGNORE, encoding='utf-8'):
            ln = ln.rstrip('\n')
            if ln.startswith('word:'):
                words.update(w.lower() for w in ln[5:].split())
            elif ln.startswith('rule:'):
                rules.update(ln[5:].split())
            elif ln.startswith('match:'):
                r, _, txt = ln[6:].strip().partition(' ')
                exact.add((r, txt.strip()))
    return words, rules, exact


BRIT = [('isation', 'ization'), ('ise', 'ize'), ('ising', 'izing'), ('ised', 'ized'), ('yse', 'yze'), ('our', 'or'),
        ('ence', 'ense'), ('grey', 'gray'), ('litre', 'liter'), ('metre', 'meter'), ('centre', 'center'),
        ('ogue', 'og'), ('plough', 'plow'), ('skilful', 'skillful'), ('woollen', 'woolen'), ('aeo', 'eo'),
        ('aedia', 'edia'), ('ppe', 'pe'), ('eable', 'able'), ('lled', 'led'), ('lling', 'ling')]


def british(w, reps):
    """британское написание: американский вариант LanguageTool получается заменой BRIT"""
    w, cand = w.lower(), {r.lower() for r in reps.split('|') if r}
    return any(a in w and w.replace(a, b) in cand for a, b in BRIT)


def is_spelling(rule):
    return rule.startswith('MORFOLOGIK_RULE')


def run(args):
    groups = [a for a in args if a in GROUPS] or ['sr1', 'sr2', 'mods', 'dev']
    only, show_all, learn = [], '--all' in args, '--learn' in args
    if '--files' in args:
        only = args[args.index('--files') + 1].split(',')
    if not os.path.exists(os.path.join(CACHE, 'classes', 'QG.class')):
        setup()
    files, paras = corpus(groups, only)
    words, rules_off, exact = load_ignore()
    texts = list(paras)
    data = ''.join('%d\t%s\n' % (i, t) for i, t in enumerate(texts))
    print('файлов: %d, уникальных абзацев: %d; проверка...' % (len(files), len(texts)), file=sys.stderr)
    out = subprocess.run(['java', '-cp', os.pathsep.join([os.path.join(CACHE, 'classes'), os.path.join(CACHE, 'lib', '*')]),
                          'QG'] + OFF_RULES + sorted(rules_off),
                         input=data.encode('utf-8'), capture_output=True, check=True).stdout.decode('utf-8')
    found = []  # (rule, cat, text, frm, to, msg, rep)
    for ln in out.splitlines():
        p = ln.split('\t')
        if len(p) < 7:
            continue
        i, rule, cat, frm, to, msg, rep = int(p[0]), p[1], p[2], int(p[3]), int(p[4]), p[5], p[6]
        txt = texts[i]
        hit = txt[frm:to]
        if rule in rules_off or (rule, hit.replace('\n', ' ').strip()) in exact or (not show_all and soft(rule, cat)):
            continue
        if is_spelling(rule) or cat == 'TYPOS':
            ws = [w.lower() for w in WORD.findall(hit)]
            if ws and all(w in words or w.strip("'’-") in words for w in ws):
                continue
        found.append((rule, cat, i, frm, to, msg, rep))

    os.makedirs(WORK, exist_ok=True)
    with open(os.path.join(WORK, 'grammar_matches.tsv'), 'w', encoding='utf-8') as f:
        for rule, cat, i, frm, to, msg, rep in found:
            f.write('\t'.join([rule, cat, paras[texts[i]][0], str(len(paras[texts[i]])), texts[i][frm:to], rep, msg,
                               texts[i]]) + '\n')

    spell = collections.OrderedDict()  # слово -> [(i, варианты)]
    other = collections.defaultdict(list)
    for rule, cat, i, frm, to, msg, rep in found:
        if is_spelling(rule):
            spell.setdefault(texts[i][frm:to], []).append((i, rep))
        else:
            other[rule].append((i, frm, to, msg, rep))
    R = []
    R.append('Грамматика: группы %s; файлов %d; уникальных абзацев %d; находок %d (опечаток %d слов, прочих %d).'
             % (','.join(groups), len(files), len(texts), len(found), len(spell), sum(map(len, other.values()))))
    R.append('Исключения: Translation/GRAMMAR_IGNORE.txt (word:/rule:/match:); `learn` вносит все текущие находки.\n')
    R.append('== Сводка по правилам')
    for rule, v in sorted(other.items(), key=lambda kv: -len(kv[1])):
        R.append('%5d  %s  — %s' % (len(v), rule, v[0][3][:90]))
    R.append('')
    for rule, v in sorted(other.items(), key=lambda kv: -len(kv[1])):
        R.append('== %s (%d)' % (rule, len(v)))
        for i, frm, to, msg, rep in v:
            t = texts[i]
            ctx = (t[max(0, frm - 50):frm] + '[[' + t[frm:to] + ']]' + t[to:to + 50]).replace('\n', ' ')
            loc = paras[t][0] + ('' if len(paras[t]) == 1 else ' (x%d)' % len(paras[t]))
            R.append('  %s | %s%s' % (loc, ctx, ' -> ' + rep if rep else ''))
        R.append('')
    def close(w, reps):
        # британизм или опечатка: первый вариант LanguageTool почти совпадает со словом
        r = reps.split('|')[0].lower()
        return bool(r) and ' ' not in r and difflib.SequenceMatcher(None, w.lower(), r).ratio() >= 0.8
    brit = [kv for kv in spell.items() if british(kv[0], kv[1][0][1])]
    near = [kv for kv in spell.items() if kv not in brit and close(kv[0], kv[1][0][1])]
    far = [kv for kv in spell.items() if kv not in brit and not close(kv[0], kv[1][0][1])]
    for title, lst in (('Британская орфография (у нас американская)', brit), ('Вероятные опечатки', near),
                       ('Неизвестные слова (термины/междометия?)', far)):
        R.append('== %s (%d): слово | повторов | первое место | варианты' % (title, len(lst)))
        for w, v in sorted(lst, key=lambda kv: (-len(kv[1]), kv[0].lower())):
            R.append('  %s | %d | %s | %s' % (w, sum(len(paras[texts[i]]) for i, _ in v), paras[texts[v[0][0]]][0],
                                              v[0][1]))
        R.append('')
    if learn:
        new_w = sorted({w for w, v in spell.items() if not british(w, v[0][1])}, key=str.lower)
        new_m = sorted({(r, texts[i][a:b]) for r, c, i, a, b, m, rp in found if not is_spelling(r)})
        with open(IGNORE, 'a', encoding='utf-8') as f:
            f.write('\n# learn %s\n' % ','.join(groups))
            for k in range(0, len(new_w), 12):
                f.write('word: ' + ' '.join(new_w[k:k + 12]) + '\n')
            for r, t in new_m:
                f.write('match: %s %s\n' % (r, t.replace('\n', ' ')))
        print('в исключения: слов %d, находок %d (британизмы не вносятся)' % (len(new_w), len(new_m)))
    rep_path = os.path.join(WORK, 'grammar_report.txt')
    open(rep_path, 'w', encoding='utf-8').write('\n'.join(R) + '\n')
    print(R[0])
    print('отчёт:', os.path.relpath(rep_path, ROOT))


if __name__ == '__main__':
    a = sys.argv[1:]
    if not a or a[0] not in ('setup', 'run'):
        print(__doc__)
    elif a[0] == 'setup':
        setup()
    else:
        run(a[1:])
