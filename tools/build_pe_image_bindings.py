"""Produce Windows edition coordinates from PE unwind/code and named globals.

Called only by the normal build pipeline. Never runs either game executable.
Equal instruction shapes establish whole function ranges; changed operands are
retained as exact byte translations for the existing runtime ownership checks.
"""
from __future__ import annotations
import bisect
import difflib
import hashlib
import pickle
from pathlib import Path
import re
import struct
import subprocess
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]

class PeImage:
    def __init__(self, path: Path):
        self.path = path
        self.data = path.read_bytes()
        pe = struct.unpack_from('<I', self.data, 0x3c)[0]
        if self.data[:2] != b'MZ' or self.data[pe:pe+4] != b'PE\0\0':
            raise ValueError(f'Not a PE image: {path}')
        machine, count, self.timestamp = struct.unpack_from('<HHI', self.data, pe+4)
        optional_size = struct.unpack_from('<H', self.data, pe+20)[0]
        optional = pe+24
        if machine != 0x8664 or struct.unpack_from('<H', self.data, optional)[0] != 0x20b:
            raise ValueError(f'Not a native x64 PE image: {path}')
        self.base = struct.unpack_from('<Q', self.data, optional+24)[0]
        self.size = struct.unpack_from('<I', self.data, optional+56)[0]
        self.sections = []
        for i in range(count):
            at = optional+optional_size+i*40
            size, rva, raw_size, raw = struct.unpack_from('<IIII', self.data, at+8)
            flags = struct.unpack_from('<I', self.data, at+36)[0]
            self.sections.append((rva, rva+max(size, raw_size), raw, raw_size, flags))
        pdata, length = struct.unpack_from('<II', self.data, optional+112+3*8)
        entries = [struct.unpack_from('<III', self.read(pdata+i, 12))[:2] for i in range(0, length, 12)]
        self.functions = sorted(set((a,b) for a,b in entries if a < b))
        # Leaf routines have no unwind records. Their gaps are separate regions;
        # equal complete assembly is required before admitting those addresses.
        text = next(s for s in self.sections if s[4] & 0x20000000)
        regions = []
        cursor = text[0]
        for a,b in self.functions:
            if a > cursor: regions.append((cursor,a))
            regions.append((a,b))
            cursor = max(cursor,b)
        if cursor < text[1]: regions.append((cursor,text[1]))
        self.functions = regions
        self.starts = [a for a,b in regions]
        self.shapes = {}
        self.refs = {}
        self.rows = {}
        self.imports = {}
        imports, _ = struct.unpack_from('<II', self.data, optional+112+8)
        while imports:
            original, _, _, name, iat = struct.unpack('<IIIII', self.read(imports,20))
            if not name: break
            library = self.cstring(name).lower()
            for i in range(10000):
                value = struct.unpack('<Q',self.read((original or iat)+i*8,8))[0]
                if not value: break
                symbol = str(value & 0xffff) if value >> 63 else self.cstring(value+2)
                self.imports[(library,symbol)] = iat+i*8
            imports += 20

    def section(self, rva):
        return next((s for s in self.sections if s[0] <= rva < s[1]), None)

    def read(self, rva, size):
        s = self.section(rva)
        if not s or rva+size > min(s[1],s[0]+s[3]):
            raise ValueError(f'Unbacked PE coordinate {rva:#x}+{size:#x} in {self.path}')
        return self.data[s[2]+rva-s[0]:s[2]+rva-s[0]+size]

    def cstring(self, rva):
        s = self.section(rva)
        at = s[2]+rva-s[0]
        return self.data[at:self.data.index(b'\0',at)].decode('ascii')

    def vtable_type(self, rva):
        locator = struct.unpack('<Q', self.read(rva-8, 8))[0]-self.base
        signature, offset, _, descriptor, _, self_rva = struct.unpack(
            '<IIIIII', self.read(locator, 24))
        if signature != 1 or offset != 0 or self_rva != locator:
            raise ValueError(f'Invalid primary MSVC vtable at {rva:#x} in {self.path}')
        return self.cstring(descriptor+16)

    def disassemble(self, objdump, coordinates):
        cache=ROOT/'data/extracted/cache/native-build'/('pe-3-'+hashlib.sha256(self.data).hexdigest()+'.pickle')
        if cache.is_file():
            self.shapes,self.refs,self.rows=pickle.loads(cache.read_bytes())
            return
        print(f'Reading PE instruction bindings: {self.path}', flush=True)
        line_re = re.compile(r'^\s*([0-9a-f]+):\s*\t([0-9a-f ]+)\t(.*)$')
        process = subprocess.Popen([str(objdump),'-d','-w','-M','intel',str(self.path)], stdout=subprocess.PIPE, text=True, encoding='utf-8', errors='replace')
        current, digest, covered, refs, rows = None, None, 0, [], []
        def finish():
            if current is not None:
                begin,end = self.functions[current]
                if covered == end-begin:
                    self.shapes[begin] = digest.digest()
                    self.refs[begin] = refs
                    if rows: self.rows[begin] = rows
        try:
            for line in process.stdout:
                match = line_re.match(line)
                if not match: continue
                address = int(match[1],16)-self.base
                index = bisect.bisect_right(self.starts,address)-1
                if index < 0: continue
                begin,end = self.functions[index]
                raw = bytes.fromhex(match[2])
                if address+len(raw)>end: continue
                if current != index:
                    finish()
                    current,digest,covered,refs,rows = index,hashlib.sha256(),0,[],[]
                    ci = bisect.bisect_left(coordinates,begin)
                    retain = ci < len(coordinates) and coordinates[ci]<end
                asm = match[3]
                rip = re.search(r'\[rip[+-]0x[0-9a-f]+\].*#\s*(?:0x)?([0-9a-f]+)',asm)
                if rip: refs.append((address-begin,int(rip[1],16)-self.base,'data'))
                asm = re.sub(r'\s*<[^>]*>','',asm.split('#',1)[0]).strip()
                asm = re.sub(r'\[rip[+-]0x[0-9a-f]+\]','[rip+address]',asm)
                branch = re.match(r'((?:bnd\s+)?(?:call|j\w+)\s+)(?:0x)?([0-9a-f]+)$',asm)
                if branch:
                    target = int(branch[2],16)-self.base
                    refs.append((address-begin,target,'code'))
                    operand = f'local:{target-begin:x}' if begin<=target<end else 'address'
                    asm = branch[1]+operand
                # MSVC switch dispatch uses an image-base register plus a
                # literal RVA, rather than a RIP-relative table operand.
                def relative_table(match):
                    value=int(match[1],16)
                    if value>=0x100000 and self.section(value):
                        refs.append((address-begin,value,'table'))
                        return '+image_address]'
                    return match[0]
                asm=re.sub(r'\+0x([0-9a-f]+)\]',relative_table,asm)
                digest.update(f'{address-begin}:{len(raw)}:{asm}\n'.encode())
                covered += len(raw)
                if retain: rows.append((address,raw,asm))
            finish()
        finally:
            process.stdout.close()
        if process.wait(): raise RuntimeError(f'Native objdump failed: {self.path}')
        cache.parent.mkdir(parents=True,exist_ok=True)
        cache.write_bytes(pickle.dumps((self.shapes,self.refs,self.rows),protocol=5))

