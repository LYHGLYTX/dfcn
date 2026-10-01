#!/usr/bin/env python3
"""Extract the reviewed native statue/art formatter graph from an offline PE.

This is reverse-engineering source extraction, not a translation generator or
test. It reads the game executable and invokes only the native disassembler;
it never executes the game, reads process memory, or touches translation data.
The source catalog preserves every literal reference and every action table
entry, including native empty/default cases and singular/plural productions.
See statue-description-grammar.md for the reconstructed control flow and the
typed dynamic leaves (RAW names, materials, historical events, and names).
"""
from __future__ import annotations

import argparse
import bisect
from pathlib import Path
import re
import struct

from native_caption_image import CaptionImage

ROOT = Path(__file__).resolve().parents[1]
PE_IDENTITY = "PE:6a70a6d9:02711000"
OBJDUMP = (r"C:\Users\WIN11\AppData\Local\Programs\dfcn-toolchains"
           r"\w64devkit-2.9.1\w64devkit\bin\objdump.exe")

# These are formatter bindings, not runtime hooks or executable probes.
# The shared item formatter intentionally retains its complete superset: the
# same branches describe statues, and item image elements can depict any item.
FORMATTERS = (
    ("image-paragraph", 0x1451B10, 0x145312C),
    ("statue-figurine-title", 0xCA0B40, 0xCA0BC2),
    ("base-item-title", 0xCA5BB0, 0xCA5D62),
    ("item-description-shared-superset", 0xC75000, 0xC796AA),
    ("item-noun-shared", 0xA82C10, 0xA882FC),
    ("artifact-item-identity", 0xC65450, 0xC6571D),
    ("artifact-item-identity-continuation", 0xC6571D, 0xC65F0A),
    ("material-noun", 0x14D1920, 0x14D1D79),
    ("creature-noun", 0xAA3BD0, 0xAA3D93),
    ("personal-name", 0xA94030, 0xA946D1),
    ("generated-name", 0xA946E0, 0xA94EA2),
    ("action-transitive", 0x146750, 0x146EA4),
    ("action-intransitive", 0x146EB0, 0x147640),
    ("element-creature-figure-deity", 0x148320, 0x148ECF),
    ("element-item-artifact", 0x147B60, 0x148112),
    ("element-shape", 0x147640, 0x14790B),
    ("element-plant-tree", 0x149120, 0x14931E),
    ("deity-sphere-with-article", 0x756500, 0x756688),
    ("deity-sphere-noun-leaf", 0x756690, 0x757174),
    ("item-cloth-material", 0xCACD70, 0xCAD269),
    ("item-thread-dye", 0xCAD270, 0xCADCAC),
    ("item-object-dye", 0xCADCB0, 0xCAE6EC),
    ("item-writing-introduction", 0xCC6A10, 0xCC7020),
    ("item-writing-portion", 0xCC7020, 0xCC75F8),
    ("item-writing-details", 0xCC5D50, 0xCC6A0E),
    ("item-writing-style-leaf", 0xCC5520, 0xCC5D08),
    ("item-dice-face", 0x85DA20, 0x85E1A8),
    ("item-dice-creature", 0xB94ED0, 0xB9501C),
    ("gem-material-shape", 0x14E1EC0, 0x14E2A28),
    ("material-raw-selection", 0x14ADD70, 0x14ADE9F),
    ("material-state-selection", 0x14D16F0, 0x14D1781),
    ("material-adjective-selection", 0x14D1790, 0x14D1911),
    ("craft-profession-name", 0x1BB330, 0x1BB3FC),
)

# The actual virtual slots used by 145274a and 14529da, including base no-ops.
VIRTUALS = (
    ("art_image_element", 0x15FE048, 0x072280),
    ("art_image_element_creaturest", 0x15FDCC8, 0x148320),
    ("art_image_element_itemst", 0x15FDFA0, 0x147B60),
    ("art_image_element_shapest", 0x15FDC28, 0x147640),
    ("art_image_element_plantst", 0x15FDD48, 0x149120),
    ("art_image_element_treest", 0x15FDF38, 0x149120),
    ("art_image_property", 0x15FDDA0, 0x072280),
    ("art_image_property_transitive_verbst", 0x15FDDD8, 0x146750),
    ("art_image_property_intransitive_verbst", 0x15FDE10, 0x146EB0),
)

