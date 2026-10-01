#!/usr/bin/env python3
"""Generate native event identities from the supported local game image.

This reads the supported native PE layouts or ELF RTTI and decodes getType's
constant return instructions. It never loads the game or invokes native code.
Only the requested final include is written; no intermediate files are needed.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import re
from pathlib import Path
import struct
import sys


WORKSPACE = Path(__file__).resolve().parent.parent
SUPPORTED_TIMESTAMP = 0x6A70A6D9
SUPPORTED_IMAGE_BASE = 0x140000000
EXPECTED_EVENT_COUNT = 133


class PEImage:
    def __init__(self, path: Path):
        self.data = path.read_bytes()
        if self.read_file(0, 2) != b"MZ":
            raise ValueError("The game is not a Windows PE image")
        nt = self.unpack_file("<I", 0x3C)[0]
        if self.read_file(nt, 4) != b"PE\0\0":
            raise ValueError("The game has an invalid PE signature")
        machine, section_count, self.timestamp = self.unpack_file("<HHI", nt + 4)
        optional_size = self.unpack_file("<H", nt + 20)[0]
        optional = nt + 24
        if machine != 0x8664 or self.unpack_file("<H", optional)[0] != 0x20B:
            raise ValueError("Only the native Windows x64 game is supported")
        self.image_base = self.unpack_file("<Q", optional + 24)[0]
        self.image_size = self.unpack_file("<I", optional + 56)[0]
        if self.timestamp != SUPPORTED_TIMESTAMP or self.image_base != SUPPORTED_IMAGE_BASE:
            raise ValueError("The game does not match the supported 53.16 Windows profile")
        self.sections = []
        section_table = optional + optional_size
        for index in range(section_count):
            entry = section_table + index * 40
            virtual_size, rva, raw_size, raw_offset = self.unpack_file("<IIII", entry + 8)
            flags = self.unpack_file("<I", entry + 36)[0]
            self.sections.append((rva, virtual_size, raw_size, raw_offset, flags))

    def read_file(self, offset: int, size: int) -> bytes:
        if offset < 0 or size < 0 or offset + size > len(self.data):
            raise ValueError(f"Read outside the PE file at {offset:#x}")
        return self.data[offset:offset + size]

    def unpack_file(self, format_string: str, offset: int) -> tuple:
        return struct.unpack(format_string, self.read_file(offset, struct.calcsize(format_string)))

    def read_rva(self, rva: int, size: int, executable: bool = False) -> bytes:
        if rva < 0 or size < 0 or rva + size > self.image_size:
            raise ValueError(f"Read outside the PE image at {rva:#x}")
        for start, virtual_size, raw_size, raw_offset, flags in self.sections:
            delta = rva - start
            if 0 <= delta and delta + size <= min(raw_size, virtual_size):
                if executable and not flags & 0x20000000:
                    raise ValueError(f"Native method is not in executable code: {rva:#x}")
                return self.read_file(raw_offset + delta, size)
        raise ValueError(f"RVA has no file-backed section: {rva:#x}")

    def pointer(self, rva: int) -> int:
        value = struct.unpack("<Q", self.read_rva(rva, 8))[0]
        if not self.image_base <= value < self.image_base + self.image_size:
            raise ValueError(f"Vtable pointer is outside the game image: {value:#x}")
        return value - self.image_base


def read_profiles(image: PEImage, layouts: Path) -> list[tuple]:
    profiles = []
    with layouts.open(encoding="utf-8-sig", newline="") as source:
        for row in csv.reader(source, delimiter="\t"):
            if not row or row[0].startswith("#") or row[0] == ".?AVhistory_eventst@@":
                continue
            if len(row) < 4 or not row[0].startswith(".?AVhistory_event_"):
                raise ValueError(f"Unexpected history event layout entry: {row!r}")
            name = row[0][len(".?AVhistory_event_"):-len("st@@")]
            vtable = int(row[1], 16) - image.image_base
            get_type = image.pointer(vtable)
            get_sentence = image.pointer(vtable + 0xD0)
            get_subject = image.pointer(vtable + 0xD8)
            if get_sentence != int(row[2], 16) - image.image_base or get_subject != int(row[3], 16) - image.image_base:
                raise ValueError(f"Layout formatter mismatch for {name}")
            image.read_rva(get_sentence, 1, executable=True)
            image.read_rva(get_subject, 1, executable=True)
            code = image.read_rva(get_type, 6, executable=True)
            if code[0] == 0xB8 and code[5] == 0xC3:
                native_type = struct.unpack("<i", code[1:5])[0]
                code_size = 6
            elif code[:3] in (b"\x31\xc0\xc3", b"\x33\xc0\xc3"):
                native_type = 0
                code_size = 3
            else:
                raise ValueError(f"getType is not an immediate return for {name}: {code.hex()}")
            profiles.append((vtable, get_type, get_sentence, native_type,
                             code[:code_size], name))
    if len(profiles) != EXPECTED_EVENT_COUNT:
        raise ValueError(f"Expected {EXPECTED_EVENT_COUNT} concrete event types, found {len(profiles)}")
    if len({entry[0] for entry in profiles}) != len(profiles):
        raise ValueError("Duplicate event vtables in the layouts")
    if {entry[3] for entry in profiles} != set(range(EXPECTED_EVENT_COUNT)):
        raise ValueError("Native event types are not the expected complete range 0..132")
    return sorted(profiles)


def render_bindings(profiles: list[tuple], comments: list[str], anchor: int = 0) -> str:
    """Emit native ABI data only; identity lookup/validation live in shared C++."""
    lines = [
        *comments,
        "// Native RVA/ABI bindings only; no per-host capture or validation logic.",
        f"static constexpr std::array<NativeHistoryEventIdentityProfile, {len(profiles)}>",
        "    native_history_event_identity_profiles{{",
    ]
    for vtable, get_type, get_sentence, native_type, code, name in profiles:
        bytes_text = ", ".join(f"0x{value:02x}" for value in code)
        lines.append(f"    {{0x{vtable - anchor:08x}, 0x{get_type - anchor:08x}, "
                     f"0x{get_sentence - anchor:08x}, {native_type}, {len(code)}, "
                     f"{{{{{bytes_text}}}}}}}, // {name}")
    lines += ["}};", ""]
    return "\n".join(lines)


def render(image: PEImage, profiles: list[tuple]) -> str:
    return render_bindings(profiles, [
        "// Generated by tools/build_history_event_profiles.py from the local game PE.",
        f"// Source SHA-256: {hashlib.sha256(image.data).hexdigest()}",
    ])


class ELFImage:
    """File-backed native ELF ranges; no dependencies or game execution."""
    def __init__(self, path: Path):
        self.data = path.read_bytes()
        if self.data[:6] != b"\x7fELF\x02\x01" or struct.unpack_from("<HH", self.data, 16) != (2, 62):
            raise ValueError("Expected the native x86-64 Linux ET_EXEC game")
        phoff = struct.unpack_from("<Q", self.data, 32)[0]
        phsize, phcount = struct.unpack_from("<HH", self.data, 54)
        self.ranges = []
        self.build_id = ""
        for index in range(phcount):
            kind, flags, offset, va, _, size, _, _ = struct.unpack_from(
                "<IIQQQQQQ", self.data, phoff + index * phsize)
            if kind == 1:
                self.ranges.append((va, offset, size, flags))
            if kind == 4:
                cursor = offset
                while cursor + 12 <= offset + size:
                    namesz, descsz, note = struct.unpack_from("<III", self.data, cursor)
                    cursor += 12
                    name = self.data[cursor:cursor + namesz]
                    cursor += (namesz + 3) & ~3
                    desc = self.data[cursor:cursor + descsz]
                    cursor += (descsz + 3) & ~3
                    if note == 3 and name == b"GNU\0":
                        self.build_id = desc.hex()
        if self.build_id != "bcc6789e6fb477b785a2b02be80b8b1b054ff88c":
            raise ValueError("Unsupported native Linux history ABI: " + self.build_id)

    def read(self, va: int, size: int) -> bytes:
        for start, offset, count, _ in self.ranges:
            if start <= va and va + size <= start + count:
                return self.data[offset + va - start:offset + va - start + size]
        raise ValueError(f"ELF address is not file-backed: {va:#x}")

    def pointer(self, va: int) -> int:
        return struct.unpack("<Q", self.read(va, 8))[0]

    def references(self, value: int):
        needle = struct.pack("<Q", value)
        for start, offset, count, flags in self.ranges:
            if flags & 1:
                continue
            cursor = offset
            while (cursor := self.data.find(needle, cursor, offset + count)) != -1:
                if cursor % 8 == 0:
                    yield start + cursor - offset
                cursor += 8


def read_elf_profiles(image: ELFImage) -> list[tuple]:
    profiles = []
    for start, offset, count, flags in image.ranges:
        if flags != 4:
            continue
        for match in re.finditer(rb"[0-9]+history_event_([a-z0-9_]+)st\0",
                                 image.data[offset:offset + count]):
            name_address = start + match.start()
            name = match.group(1).decode("ascii")
            if name == "masterpiece_created" or name == "collection" or name.startswith("collection_"):
                continue  # Abstract base and the separate collection hierarchy.
            for name_ref in image.references(name_address):
                typeinfo = name_ref - 8
                for type_ref in image.references(typeinfo):
                    vtable = type_ref + 8
                    get_type = image.pointer(vtable)
                    if not 0x421000 <= get_type < 0x2099000:
                        continue  # Relocations and derived RTTI are not vtables.
                    code = image.read(get_type, 16)
                    prefix = 4 if code.startswith(b"\xf3\x0f\x1e\xfa") else 0
                    tail = code[prefix:]
                    if tail[0] == 0xB8 and tail[5] == 0xC3:
                        native_type = struct.unpack_from("<i", tail, 1)[0]
                        code = code[:prefix + 6]
                    elif tail[:3] in (b"\x31\xc0\xc3", b"\x33\xc0\xc3"):
                        native_type = 0
                        code = code[:prefix + 3]
                    else:
                        raise ValueError(f"Nonconstant ELF getType for {name}: {code.hex()}")
                    sentence = image.pointer(vtable + 0xD0)
                    if not 0x421000 <= sentence < 0x2099000:
                        raise ValueError(f"Invalid ELF sentence slot for {name}")
                    profiles.append((vtable, get_type, sentence, native_type, code, name))
    if len(profiles) != EXPECTED_EVENT_COUNT or {p[3] for p in profiles} != set(range(EXPECTED_EVENT_COUNT)):
        raise ValueError(f"Incomplete ELF event identities: {len(profiles)}")
    return sorted(profiles)


def render_elf(image: ELFImage, profiles: list[tuple]) -> str:
    return render_bindings(profiles, [
        "// Generated by tools/build_history_event_profiles.py from the native Linux ELF.",
        f"// Build ID: {image.build_id}; SHA-256: {hashlib.sha256(image.data).hexdigest()}",
    ], anchor=0x400000)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--exe", type=Path, default=WORKSPACE.parent /
                        ("Dwarf Fortress.exe" if sys.platform == "win32" else "dwarfort"))
    parser.add_argument("--layouts", type=Path,
                        default=WORKSPACE / "data/extracted/native-history-event-layouts.tsv")
    parser.add_argument("--output", type=Path,
                        default=WORKSPACE / "src" / ("native_history_event_profiles.inc"
                        if sys.platform == "win32" else "native_history_event_profiles_elf.inc"))
    args = parser.parse_args()
    if args.exe.read_bytes()[:4] == b"\x7fELF":
        image = ELFImage(args.exe)
        profiles = read_elf_profiles(image)
        output = render_elf(image, profiles)
    else:
        image = PEImage(args.exe)
        profiles = read_profiles(image, args.layouts)
        output = render(image, profiles)
    args.output.write_text(output, encoding="utf-8", newline="\n")
    print(f"Generated {len(profiles)} native event identity profiles: {args.output}")


if __name__ == "__main__":
    main()
