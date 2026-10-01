#!/usr/bin/env python3
"""Extract item-description producers from the installed native PE and RAWs.

Offline source extraction only: no translator, game process, generated mapping,
build, or test is invoked. RTTI determines the item/improvement owner set. The
instruction walk follows direct producer calls and records every virtual/data
boundary; embedded jump tables are decoded as selectors, never instructions.
Historical artwork and memorial subgraphs retain their existing source catalogs.
"""
from __future__ import annotations

import argparse
import bisect
from collections import Counter, deque
import csv
import hashlib
from pathlib import Path
import re
import struct
import subprocess

from extract_legends_catalog import NativeImage
from extract_statue_history_catalog import (INSTRUCTION, DIRECT, REFERENCE,
                                            TABLE_LOAD, BYTE_TABLE, BOUND)

ROOT = Path(__file__).resolve().parents[1]
OBJDUMP = (r"C:\Users\WIN11\AppData\Local\Programs\dfcn-toolchains"
           r"\w64devkit-2.9.1\w64devkit\bin\objdump.exe")
IDENTITY = "PE:6a70a6d9:02711000"

# These boundaries are read operations or creation/storage infrastructure, not
# alternate sentence generators. They remain visible as edges in the output.
BOUNDARIES = {
    0x14D880: "plant RAW lookup by index",
    0x145BEE0: "material flag predicate; no text",
    0x145C2B0: "material +4e0 -> descriptor_color index; colors[index]+50 NAME read by caller",
    0x1453230: "resolve art-image chunk reference; source-storage boundary",
    0x1453130: "allocate art-image chunk; creation-time state mutation",
    0x1458B0: "load art-image chunk; source-storage boundary",
    0xCC84D0: "create absent item art image; rendered result enters 1451b10",
    0xCC83E0: "update item art image; rendered result enters 1451b10",
    0xEB68B0: "create coin art source; rendered result enters 1451b10",
    0x144DCD0: "allocate art image; creation-time state mutation",
    0x931860: "create coin art; rendered result enters 1451b10",
    0x13B3090: "written-content lookup by ID; no text construction",
    0xC0F630: "historical-figure identity pointer",
    0xC0F660: "historical-figure identity pointer",
    0xC3A4F0: "unit name pointer; formatter is a94030/a946e0",
    0xACCD40: "player race getter; no text construction",
    0xB957B0: "visibility/knowledge predicate for artwork",
}

# Main prose, shared item noun/title, and creation-time instrument description.
# The instrument text is stored at itemdef_instrument +278, then copied by
# c75000; following only runtime calls would miss its entire production grammar.
ROOTS = {
    0xC75000: "complete-item-description",
    0xA82C10: "shared-item-noun",
    0xC65450: "artifact-quality-count-identity",
    0x1451B10: "artwork-paragraph",
    0x5BEEB0: "coin-description",
    0xCC6A10: "writing-on-item",
    0xCC7020: "writing-in-pages",
    0xCC5D50: "writing-content-and-style",
    0xCC5520: "writing-style-enum",
    0x85DA20: "upward-die-face",
    0xEBE8A0: "stored-instrument-description-writer",
    0xEB6FE0: "instrument-range-description",
}

ITEM_SLOTS = {
    0: "item-type", 8: "item-subtype", 0x10: "material-type",
    0x18: "material-index", 0x38: "dye-material-type", 0x40: "dye-material-index",
    0x48: "specific-creature-race", 0x50: "specific-creature-caste",
    0x90: "is-food-storage", 0xD0: "color-override", 0xE0: "has-tool-use",
    0x1D8: "wear", 0x1E8: "maker", 0x230: "base-art-image",
    0x1F8: "corpse-info", 0x200: "body-info", 0x208: "glove-flags",
    0x2A8: "is-liquid-powder", 0x2B0: "is-liquid",
    0x448: "can-be-contaminated", 0x478: "quantity", 0x508: "quality",
    0x518: "improvement-quality", 0x590: "maker-race", 0x5A0: "effective-armor-level", 0x5A8: "is-constructed",
    0x5D8: "has-displayed-improvements", 0x5E0: "magic-effect-record",
    0x5E8: "title", 0x5F0: "title-with-article",
    0x6B0: "base-pattern-first-color", 0x6C0: "bar-material-form",
    0x718: "slab-engraving-type", 0x728: "is-glazed", 0x748: "gem-shape",
    0x750: "upward-die-face-index",
}