TRANSITIVE = {
    1: "surrounded by", 2: "massacring", 3: "fighting with", 5: "greeting",
    6: "refusing", 7: "speaking with", 8: "embracing", 9: "striking down",
    12: "raising", 13: "hiding", 16: "devouring", 17: "admiring",
    18: "burning", 33: "shooting", 34: "torturing",
    35: "committing a depraved act upon", 36: "praying to",
    37: "contemplating", 38: "cooking", 39: "engraving",
    40: "prostrating itself before", 42: "impaled on", 44: "being flayed by",
    45: "hanging from", 46: "being mutilated by",
}
INTRANSITIVE = {
    0: "withering away", 4: "laboring", 10: "striking a menacing pose",
    11: "traveling", 14: "looks confused", 15: "looks terrified",
    18: "burning", 19: "weeping", 20: "looks dejected", 21: "cringing",
    22: "screaming", 23: "making a submissive gesture", 24: "in a fetal position",
    25: "smeared out into a spiral", 26: "falling", 27: "dead", 28: "laughing",
    29: "looks offended", 30: "being shot", 31: "making a plaintive gesture",
    32: "melting", 34: "being tortured", 35: "committing a depraved act",
    36: "praying", 37: "contemplating", 38: "cooking", 39: "engraving",
    41: "suffering", 43: "unnaturally contorted", 44: "being flayed",
    46: "being mutilated", 47: "striking a triumphant pose",
}


def escaped(value):
    return str(value).replace("\\", "\\\\").replace("\t", "\\t").replace("\r", "\\r").replace("\n", "\\n")


