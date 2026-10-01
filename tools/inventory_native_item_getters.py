#!/usr/bin/env python3
"""Inspect native PE item getter contracts without running the game."""
from pathlib import Path
import re
import struct

raw = (Path(__file__).resolve().parents[2] / "Dwarf Fortress.exe").read_bytes()
pe = struct.unpack_from("<I", raw, 0x3c)[0]
count = struct.unpack_from("<H", raw, pe + 6)[0]
optional = struct.unpack_from("<H", raw, pe + 20)[0]
base = struct.unpack_from("<Q", raw, pe + 48)[0]
sections = [struct.unpack_from("<IIII", raw, pe + 24 + optional + 40 * i + 8)
            for i in range(count)]

def rva(offset):
    for size, address, disk_size, disk in sections:
        if disk <= offset < disk + disk_size:
            return offset - disk + address
    raise ValueError(offset)

def disk(address):
    for size, start, disk_size, offset in sections:
        if start <= address < start + disk_size:
            return address - start + offset
    raise ValueError(address)

def occurrences(value):
    at = 0
    while (at := raw.find(value, at)) >= 0:
        yield at
        at += 1

slots = [0, 8, 0x10, 0x18, 0x478, 0x508, 0x590, 0x1e8, 0x1d8, 0x5a8]
contracts = {}
for match in re.finditer(rb"\.\?AVitem_[^\0]*st@@\0", raw):
    name = match.group()[:-1].decode("ascii")
    td = rva(match.start()) - 16
    for hit in occurrences(struct.pack("<I", td)):
        if hit < 12:
            continue
        col = hit - 12
        sig, offset, cd, type_id, hierarchy, self_id = struct.unpack_from("<6I", raw, col)
        if (sig, offset, cd, self_id) != (1, 0, 0, rva(col)):
            continue
        for pointer in occurrences(struct.pack("<Q", base + rva(col))):
            vtable = rva(pointer) + 8
            for slot in slots:
                fn = struct.unpack_from("<Q", raw, disk(vtable + slot))[0] - base
                code = raw[disk(fn):disk(fn) + 20]
                contracts.setdefault((slot, fn, code), []).append(name)
for (slot, fn, code), names in sorted(contracts.items()):
    print(f"{slot:#x}\t{fn:#x}\t{code.hex(' ')}\t{','.join(names)}")