DYNAMIC_FIELDS = (
    (0xC7540B, "item-title", "type/subtype/material/index/count/quality/maker race", "98 RTTI item owners; title +5e8, article +5f0; all 93 noun selector entries in a82c10"),
    (0xC755A4, "personal-name", "historical figure original/current identity name", "a94030/a946e0; first name, nickname and generated WORD forms; authored nicknames remain data"),
    (0xC75657, "craftsmanship-profession", "creature_raw PROFESSION_NAME:CRAFTSMAN singular", "+220+25*20; default craftsman; suffix ship is appended independently"),
    (0xC759C3, "food-ingredients", "item_food ingredient vector, native item tuples, preparation and quality", "reverse native vector order; count and ingredient names are independent"),
    (0xC75809, "base-artwork", "item virtual +230 art_image reference", "image element/property virtuals in statue-art-sources.tsv; historical event/collection virtuals in statue-history-sources.tsv"),
    (0xC75B61, "improvements", "item +d0 vector; improvement virtual +28 native kind", "16 RTTI owners: base -1; concrete 0..14. Kind 10 illustration is retained in stored pages; main prose skips it as an independent decoration."),
    (0xC7693F, "instrument-component", "itemdef_instrument piece token maps to NAME singular/plural", "improvement_instrument_piece +28 type string; count selects names"),
    (0xC77A26, "dice", "image_set faces/categories/ranges and native WORD/shape/art elements", "all summary variants in c75000; individual face formatter 85da20"),
    (0xC77EC0, "written-content", "written_content title, author, type, style, subjects and improvements", "cc6a10/cc7020 -> cc5d50 -> cc5520; title and prose are independent data fields"),
    (0xC78382, "dye-color", "descriptor_color +50 NAME; colors vector RVA 24f70b8", "profile +d8 overrides dye-material +4e0 color INDEX; -1 -> gray. This is not descriptor_pattern. Undyed BASE_COLOR: material +9c -> patterns vector 24f70e8 -> first int16 color at pattern +20 -> same colors vector."),
    (0xC78548, "dye-material-list", "profile vectors +8 material types / +20 material indexes", "stable dedup of pairs; >=2 mixture. Base thread/skin both vector and direct dye use POWDER. Improvement dye helpers use POWDER constituents but SOLID for their direct dye."),
    (0xC78548, "material-state", "material prefix +520; state names +b8 + state*20; named figure possessive", "14d1920 and typed material lookup; inherited RAW material templates and procedural Lua materials"),
    (0xC78CF2, "currency", "coin entity, ruler, year, material and front/back image references", "5beeb0; all native currency modes; both sides use 1451b10"),
    (0xC78F4D, "stored-slab-inscription", "item_slab +e8; subtype +10c; figure/content id +108", "native memorial writer cc23e0 catalog is complete; inscription text is stored random output and must not be regenerated"),
    (0xC793E2, "contaminants", "item +98 vector; amount/material tuple/material state", "every vector entry, native amount threshold and material state"),
    (0xC794CB, "power-description", "interaction_source_item_power +408 item_description", "item virtual +5e0 effects; interaction source kind 10 only; RAW/Lua IS_DESCRIPTION"),
    (0xC79547, "tool-description", "itemdef_tool +188 description", "authored RAW DESCRIPTION and stored generated instrument-part DESCRIPTION; generator ebe8a0 emits all part texts"),
    (0xC795E4, "instrument-description", "itemdef_instrument +278 description", "authored RAW DESCRIPTION or complete ebe8a0 writer; unknown mods may author arbitrary prose"),
)

