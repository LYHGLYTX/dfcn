"""Read native help string construction, including keys and shared labels.

This is source extraction from the installed PE, never execution of game code.
The reviewed calls below are MSVC string construction/append and native text
submission functions in Windows DF 53.16. The initializer's case-local constant
tracking recovers appended key metadata and inline MSVC strings; a separate
reference inventory includes alternatives that share an append call. This is
source inventory, not execution or simulation of the game's control flow.
"""

from __future__ import annotations

from collections import Counter
from pathlib import Path
import os
import re
import shutil
import struct
import subprocess


class NativeHelpImage:
    def __init__(self, path: Path):
        self.path = path
        self.raw = path.read_bytes()
        header = struct.unpack_from("<I", self.raw, 0x3C)[0]
        if self.raw[:2] != b"MZ" or self.raw[header:header + 4] != b"PE\0\0":
            raise ValueError("Expected a native PE executable")
        if struct.unpack_from("<H", self.raw, header + 4)[0] != 0x8664:
            raise ValueError("Expected native Windows x64 help source")
        count = struct.unpack_from("<H", self.raw, header + 6)[0]
        optional = struct.unpack_from("<H", self.raw, header + 20)[0]
        self.base = struct.unpack_from("<Q", self.raw, header + 48)[0]
        self.sections = []
        for index in range(count):
            at = header + 24 + optional + index * 40
            size, rva, raw_size, offset = struct.unpack_from("<IIII", self.raw, at + 8)
            self.sections.append((rva, offset, raw_size))

    def offset(self, address: int) -> int:
        for rva, offset, size in self.sections:
            if self.base + rva <= address < self.base + rva + size:
                return offset + address - self.base - rva
        raise ValueError(f"Unmapped native help address: {address:#x}")

    def literal(self, address: int) -> str:
        at = self.offset(address)
        end = self.raw.find(b"\0", at, at + 16384)
        if end < 0 or any(ch < 0x20 or ch > 0x7E for ch in self.raw[at:end]):
            raise ValueError(f"Nonliteral native help input: {address:#x}")
        return self.raw[at:end].decode("ascii")

    def disassemble(self, start: int, end: int):
        executable = shutil.which("objdump")
        if not executable:
            candidate = Path(os.environ.get("TEMP", "")) / "codex-world-compute-w64devkit/extracted/w64devkit/bin/objdump.exe"
            if candidate.is_file():
                executable = str(candidate)
        if not executable:
            raise ValueError("Native objdump is required to read complete help construction")
        output = subprocess.check_output([
            executable, "-d", "-M", "intel", "--no-show-raw-insn",
            f"--start-address={start:#x}", f"--stop-address={end:#x}", str(self.path),
        ], text=True)
        for line in output.splitlines():
            match = re.match(r"\s*([0-9a-f]+):\s+(\w+)\s*(.*?)\s*$", line)
            if not match:
                continue
            address, operation, operands = match.groups()
            annotation = re.search(r"#\s*(0x[0-9a-f]+)", operands)
            yield int(address, 16), operation, operands.split("#", 1)[0].strip(), (
                int(annotation[1], 16) if annotation else None)


