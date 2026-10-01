#!/usr/bin/env python3
"""Inventory native operation-title branches without running the game.

Read the DF 53.16 ELF menu switches and follow BOTH sides of conditional
branches through the first title submission. This includes normal/blueprint
and conversion modes, not merely strings next to a screenshot's caption.
No game code is executed and no translation or rendering tests are performed.
"""

from __future__ import annotations

import argparse
from collections import defaultdict
from pathlib import Path
import re
import struct
import subprocess

from build_translations import atomic_dictionary_output


ROOT = Path(__file__).resolve().parents[1]
BUILD_ID = "bcc6789e6fb477b785a2b02be80b8b1b054ff88c"
# Each table is reached AFTER the operation frame has been drawn. The menu
# switch at 0x167f10b covers states 0..35; states 13 and 22 have no title.
TABLES = (("mining", 0x21A7D78, 25), ("items", 0x21A7E4C, 8),
          ("surface", 0x21A7E6C, 22))
SELECTORS = (("chopping", 0x168F793), ("gathering", 0x168F860),
             ("traffic", 0x167F14D), ("erase", 0x168F5AE))
# Arena uses the same title style outside the fortress designation switch.
ARENA = (0x169406E, 0x16940C9, 0x16943FE, 0x16944A0,
         0x1694924, 0x169495A, 0x1694A19)
# Stop at the shared string destruction / next rendering stage. In particular
# do not mistake the staircase elevation warning for another operation title.
STOPS = {0x167F1A1, 0x167F1C2, 0x168F929, 0x168F94A}
STRING_CONSTRUCTOR = 0x1648BD0
ADDST = 0x425170


def extract(path: Path) -> list[tuple[str, str, str, str]]:
    raw = path.read_bytes()
    if raw[:6] != b"\x7fELF\x02\x01" or struct.unpack_from("<H", raw, 18)[0] != 62:
        raise ValueError("Expected the native little-endian x86-64 ELF game")
    segments = []
    notes = []
    phoff = struct.unpack_from("<Q", raw, 32)[0]
    phsize, phnum = struct.unpack_from("<HH", raw, 54)
    for index in range(phnum):
        kind, _, offset, address, _, size, _, _ = struct.unpack_from(
            "<IIQQQQQQ", raw, phoff + index * phsize)
        if kind == 1:
            segments.append((address, offset, size))
        elif kind == 4:
            at = offset
            while at + 12 <= offset + size:
                namesz, descsz, note_type = struct.unpack_from("<III", raw, at)
                name = raw[at + 12:at + 12 + namesz]
                desc = at + 12 + ((namesz + 3) & ~3)
                if name == b"GNU\0" and note_type == 3:
                    notes.append(raw[desc:desc + descsz].hex())
                at = desc + ((descsz + 3) & ~3)
    if BUILD_ID not in notes:
        raise ValueError("Operation-title profile does not match this game; inspect its native switches first")

    def offset_of(address: int, size: int = 1) -> int:
        for base, offset, length in segments:
            if base <= address and address + size <= base + length:
                return offset + address - base
        raise ValueError(f"Unmapped title source address: {address:#x}")

    def literal(address: int) -> str:
        start = offset_of(address)
        end = raw.find(b"\0", start, start + 256)
        if end <= start or any(ch < 32 or ch > 126 for ch in raw[start:end]):
            raise ValueError(f"Nonliteral operation title at {address:#x}")
        return raw[start:end].decode("ascii")

    output = subprocess.check_output([
        "objdump", "-d", "--no-show-raw-insn", "-M", "intel",
        "--start-address=0x167e388", "--stop-address=0x16ad000", str(path),
    ], text=True)
    instructions = {}
    for line in output.splitlines():
        match = re.match(r"\s*([0-9a-f]+):\s+(\w+)\s*(.*)", line)
        if not match:
            continue
        pc, op, operands = match.groups()
        rip_match = re.search(r"# ([0-9a-f]+)", operands)
        rip = int(rip_match[1], 16) if rip_match else None
        instructions[int(pc, 16)] = (op, operands.split("#")[0].split(" <")[0].strip(), rip)
    addresses = sorted(instructions)
    next_pc = dict(zip(addresses, addresses[1:]))
    roots = list(SELECTORS) + [("arena", pc) for pc in ARENA]
    for group, table, count in TABLES:
        for index in range(count):
            delta = struct.unpack_from("<i", raw, offset_of(table + index * 4, 4))[0]
            roots.append((group, table + delta))

    entries = defaultdict(lambda: (set(), set(), set()))
    for group, root in roots:
        pending = [(root, None, None)]
        visited = set()
        while pending:
            pc, source_address, constructed = pending.pop()
            state = (pc, source_address, constructed)
            if pc in STOPS or state in visited:
                continue
            visited.add(state)
            if pc not in instructions:
                raise ValueError(f"Title branch leaves the inspected function at {pc:#x}")
            op, operands, rip = instructions[pc]
            if op == "lea" and operands.startswith("rsi,") and rip is not None:
                source_address = rip
            elif op == "call":
                target = int(operands, 16)
                if target == STRING_CONSTRUCTOR:
                    if source_address is None:
                        raise ValueError(f"Unresolved operation title at {pc:#x}")
                    constructed = source_address
                elif target == ADDST:
                    if constructed is None:
                        raise ValueError(f"Unresolved title submission at {pc:#x}")
                    groups, refs, draws = entries[literal(constructed)]
                    groups.add(group)
                    refs.add(constructed)
                    draws.add(pc)
                    continue
                else:
                    raise ValueError(f"Unexpected call in title construction at {pc:#x}: {operands}")
            if op.startswith("j"):
                target = int(operands, 16)
                pending.append((target, source_address, constructed))
                if op == "jmp":
                    continue
            elif op in {"ret", "notrack"}:
                raise ValueError(f"Unresolved title branch at {pc:#x}")
            pending.append((next_pc[pc], source_address, constructed))
    return [("/".join(sorted(groups)), ",".join(f"{ref:#x}" for ref in sorted(refs)),
             ",".join(f"{draw:#x}" for draw in sorted(draws)), source)
            for source, (groups, refs, draws) in sorted(entries.items())]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--game", type=Path, default=ROOT.parent / "dwarfort")
    parser.add_argument("--output", type=Path, default=ROOT / "data/extracted/operation-title-sources.tsv")
    args = parser.parse_args()
    entries = extract(args.game)
    with atomic_dictionary_output(args.output) as output:
        output.write(f"# Native operation titles: Linux DF 53.16, ELF BuildID {BUILD_ID}\n")
        output.write("# GENERATED by tools/extract_operation_title_catalog.py; translation entries live in data/runtime/local-overrides.tsv.\n")
        output.write("# Source inventory only: follows native title branches, never executes game code.\n")
        output.write("# group\tliteral VA\tdraw call VA\tcomplete source\n")
        for entry in entries:
            output.write("\t".join(entry) + "\n")
    print(f"Inventoried {len(entries)} native operation titles in {args.output}")


if __name__ == "__main__":
    main()
