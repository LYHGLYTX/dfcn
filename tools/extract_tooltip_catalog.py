#!/usr/bin/env python3
"""Read the ELF64 DF 53.16 tooltip initializer without executing the game.

GCC embeds many strings as SIMD constants / immediate stores, so `strings`
alone loses short captions and sentence tails. Decode the initializer's
straight-line string construction and emit every add_paragraph argument.
The addresses describe BuildID bcc6789e6fb477b785a2b02be80b8b1b054ff88c;
this is a source-inventory tool, not a runtime hook or a game test.
RAW building descriptions are separate from that initializer; include their
complete TOOLTIP tags in the same inventory.
"""

from __future__ import annotations

import argparse
import re
import struct
import subprocess
from pathlib import Path


def building_tooltip_sources(game: Path) -> list[tuple[str, str, str, str]]:
    """Read complete native RAW tooltips, without inventing a screen width."""
    entries = []
    for path in sorted((game / "data/vanilla").glob("*/objects/*.txt")):
        raw = path.read_text(encoding="cp437")
        if "[OBJECT:BUILDING]" not in raw:
            continue
        owner = None
        for token in re.finditer(r"\[([^\[\]]*)\]", raw):
            value = token[1]
            if value.startswith(("BUILDING_WORKSHOP:", "BUILDING_FURNACE:")):
                owner = value
            elif value.startswith("TOOLTIP:") and owner:
                source = " ".join(value.removeprefix("TOOLTIP:").split())
                if source:
                    line = raw.count("\n", 0, token.start()) + 1
                    entries.append((f"{path.relative_to(game).as_posix()}:{line}",
                                    owner, "-", source))
    return entries


