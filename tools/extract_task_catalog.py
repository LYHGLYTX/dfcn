#!/usr/bin/env python3
"""Inventory native task-caption inputs and installed RAW reaction names.

This reads the installed game's code and read-only data, without executing it
or testing translations. Include all branches, not just the literals adjacent
to Dig channel/Fell tree: material, creature and color jobs use shared strings
elsewhere in .rodata. Fragments are deliberately not treated as whole jobs.
The output is a source inventory for translation maintenance, not a runtime
address profile, translation table or proof of in-game acceptance.
"""

from __future__ import annotations

import argparse
from collections import defaultdict
from pathlib import Path
import re

from build_translations import atomic_dictionary_output, tsv_escape_bytes
from extract_workshop_tooltip_catalog import native_game_executable
from native_caption_image import CaptionImage


ROOT = Path(__file__).resolve().parents[1]
BUILD_ID = "bcc6789e6fb477b785a2b02be80b8b1b054ff88c"
# Function boundary from the native ELF .eh_frame FDE. Both short and detailed
# labels are formatted here. Do not walk beyond it into job execution code.
START, END = 0x1CAB560, 0x1CB2754
PE_START, PE_END = 0xD032B0, 0xD082D4


def extract_native(path: Path, objdump: str | None):
    image = CaptionImage(path, objdump)
    profiles = {
        "ELF:" + BUILD_ID: (START, END),
        "PE:6a70a6d9:02711000": (PE_START, PE_END),
    }
    if image.identity not in profiles:
        raise ValueError("Task source profile does not match the installed game; inspect its formatter first")
    start, end = (image.base + value for value in profiles[image.identity])
    if image.functions.get(start) != end:
        raise ValueError("Task formatter unwind boundary has changed")
    sources = defaultdict(lambda: (set(), set()))
    for instruction, address, source in image.literal_refs(start, end):
        addresses, references = sources[source]
        addresses.add(address)
        references.add(instruction)
    rows = []
    for source, (addresses, references) in sorted(sources.items()):
        kind = "caption" if source == source.strip() and source[0].isupper() and source != "Make" else "fragment"
        rows.append((kind, ",".join(f"{value:#x}" for value in sorted(addresses)),
                     ",".join(f"{value:#x}" for value in sorted(references)),
                     tsv_escape_bytes(source.encode("ascii"))))
    return rows, f"{image.identity}; task formatter {start:#x}..{end:#x}"


def reaction_sources(executable: Path, objdump: str | None = None) -> list[tuple[str, str, str, str]]:
    rows = []
    raw_root = executable.parent / "data/vanilla"
    for path in sorted(raw_root.glob("*/objects/*.txt")):
        text = path.read_text(encoding="cp437")
        if "[OBJECT:REACTION]" not in text:
            continue
        reaction = None
        for match in re.finditer(r"\[([^\[\]]+)\]", text):
            tag, _, value = match[1].partition(":")
            if tag == "REACTION":
                reaction = value
            elif tag == "NAME" and reaction is not None:
                location = f"{path.relative_to(executable.parent).as_posix()}:{text.count(chr(10), 0, match.start()) + 1}"
                rows.append(("raw-reaction", location, reaction,
                             tsv_escape_bytes(value.encode("cp437"))))
    # Native instrument generation constructs a NAME from one of these
    # action prefixes and a generated name/piece. Preserve the open prefix;
    # it is not a complete caption or an arbitrary untranslated wildcard.
    image = CaptionImage(executable, objdump).image
    for start, data in image.read_only_data():
        for match in re.finditer(rb"\[NAME:((?:make|forge|assemble) [^\[\]\x00]*)", data):
            rows.append(("generated-prefix", image.source_location(start + match.start()),
                         "generated instrument reaction NAME", tsv_escape_bytes(match[1])))
    return rows


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path)
    parser.add_argument("--objdump", help="Full path to native objdump")
    parser.add_argument("--output", type=Path, default=ROOT / "data/extracted/task-sources.tsv")
    args = parser.parse_args()
    executable = native_game_executable(args.exe or ROOT.parent)
    rows, profile = extract_native(executable, args.objdump)
    native_count = len(rows)
    rows += reaction_sources(executable, args.objdump)
    with atomic_dictionary_output(args.output) as output:
        output.write(f"# DF 53.16 {profile}\n")
        output.write("# kind\tsource locations\tinstruction references or RAW owner\tsource (significant spaces retained)\n")
        output.write("# Source inventory only. RAW NAME case is retained; the game capitalizes displayed task titles.\n")
        for row in rows:
            output.write("\t".join(row) + "\n")
    print(f"Inventoried {native_count} task-caption inputs and {len(rows) - native_count} reaction sources in {args.output}")


if __name__ == "__main__":
    main()
