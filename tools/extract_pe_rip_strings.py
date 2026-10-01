#!/usr/bin/env python3
"""List printable strings referenced by x64 RIP-relative operands in a code range."""

from __future__ import annotations

import argparse
import pathlib
import sys


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("pe", type=pathlib.Path)
    parser.add_argument("start", type=lambda value: int(value, 0))
    parser.add_argument("end", type=lambda value: int(value, 0))
    parser.add_argument("--module-path", type=pathlib.Path)
    args = parser.parse_args()
    if args.module_path:
        sys.path.insert(0, str(args.module_path))

    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM
    from capstone.x86 import X86_REG_RIP

    raw = args.pe.read_bytes()
    pe = pefile.PE(data=raw, fast_load=True)
    base = pe.OPTIONAL_HEADER.ImageBase
    start = args.start if args.start >= base else base + args.start
    end = args.end if args.end >= base else base + args.end
    start_offset = pe.get_offset_from_rva(start - base)
    code = raw[start_offset:start_offset + end - start]

    def ascii_at(address: int) -> str | None:
        try:
            offset = pe.get_offset_from_rva(address - base)
        except Exception:
            return None
        if offset < 0 or offset >= len(raw):
            return None
        stop = raw.find(b"\0", offset, min(len(raw), offset + 256))
        if stop < 0 or stop == offset:
            return None
        value = raw[offset:stop]
        if any(byte < 32 or byte > 126 for byte in value):
            return None
        try:
            return value.decode("ascii")
        except UnicodeDecodeError:
            return None

    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True
    md.skipdata = True
    rows: list[tuple[int, int, str, str]] = []
    for instruction in md.disasm(code, start):
        if instruction.id == 0:
            continue
        for operand in instruction.operands:
            if operand.type != CS_OP_MEM or operand.mem.base != X86_REG_RIP:
                continue
            target = instruction.address + instruction.size + operand.mem.disp
            value = ascii_at(target)
            if value is not None:
                rows.append((instruction.address, target, value,
                             f"{instruction.mnemonic} {instruction.op_str}"))
    for address, target, value, instruction in rows:
        print(f"0x{address:X}\t0x{target:X}\t{value}\t{instruction}")
    print(f"STRING_XREFS={len(rows)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
