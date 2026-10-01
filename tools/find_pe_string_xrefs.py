#!/usr/bin/env python3
"""Find x64 RIP-relative code references to exact ASCII strings in a PE file."""

from __future__ import annotations

import argparse
import collections
import pathlib
import sys


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("pe", type=pathlib.Path)
    parser.add_argument("strings", nargs="+")
    parser.add_argument("--module-path", type=pathlib.Path)
    args = parser.parse_args()

    if args.module_path:
        sys.path.insert(0, str(args.module_path))
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM
    from capstone.x86 import X86_REG_RIP

    raw = args.pe.read_bytes()
    pe = pefile.PE(data=raw, fast_load=True)
    pe.parse_data_directories(
        directories=[pefile.DIRECTORY_ENTRY["IMAGE_DIRECTORY_ENTRY_EXCEPTION"]]
    )
    image_base = pe.OPTIONAL_HEADER.ImageBase

    def function_bounds(address: int) -> tuple[int, int] | None:
        rva = address - image_base
        for entry in getattr(pe, "DIRECTORY_ENTRY_EXCEPTION", []):
            begin = entry.struct.BeginAddress
            end = entry.struct.EndAddress
            if begin <= rva < end:
                return image_base + begin, image_base + end
        return None
    targets: dict[int, list[tuple[str, int]]] = collections.defaultdict(list)
    for text in args.strings:
        needle = text.encode("ascii") + b"\0"
        start = 0
        while True:
            offset = raw.find(needle, start)
            if offset < 0:
                break
            rva = pe.get_rva_from_offset(offset)
            targets[image_base + rva].append((text, offset))
            start = offset + 1

    for address, entries in sorted(targets.items()):
        for text, offset in entries:
            print(f"STRING {text!r} file=0x{offset:X} va=0x{address:X}")

    text_section = next(
        section for section in pe.sections
        if section.Name.rstrip(b"\0") == b".text"
    )
    code = text_section.get_data()
    code_address = image_base + text_section.VirtualAddress
    md = Cs(CS_ARCH_X86, CS_MODE_64)
    md.detail = True
    md.skipdata = True
    hits = 0
    for instruction in md.disasm(code, code_address):
        if instruction.id == 0:
            continue
        for operand in instruction.operands:
            if operand.type != CS_OP_MEM or operand.mem.base != X86_REG_RIP:
                continue
            target = instruction.address + instruction.size + operand.mem.disp
            if target not in targets:
                continue
            for text, offset in targets[target]:
                bounds = function_bounds(instruction.address)
                function_text = ""
                if bounds:
                    function_text = (
                        f" function=0x{bounds[0]:X}-0x{bounds[1]:X}"
                    )
                print(
                    f"XREF {text!r} code_va=0x{instruction.address:X} "
                    f"file=0x{pe.get_offset_from_rva(instruction.address - image_base):X} "
                    f"{instruction.mnemonic} {instruction.op_str}" +
                    function_text
                )
                hits += 1
    print(f"XREF_COUNT={hits}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