def extract(path: Path) -> list[tuple[int, int, int, str]]:
    raw = path.read_bytes()
    if raw[:6] != b"\x7fELF\x02\x01":
        raise ValueError("Expected a little-endian ELF64 game")
    if bytes.fromhex("bcc6789e6fb477b785a2b02be80b8b1b054ff88c") not in raw:
        raise ValueError("Tooltip initializer BuildID does not match the recorded DF 53.16 image; inspect the new build first")
    segments = []
    phoff = struct.unpack_from("<Q", raw, 32)[0]
    phsize, phnum = struct.unpack_from("<HH", raw, 54)
    for i in range(phnum):
        kind, _, offset, address, _, size, _, _ = struct.unpack_from(
            "<IIQQQQQQ", raw, phoff + i * phsize)
        if kind == 1:
            segments.append((address, offset, size))
    memory: dict[int, int] = {}
    registers = {"rsp": 0x100000000, "rax": 0}
    heap = 0x200000000
    widths = {"BYTE": 1, "WORD": 2, "DWORD": 4, "QWORD": 8, "XMMWORD": 16}

    def reg(name: str) -> tuple[str, int]:
        if name.startswith("xmm"):
            return name, 16
        for suffix, width in (("d", 4), ("w", 2), ("b", 1)):
            if re.fullmatch(r"r\d+" + suffix, name):
                return name[:-1], width
        for full, forms in {
            "rax": ("eax", "ax", "al"), "rbx": ("ebx", "bx", "bl"),
            "rcx": ("ecx", "cx", "cl"), "rdx": ("edx", "dx", "dl"),
            "rsi": ("esi", "si", "sil"), "rdi": ("edi", "di", "dil"),
            "rbp": ("ebp", "bp", "bpl"), "rsp": ("esp", "sp", "spl"),
        }.items():
            if name in forms:
                return full, (4, 2, 1)[forms.index(name)]
        return name, 8

    def address(expr: str, rip: int | None) -> int:
        expr = expr[expr.index("[") + 1:expr.index("]")]
        if expr.startswith("rip"):
            if rip is None:
                raise ValueError("Missing RIP address")
            return rip
        result = 0
        for term in re.findall(r"[+-]?[^+-]+", expr):
            sign = -1 if term.startswith("-") else 1
            term = term.lstrip("+-")
            if "*" in term:
                name, factor = term.split("*")
                value = registers[name] * int(factor, 0)
            else:
                value = int(term, 0) if term.startswith("0x") or term.isdigit() else registers[term]
            result += sign * value
        return result

    def read(at: int, size: int) -> bytes:
        for base, offset, length in segments:
            if base <= at and at + size <= base + length:
                return raw[offset + at - base:offset + at - base + size]
        return bytes(memory[at + i] for i in range(size))

    def write(at: int, value: int, size: int) -> None:
        for i, byte in enumerate((value & ((1 << (size * 8)) - 1)).to_bytes(size, "little")):
            memory[at + i] = byte

    def get(operand: str, rip: int | None = None) -> int:
        if operand.startswith("0x") or operand.isdigit():
            return int(operand, 0)
        if "PTR" in operand:
            return int.from_bytes(read(address(operand, rip), widths[operand.split()[0]]), "little")
        name, width = reg(operand)
        return registers[name] & ((1 << (width * 8)) - 1)

    def put(operand: str, value: int, rip: int | None = None) -> None:
        if "PTR" in operand:
            write(address(operand, rip), value, widths[operand.split()[0]])
        else:
            name, width = reg(operand)
            registers[name] = value & ((1 << (width * 8)) - 1)

    output = subprocess.check_output([
        "objdump", "-d", "--no-show-raw-insn", "-M", "intel",
        "--start-address=0x1648c70", "--stop-address=0x1657a56", str(path),
    ], text=True)
    entries = []
    for line in output.splitlines():
        match = re.match(r"\s*([0-9a-f]+):\s+(\w+)\s*(.*)", line)
        if not match:
            continue
        pc, op, operands = match.groups()
        rip_match = re.search(r"# ([0-9a-f]+)", operands)
        rip = int(rip_match[1], 16) if rip_match else None
        operands = operands.split("#")[0].split(" <")[0].strip()
        args = operands.split(",")
        try:
            # Stack guards / epilogue do not construct a string.
            if "fs:" in operands or "[rsp+0x28]" in operands:
                continue
            if op in {"mov", "movabs", "movdqa", "movups"}:
                put(args[0], get(args[1], rip), rip)
            elif op == "lea":
                put(args[0], address(args[1], rip))
            elif op in {"and", "sub", "shr", "xor"}:
                a, b = get(args[0]), get(args[1])
                put(args[0], {"and": lambda: a & b, "sub": lambda: a - b,
                              "shr": lambda: a >> b, "xor": lambda: a ^ b}[op]())
            elif op == "rep":
                size = registers["rcx"] * widths[operands.split()[1]]
                data = read(registers["rsi"], size)
                for i, byte in enumerate(data):
                    memory[registers["rdi"] + i] = byte
                registers["rsi"] += size
                registers["rdi"] += size
                registers["rcx"] = 0
            elif op == "call":
                target = int(operands, 16)
                if target == 0x423860:  # operator new
                    registers["rax"] = heap
                    heap += 0x10000
                elif target == 0x1648bd0:  # std::string(const char *)
                    data = bytearray()
                    at = registers["rsi"]
                    while (byte := read(at + len(data), 1)[0]):
                        data.append(byte)
                    for i, byte in enumerate(data):
                        memory[heap + i] = byte
                    write(registers["rdi"], heap, 8)
                    write(registers["rdi"] + 8, len(data), 8)
                    write(registers["rdi"] + 16, len(data), 8)
                    heap += 0x10000
                elif target == 0x423910:  # curses_text_boxst::add_paragraph
                    string = registers["rsi"]
                    ptr = int.from_bytes(read(string, 8), "little")
                    size = int.from_bytes(read(string + 8, 8), "little")
                    source = read(ptr, size).decode("ascii")
                    if not source or any(ord(ch) < 32 or ord(ch) > 126 for ch in source):
                        raise ValueError("Non-prose initializer")
                    entries.append((int(pc, 16), registers["rdi"], registers["rdx"], source))
                elif target != 0x423790:  # operator delete
                    raise ValueError(f"Unknown call {operands}")
            elif op not in {"push", "pop", "cmp", "je", "jne", "add", "ret", "endbr64"}:
                raise ValueError(f"Unknown instruction {op}")
        except (KeyError, ValueError) as exc:
            raise ValueError(f"Cannot decode initializer at {pc}: {op} {operands}: {exc}") from exc
    return entries


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("game", type=Path)
    args = parser.parse_args()
    print("# call address or RAW path:line\tparagraph address or RAW object\tnative width (- = runtime)\tcomplete source")
    for pc, owner, width, source in extract(args.game):
        print(f"0x{pc:x}\t0x{owner:x}\t{width}\t{source}")
    for entry in building_tooltip_sources(args.game.resolve().parent):
        print("\t".join(entry))
