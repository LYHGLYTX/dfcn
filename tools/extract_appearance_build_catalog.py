"""Read the native appearance body-build switch and retain every source branch.

This is a source-extraction tool, not a game/plugin runner. The reviewed native
formatter has a 28-entry body-shape switch and a 17-way muscle/fat selector.
Walk its conditional branches rather than scanning neighbouring string data.
No code is loaded, executed, compiled or deployed.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import re
import struct

from native_caption_image import CaptionImage

ROOT = Path(__file__).resolve().parents[1]
IDENTITY = "PE:6a70a6d9:02711000"
START, END, SWITCH = 0x70C240, 0x70F06C, 0x70EFFC
SHAPES = (
    "gigantic", "very_large", "large", "tall_thin", "short_broad",
    "incredibly_broad", "very_broad", "broad", "long_thin",
    "incredibly_thin", "very_thin", "thin", "incredibly_tall",
    "very_tall", "tall", "incredibly_long", "very_long", "long",
    "incredibly_short_height", "very_short_height", "short_height",
    "incredibly_short_length", "very_short_length", "short_length",
    "average", "small", "very_small", "tiny",
)
# Decoded from 0x70c29b..0x70c379. The comparisons are ordered: the first
# matching row wins. r8d is muscularity deviation, r9d is fat deviation.
CONDITIONS = (
    (0, "muscle>=75 and fat>=75"),
    (1, "muscle>=75"),
    (2, "fat>=75"),
    (3, "muscle>=50"),
    (4, "fat>=50"),
    (5, "muscle>=25 and fat>=25"),
    (6, "muscle<=-75 and fat<=-75"),
    (7, "muscle<=-75"),
    (8, "fat<=-75"),
    (9, "muscle<=-50"),
    (10, "fat<=-50"),
    (11, "muscle<=-25 and fat<=-25"),
    (12, "muscle>=25"),
    (13, "fat>=25"),
    (14, "muscle<=-25"),
    (15, "fat<=-25"),
    (-1, "otherwise"),
)
REGISTERS = {
    "r13w": 6, "di": 7, "bx": 8, "cx": 9, "r12w": 10,
    "r14w": 11, "si": 12, "bp": 13, "ax": 14, "r15w": 15,
}


def extract(image: CaptionImage):
    if image.identity != IDENTITY:
        raise ValueError(f"Appearance branch addresses need review for {image.identity}")
    instructions = dict(image.instructions(image.base + START, image.base + SWITCH))
    addresses = list(instructions)
    next_address = dict(zip(addresses, addresses[1:]))
    literals = {ref: (target, value) for ref, target, value in
                image.literal_refs(image.base + START, image.base + SWITCH)}
    at = image.offset(image.base + SWITCH)
    entries = struct.unpack_from("<28I", image.raw, at)
    for shape_id, entry in enumerate(entries):
        for condition_id, condition in CONDITIONS:
            address = image.base + entry
            equal = False
            for _ in range(len(instructions)):
                instruction = instructions[address]
                if address in literals:
                    target, value = literals[address]
                    yield (shape_id, SHAPES[shape_id], condition_id, condition,
                           image.base + entry, address, target, value)
                    break
                opcode, _, operands = instruction.partition(" ")
                operands = operands.strip()
                if opcode == "test" and operands == "r10w,r10w":
                    equal = condition_id == 0
                elif opcode == "cmp" and operands.startswith("r10w,"):
                    operand = operands.split(",")[1]
                    expected = REGISTERS[operand] if operand in REGISTERS else int(operand, 0)
                    equal = (condition_id & 0xffff) == expected
                elif opcode in ("je", "jne", "jmp"):
                    if opcode == "jmp" or (opcode == "je" and equal) or (opcode == "jne" and not equal):
                        address = int(operands, 0)
                        continue
                address = next_address[address]
            else:
                raise ValueError(f"Unresolved native branch shape={shape_id}, condition={condition_id}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, default=ROOT.parent / "Dwarf Fortress.exe")
    parser.add_argument("--objdump")
    parser.add_argument("--output", type=Path, default=ROOT / "data/extracted/appearance-build-sources.tsv")
    args = parser.parse_args()
    image = CaptionImage(args.exe, args.objdump)
    rows = list(extract(image))
    with args.output.open("w", encoding="utf-8", newline="\n") as out:
        out.write(f"# Native appearance build branches; {image.identity}\n")
        out.write("# Formatter 0x14070c240..0x14070f06c; jump table 0x14070effc, 28 entries.\n")
        out.write("# Conditions are first-match in the order 0..15,-1; full predicates have no pronoun/punctuation.\n")
        out.write("# shape_id\tshape\tmuscle_fat_id\tcondition\tbranch\treference\tliteral\tsource\n")
        for shape_id, shape, condition_id, condition, branch, ref, literal, source in rows:
            out.write(f"{shape_id}\t{shape}\t{condition_id}\t{condition}\t{branch:#x}\t{ref:#x}\t{literal:#x}\t{source}\n")
    print(f"Extracted {len(rows)} branches and {len({r[-1] for r in rows})} distinct predicates to {args.output}")


if __name__ == "__main__":
    main()