def extract(image):
    rows = []
    def row(kind, owner, start="-", end="-", reference="-", target="-", source="", note=""):
        address = lambda v: f"0x{v:x}" if isinstance(v, int) else v
        rows.append(tuple(map(escaped, (kind, owner, address(start), address(end),
                    address(reference), address(target), source, note))))

    for owner, slot, target in VIRTUALS:
        observed = image.uint64(image.base + slot) - image.base
        if observed != target:
            raise ValueError(f"Native virtual formatter binding changed: {owner}")
        row("virtual", owner, target, reference=slot, target=target,
            note="element slot +0x38" if "element" in owner else "property slot +0x28")

    for owner, start, end in FORMATTERS:
        if start not in (0x756690, 0xCC5520) and image.functions.get(image.base + start) != image.base + end:
            raise ValueError(f"Native formatter boundary changed: {owner}")
        row("formatter", owner, start, end)
        # Unwind ranges include embedded action jump tables. Do not present
        # those table bytes as instructions or spurious direct calls.
        code_end = {0x146750: 0x146DEC, 0x146EB0: 0x147580,
                    0x1451B10: 0x1453100, 0x756500: 0x756614,
                    0xA82C10: 0xA880E0, 0xC75000: 0xC79660,
                    0xCC6A10: 0xCC6F94, 0xCC7020: 0xCC7590,
                    0x85DA20: 0x85E118}.get(start, end)
        for address, instruction in image.instructions(image.base + start, image.base + code_end):
            rva = address - image.base
            direct = re.match(r"call\s+0x([0-9a-f]+)$", instruction)
            if direct:
                target = int(direct[1], 16) - image.base
                row("direct-call", owner, start, end, rva, target, note=instruction)
            elif instruction.startswith("call"):
                row("indirect-call", owner, start, end, rva, note=instruction)
            reference = re.search(r"# (?:0x)?([0-9a-f]+)", instruction)
            if reference:
                target = int(reference[1], 16)
                value = image.string(target)
                if value is not None:
                    row("literal", owner, start, end, rva, target-image.base, value, instruction)
            immediate = re.search(r"^mov(?:abs)?\s+(?:DWORD|WORD|QWORD) PTR [^,]+,0x([0-9a-f]+)$", instruction)
            if immediate:
                width = 8 if "QWORD" in instruction else 4 if "DWORD" in instruction else 2
                value = int(immediate[1], 16).to_bytes(width, "little").rstrip(b"\0")
                if len(value) >= 2 and all(32 <= c < 127 for c in value):
                    row("inline-literal", owner, start, end, rva, source=value.decode("ascii"), note=instruction)

    for owner, table, count, first, vocabulary, start, end in (
        ("transitive", 0x146DEC, 46, 1, TRANSITIVE, 0x146750, 0x146EA4),
        ("intransitive", 0x147580, 48, 0, INTRANSITIVE, 0x146EB0, 0x147640),
    ):
        entries = struct.unpack_from("<" + "I" * count, image.raw, image.offset(image.base + table))
        for index, target in enumerate(entries):
            action = index + first
            phrase = vocabulary.get(action)
            if phrase is None:
                row("action-empty", f"{owner}:{action}", start, end, table + 4*index,
                    target, "{subject}.", "no predicate/object; invalid subject OR transitive object indexes return empty")
                continue
            for plural in (False, True):
                predicate = phrase
                if owner == "transitive":
                    if plural:
                        predicate = predicate.replace("itself", "themselves")
                    value = "{subject} " + ("are " if plural else "is ") + predicate + " {object}."
                elif predicate.startswith("looks "):
                    value = "{subject} " + (predicate.replace("looks ", "look ", 1) if plural else predicate) + "."
                else:
                    value = "{subject} " + ("are " if plural else "is ") + predicate + "."
                row("action-plural" if plural else "action-singular", f"{owner}:{action}",
                    start, end, table+4*index, target, value,
                    "count != 1" if plural else "count == 1")

    # Deity domains are a finite 130-way native switch, not free text.
    # A second native byte selector adds 'the ' to ten domain captions.
    spheres = struct.unpack_from("<130I", image.raw, image.offset(image.base + 0x757174))
    article_selectors = image.raw[image.offset(image.base + 0x75661C):
                                  image.offset(image.base + 0x75661C) + 108]
    for sphere, target in enumerate(spheres):
        literal = image.base + target + 7 + struct.unpack_from(
            "<i", image.raw, image.offset(image.base + target) + 3)[0]
        noun = image.string(literal)
        article = "the " if 19 <= sphere <= 126 and article_selectors[sphere - 19] == 0 else ""
        row("sphere", str(sphere), 0x756690, 0x757174, 0x757174 + 4*sphere,
            target, article + noun, f"noun RVA=0x{literal-image.base:x}; article selector at 0x75661c")

    entity_types = ("civilization", "government", "vessel", "group", "group", "religion",
                    "military organization", "group", "performance troupe", "merchant company",
                    "{profession} guild|craft guild")
    entity_modifiers = {1: "local ", 3: "migrating ", 4: "nomadic ", 7: "outcast "}
    branches = struct.unpack_from("<11I", image.raw, image.offset(image.base + 0x1453100))
    for kind, target in enumerate(branches):
        row("entity-type", str(kind), 0x1451B10, 0x145312C, 0x1453100 + 4*kind,
            target, entity_modifiers.get(kind, "") + "{species} " + entity_types[kind],
            "species/name may be absent; category 0=symbol, 1=commission")

    # Shared item noun and written-form dispatches retain all finite targets.
    # Names/fields below these switches belong to the typed vocabularies and
    # source bindings already documented for the shared item and book grammar.
    for owner, start, end, table, count in (
        ("item-type", 0xA82C10, 0xA882FC, 0xA880E0, 93),
        ("written-form-on-item", 0xCC6A10, 0xCC7020, 0xCC6FB8, 26),
        ("written-form-in-portion", 0xCC7020, 0xCC75F8, 0xCC7590, 26),
        ("written-style", 0xCC5520, 0xCC5D08, 0xCC5D08, 18),
    ):
        branches = struct.unpack_from("<" + "I" * count, image.raw, image.offset(image.base + table))
        for kind, target in enumerate(branches):
            row("finite-dispatch", f"{owner}:{kind}", start, end,
                table + 4*kind, target, note="native jump-table entry; target literals retained with the owning formatter")

    # Shape nouns and adjectives are native RAW fields, not C++ literals.
    # Preserve all installed definitions, including forms unused by the
    # screenshot. Product rows retain the native adjective/noun boundary.
    for directory in (image.path.parent / "data/vanilla", image.path.parent / "data/installed_mods"):
        if not directory.is_dir():
            continue
        for path in sorted(directory.glob("*/objects/*.txt")):
            raw = path.read_text(encoding="cp437")
            for profession in re.findall(r"\[PROFESSION_NAME:CRAFTSMAN:([^:\]]+):[^\]]+\]", raw):
                row("raw-craftsmanship", "CRAFTSMAN", 0xC75000, 0xC796AA,
                    source="All " + profession + "ship is of the highest quality.",
                    note=str(path.relative_to(image.path.parent)))
            if "[OBJECT:DESCRIPTOR_SHAPE]" not in raw:
                continue
            shapes = re.split(r"\[SHAPE:([^\]]+)\]", raw)
            for index in range(1, len(shapes), 2):
                owner, body = shapes[index:index+2]
                names = re.search(r"\[NAME:([^\]]+)\]", body)
                if not names:
                    continue
                adjectives = re.findall(r"\[ADJ:([^\]]+)\]", body)
                for number, noun in enumerate(names[1].split(":")[:2]):
                    for adjective in ["", *adjectives]:
                        row("raw-shape", owner, 0x147640, 0x14790B,
                            source=(adjective + " " + noun).strip(),
                            note=f"{path.relative_to(image.path.parent)}; NAME[{number}]; ADJ={adjective!r}")

    # All actual E8 callers of the paragraph formatter, resolved back to PE
    # unwind functions; the disassembled owning function confirms boundaries.
    starts = sorted(image.functions)
    for name, _, rva, size, disk in image.image.sections:
        if name.rstrip(b"\0") != b".text":
            continue
        offset = image.raw.find(b"\xe8", disk)
        while disk <= offset < disk + size - 4:
            address = image.base + rva + offset - disk
            target = address + 5 + struct.unpack_from("<i", image.raw, offset + 1)[0]
            if target == image.base + 0x1451B10:
                index = bisect.bisect_right(starts, address) - 1
                start = starts[index]
                if address < image.functions[start]:
                    row("paragraph-caller", "image-paragraph", start-image.base,
                        image.functions[start]-image.base, address-image.base, 0x1451B10)
            offset = image.raw.find(b"\xe8", offset + 1)
    return rows


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, default=ROOT.parent / "Dwarf Fortress.exe")
    parser.add_argument("--objdump", default=OBJDUMP)
    parser.add_argument("--output", type=Path, default=ROOT / "data/extracted/statue-art-sources.tsv")
    args = parser.parse_args()
    image = CaptionImage(args.exe, args.objdump)
    if image.identity != PE_IDENTITY:
        raise ValueError("This source map belongs to " + PE_IDENTITY + "; review new native bindings first")
    rows = extract(image)
    with args.output.open("w", encoding="utf-8", newline="\n") as out:
        out.write(f"# Offline native statue/art formatter sources; {image.identity}\n")
        out.write("# All addresses are RVAs in the installed native Dwarf Fortress.exe. Significant spaces retained.\n")
        out.write("# kind\towner\tfunction-start\tfunction-end\tinstruction-or-table-entry\tliteral-or-branch-target\tsource\tnative-operand-or-production\n")
        out.write("# Complete image virtual graph and both action tables, plus the entire shared item-description/noun formatter superset.\n")
        out.write("# Dynamic historical event/collection sources are separately retained in data/extracted/statue-history-sources.tsv.\n")
        for fields in rows:
            out.write("\t".join(fields) + "\n")
    print(f"Extracted {len(rows)} native source records to {args.output}")


if __name__ == "__main__":
    main()