def constructed_sources(image: NativeHelpImage, start: int, end: int):
    """Return complete paragraph submissions and direct native draw strings."""
    registers: dict[str, int | None] = {"rsp": 0x10000000, "rcx": 0x20000000}
    origins: dict[str, str] = {}
    memory: dict[int, tuple[int, str]] = {}
    strings: dict[int, list[tuple[str, str]]] = {}
    submissions: list[tuple[str, int, list[tuple[str, str]]]] = []
    operations: Counter[int] = Counter()
    heap = 0x30000000
    # Each initializer case starts with the same help object and stack frame.
    # Case bodies may repurpose nonvolatile registers before jumping to the
    # common epilogue. Do not carry those values into another switch case.
    case_starts = set()
    case_registers = None
    case_memory = None
    if start == 0x1401F2310:
        table = image.offset(0x1401F6D9C)
        case_starts = {image.base + struct.unpack_from("<I", image.raw, table + i * 4)[0]
                       for i in range(0x4E)}

    def register(name: str) -> str:
        for full, forms in {"rax": ("eax", "ax", "al", "ah"),
                            "rcx": ("ecx", "cx", "cl", "ch"),
                            "rdx": ("edx", "dx", "dl", "dh"),
                            "rbx": ("ebx", "bx", "bl", "bh"),
                            "rsi": ("esi", "si", "sil"), "rdi": ("edi", "di", "dil"),
                            "rbp": ("ebp", "bp", "bpl"), "rsp": ("esp", "sp", "spl")}.items():
            if name in forms:
                return full
        return re.sub(r"(r\d+)[dwb]$", r"\1", name)

    def width(operand: str) -> int:
        for name, size in (("XMMWORD", 16), ("QWORD", 8), ("DWORD", 4), ("WORD", 2), ("BYTE", 1)):
            if operand.startswith(name + " PTR"):
                return size
        if operand.startswith("xmm"):
            return 16
        if operand.startswith("e") or re.fullmatch(r"r\d+d", operand):
            return 4
        if operand in ("ax", "bx", "cx", "dx", "si", "di", "bp", "sp") or re.fullmatch(r"r\d+w", operand):
            return 2
        if operand in ("al", "ah", "bl", "bh", "cl", "ch", "dl", "dh", "sil", "dil") or re.fullmatch(r"r\d+b", operand):
            return 1
        return 8

    def address_of(operand: str, rip: int | None) -> int | None:
        expression = operand[operand.index("[") + 1:operand.index("]")]
        if expression.startswith("rip"):
            return rip
        total = 0
        for term in re.findall(r"[+-]?[^+-]+", expression):
            sign = -1 if term.startswith("-") else 1
            term = term.lstrip("+-")
            factors = term.split("*")
            factor = int(factors[1], 0) if len(factors) > 1 else 1
            atom = int(factors[0], 0) if re.fullmatch(r"0x[0-9a-f]+|[0-9]+", factors[0]) else registers.get(factors[0])
            if atom is None:
                return None
            total += sign * atom * factor
        return total

    def read(at: int | None, size: int) -> int | None:
        if at is None:
            return None
        if all(at + i in memory for i in range(size)):
            return int.from_bytes(bytes(memory[at + i][0] for i in range(size)), "little")
        try:
            offset = image.offset(at)
            return int.from_bytes(image.raw[offset:offset + size], "little")
        except ValueError:
            return None

    def write(at: int | None, size: int, data: int | None, origin: str):
        if at is None:
            return
        for obj in list(strings):
            if at < obj + 32 and obj < at + size:
                del strings[obj]
        for i in range(size):
            if data is None:
                memory.pop(at + i, None)
            else:
                memory[at + i] = ((data >> (8 * i)) & 255, origin)

    def part(at: int, size: int | None = None) -> tuple[str, str]:
        if size is None:
            data = []
            for i in range(16384):
                byte = read(at + i, 1)
                if byte == 0:
                    break
                if byte is None:
                    raise ValueError(f"Unknown native help byte at {at + i:#x}")
                data.append(byte)
            else:
                raise ValueError("Unterminated native help string")
        else:
            data = [read(at + i, 1) for i in range(size)]
        if any(ch is None or ch < 0x20 or ch > 0x7E for ch in data):
            raise ValueError(f"Nontext native help construction at {at:#x}")
        if at in memory:
            provenance = "+".join(dict.fromkeys(memory[at + i][1] for i in range(len(data))))
        else:
            provenance = f"PE:file:{image.offset(at):#x}"
        return bytes(data).decode("ascii"), provenance

    def string(at: int | None) -> list[tuple[str, str]] | None:
        if at is None:
            return None
        if at in strings:
            return strings[at]
        length, capacity = read(at + 16, 8), read(at + 24, 8)
        if length is None or capacity is None or length > 16384 or capacity < length:
            return None
        data = at if capacity < 16 else read(at, 8)
        if data is None:
            return None
        strings[at] = [part(data, length)] if length else []
        return strings[at]

    def value(operand: str, rip: int | None):
        if re.fullmatch(r"0x[0-9a-f]+|[0-9]+", operand):
            return int(operand, 0)
        if "PTR" in operand:
            return read(address_of(operand, rip), width(operand))
        data = registers.get(register(operand))
        return None if data is None else data & ((1 << (width(operand) * 8)) - 1)

    def put(operand: str, data: int | None, rip: int | None, origin: str):
        if "PTR" in operand:
            write(address_of(operand, rip), width(operand), data, origin)
        else:
            key = register(operand)
            registers[key] = data
            origins[key] = origin

    for address, op, args, rip in image.disassemble(start, end):
        if address == 0x1401F244F:
            case_registers, case_memory = dict(registers), dict(memory)
        if address in case_starts and case_registers is not None:
            registers = dict(case_registers)
            memory = dict(case_memory)
            strings.clear()
        operands = args.split(",")
        origin = f"PE:instruction:{address:#x}"
        if op == "lea" and len(operands) == 2:
            dst, src = operands
            put(dst, address_of(src, rip), rip, origin)
        elif op in ("mov", "movabs", "movzx", "movsx", "movsxd", "movups", "movaps", "movdqa", "movdqu", "movsd") and len(operands) == 2:
            src_origin = origins.get(register(operands[1]), origin)
            if rip is not None:
                try:
                    src_origin = f"PE:file:{image.offset(rip):#x}"
                except ValueError:
                    pass  # Uninitialized globals have no file-backed bytes.
            put(operands[0], value(operands[1], rip), rip, src_origin)
        elif op in ("xor", "xorps", "pxor") and len(operands) == 2 and operands[0] == operands[1]:
            put(operands[0], 0, rip, origin)
        elif op in ("add", "sub") and len(operands) == 2:
            a, b = value(operands[0], rip), value(operands[1], rip)
            put(operands[0], None if a is None or b is None else a + (b if op == "add" else -b), rip, origin)
        elif op == "push":
            registers["rsp"] -= 8
        elif op == "call" and re.fullmatch(r"0x[0-9a-f]+", args):
            callee = int(args, 16)
            rcx, rdx = registers.get("rcx"), registers.get("rdx")
            operations[callee] += 1
            if address == 0x1401F5A95:
                # Adventure intro paragraphs queued by the native event
                # initializer. Their typed branches are extracted separately.
                if string(rcx) is None:
                    raise ValueError("Missing adventure introduction buffer")
                strings[rcx].append(("{adventure-introduction}", origin))
            elif callee == 0x14006F690:  # std::string default constructor
                strings[rcx] = []
            elif callee in (0x140068150, 0x14006F580, 0x14006F560, 0x14006FA10):
                if isinstance(rcx, int) and isinstance(rdx, int):
                    fragment = part(rdx, registers.get("r8") if callee == 0x14006FA10 else None)
                    if callee in (0x14006F560, 0x14006FA10):
                        if string(rcx) is None:
                            raise ValueError(f"Help append without recovered constructor at {address:#x}")
                        strings[rcx].append(fragment)
                    else:
                        strings[rcx] = [fragment]
                    if rcx == 0x20000010:
                        submissions.append(("title", address, [fragment]))
                    registers["rax"] = rcx
                else:
                    raise ValueError(f"Unrecovered help string arguments at {address:#x}: {rcx!r}, {rdx!r}")
            elif callee == 0x14052C130:
                if string(rdx) is None:
                    raise ValueError(f"Unrecovered help integer insertion at {address:#x}")
                strings[rdx].append((str(rcx) if isinstance(rcx, int) else "{d}", origin))
            elif callee in (0x140D51EB0, 0x140AD9A40, 0x140AD9960):
                if string(rdx) is not None:
                    submissions.append(("paragraph" if callee == 0x140D51EB0 else "control",
                                        address, list(strings[rdx])))
                elif callee == 0x140D51EB0:
                    raise ValueError(f"Unrecovered native help paragraph at {address:#x}: {rdx!r}")
                # Other addst calls draw the title or rows of the paragraph
                # object; their source is inventoried at construction above.
            elif callee in (0x140067E30, 0x14006F850):
                strings.pop(rcx, None)
            elif callee == 0x1400707D0:  # game allocation for inline string construction
                registers["rax"] = heap
                heap += 0x10000
    return submissions, operations


