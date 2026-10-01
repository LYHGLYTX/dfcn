#!/usr/bin/env python3
"""Read installed native announcement constructors with ELF/PE literal notes.

This is a source-inspection aid. It does not execute the game or a translation.
"""
from __future__ import annotations

import argparse
import bisect
import os
from pathlib import Path
import re
import shutil
import struct
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("start", nargs="?", type=lambda value: int(value, 0))
    parser.add_argument("end", nargs="?", type=lambda value: int(value, 0))
    parser.add_argument("--callers", type=lambda value: int(value, 0),
                        help="Inventory direct callers and their literal operands (ELF)")
    parser.add_argument("--assembly", type=Path,
                        help="Reuse a full native objdump listing for the caller inventory")
    args = parser.parse_args()
    executable = shutil.which("objdump")
    if not executable:
        raise SystemExit("Native objdump is required for source inspection")
    game = ROOT.parent / ("Dwarf Fortress.exe" if os.name == "nt" else "dwarfort")
    if args.callers is None and (args.start is None or args.end is None):
        parser.error("provide start/end, or --callers")
    if args.assembly and args.callers is None:
        parser.error("--assembly belongs to --callers")
    if args.assembly:
        listing = args.assembly.read_text()
    else:
        bounds = [] if args.callers is not None else [
            f"--start-address={args.start:#x}", f"--stop-address={args.end:#x}"]
        listing = subprocess.run([executable, "-d", "-Mintel", *bounds, str(game)],
            check=True, capture_output=True, text=True).stdout
    raw = game.read_bytes()
    sections = []
    if raw[:6] == b"\x7fELF\x02\x01":
        headers = struct.unpack_from("<Q", raw, 0x28)[0]
        width, count = struct.unpack_from("<HH", raw, 0x3a)
        for index in range(count):
            at = headers + width * index
            kind = struct.unpack_from("<I", raw, at + 4)[0]
            address, offset, size = struct.unpack_from("<QQQ", raw, at + 16)
            if kind == 1:
                sections.append((address, size, offset))
    elif raw[:2] == b"MZ":
        pe = struct.unpack_from("<I", raw, 0x3c)[0]
        count = struct.unpack_from("<H", raw, pe + 6)[0]
        optional_size = struct.unpack_from("<H", raw, pe + 20)[0]
        base = struct.unpack_from("<Q", raw, pe + 48)[0]
        for index in range(count):
            at = pe + 24 + optional_size + 40 * index
            size, address, file_size, offset = struct.unpack_from("<IIII", raw, at + 8)
            sections.append((base + address, file_size, offset))
    else:
        raise SystemExit("Unsupported native executable format")
    def literal(address, width=None):
        for start, size, offset in sections:
            if start <= address < start + size:
                at = offset + address - start
                stop = min(at + width, offset + size) if width else raw.find(
                    b"\0", at, min(at + 2048, offset + size))
                text = raw[at:stop] if stop >= at else b""
                if text and all(32 <= byte < 127 for byte in text):
                    return text.decode("ascii")
        return None
    selected = []
    calls = set()
    if args.callers is not None:
        if raw[:4] != b"\x7fELF":
            parser.error("--callers requires native ELF unwind function ranges")
        frames = subprocess.run(["readelf", "--debug-dump=frames", str(game)],
            check=True, capture_output=True, text=True).stdout
        ranges = sorted(set((int(a, 16), int(b, 16)) for a, b in re.findall(
            r"FDE .*pc=([0-9a-f]+)\.\.([0-9a-f]+)", frames)))
        starts = [start for start, end in ranges]
        owners = set()
        for line in listing.splitlines():
            if not re.search(rf"\b(?:call|jmp)\s+{args.callers:x}\b", line):
                continue
            address = int(line.split(":", 1)[0], 16)
            at = bisect.bisect_right(starts, address) - 1
            if at < 0 or address >= ranges[at][1]:
                raise SystemExit(f"No native function range for caller {address:#x}")
            owners.add(ranges[at])
            calls.add(address)
        selected = sorted(owners)
        starts = [start for start, end in selected]
        print("function_start\tfunction_end\tinstruction\tkind\toperand\ttext")
    for line in listing.splitlines():
        instruction = re.match(r"\s*([0-9a-f]+):", line)
        if args.callers is not None:
            if not instruction:
                continue
            address = int(instruction[1], 16)
            at = bisect.bisect_right(starts, address) - 1
            if at < 0 or address >= selected[at][1]:
                continue
            prefix = f"{selected[at][0]:x}\t{selected[at][1]:x}\t{address:x}"
            if address in calls:
                print(f"{prefix}\tcall\t{args.callers:x}\t")
        target = re.search(r"# (?:0x)?([0-9a-f]+)", line)
        width = 32 if "YMMWORD PTR" in line else 16 if "XMMWORD PTR" in line else None
        value = literal(int(target[1], 16), width) if target else None
        if value is not None:
            if args.callers is not None:
                print(f"{prefix}\t{'bytes' if width else 'cstring'}\t{target[1]}\t{value}")
                continue
            line += " ; SOURCE " + repr(value)
        # Optimized constructors also embed short append/assign fragments in
        # integer stores. Preserve these as operands, not invented sentences.
        immediate = re.search(r"\bmov(?:abs)?\s+[^#]*,0x([0-9a-f]{4,16})(?:\s|$)", line)
        if immediate:
            hex_value = immediate[1]
            width = 8 if len(hex_value) > 8 else 4 if len(hex_value) > 4 else 2
            value = int(hex_value, 16).to_bytes(width, "little").rstrip(b"\0")
            if len(value) >= 2 and all(32 <= byte < 127 for byte in value):
                if args.callers is not None:
                    print(f"{prefix}\timmediate\t{hex_value}\t{value.decode('ascii')}")
                else:
                    line += " ; INLINE " + repr(value.decode("ascii"))
        if args.callers is None:
            print(line)


if __name__ == "__main__":
    main()