def generate(reference_path, classic_path, objdump, output):
    a,b = PeImage(reference_path),PeImage(classic_path)
    if (a.timestamp,b.timestamp)!=(0x6a70a6d9,0x6a70b91c):
        raise RuntimeError('PE edition sources must be Steam 53.16 and Classic 53.16.')
    sources = [p for p in (ROOT/'src').iterdir() if p.suffix in ('.h','.inc','.cpp') and 'build_bindings' not in p.name]
    text = '\n'.join(p.read_text(encoding='utf-8') for p in sources)
    from native_pe_coordinates import collect_required_coordinates, PE_VTABLE_TYPE_ANCHORS
    required=collect_required_coordinates(ROOT)
    # A signature can cross several unwind records belonging to one routine.
    # Retaining only its first address loses operand translations in later
    # records, even when those records already have valid address bindings.
    # Include each intersected code region, including no-unwind leaf gaps.
    required_regions=dict(required)
    for address,length in required.items():
        stop=address+length
        i=max(0,bisect.bisect_right(a.starts,address)-1)
        while i<len(a.functions) and a.functions[i][0]<stop:
            begin,end=a.functions[i]
            start,finish=max(address,begin),min(stop,end)
            if start<finish:
                required_regions[start]=max(required_regions.get(start,0),finish-start)
            i+=1
    coordinates = sorted(set(required_regions) | {int(v,16) for v in re.findall(r'\b0x([0-9a-fA-F]+)\b',text) if 0x10000<=int(v,16)<a.size})
    # Native coordinates need their whole containing routine during assembly
    # matching. Retain native candidate routines at the same ordered positions.
    ordered = difflib.SequenceMatcher(None,[y-x for x,y in a.functions],[y-x for x,y in b.functions],autojunk=False)
    candidates = [(a.functions[block.a+i],b.functions[block.b+i]) for block in ordered.get_matching_blocks() for i in range(block.size)]
    native_coordinates = sorted({target for (begin,end),(target,_) in candidates if (j:=bisect.bisect_left(coordinates,begin))<len(coordinates) and coordinates[j]<end})
    a.disassemble(objdump,coordinates)
    b.disassemble(objdump,native_coordinates)
    ranges,changes,pairs = [],{},{}
    def add_range(begin,end,target):
        ranges.append((begin,end,target))
    matched = []
    for (begin,end),(target,other_end) in candidates:
        if begin not in a.shapes or a.shapes[begin]!=b.shapes.get(target): continue
        add_range(begin,end,target)
        matched.append((begin,end,target))
        left,right = a.refs[begin],b.refs[target]
        for (off,ref,kind),(noff,native,nkind) in zip(left,right):
            if off==noff and kind==nkind: pairs.setdefault(ref,set()).add(native)
        j = bisect.bisect_left(coordinates,begin)
        if j<len(coordinates) and coordinates[j]<end:
            changes.update({begin+i:(x,y) for i,(x,y) in enumerate(zip(a.read(begin,end-begin),b.read(target,end-begin))) if x!=y})
    # Linker ordering changes can move otherwise identical functions. A unique
    # complete shape supplies a second binding, never a guessed global delta.
    ashapes,bshapes = {},{}
    for image,store in ((a,ashapes),(b,bshapes)):
        for start,shape in image.shapes.items(): store.setdefault(shape,[]).append(start)
    bound = {x for x,y,z in ranges}
    for shape,left in ashapes.items():
        right=bshapes.get(shape,[])
        if len(left)!=1 or len(right)!=1 or left[0] in bound: continue
        begin,target=left[0],right[0]
        end=a.functions[bisect.bisect_left(a.starts,begin)][1]
        add_range(begin,end,target)
        for (off,ref,kind),(noff,native,nkind) in zip(a.refs[begin],b.refs[target]):
            if off==noff and kind==nkind: pairs.setdefault(ref,set()).add(native)
        j=bisect.bisect_left(coordinates,begin)
        if j<len(coordinates) and coordinates[j]<end:
            changes.update({begin+i:(x,y) for i,(x,y) in enumerate(zip(a.read(begin,end-begin),b.read(target,end-begin))) if x!=y})
    # Official symbols establish object starts. Vtable extents come from actual
    # paired code-pointer slots, never from arbitrary inter-symbol padding.
    tables=[]
    symbols=ET.parse(ROOT/'data/upstream/df-structures/symbols.xml').getroot()
    for image in (a,b):
        table=next(t for t in symbols.iter('symbol-table') if any(int(n.get('value'),16)==image.timestamp for n in t.findall('binary-timestamp')))
        tables.append({(n.tag,n.get('name')):int(n.get('value'),16)-image.base for n in table if n.tag in ('global-address','vtable-address') and n.get('value')})
    for reference, (native, type_name) in PE_VTABLE_TYPE_ANCHORS.items():
        if reference not in required:
            continue
        if a.vtable_type(reference) != type_name or b.vtable_type(native) != type_name:
            raise RuntimeError(f'PE vtable type does not match its ownership anchor at {reference:#x}')
        key = ('vtable-address', type_name)
        tables[0][key], tables[1][key] = reference, native
    named=sorted(set((va,tables[1][name]) for name,va in tables[0].items() if name in tables[1]))
    vtable_ranges=[]
    authoritative={}
    for name,start in tables[0].items():
        if name[0]!='vtable-address' or name not in tables[1]: continue
        target=tables[1][name]
        later=[va for va in tables[0].values() if va>start]
        native_later=[va for va in tables[1].values() if va>target]
        length=min(4096,min(later,default=start+4096)-start,min(native_later,default=target+4096)-target)
        extent=0
        for offset in range(0,length-7,8):
            try:
                ref=struct.unpack('<Q',a.read(start+offset,8))[0]-a.base
                native=struct.unpack('<Q',b.read(target+offset,8))[0]-b.base
            except ValueError: break
            sa,sb=a.section(ref),b.section(native)
            if sa and sb and sa[4]&0x20000000 and sb[4]&0x20000000:
                pairs.setdefault(ref,set()).add(native)
                authoritative.setdefault(ref,set()).add(native)
                extent=offset+8
            else: break
        if extent: vtable_ranges.append((start,start+extent,target))
    data=[]
    for i,(start,target) in enumerate(named):
        sa,sb=a.section(start),b.section(target)
        if not sa or not sb or sa[4]&0x20000000: continue
        data.append((start,start+1,target))
    data.extend(vtable_ranges)
    data.extend((va,va+8,b.imports[key]) for key,va in a.imports.items() if key in b.imports)
    ranges.extend(data)
    ranges.sort()
    starts=[x for x,y,z in ranges]
    def locate(address):
        i=bisect.bisect_right(starts,address)-1
        return ranges[i][2]+address-ranges[i][0] if i>=0 and address<ranges[i][1] else None
    # RIP references and agreeing callers identify readonly constants and leaf
    # entries outside unwind records. Only identical bytes are admitted here.
    # Whole routine shapes do not cover edition-specific inlining or leaf
    # regions sharing one unwind gap. Match only unchanged instruction blocks
    # inside the corresponding routines, retaining their actual operand bytes.
    region_pairs=set(candidates)
    for address,targets in pairs.items():
        if len(targets)!=1: continue
        target=next(iter(targets))
        ai=bisect.bisect_right(a.starts,address)-1
        bi=bisect.bisect_right(b.starts,target)-1
        if ai<0 or bi<0: continue
        ra,rb=a.functions[ai],b.functions[bi]
        if ra[0]<=address<ra[1] and rb[0]<=target<rb[1]:
            region_pairs.add((ra,rb))
    from pe_instruction_match import match_instruction_regions
    incomplete=[]
    for ra,rb in sorted(region_pairs):
        j=bisect.bisect_left(coordinates,ra[0])
        if j<len(coordinates) and coordinates[j]<ra[1] and (ra[0] not in a.shapes or a.shapes.get(ra[0])!=b.shapes.get(rb[0])):
            incomplete.append((ra,rb))
    blocks,operands=match_instruction_regions(a,b,objdump,incomplete,required_regions)
    arefs={start+off:(ref,kind) for start,refs in a.refs.items() for off,ref,kind in refs}
    brefs={start+off:(ref,kind) for start,refs in b.refs.items() for off,ref,kind in refs}
    refsites=sorted(arefs)
    for start,end,target in blocks:
        i=bisect.bisect_left(refsites,start)
        while i<len(refsites) and refsites[i]<end:
            site=refsites[i]; other=brefs.get(target+site-start)
            if other and other[1]==arefs[site][1]:
                pairs.setdefault(arefs[site][0],set()).add(other[0])
            i+=1
    ranges.extend(blocks); ranges.sort(); changes.update(operands)
    starts=[x for x,y,z in ranges]
    extras=[]
    # MSVC places RVA switch tables in .text. These are data, not executable
    # instruction blocks: preserve every arm's already resolved destination.
    for address,length in required.items():
        targets=pairs.get(address,set())
        if length<8 or length%4 or len(targets)!=1 or locate(address) is not None: continue
        target=next(iter(targets))
        try:
            left,right=a.read(address,length),b.read(target,length)
            source_entries=struct.unpack('<'+'I'*(length//4),left)
            target_entries=struct.unpack('<'+'I'*(length//4),right)
            if not all(locate(x)==y for x,y in zip(source_entries,target_entries)): continue
        except ValueError: continue
        extras.append((address,address+length,target))
        changes.update({address+i:(x,y) for i,(x,y) in enumerate(zip(left,right)) if x!=y})
    for address,targets in sorted(pairs.items()):
        if len(targets)!=1 or locate(address) is not None: continue
        target=next(iter(targets)); sa,sb=a.section(address),b.section(target)
        if not sa or not sb: continue
        if not sa[4]&0x20000000 and not sb[4]&0x20000000:
            extras.append((address,address+1,target))
    ranges.extend(extras); ranges.sort()
    # Coalesce consistent overlapping ranges; conflicting coordinates are a
    # real generation failure, never resolved by removing runtime safeguards.
    merged=[]
    for start,end,target in ranges:
        if merged and start<=merged[-1][1] and target-start==merged[-1][2]-merged[-1][0]:
            x,y,z=merged[-1]; merged[-1]=(x,max(y,end),z)
        elif merged and start<merged[-1][1]:
            raise RuntimeError(f'Conflicting PE coordinates: {merged[-1]!r} versus {(start,end,target)!r}')
        else: merged.append((start,end,target))
    ranges=merged
    starts=[x for x,y,z in ranges]
    missing=[]
    for address,length in required.items():
        target=locate(address)
        i=bisect.bisect_right(starts,address)-1
        # Adjacent equal-delta ranges were merged above. Requiring the entire
        # resource inside one such range also excludes unmapped interior gaps.
        if target is None or i<0 or address+length>ranges[i][1]:
            missing.append(f'{address:#x}+{length:#x}')
            continue
        # Emit the complete requested resource, not merely code records whose
        # starts appeared in the source. This also covers readonly signatures
        # and switch-table data that share the same contiguous-span contract.
        # One-byte coordinates also name uninitialized globals. They need an
        # address binding, but have no file-backed signature bytes to emit.
        if length==1 and any(section and not section[4]&0x20000000 and
                point>=section[0]+section[3]
                for point,section in ((address,a.section(address)),(target,b.section(target)))):
            continue
        left,right=a.read(address,length),b.read(target,length)
        changes.update({address+i:(x,y) for i,(x,y) in enumerate(zip(left,right)) if x!=y})
    if missing:
        raise RuntimeError('Cannot produce required Classic PE bindings: '+', '.join(missing))
    for address,targets in authoritative.items():
        if len(targets)==1 and locate(address) is not None and locate(address)!=next(iter(targets)):
            raise RuntimeError(f'PE function mapping disagrees with its named vtable at {address:#x}')
    lines=['// Generated by the normal build pipeline from both Windows 53.16 editions.',
           f'// Steam SHA256: {hashlib.sha256(a.data).hexdigest()}',f'// Classic SHA256: {hashlib.sha256(b.data).hexdigest()}',
           'inline constexpr NativePeRange native_pe_edition_ranges[]{']
    lines.extend(f'    {{0x{x:x}, 0x{y:x}, 0x{z:x}}},' for x,y,z in ranges)
    lines+=['};','inline constexpr NativePeByte native_pe_edition_bytes[]{']
    lines.extend(f'    {{0x{at:x}, 0x{x:02x}, 0x{y:02x}}},' for at,(x,y) in sorted(changes.items()))
    lines+=['};','']
    output.write_text('\n'.join(lines),encoding='utf-8')
    print(f'Generated Windows edition bindings: {len(ranges)} ranges; {len(changes)} operand bytes.',flush=True)