PRODUCTIONS = (
    (0xC752F6, "opening", "This is|These are|This is a stack of|This is a bundle of|These are {count} bundles of", "type/material/plural/stack/bundle selects opening; c65450 supplies independently typed title"),
    (0xC7545A, "preparation-quality", "well-prepared|finely-prepared|superiorly prepared|exceptional prepared|masterfully prepared", "native FOOD quality 1..5; preserve native exceptional spelling"),
    (0xC754A5, "craft-quality", "well-crafted|finely-crafted|superior quality|exceptional|masterful", "quality 1..5; maker only at masterwork; unknown artisan is a separate branch"),
    (0xC755F0, "artifact-craftsmanship", "All {CRAFTSMAN-singular}ship is of the highest quality.", "race RAW PROFESSION_NAME:CRAFTSMAN; default craftsman; runtime races can override it"),
    (0xC756F9, "fit", "It is sized for {creature-plural}.", "armor/helm/gloves/shoes/pants; different maker/player race"),
    (0xC75879, "food", "The ingredients are {ingredient-list}.", "all ingredient records in reverse order; quality 0..5; cooked/minced; shared item tuple"),
    (0xC75CD7, "covered-improvement", "It is {glazed with|decorated with|studded with|encrusted with} {worked-material-list}.", "improvement type 1; material flags and glaze flag select all four predicates"),
    (0xC762FE, "bands", "It is encircled with bands of {worked-material-list}.", "improvement type 3"),
    (0xC766A9, "cloth", "{cloth-material-description}", "improvement type 7 -> cacd70; sewn image shares formatter at c77778"),
    (0xC76782, "thread-coloration", "The thread is {color-name}[, {quality}colored] with {dye-or-mixture}[ by {maker}].", "improvement type 6 -> cad270; quality 0 omits comma and colored; maker only quality 5"),
    (0xC76863, "object-coloration", "The object is {color-name}[, {quality}colored] with {dye-or-mixture}[ by {maker}].", "improvement type 14 -> cadcb0"),
    (0xC769C7, "instrument-piece", "The {piece-plural} are made from {worked-material}[ by {maker}].|The {piece-singular} is made from {worked-material}[ by {maker}].", "improvement type 11; itemdef instrument pieces token/name; count controls plurality"),
    (0xC76C26, "item-specific", "The chain is {material}.|The rope is {material}.|The rollers are made from {material}.|The handle is made from {material}.", "improvement type 5; four specific types; quality and maker apply independently"),
    (0xC76E65, "rings", "This object is adorned with hanging rings of {worked-material-list}.", "improvement type 2"),
    (0xC77136, "spikes", "This object menaces with spikes of {worked-material-list}.", "improvement type 4"),
    (0xC77443, "art-improvement", "{artwork-paragraph}", "improvement type 0 ->1451b10; symbols append material; image quality and maker independent"),
    (0xC77650, "sewn-image", "{artwork-paragraph}{cloth-description}{thread-dye-description}", "improvement type 8; independent image, cloth, dye qualities and makers"),
    (0xC77A48, "die-summary", "On the faces of the object are {numbers|dots}[, ranging from {count} to {count}].|On the faces of the object are a series of {count} {symbols|words|images|images and symbols}[ which you cannot read].", "improvement type 13; all native image-set categories and literacy branch"),
    (0xC77D00, "die-upward", "The upward face is {face}.", "item +750 face index; face types: number, dots, WORD, creature/image, item, shape"),
    (0xC77EC0, "writing", "{written-content-description}", "improvement type 12; literacy and read flags produce separate unread/cannot-read sentences"),
    (0xC7816C, "pages", "{written-portion-description}|The pages are blank.|You have not read this book.|There is writing in the book, but you cannot read.", "improvement type 9; written content/portion vectors"),
    (0xC78336, "base-thread-coloration", "The thread is {color-name}[, {quality}colored][ with {dye-or-mixture}][ by {maker}].", "THREAD 57; no-quality branch has no colored; profile color override else material dye color else gray; physical dye can be absent"),
    (0xC7882A, "base-material-coloration", "The material is {color-name}[, {quality}colored][ with {dye-or-mixture}][ by {maker}].", "SKIN_TANNED 55; same composition as base thread; CLOTH is type 58 and uses BASE_COLOR pattern first color"),
    (0xC784C8, "dye-mixture", "a mixture of {dye-1} and {dye-2}|a mixture of {dye-1}, {dye-2}, ... and {dye-N}", "deduplicate (material type,index) pairs preserving order; N>=2; base thread/skin both mixed and direct dye use POWDER; improvement helper direct dye uses SOLID"),
    (0xC78DBC, "dye-output", "When used as a dye, it produces {color-name}.", "powder dye material +4e0 color index -> colors vector 24f70b8 -> descriptor_color +50 NAME"),
    (0xC78F33, "slab", "The slab reads \"{stored-inscription}\".|There is writing on the slab, but you cannot read.", "item_slab +e8 stored text; creation writer cc23e0 cataloged separately"),
    (0xC79264, "wear", "This object is in tatters.|This object is threadbare.|This object is mangled.|This object is heavily worn.|This object is showing some wear.", "wear 1..3; native item-type/material selector controls soft/hard wording"),
    (0xC79363, "contaminants", "It is {coated|spattered} with {material-state-name}.", "every contaminant; amount >=100 selects coated; state index changes noun"),
    (0xC794CB, "item-power", "{interaction-source-item-power-description}", "interaction source type 10, +408; IS_DESCRIPTION from RAW/Lua"),
    (0xC79547, "authored-tool", "{tool-description}", "item type 86; itemdef_tool +188 DESCRIPTION; copied without a wrapper"),
    (0xC795E4, "stored-instrument", "{instrument-description}", "item type 13; itemdef_instrument +278 DESCRIPTION; RAW or ebe8a0 creation-time writer"),
)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, default=ROOT.parent / "Dwarf Fortress.exe")
    parser.add_argument("--objdump", default=OBJDUMP)
    parser.add_argument("--output", type=Path, default=ROOT / "data/extracted/item-description-sources.tsv")
    args = parser.parse_args()
    image = NativeImage(args.exe)
    base = image.base
    pe = struct.unpack_from("<I", image.raw, 0x3c)[0]
    identity = "PE:%08x:%08x" % (struct.unpack_from("<I", image.raw, pe+8)[0],
                                  struct.unpack_from("<I", image.raw, pe+24+56)[0])
    if identity != IDENTITY:
        raise ValueError("Source bindings belong to " + IDENTITY + "; current image " + identity)
    _, text_start, text_size, _, _ = next(s for s in image.sections if s[0] == ".text")
    text_end = text_start + text_size
    rows = []
    def row(kind, owner, function=0, address=0, target=0, source="", detail=""):
        rows.append((kind, owner, f"0x{function:x}" if function else "",
                     f"0x{address:x}" if address else "", f"0x{target:x}" if target else "",
                     source, detail))
    def rva(offset):
        for _, start, _, disk, size in image.sections:
            if disk <= offset < disk+size:
                return start+offset-disk
        raise ValueError(f"Unmapped offset {offset:#x}")
    def pointer(address):
        return struct.unpack_from("<Q", image.raw, image.offset(address))[0]-base
    def owner(address):
        at = bisect.bisect_right(image.starts, address)-1
        if at >= 0:
            begin, end = image.functions[at]
            if begin <= address < end:
                return image.function_owners[begin]
        return address
    def occurrences(needle):
        at = 0
        while (at := image.raw.find(needle, at)) >= 0:
            yield at
            at += 1
    imports = {}
    import_directory = struct.unpack_from("<I",image.raw,pe+24+112+8)[0]
    for index in range(4096):
        original,_,_,name,first=struct.unpack_from("<IIIII",image.raw,image.offset(import_directory+20*index))
        if not any((original,name,first)):
            break
        dll=image.string(name)[1]
        for slot in range(65536):
            thunk=struct.unpack_from("<Q",image.raw,image.offset((original or first)+slot*8))[0]
            if not thunk:
                break
            symbol=f"ordinal {thunk & 0xffff}" if thunk>>63 else image.string(thunk+2)[1]
            imports[first+slot*8]=dll+"!"+symbol
    def scalar(target):
        at = image.offset(target)
        code = image.raw[at:at+8]
        if code[0] == 0xb8 and code[5] == 0xc3:
            return struct.unpack_from("<i", code, 1)[0]
        if code[:3] in (b"\x33\xc0\xc3", b"\x31\xc0\xc3"):
            return 0
        if code[:4] == b"\x83\xc8\xff\xc3":
            return -1
        return "dynamic"

    pending = deque(ROOTS)
    for target, label in ROOTS.items():
        row("root", label, target, target, target)
    # Each actual primary vtable is retained, including abstract/base itemst.
    for match in re.finditer(rb"\.\?AV(?:item(?:_[a-z_]+)?st|itemimprovement(?:_[a-z_]+)?st|general_ref[a-z_]*st|interaction_source[a-z_]*st)@@\0", image.raw):
        label = match.group()[:-1].decode("ascii").removeprefix(".?AV").removesuffix("@@")
        descriptor = rva(match.start())-16
        improvement = label.startswith("itemimprovement")
        reference_owner = label.startswith("general_ref")
        interaction_owner = label.startswith("interaction_source")
        for hit in occurrences(struct.pack("<I", descriptor)):
            if hit < 12:
                continue
            col = hit-12
            signature, displacement, construction, _, hierarchy, self_id = struct.unpack_from("<6I", image.raw, col)
            if (signature, displacement, construction, self_id) != (1, 0, 0, rva(col)):
                continue
            for ref in occurrences(struct.pack("<Q", base+self_id)):
                vtable = rva(ref)+8
                type_slot = 0x28 if improvement else 0x10 if reference_owner else 0
                getter = pointer(vtable+type_slot)
                native_type = scalar(getter)
                kind = "improvement-owner" if improvement else "reference-owner" if reference_owner else "interaction-source-owner" if interaction_owner else "item-owner"
                row(kind, label, getter,
                    vtable, descriptor, str(native_type), f"COL={self_id:#x}; hierarchy={hierarchy:#x}")
                slots = ({0x28: "improvement-type"} if improvement else
                         {0x10:"general-reference-type",0x20:"unit-record-pointer",0x40:"artifact-record-pointer",
                          0x90:"written-content-reference-description",0x98:"reference-short-name"} if reference_owner else
                         {0:"interaction-source-type"} if interaction_owner else ITEM_SLOTS)
                for slot, meaning in slots.items():
                    target = pointer(vtable+slot)
                    row("virtual", label, target, vtable+slot, target, meaning,
                        f"vtable+{slot:#x}; native_type={native_type}")
                    # Text and pattern methods are roots. Other getter bodies
                    # are retained as typed contracts, not vocabulary writers.
                    if kind == "item-owner" and slot in (0x5E8, 0x5F0, 0x6B0):
                        pending.append(target)
                    if reference_owner and slot in (0x90,0x98):
                        pending.append(target)

    seen = set()
    while pending:
        requested = pending.popleft()
        begin = owner(requested)
        if begin in seen:
            continue
        seen.add(begin)
        if begin in BOUNDARIES or begin < 0x140000 or begin >= 0x1539000:
            row("terminal", "data-runtime-or-storage", begin, requested, source=BOUNDARIES.get(begin,
                "native string/container/allocation/runtime helper; text supplied by caller"))
            continue
        end = image.function_ends.get(begin)
        leaf = end is None
        if leaf:
            at = bisect.bisect_right(image.starts, begin)
            end = image.starts[at] if at < len(image.starts) else text_end
        output = subprocess.run([args.objdump, "-d", "-M", "intel", "--wide",
            f"--start-address={base+begin:#x}", f"--stop-address={base+end:#x}", str(args.exe)],
            check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True).stdout
        instructions = []
        for line in output.splitlines():
            match = INSTRUCTION.match(line)
            if match:
                instructions.append((int(match[1],16)-base, match[2], match[3]))
        switches = {}
        for index, (address, mnemonic, operands) in enumerate(instructions):
            if mnemonic != "jmp" or DIRECT.match(operands):
                continue
            prior = instructions[max(0,index-22):index]
            load = next((i for i in range(len(prior)-1,-1,-1) if TABLE_LOAD.search(prior[i][2])), None)
            if load is None:
                continue
            table = int(TABLE_LOAD.search(prior[load][2])[1],16)
            bound_at = next((i for i in range(load-1,-1,-1) if prior[i][1] == "cmp"),None)
            if bound_at is None:
                continue
            bound = BOUND.search(prior[bound_at][2])
            if not bound:
                register = prior[bound_at][2].split(",")[-1]
                bound = next((BOUND.search(prior[i][2]) for i in range(bound_at-1,-1,-1)
                    if prior[i][1] == "mov" and prior[i][2].startswith(register+",") and BOUND.search(prior[i][2])),None)
            if not bound:
                continue
            count = int(bound[1],16)+1
            if count > 65536:
                continue
            remap = next((BYTE_TABLE.search(e[2]) for e in prior[bound_at+1:load] if BYTE_TABLE.search(e[2])),None)
            indices = list(range(count))
            if remap:
                at = image.offset(int(remap[1],16))
                indices = list(image.raw[at:at+count])
            try:
                cases = [(case, struct.unpack_from("<I",image.raw,image.offset(table+slot*4))[0])
                         for case,slot in enumerate(indices)]
            except ValueError:
                continue
            if any(not begin <= target < end for _,target in cases):
                continue
            switches[address] = (table,cases,"; ".join(f"{pc:#x} {mn} {op}" for pc,mn,op in prior))
        # Invented instrument names use bounded random-number reductions,
        # rather than a simple CMP selector. These three switch bounds come
        # from the reciprocal-multiply reductions and table endpoints. The
        # fourth, 16-way consonant selector is recovered by the generic walk.
        if begin == 0x930BE0:
            for branch,table,count in ((0x930D23,0x931748,6),
                                        (0x931088,0x931760,6),
                                        (0x931168,0x931778,41)):
                cases=[(i,struct.unpack_from("<I",image.raw,image.offset(table+i*4))[0])
                       for i in range(count)]
                switches[branch]=(table,cases,"native bounded RNG reciprocal-multiply selector; instrument-name syllable construction")
        by_address = {v[0]:i for i,v in enumerate(instructions)}
        reachable, walk = set(), [begin,requested]
        while walk:
            address = walk.pop()
            if address in reachable or address not in by_address:
                continue
            reachable.add(address)
            index = by_address[address]
            _,mnemonic,operands = instructions[index]
            direct = DIRECT.match(operands)
            if mnemonic.startswith("j") and direct:
                walk.append(int(direct[1],16)-base)
            if mnemonic == "jmp":
                if address in switches:
                    walk.extend(target for _,target in switches[address][1])
                continue
            if mnemonic.startswith("ret") or mnemonic in ("int3","ud2"):
                continue
            if index+1 < len(instructions):
                walk.append(instructions[index+1][0])
        row("function", ROOTS.get(begin,"producer-callee"), begin, begin, end,
            detail="stackless leaf" if leaf else "PE chained unwind owner")
        for address,mnemonic,operands in instructions:
            if address not in reachable:
                continue
            reference = REFERENCE.search(operands)
            if reference:
                target = int(reference[1],16)-base
                literal = image.string(target)
                if literal and not text_start <= target < text_end:
                    row("literal","native",begin,address,target,literal[1],mnemonic+" "+operands)
            if mnemonic in ("mov","movabs"):
                immediate = re.search(r"^(BYTE|WORD|DWORD|QWORD) PTR [^,]+,0x([0-9a-f]+)$",operands)
                if immediate:
                    width = {"BYTE":1,"WORD":2,"DWORD":4,"QWORD":8}[immediate[1]]
                    value = int(immediate[2],16).to_bytes(width,"little").rstrip(b"\0")
                    if value and all(32 <= c < 127 for c in value):
                        row("inline-literal","native",begin,address,source=value.decode("ascii"),detail=mnemonic+" "+operands)
            if mnemonic not in ("call","jmp"):
                continue
            direct = DIRECT.match(operands)
            if not direct:
                if address in switches:
                    table,cases,context = switches[address]
                    row("switch","native-selector",begin,address,table,detail=context)
                    for case,target in cases:
                        row("switch-case",str(case),begin,address,target,detail=f"normalized selector; table={table:#x}")
                else:
                    category = "indirect-edge"
                    detail = "typed virtual/import/register call; operand retained"
                    imported=REFERENCE.search(operands)
                    if imported and int(imported[1],16)-base in imports:
                        category,detail="import-edge",imports[int(imported[1],16)-base]
                    if begin == 0xCC5D50 and "+0x90]" in operands:
                        category,detail="bound-virtual-edge","general_ref +90 written-content subject description; all 69 reference owners are producer roots"
                    if category == "indirect-edge":
                        if begin in (0x142CF0,0x14A9D0,0x14B080,0x2847E0,0xA513E0,0xA51AE0,0xA52540):
                            category,detail="storage-edge","native file/compressor/resource interface in direct-call dependency; stored bytes are input data, no item sentence callback"
                        elif begin in (0xCCCAA0,0xCD6B10,0xED7230):
                            category,detail="raw-loader-edge","item RAW registration/parser/type storage called after ebe8a0 constructs DESCRIPTION; text production remains in extracted writer and RAW tokens"
                        elif begin in (0x2470C0,0x3C8F80,0x46AB90,0x52BAB0,0x73D4E0,0x73D970,0x778770,
                                       0x140EC90,0x14101A0,0x1410C80,0x1412C70,0x1419EC0,0x141A190):
                            category,detail="auxiliary-ui-edge","RAW parser error reporting/logging/warning modal/widget lifecycle dependency; not an item-description text callback"
                        elif address in (0xBEB822,0xEEDDA1):
                            category="external-graph"
                            detail=("history_event_collection +30; all 18 collection RTTI roots in statue-history-sources.tsv" if address==0xBEB822 else
                                    "history_event +d8 from written-content subject; all 133 event RTTI roots in statue-history-sources.tsv")
                        elif begin in (0xB973C0,0xB98D90,0xBEB620,0xBEB780):
                            category,detail="typed-data-edge","history/collection reference kind getter; numeric comparison selects caller branch; collection prose delegates through separately recorded +30 graph edge"
                        elif begin in (0xEE3560,0xEED3B0):
                            category,detail="typed-data-edge",("interaction-source kind getter; RAW IS_NAME field captured by src/native_history_written_content.inc; complete work-reference renderer in src/history_written_content_semantics.inc" if begin==0xEE3560 else
                                "abstract-building +10 language-name pointer / +0 kind; typed name, category and location in src/native_history_written_content.inc and src/history_written_content_semantics.inc; no separate prose callback")
                        elif begin == 0x85DA20:
                            category,detail="typed-data-edge","art_image_element +10 kind getter for die face; all element concrete types and prose producers in statue-art-sources.tsv"
                        elif begin == 0x1451B10:
                            if address in (0x145274A,0x14529DA):
                                category,detail="external-graph",("art_image_element +38; every concrete element virtual and formatter in statue-art-sources.tsv" if address==0x145274A else
                                    "art_image_property +28; transitive/intransitive/base virtuals and all action tables in statue-art-sources.tsv")
                            elif address in (0x14520D7,0x14520EE,0x1452102):
                                category,detail="bound-virtual-edge","artifact-associated item +0 type / +e0 tool-use predicate; all item-owner virtual slots retained"
                            else:
                                category,detail="typed-data-edge","art-image source +10 kind; complete source-kind production branches in statue-description-grammar.md and statue-art-sources.tsv"
                        elif begin in (0x2566A0,0xA82C10,0xC653E0,0xC738A0,0xC91A90,0xC91B60,
                                       0xCA0040,0xCA0D60,0xCA1AA0,0xCA27C0,0xCA2B90,0xCA39F0,
                                       0xCA4420,0xCA53F0,0xCA5BB0,0xCABF80):
                            category="bound-virtual-edge"
                            if address in (0xCA455E,0xCA5BE3):
                                detail="general_ref +10 kind; all reference-owner entries retained"
                            elif address == 0xCA4578:
                                detail="general_ref +20 contained-unit pointer; all reference-owner entries retained; subsequent name/creature formatters are direct edges"
                            elif address == 0xCA5BF7:
                                detail="general_ref +40 artifact record; all reference-owner entries retained"
                            elif address == 0xCA44F7:
                                detail="item +48 race getter loaded into rdx at ca44f0; all item owners retained"
                            elif address == 0xCA5C6B:
                                detail="item +590 maker-race getter loaded into rdx at ca5c64; all item owners retained"
                            else:
                                detail="item typed scalar/data getter; all item-owner slots retained, including shape/slab intent/body info/container/material flags; full noun/title prose remains in decoded caller and item-info-title-sources.tsv"
                        elif begin == 0xCAEB90:
                            category,detail="bound-virtual-edge","itemimprovement +28 kind; all 16 improvement-owner entries retained"
                    if begin in (0xC75000,0xC65450):
                        slot_match=re.search(r"QWORD PTR \[\w+(?:\+(0x[0-9a-f]+))?\]",operands)
                        slot=int(slot_match[1],16) if slot_match and slot_match[1] else 0
                        if address in (0xC7543C,0xC75487):
                            category,detail="bound-virtual-edge","item quality +508 loaded into rdx at c7542c; every item owner slot retained"
                        elif address in (0xC6549D,0xC65EDB):
                            category,detail="bound-virtual-edge","general_ref +10 kind; all reference-owner type getters retained"
                        elif address == 0xC654B1:
                            category,detail="bound-virtual-edge","general_ref_is_artifactst +40 -> artifact record; generated name comes from a94030"
                        elif address == 0xC794B9:
                            category,detail="bound-virtual-edge","interaction_source +0 kind; only ITEM_POWER=10 appends +408; all source type getters retained"
                        elif address in (0xC773A0,0xC775AB):
                            category,detail="stored-art-boundary","improvement +0 getImage(item); artwork paragraph is rendered by 1451b10; may create missing art"
                        elif slot_match and slot == 0x28:
                            category,detail="bound-virtual-edge","improvement +28 kind; all 16 improvement-owner entries retained"
                        elif slot_match and slot in ITEM_SLOTS:
                            category,detail="bound-virtual-edge",f"item +{slot:x} {ITEM_SLOTS[slot]}; all 98 item owners retained"
                    if address == 0x1452AAA:
                        category,detail = "external-graph","history_event +d8; all event RTTI in statue-history-sources.tsv"
                    elif address == 0x1452B4D:
                        category,detail = "external-graph","history_event_collection +30; all collection RTTI in statue-history-sources.tsv"
                    row(category,mnemonic,begin,address,source=operands,detail=detail)
                continue
            target = int(direct[1],16)-base
            if begin <= target < end:
                continue
            row("direct-edge",mnemonic,begin,address,target,detail=operands)
            if text_start <= target < text_end:
                pending.append(target)

    for address,label,source,detail in PRODUCTIONS:
        row("production",label,0xC75000,address,source=source,detail=detail)
    for address,label,source,detail in DYNAMIC_FIELDS:
        row("dynamic-field",label,0xC75000,address,source=source,detail=detail)
    # The RAW is part of the input language, not a finite enumeration of saves.
    # Retain installed vanilla and mod leaves, with owner/token and source line.
    tags = {"NAME","NAME_PLURAL","NAME_SINGULAR","ADJECTIVE","ADJ","STATE_NAME",
            "STATE_ADJ","STATE_NAME_ADJ","PREFIX","MATERIAL_REACTION_PRODUCT",
            "DESCRIPTION","IS_DESCRIPTION","PROFESSION_NAME","ITEM_NAME",
            "CASTE_NAME","BODY_DETAIL_PLAN","BP_ADD_TYPE","BP_LAYERS","BP_NAME",
            "GROWTH_NAME","PLANT_NAME","SEED_NAME","LEAVES","FRUIT",
            "MATERIAL_TEMPLATE","USE_MATERIAL_TEMPLATE","USE_MATERIAL",
            "TISSUE_NAME","TISSUE_MATERIAL","NOUN","VERB","WORD","T_WORD"}
    for directory in (args.exe.parent/"data/vanilla",args.exe.parent/"data/installed_mods"):
        if not directory.is_dir():
            continue
        for path in sorted(directory.glob("*/objects/*.txt")):
            text = path.read_text(encoding="cp437")
            object_type,raw_owner,material = "","",""
            for number,line in enumerate(text.splitlines(),1):
                for match in re.finditer(r"\[([A-Z_]+):([^\]]*)\]",line):
                    tag,value = match.groups()
                    if tag == "OBJECT":
                        object_type = value
                    owner_tokens={"CREATURE":"CREATURE","PLANT":"PLANT","INORGANIC":"INORGANIC",
                        "MATERIAL_TEMPLATE":"MATERIAL_TEMPLATE","DESCRIPTOR_SHAPE":"SHAPE",
                        "DESCRIPTOR_COLOR":"COLOR","DESCRIPTOR_PATTERN":"COLOR_PATTERN",
                        "LANGUAGE":"WORD","INTERACTION":"INTERACTION","BODY":"BODY",
                        "BODY_DETAIL_PLAN":"BODY_DETAIL_PLAN","TISSUE_TEMPLATE":"TISSUE_TEMPLATE"}
                    if tag == owner_tokens.get(object_type) or object_type == "ITEM" and tag.startswith("ITEM_") and value.startswith(tag+"_"):
                        raw_owner,material = tag+":"+value,""
                    if tag in ("MATERIAL","USE_MATERIAL_TEMPLATE","USE_MATERIAL","SELECT_MATERIAL","CASTE","SELECT_CASTE","GROWTH"):
                        material = tag+":"+value
                    if tag in tags and raw_owner:
                        row("raw-token",raw_owner,source=f"[{tag}:{value}]",
                            detail=f"{path.relative_to(args.exe.parent)}:{number}; context={material}; object={object_type}")
        for path in sorted(directory.glob("*/scripts/generators/**/*.lua")):
            text = path.read_text(encoding="utf-8")
            if path.name in ("materials.lua","divine.lua","evil.lua","item_power.lua"):
                row("lua-source-file",path.stem,source=str(path.relative_to(args.exe.parent)),
                    detail="native generator tables and expressions; sha256="+hashlib.sha256(path.read_bytes()).hexdigest())
            # The entire native Lua expression is retained for dynamic leaves;
            # do not execute its generation or approximate it with examples.
            for number,line in enumerate(text.splitlines(),1):
                if any(token in line for token in ("IS_DESCRIPTION:","STATE_NAME", "STATE_ADJ", "ITEM_NAME:", "PROFESSION_NAME:")):
                    row("lua-production",path.stem,source=line.strip(),detail=f"{path.relative_to(args.exe.parent)}:{number}")

    for name,detail in (
        ("statue-art-sources.tsv","complete artwork element/property virtual roots, all action enums, deity spheres and shared item noun tables"),
        ("statue-history-sources.tsv","all native history event +d8 and event-collection +30 RTTI roots and direct-call closure"),
        ("memorial-inscription-sources.tsv","stored slab writer cc23e0; all death/preference branches and stored random variants"),
        ("item-info-title-sources.tsv","all item title owners and typed resolver routes"),
        ("map-hover-item-sources.tsv","shared item title/material/corpse literal sources"),
        ("item-raw-title-sources.tsv","itemdef subtype title, singular/plural, adjective field sources"),
        ("corpse-caption-sources.tsv","full corpse/body-part native production branches"),
    ):
        path=ROOT/"data/extracted"/name
        row("external-catalog",name,source=name,detail=detail+("; sha256="+hashlib.sha256(path.read_bytes()).hexdigest() if path.exists() else "; unavailable"))
    with args.output.open("w",encoding="utf-8",newline="") as out:
        out.write(f"# Offline native item-description source catalog; {identity}\n")
        out.write("# All addresses are RVAs. No game execution, generated translation, test, or display observation.\n")
        out.write("# SHA256="+hashlib.sha256(image.raw).hexdigest()+"\n")
        out.write("# Productions describe combinations; runtime names, counts, saves and arbitrary mod text are unbounded.\n")
        writer=csv.writer(out,delimiter="\t",lineterminator="\n")
        writer.writerow(("kind","owner","function-rva","instruction-or-slot-rva","target-or-end-rva","source","native-production-or-operand"))
        writer.writerows(rows)
    print(f"Extracted source records: {dict(Counter(row[0] for row in rows))}; output={args.output}")


if __name__ == "__main__":
    main()
