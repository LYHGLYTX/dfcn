#!/usr/bin/env python3
"""Read native Windows Legends literals and their containing PE functions.

This is a static source catalogue for translation review. It never loads the
game/core or invokes a translator. Adjacent literals are not a grammar: use
the printed function addresses with the native objdump for branch inspection.
"""
from __future__ import annotations

import argparse
import bisect
from pathlib import Path
import re
import struct


class NativeImage:
    def __init__(self, path: Path):
        self.raw = path.read_bytes()
        pe = struct.unpack_from("<I", self.raw, 60)[0]
        if self.raw[:2] != b"MZ" or self.raw[pe:pe + 4] != b"PE\0\0":
            raise ValueError("Expected the native Windows game executable")
        count = struct.unpack_from("<H", self.raw, pe + 6)[0]
        optional_size = struct.unpack_from("<H", self.raw, pe + 20)[0]
        optional = pe + 24
        if struct.unpack_from("<H", self.raw, optional)[0] != 0x20B:
            raise ValueError("Expected a 64-bit PE image")
        self.base = struct.unpack_from("<Q", self.raw, optional + 24)[0]
        self.sections = []
        for index in range(count):
            at = optional + optional_size + index * 40
            name = self.raw[at:at + 8].rstrip(b"\0").decode("ascii")
            virtual_size, rva, size, offset = struct.unpack_from("<IIII", self.raw, at + 8)
            self.sections.append((name, rva, virtual_size, offset, size))
        exception_rva, exception_size = struct.unpack_from("<II", self.raw, optional + 112 + 3 * 8)
        offset = self.offset(exception_rva)
        runtime_functions = sorted(struct.unpack_from("<III", self.raw, at)
                                   for at in range(offset, offset + exception_size, 12))
        self.functions = [(begin, end) for begin, end, _ in runtime_functions]
        self.starts = [begin for begin, _ in self.functions]
        # A PE runtime-function entry may cover only one portion of a C++
        # function. MSVC chains later portions to its original unwind record;
        # treating each entry as a separate function loses continuation text.
        parents = {}
        for begin, _, unwind in runtime_functions:
            at = self.offset(unwind)
            flags, codes = self.raw[at] >> 3, self.raw[at + 2]
            if flags & 4:  # UNW_FLAG_CHAININFO; codes are aligned to four bytes.
                trailer = at + 4 + ((codes + 1) // 2) * 4
                parents[begin] = struct.unpack_from("<III", self.raw, trailer)[0]
        self.function_owners = {}
        self.function_ends = {}
        for begin, end, _ in runtime_functions:
            owner, seen = begin, set()
            while owner in parents:
                if owner in seen:
                    raise ValueError("Cyclic native unwind chain")
                seen.add(owner)
                owner = parents[owner]
            self.function_owners[begin] = owner
            self.function_ends[owner] = max(end, self.function_ends.get(owner, 0))

    def offset(self, rva: int) -> int:
        for _, start, _, offset, size in self.sections:
            if start <= rva < start + size:
                return offset + rva - start
        raise ValueError(f"RVA outside file data: {rva:#x}")

    def string(self, rva: int) -> tuple[int, str] | None:
        try:
            offset = self.offset(rva)
        except ValueError:
            return None
        stop = self.raw.find(b"\0", offset, min(len(self.raw), offset + 2048))
        if stop <= offset:
            return None
        value = self.raw[offset:stop]
        if any(ch < 32 or ch > 126 for ch in value):
            return None
        return offset, value.decode("ascii")

    def references(self):
        _, rva, _, offset, size = next(s for s in self.sections if s[0] == ".text")
        # MSVC materializes these literal addresses using RIP-relative LEA.
        # Keep function containment and printable/NUL bounds; these results
        # are navigation hints, not claims of decoded instructions/coverage.
        pattern = rb"[\x48\x4c]\x8d[\x05\x0d\x15\x1d\x25\x2d\x35\x3d]...."
        for match in re.finditer(pattern, self.raw[offset:offset + size], re.S):
            address = rva + match.start()
            index = bisect.bisect_right(self.starts, address) - 1
            if index < 0:
                continue
            begin, end = self.functions[index]
            if not begin <= address < end:
                continue
            target = address + 7 + struct.unpack_from("<i", match.group(), 3)[0]
            value = self.string(target)
            if value:
                owner = self.function_owners[begin]
                yield address, owner, self.function_ends[owner], *value


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("image", type=Path)
    parser.add_argument("--function", type=lambda value: int(value, 0))
    parser.add_argument("--literal", action="append", default=[])
    parser.add_argument("--start", type=lambda value: int(value, 0), default=0x16D5E78)
    parser.add_argument("--end", type=lambda value: int(value, 0), default=0x16DF2A0)
    parser.add_argument("--related", action="store_true", help="Include other literals referenced by the same functions, including chained unwind regions")
    args = parser.parse_args()
    image = NativeImage(args.image)
    if args.function is not None:
        rva = args.function - image.base
        args.function = image.base + image.function_owners.get(rva, rva)
    refs = list(image.references())
    selected = [r for r in refs if
                (args.function is not None and r[1] + image.base == args.function) or
                (args.literal and r[4].strip() in args.literal) or
                (args.function is None and not args.literal and args.start <= r[3] < args.end)]
    if args.related or args.literal:
        functions = {r[1] for r in selected}
        selected = [r for r in refs if r[1] in functions]
    print("file_offset\tcode_address\tfunction_start\tfunction_end\tliteral")
    for address, begin, end, offset, value in sorted(set(selected), key=lambda r: (r[1], r[0])):
        print(f"0x{offset:x}\t0x{image.base + address:x}\t0x{image.base + begin:x}\t0x{image.base + end:x}\t{value}")


if __name__ == "__main__":
    main()