HELP_FUNCTIONS = (
    # The shared screen draw also handles saves, settings and music.  Only
    # the [rsi+0xE9] branch is the complete two-column help directory:
    # 0x1401DEB47 tests it, false jumps to 0x1401DFBE5, and the final
    # 0x1401DFBE0 jump leaves for the common epilogue.  This includes both
    # label switches (0x1401DF324 / 0x1401DF6D0), status labels and scroll
    # controls.  Directory labels are literal ctor/append or explicit-length
    # append inputs; the short immediates here are lengths/color/geometry.
    ("help-index", 0x1401DEB47, 0x1401DFBE5),
    ("help-overview", 0x1401E65A0, 0x1401E8A24),
    ("tutorial-objective", 0x1401E8B20, 0x1401F1366),
    ("help-tutorial", 0x1401F2310, 0x1401F6CD2),
)


def referenced_literals(image: NativeHelpImage, start: int, end: int):
    """Read all branch-local literal references, including SIMD constructors.

    Interior pointers used to copy the second SIMD word are excluded; the
    first reference owns the complete literal. Short immediate strings are
    recovered by constructed_sources instead.
    """
    seen = set()
    for address, op, args, rip in image.disassemble(start, end):
        if rip is None or op not in ("lea", "mov", "movups", "movaps", "movdqa", "movdqu", "movsd"):
            continue
        try:
            offset = image.offset(rip)
            if offset == 0 or image.raw[offset - 1] != 0:
                continue
            literal = image.literal(rip)
        except ValueError:
            continue
        if literal and re.search(r"[A-Za-z]", literal) and literal not in seen:
            seen.add(literal)
            yield literal, f"PE:file:{offset:#x}"


