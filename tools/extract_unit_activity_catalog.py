#!/usr/bin/env python3
"""Extract the complete reviewed unit-activity formatter graph, not a string vicinity.

The bindings are reverse-engineering provenance, NOT runtime hooks. Each row
names a formatter and its unwind boundary; virtual rows also retain their
vtable slot, including subclasses that inherit the base caption. The image
adapter owns binary-format differences; extraction and classification are
shared. New native builds require a fresh formatter-graph review, not guessed
addresses or silently reduced coverage. This reads files only, never tests or
executes the game/plugin.
"""
from __future__ import annotations

import argparse
from collections import defaultdict
from pathlib import Path

from build_translations import atomic_dictionary_output, tsv_escape_bytes
from extract_workshop_tooltip_catalog import native_game_executable
from native_caption_image import CaptionImage

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path)
    parser.add_argument("--objdump")
    parser.add_argument("--bindings", type=Path,
                        default=ROOT / "data/extracted/unit-activity-native-bindings.tsv")
    parser.add_argument("--output", type=Path, default=ROOT / "data/extracted/unit-activity-sources.tsv")
    args = parser.parse_args()
    image = CaptionImage(native_game_executable(args.exe or ROOT.parent), args.objdump)
    bindings = [line.split("\t") for line in args.bindings.read_text().splitlines()
                if line and not line.startswith("#")]
    bindings = [row for row in bindings if row[0] == image.identity]
    if not bindings:
        raise ValueError(f"No reviewed activity graph for {image.identity}; reverse engineer this build first")
    rows = []
    for _, kind, owner, start, end, slot in bindings:
        start, end = int(start, 0) + image.base, int(end, 0) + image.base
        if image.functions.get(start) != end:
            raise ValueError(f"Unwind boundary changed for {owner}")
        if slot != "-" and image.uint64(image.base + int(slot, 0)) != start:
            raise ValueError(f"Virtual caption method changed for {owner}")
        sources = defaultdict(lambda: (set(), set()))
        for ref, address, value in image.literal_refs(start, end):
            addresses, refs = sources[value]
            addresses.add(address)
            refs.add(ref)
        for value, (addresses, refs) in sorted(sources.items()):
            rows.append((kind, owner, f"{start:#x}..{end:#x}",
                         ",".join(f"{a:#x}" for a in sorted(addresses)),
                         ",".join(f"{a:#x}" for a in sorted(refs)),
                         tsv_escape_bytes(value.encode("ascii"))))
    with atomic_dictionary_output(args.output) as out:
        out.write(f"# Native unit activity graph; {image.identity}\n")
        out.write("# kind\towner\tformatter\tliteral addresses\tinstruction references\tsource\n")
        out.write("# Includes job captions, all activity/order virtual methods, status wrappers and finite operands.\n")
        out.write("# Significant spaces retained. See data/extracted/unit-activity-source-review.md for compositions, inline stores and shared noun resolvers.\n")
        for row in rows:
            out.write("\t".join(row) + "\n")
    print(f"Extracted {len(bindings)} formatter bindings and {len(rows)} source records to {args.output}")


if __name__ == "__main__":
    main()
