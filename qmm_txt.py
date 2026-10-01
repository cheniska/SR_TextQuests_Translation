#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
qmm_txt.py - конвертер квестов Space Rangers (.qmm) <-> текстовый .txt,
побайтово совместимый по формату txt с TGE (ExportText/ImportText, TextQuest.pas).

Формат qmm: 5.0.0 / 5.0.1 / 5.0.2 (FileVersion 1111111125..27) - все, что есть в SR2HD и модах.

Использование (py -3.14 qmm_txt.py ... < /dev/null):
  export <qmm|папка> <txt|папка>            qmm -> txt
  import <qmm|папка> <txt|папка> <out>      txt -> qmm (заменяет ТОЛЬКО тексты в исходном qmm;
                                            все остальные байты остаются как есть, версия формата сохраняется)
  check  <qmm|папка>                        разобрать qmm до конца файла и проверить структуру

Формат txt (как у TGE): UTF-16LE + BOM, CRLF; строка = <Тип>\t<текст>; продолжение
многострочного текста - строки с типом '*'.
Типы: QuestDescription, QuestSuccessGovMessage, Par<N>-<k>, Par<N>-crit, Loc<N>-<k>,
Loc<N>-par<P>-crit, Path<N>, Path<N>b, Path<N>-par<P>-crit.
"""
import os
import struct
import sys

FV_5_0_0, FV_5_0_1, FV_5_0_2 = 1111111125, 1111111126, 1111111127


class QmmError(Exception):
    pass


def trim_ex(s):
    """EC_Str.TrimEx: режет пробел, TAB, CR, LF, NUL с обоих концов."""
    return s.strip(' \t\r\n\x00')


class TF:
    """TTextField: позиция байтов в файле + загруженный (склеенный) текст."""
    __slots__ = ('start', 'end', 'text')

    def __init__(self, start, end, text):
        self.start, self.end, self.text = start, end, text


class Reader:
    def __init__(self, data):
        self.d = data
        self.p = 0

    def need(self, n):
        if self.p + n > len(self.d):
            raise QmmError('неожиданный конец файла на %d' % self.p)

    def int(self):
        self.need(4)
        v = struct.unpack_from('<i', self.d, self.p)[0]
        self.p += 4
        return v

    def byte(self):
        self.need(1)
        v = self.d[self.p]
        self.p += 1
        return v

    def skip(self, n):
        self.need(n)
        self.p += n

    def tf(self):
        start = self.p
        m = self.int()
        if m < 0 or m > 100000:
            raise QmmError('странное число строк %d на %d' % (m, start))
        text = ''
        for _ in range(m):
            t = self.int()
            if t < 0:
                raise QmmError('отрицательная длина строки на %d' % self.p)
            self.need(t * 2)
            s = self.d[self.p:self.p + t * 2].decode('utf-16-le', 'surrogatepass')
            self.p += t * 2
            # TextFieldClass.Load: Text = Text + CRLF + trimEX(s) если Text<>''
            text = (text + '\r\n' + trim_ex(s)) if text != '' else trim_ex(s)
        text = trim_ex(text)
        return TF(start, self.p, text)

    def vlist(self):
        cnt = self.int()
        self.byte()
        if cnt < 0 or cnt > 1000000:
            raise QmmError('странный ValuesList')
        self.skip(cnt * 4)
        return cnt


class Par:
    pass


class Delta:
    """TParameterDelta: gate и delta загружаются раздельно и сливаются по ParNum."""

    def __init__(self, no, pmin, pmax):
        self.no = no
        self.min, self.max = pmin, pmax
        self.vg = self.mg = 0
        self.delta = 0
        self.view = 0
        self.mode = 1  # ни Appr, ни Expr, ни Percent
        self.expr = ''
        self.crit = None  # TF

    def gate_no_effect(self, pars):
        if self.no <= 0 or self.no > len(pars):
            return True
        p = pars[self.no - 1]
        return not (self.min > p.min_gate() or self.max < p.max_gate() or self.vg > 0 or self.mg > 0)

    def delta_no_effect(self, pars):
        if self.no <= 0 or self.no > len(pars):
            return True
        if self.view != 0:
            return False
        if self.mode == 3:
            return trim_ex(self.expr) == ''
        if self.mode == 0:
            return False
        return self.delta == 0


def _par_min_gate(p):
    r = p.min
    if p.type not in (0, 2) and p.lolimit:
        r += 1
    return r


def _par_max_gate(p):
    r = p.max
    if p.type not in (0, 2) and not p.lolimit:
        r -= 1
    return r


Par.min_gate = _par_min_gate
Par.max_gate = _par_max_gate


def read_delta_part(r, d):
    d.delta = r.int()
    d.view = r.byte()
    d.mode = r.byte()
    d.expr = r.tf().text
    d.crit = r.tf()
    r.tf()  # Image
    r.tf()  # Sound
    r.tf()  # BGM


def read_gate_part(r, d):
    d.min = r.int()
    d.max = r.int()
    d.vg = r.vlist()
    d.mg = r.vlist()


class Quest:
    pass


def parse(data):
    r = Reader(data)
    q = Quest()
    q.data = data
    ver = r.int()
    if ver not in (FV_5_0_0, FV_5_0_1, FV_5_0_2):
        raise QmmError('неподдерживаемая версия формата %d (поддержаны 5.0.0-5.0.2)' % ver)
    q.version = ver
    if ver >= FV_5_0_2:
        r.int()
        r.int()
        r.tf()  # QuestComment
    r.skip(1)  # SRace
    r.skip(1)  # NeedNotToReturn
    r.skip(3)  # STargetRace, SRangerStatus, SRangerRace
    for _ in range(7):  # PlanetReaction, X/YScreenRes, BlockX/Ygradient, DefPathGoTimes, Difficulty
        r.int()
    cnt = r.int()
    if cnt < 0 or cnt > 1000:
        raise QmmError('странное число параметров %d' % cnt)
    pars = []
    for i in range(1, cnt + 1):
        p = Par()
        p.num = i
        p.min = r.int()
        p.max = r.int()
        p.type = r.int()
        r.byte()  # ShowIfZero
        p.lolimit = bool(r.byte())
        p.enabled = bool(r.byte())
        nv = r.int()
        r.byte()  # Money
        r.tf()  # Name
        if nv < 0 or nv > 100000:
            raise QmmError('странное ValueOfViewStrings %d' % nv)
        p.views = []
        for _ in range(nv):
            r.int()
            r.int()
            p.views.append(r.tf())
        p.crit = r.tf()
        r.tf()
        r.tf()
        r.tf()  # Image, Sound, BGM
        r.tf()  # DiapStartValues
        pars.append(p)
    # TextQuest.Load: после cnt параметров добавляется ещё один (cnt+1), выключенный, с min=0,max=1
    extra = Par()
    extra.num = cnt + 1
    extra.min, extra.max, extra.type, extra.lolimit, extra.enabled = 0, 1, 0, True, False
    extra.views, extra.crit = [], None
    pars.append(extra)
    q.pars = pars
    for _ in range(7):  # RToStar, RToPlanet, RDate, RMoney, RFromPlanet, RFromStar, RRanger
        r.tf()
    cntL = r.int()
    cntP = r.int()
    q.success = r.tf()
    q.descr = r.tf()
    # локации
    q.locs = []
    for _ in range(cntL):
        loc = Quest()
        r.int()
        r.int()
        r.int()
        loc.num = r.int()
        if ver >= FV_5_0_1:
            r.int()  # VisitsAllowed
        r.byte()
        dcnt = r.int()
        deltas = {}
        order = []
        for _ in range(dcnt):
            no = r.int()
            d = deltas.get(no)
            if d is None:
                d = deltas[no] = Delta(no, 0, 1)
                order.append(d)
            else:  # ClearDelta перед повторной загрузкой
                d.delta, d.view, d.mode, d.expr, d.crit = 0, 0, 1, '', None
            read_delta_part(r, d)
        loc.dpars = [d for d in order if 1 <= d.no <= len(pars) and not d.delta_no_effect(pars)]
        n = r.int()
        loc.descrs = []
        for _ in range(n):
            loc.descrs.append(r.tf())
            r.tf()
            r.tf()
            r.tf()
        r.byte()  # RandomShowLocationDescriptions
        r.tf()  # LocDescrExprOrder
        q.locs.append(loc)
    # пути
    q.paths = []
    for _ in range(cntP):
        pa = Quest()
        r.skip(8)  # probability
        r.int()
        pa.num = r.int()
        pa.frm = r.int()
        r.int()  # ToLocation
        r.byte()  # AlwaysShowWhenPlaying
        r.int()
        r.int()  # PassesAllowed, ShowOrder
        deltas = {}
        order = []
        n = r.int()
        for _ in range(n):
            no = r.int()
            d = deltas.get(no)
            if d is None:
                if 1 <= no <= len(pars):
                    d = Delta(no, pars[no - 1].min, pars[no - 1].max)
                else:
                    d = Delta(no, 0, 1)
                deltas[no] = d
                order.append(d)
            d.min, d.max, d.vg, d.mg = 0, 1, 0, 0
            read_gate_part(r, d)
        n = r.int()
        for _ in range(n):
            no = r.int()
            d = deltas.get(no)
            if d is None:
                if 1 <= no <= len(pars):
                    d = Delta(no, pars[no - 1].min, pars[no - 1].max)
                else:
                    d = Delta(no, 0, 1)
                deltas[no] = d
                order.append(d)
            else:
                d.delta, d.view, d.mode, d.expr, d.crit = 0, 0, 1, '', None
            read_delta_part(r, d)
        r.tf()  # LogicExpression
        pa.start = r.tf()
        pa.end = r.tf()
        r.tf()
        r.tf()
        r.tf()  # Image, Sound, BGM
        pa.dpars = [d for d in order if 1 <= d.no <= len(pars)
                    and not (d.delta_no_effect(pars) and d.gate_no_effect(pars))]
        q.paths.append(pa)
    if r.p != len(data):
        raise QmmError('после разбора осталось %d байт (разбор закончился на %d из %d)'
                       % (len(data) - r.p, r.p, len(data)))
    return q


def fields(q):
    """Список (тип, TF) в порядке экспорта TGE. Второй элемент - список TF, которые надо обновить
    при импорте (для Path<N>: дубликаты сообщений пути из той же локации)."""
    out = []

    def add(t, tf, extra=()):
        if trim_ex(tf.text) != '':
            out.append((t, tf, list(extra)))

    add('QuestDescription', q.descr)
    add('QuestSuccessGovMessage', q.success)
    for p in q.pars:
        if not p.enabled:
            continue
        for j, v in enumerate(p.views, 1):
            add('Par%d-%d' % (p.num, j), v)
        if p.type != 0 and p.crit is not None:
            add('Par%d-crit' % p.num, p.crit)
    for loc in q.locs:
        for j, tf in enumerate(loc.descrs or [], 1):
            add('Loc%d-%d' % (loc.num, j), tf)
        for d in loc.dpars:
            if d.crit is not None:
                add('Loc%d-par%d-crit' % (loc.num, d.no), d.crit)
    for i, pa in enumerate(q.paths):
        st = trim_ex(pa.start.text)
        if st != '':
            dup = False
            for pb in q.paths[:i]:
                if pb.frm == pa.frm and trim_ex(pb.start.text) == st:
                    dup = True
                    break
            if not dup:
                followers = [pc.start for pc in q.paths[i + 1:]
                             if pc.frm == pa.frm and trim_ex(pc.start.text) == st]
                add('Path%d' % pa.num, pa.start, followers)
        add('Path%db' % pa.num, pa.end)
        for d in pa.dpars:
            if d.crit is not None:
                add('Path%d-par%d-crit' % (pa.num, d.no), d.crit)
    # Loc без описаний: в TGE у локации всегда минимум 1 (пустое) описание - пустое не экспортируется
    return out


def export_text(q):
    lines = []
    for t, tf, _ in fields(q):
        parts = tf.text.split('\r\n')
        for k, s in enumerate(parts):
            lines.append((t if k == 0 else '*') + '\t' + s + '\r\n')
    return b'\xff\xfe' + ''.join(lines).encode('utf-16-le', 'surrogatepass')


def parse_txt(raw):
    if raw[:2] != b'\xff\xfe':
        raise QmmError('это не Unicode (UTF-16LE с BOM) txt')
    s = raw[2:].decode('utf-16-le', 'surrogatepass')
    recs = []  # [тип, текст]
    pos = 0
    n = len(s)
    while pos < n:
        e = s.find('\r\n', pos)
        if e < 0:
            line, pos = s[pos:], n
        else:
            line, pos = s[pos:e], e + 2
        t, sep, txt = line.partition('\t')
        if not sep:
            raise QmmError('строка без TAB: %r' % line[:60])
        if t == '*':
            if not recs:
                raise QmmError("'*' в начале файла")
            recs[-1][1] += '\r\n' + txt
        else:
            recs.append([t, txt])
    return recs


def encode_tf(text):
    text = trim_ex(text)
    if text == '':
        return struct.pack('<i', 0)
    b = text.encode('utf-16-le', 'surrogatepass')
    return struct.pack('<ii', 1, len(b) // 2) + b


def import_text(q, recs):
    """Возвращает (новые байты qmm, список предупреждений). Заменяются только изменившиеся тексты."""
    warns = []
    by_type = {}
    for t, txt in recs:
        if t in by_type:
            warns.append('повтор типа %s - берётся последний' % t)
        by_type[t] = txt
    flds = fields(q)
    known = set(t for t, _, _ in flds)
    for t in by_type:
        if t not in known:
            warns.append('в txt есть тип %s, которого нет в qmm - пропущен' % t)
    patches = {}  # start -> (end, bytes)
    for t, tf, followers in flds:
        if t not in by_type:
            warns.append('в txt нет типа %s - текст не менялся' % t)
            continue
        new = by_type[t]
        if trim_ex(new) == tf.text:
            continue
        b = encode_tf(new)
        for f in [tf] + followers:
            patches[f.start] = (f.end, b)
    out = bytearray()
    p = 0
    for st in sorted(patches):
        end, b = patches[st]
        out += q.data[p:st]
        out += b
        p = end
    out += q.data[p:]
    return bytes(out), warns


# ------------------------------------------------------------------ CLI
def iter_pairs(src, dst, ext_src, ext_dst):
    if os.path.isfile(src):
        d = dst if not os.path.isdir(dst) else os.path.join(dst, os.path.splitext(os.path.basename(src))[0] + ext_dst)
        yield src, d
        return
    for root, _, files in os.walk(src):
        for f in sorted(files):
            if f.lower().endswith(ext_src):
                rel = os.path.relpath(os.path.join(root, f), src)
                yield os.path.join(root, f), os.path.join(dst, os.path.splitext(rel)[0] + ext_dst)


def main(argv):
    if len(argv) < 3 or argv[1] not in ('export', 'import', 'check'):
        print(__doc__)
        return 2
    cmd = argv[1]
    bad = 0
    if cmd == 'check':
        for src, _ in iter_pairs(argv[2], argv[2], '.qmm', ''):
            try:
                q = parse(open(src, 'rb').read())
                print('OK   v%d pars=%d loc=%d path=%d fields=%d  %s' % (
                    q.version - 1111111100, len(q.pars) - 1, len(q.locs), len(q.paths), len(fields(q)), src))
            except QmmError as e:
                bad += 1
                print('FAIL %s: %s' % (src, e))
        return 1 if bad else 0
    if cmd == 'export':
        for src, dst in iter_pairs(argv[2], argv[3], '.qmm', '.txt'):
            try:
                q = parse(open(src, 'rb').read())
            except QmmError as e:
                bad += 1
                print('FAIL %s: %s' % (src, e))
                continue
            os.makedirs(os.path.dirname(os.path.abspath(dst)), exist_ok=True)
            open(dst, 'wb').write(export_text(q))
            print('ok', dst)
        return 1 if bad else 0
    if cmd == 'import':
        if len(argv) < 5:
            print(__doc__)
            return 2
        qsrc, tsrc, dst = argv[2], argv[3], argv[4]
        for src, _ in iter_pairs(qsrc, qsrc, '.qmm', ''):
            if os.path.isfile(qsrc):
                txt = tsrc if os.path.isfile(tsrc) else os.path.join(tsrc, os.path.splitext(os.path.basename(src))[0] + '.txt')
                out = dst if not os.path.isdir(dst) else os.path.join(dst, os.path.basename(src))
            else:
                rel = os.path.relpath(src, qsrc)
                txt = os.path.join(tsrc, os.path.splitext(rel)[0] + '.txt')
                out = os.path.join(dst, rel)
            if not os.path.exists(txt):
                continue  # как в TGE: без txt - пропуск
            try:
                q = parse(open(src, 'rb').read())
                data, warns = import_text(q, parse_txt(open(txt, 'rb').read()))
            except QmmError as e:
                bad += 1
                print('FAIL %s: %s' % (src, e))
                continue
            os.makedirs(os.path.dirname(os.path.abspath(out)), exist_ok=True)
            open(out, 'wb').write(data)
            print('ok', out, '(%d предупр.)' % len(warns) if warns else '')
            for w in warns[:10]:
                print('   !', w)
        return 1 if bad else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