def key_templates(parts: list[tuple[str, str]]):
    """Keep actual native key slots inside complete logical paragraphs.

    Adjacent bindings form one slot. [B] introduces a paragraph break and color
    tags never become prose. This keeps literal context on both sides of keys
    without guessing the current keyboard layout or the player's bindings.
    """
    raw = "".join(text for text, _ in parts)
    provenance = "+".join(dict.fromkeys(provenance for _, provenance in parts))
    for paragraph in raw.split("[B]"):
        if "[KEY:" not in paragraph:
            continue
        source = re.sub(r"\[C:\d+:\d+:\d+\]", "", paragraph)
        source = re.sub(r"(?:\[KEY:\d+\]\s*)+", "{k} ", source)
        source = " ".join(source.split())
        if "[KEY:" in source or not source.split("{k}", 1)[0].strip():
            raise ValueError(f"Unrecovered native help key context: {source!r}")
        yield source, provenance


def visible_parts(parts: list[tuple[str, str]]) -> list[tuple[str, str]]:
    """Consume native markup across constructor/append boundaries."""
    result = []
    pending = ""
    for text, provenance in parts:
        visible = []
        at = 0
        while at < len(text):
            if pending:
                close = text.find("]", at)
                if close < 0:
                    pending += text[at:]
                    break
                pending += text[at:close + 1]
                if not re.fullmatch(r"\[(?:KEY:\d+|C:\d+:\d+:\d+|B)\]", pending):
                    raise ValueError(f"Unrecognized native help markup: {pending!r}")
                pending = ""
                at = close + 1
            elif text.startswith(("[KEY:", "[C:", "[B]"), at):
                pending = text[at:at + 1]
                at += 1
            else:
                visible.append(text[at])
                at += 1
        source = " ".join("".join(visible).split())
        if source:
            result.append((source, provenance))
    if pending:
        raise ValueError(f"Unclosed native help markup: {pending!r}")
    return result
