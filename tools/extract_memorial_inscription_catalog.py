#!/usr/bin/env python3
"""Extract the installed native memorial writer and its source productions.

This is an offline reverse-engineering source extractor. It does not execute
game code, load a save, generate translations, or run a test. The inscription
writer makes creation-time random choices and stores its result on the slab;
the source catalog preserves all those branches, including native odd spacing.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import re
import struct

from native_caption_image import CaptionImage

ROOT = Path(__file__).resolve().parents[1]
OBJDUMP = (r"C:\Users\WIN11\AppData\Local\Programs\dfcn-toolchains"
           r"\w64devkit-2.9.1\w64devkit\bin\objdump.exe")

FORMATTERS = (
    ("memorial-inscription-writer", 0xCC23E0, 0xCC5384, 0xCC5278),
    ("slab-item-title", 0xCA0870, 0xCA0B3E, 0xCA0B3E),
    ("position-site-suffix", 0x9BDFB0, 0x9BE0F8, 0x9BE0F8),
    ("historical-figure-reference", 0xB92F10, 0xB93927, 0xB93927),
    ("historical-creature-reference", 0xB94ED0, 0xB9501C, 0xB9501C),
    ("artifact-identity", 0xB94400, 0xB94710, 0xB94710),
    ("entity-identity", 0xB92900, 0xB92A78, 0xB92A78),
    ("personal-name", 0xA94030, 0xA946D1, 0xA946D1),
    ("generated-name", 0xA946E0, 0xA94EA2, 0xA94EA2),
    ("creature-noun", 0xAA3BD0, 0xAA3D93, 0xAA3D93),
)

# The native table, indexed by history_event_hist_figure_diedst +0x64.
# An independent row is emitted for every slot, including duplicate targets.
DEATHS = (
    ("Died peacefully", "plain"),
    ("Starved to death", "plain"),
    ("Died of thirst", "plain"),
    ("Shot and killed", "killer+weapons"),
    ("Bled to death", "slain+weapons"),
    ("Drowned", "plain"),
    ("Suffocated", "slain-by+weapons"),
    ("Struck down", "killer+weapons"),
    ("Scuttled", "plain"),
    ("Died after colliding with an obstacle", "slain"),
    ("Burned up in magma", "plain"),
    ("Burned up in a magma mist", "plain"),
    ("Burned up in ", "dragon-fire"),
    ("Burned to death", "fire"),
    ("Scalded to death", "plain"),
    ("Crushed under a collapsing ceiling", "plain"),
    ("Crushed by a drawbridge", "plain"),
    ("Killed by falling rocks", "plain"),
    ("Fell into a deep chasm", "plain"),
    ("Died in a cage", "plain"),
    ("Murdered", "killer"),
    ("Killed by a trap", "plain"),
    ("Vanished", "plain"),
    ("Starved to death", "plain"),
    ("Starved to death", "plain"),
    ("Died in the heat", "plain"),
    ("Froze to death", "plain"),
    ("Impaled on spikes", "slain"),
    ("Encased in cooling lava", "plain"),
    ("Encased in cooling magma", "plain"),
    ("Encased in ice", "plain"),
    ("Beheaded", "killer"),
    ("Crucified", "killer"),
    ("Buried alive", "killer"),
    ("Drowned", "killer"),
    ("Burned alive", "killer"),
    ("Fed to beasts", "killer"),
    ("Hacked to pieces", "killer"),
    ("Left out in the air", "killer"),
    ("Boiled", "plain"),
    ("Melted", "plain"),
    ("Condensed", "plain"),
    ("Solidified", "plain"),
    ("Succumbed to infection", "slain"),
    ("Put to rest", "plain"),
    ("Scared to death", "killer"),
    ("Died in the dark", "plain"),
    ("Collapsed", "struck-down+weapons"),
    ("Drained of blood", "killer"),
    ("Slaughtered", "killer+weapons"),
    ("Killed by a vehicle", "plain"),
    ("Killed by a flying object", "plain"),
    ("Leapt from a great height", "plain"),
    ("Drowned", "plain"),
    ("Executed", "killer"),
)

PREFERENCES = (
    ("material", "{United with |At one with |Lover of }{material}"),
    ("creature", "{Admirer of |Friend of }{creature-plural}"),
    ("food", ""),
    ("hate-creature", ""),
    ("item", "Lover of {item-plural}"),
    ("plant", "{Admirer of |Lover of }{plant-plural}"),
    ("tree", "{Admirer of |Lover of }{plant-plural}"),
    ("color", "The color {color} made {him|her|it} happy"),
    ("shape", "Admirer of {shape-plural}"),
    ("poetic-form", "Lover of {generated-name}"),
    ("musical-form", "Lover of {generated-name}"),
    ("dance-form", "Lover of {generated-name}"),
)

PRODUCTIONS = (
    (0xCC2433, "opening", "In memory of...", "missing historical figure; return immediately"),
    (0xCC2525, "opening", "In memory of {original-name}", "hf +0xaa != 0; OriginalName(hf +0x38)"),
    (0xCC2578, "opening", "In memory of a {creature-singular}", "hf +0xaa == 0; race +2, caste +4"),
    (0xCC27D5, "missing", "[ / Born {birth-year}] / Went missing[ in the year {missing-year}]", "birth/missing years >=1; historical unit incident flag bit1 clear"),
    (0xCC33D4, "death", "[ / Born {birth-year}] / {cause}[ in {event-collection-title}][ in the year {death-year}]", "nonempty recognized cause; birth/death years >=1; first collection containing event ID"),
    (0xCC3587, "fallback-dates", " / {birth-year} - {death-year}", "both years >=1; random wording A"),
    (0xCC35E7, "fallback-dates", " / b.{birth-year} d.{death-year}", "both years >=1; random wording B"),
    (0xCC361B, "fallback-dates", " / {Died |d.}{death-year}", "birth year <1; death year >=1; random wording"),
    (0xCC2DFF, "killer", "[ by {figure}| by a {creature}]", "event slayer HF +0x2c preferred; race +0x30, caste +0x34 fallback"),
    (0xCC2F26, "slain", "[, slain by {figure}|, slain by a {creature}]", "same killer priority; no weapons for this family"),
    (0xCC2E39, "weapons", "[ with {weapon}[ from {shooter}]| with {shooter}]", "nonempty item descriptions from +0x38..44 and +0x48..54; artifact identity preferred"),
    (0xCC2F8F, "slain+weapons", "[, slain by {figure}|, slain by a {creature}|, slain]{weapons}", "without killer add slain only when at least one weapon string exists"),
    (0xCC307D, "slain-by+weapons", "[, slain by {figure}|, slain by a {creature}|, slain by ]{weapons}", "native no-killer with-weapon variant retains by and double space"),
    (0xCC3221, "struck-down+weapons", "[, struck down by {figure}|, struck down by a {creature}|, struck down ]{weapons}", "without killer add struck down only with weapons; native doubled space retained"),
    (0xCC2C31, "dragon-fire", "Burned up in {figure-possessive} dragon fire|Burned up in a {creature}'s dragon fire|Burned up in dragon fire", "HF first, creature second, unnamed source last"),
    (0xCC2CD0, "fire", "Burned to death by {figure-possessive} fire|Burned to death by a {creature} fire|Burned to death", "HF first, creature second, unnamed source last"),
    (0xCC36A6, "creation", " / Creator of {artifact-name}", "unit +0x11c &0x800; generated name at unit +0xa08"),
    (0xCC3939, "position", " / {position-title} of {entity-or-site}[ in {year}|, {start-year} to {end-year}]", "selected hf entity-link type10/11; gendered title and priority from position RAW; end -1 uses death-year"),
    (0xCC3CF6, "named-kill", " / Slayer of[ the {creature-singular}][ {generated-name}]", "species differs from dead hf -> creature; another HF of killed species exists -> name"),
    (0xCC4029, "unnamed-kills", " / {Hunter of |Slayer of }{creature-plural}", "fallback when no selected named victim; at least 5 kills; creature flag selects slayer"),
    (0xCC4124, "family", " / {Loving |Devoted }{parent|spouse|parent and spouse|father|husband|father and husband|mother|wife|mother and wife}", "hf relation kind3 parent; kinds2/15 spouse; sex1 male,0 female,other neutral"),
    (0xCC4306, "preference", "[ / {one-random-preference}]", "current soul preference vector; 12-way enum, 2/3/default empty; saved random choice must be retained"),
    (0xCC4492, "material", "[{figure-name}'s ][{material-prefix} ]{solid-state-name}[ wood| fabric]", "named HF material type219..418 adds owner; plant material419..618 appends wood or fabric flags"),
)


def escaped(value):
    return str(value).replace("\\", "\\\\").replace("\t", "\\t").replace("\r", "\\r").replace("\n", "\\n")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, default=ROOT.parent / "Dwarf Fortress.exe")
    parser.add_argument("--objdump", default=OBJDUMP)
    parser.add_argument("--output", type=Path, default=ROOT / "data/extracted/memorial-inscription-sources.tsv")
    args = parser.parse_args()
    image = CaptionImage(args.exe, args.objdump)
    if image.identity != "PE:6a70a6d9:02711000":
        raise ValueError("The reviewed memorial source bindings belong to PE:6a70a6d9:02711000")
    rows = []

    def row(kind, owner, start="-", end="-", reference="-", target="-", source="", note=""):
        addr = lambda x: f"0x{x:x}" if isinstance(x, int) else x
        rows.append(tuple(map(escaped, (kind, owner, addr(start), addr(end), addr(reference), addr(target), source, note))))

    for owner, start, end, code_end in FORMATTERS:
        row("formatter", owner, start, end, note=f"instructions end at 0x{code_end:x}; remaining bytes are jump tables")
        for address, instruction in image.instructions(image.base + start, image.base + code_end):
            reference = address - image.base
            direct = re.match(r"call\s+0x([0-9a-f]+)$", instruction)
            if direct:
                row("direct-call", owner, start, end, reference, int(direct[1], 16)-image.base, note=instruction)
            elif instruction.startswith("call"):
                row("indirect-call", owner, start, end, reference, note=instruction)
            target = re.search(r"# (?:0x)?([0-9a-f]+)", instruction)
            if target:
                target = int(target[1], 16)
                value = image.string(target)
                if value is not None:
                    row("literal", owner, start, end, reference, target-image.base, value, instruction)
            immediate = re.search(r"^mov(?:abs)?\s+(?:DWORD|WORD|QWORD) PTR [^,]+,0x([0-9a-f]+)$", instruction)
            if immediate:
                width = 8 if "QWORD" in instruction else 4 if "DWORD" in instruction else 2
                value = int(immediate[1], 16).to_bytes(width, "little").rstrip(b"\0")
                if len(value) >= 2 and all(32 <= byte < 127 for byte in value):
                    row("inline-literal", owner, start, end, reference, source=value.decode("ascii"), note=instruction)

    for index, ((phrase, family), target) in enumerate(zip(DEATHS, struct.unpack_from("<55I", image.raw, image.offset(image.base+0xCC5278)))):
        row("death-branch", f"cause:{index}", 0xCC23E0, 0xCC5384, 0xCC5278+4*index, target, phrase, family)
    row("death-default", "cause:outside-0..54", 0xCC23E0, 0xCC5384, 0xCC2A58, 0xCC3549, note="empty death phrase; use fallback dates")
    for index, ((kind, phrase), target) in enumerate(zip(PREFERENCES, struct.unpack_from("<12I", image.raw, image.offset(image.base+0xCC5354)))):
        row("preference-branch", f"preference:{index}:{kind}", 0xCC23E0, 0xCC5384, 0xCC5354+4*index, target, phrase)
    row("preference-default", "preference:outside-0..11", 0xCC23E0, 0xCC5384, 0xCC43C3, 0xCC5260, note="no preference text")
    for reference, owner, source, note in PRODUCTIONS:
        row("production", owner, 0xCC23E0, 0xCC5384, reference, source=source, note=note)
    row("external-source", "event-collection-title", reference=0xCC34C4, source="statue-history-sources.tsv", note="same native virtual slot +0x30; complete collection roots/callees/literals")
    row("external-source", "item-and-material-leaves", reference=0xCC484B, target=0xA82C10, source="statue-art-sources.tsv", note="complete shared item noun, material selection and RAW leaves")
    row("stored-data", "inscription", reference=0xCC2426, source="item_slabst +0xe8", note="creation-time text; +0x108 HF id; +0x10c subtype 0; do not rerun this mutating writer when translating")

    with args.output.open("w", encoding="utf-8", newline="\n") as out:
        out.write(f"# Offline native memorial inscription sources; {image.identity}\n")
        out.write("# RVAs refer to the installed Windows Dwarf Fortress.exe; significant native spaces retained.\n")
        out.write("# kind\towner\tfunction-start\tfunction-end\tinstruction-or-table-entry\tliteral-or-branch-target\tsource\tnative-operand-or-production\n")
        for fields in rows:
            out.write("\t".join(fields) + "\n")
    print(f"Extracted {len(rows)} native source records to {args.output}")


if __name__ == "__main__":
    main()
