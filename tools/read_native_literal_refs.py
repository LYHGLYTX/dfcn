"""Inspect RIP-relative native literal references using PE sections and unwind ranges."""
from pathlib import Path
import struct
import sys

raw = (Path(__file__).resolve().parents[2] / "Dwarf Fortress.exe").read_bytes()
pe = struct.unpack_from("<I", raw, 0x3c)[0]
count = struct.unpack_from("<H", raw, pe + 6)[0]
opt_size = struct.unpack_from("<H", raw, pe + 20)[0]
opt = pe + 24
base = struct.unpack_from("<Q", raw, opt + 24)[0]
sections = [struct.unpack_from("<8sIIII", raw, opt + opt_size + i * 40) for i in range(count)]
def rva(at):
    return next(start + at - disk for _, _, start, size, disk in sections if disk <= at < disk + size)
def offset(at):
    return next(disk + at - start for _, _, start, size, disk in sections if start <= at < start + size)
unwind, unwind_size = struct.unpack_from("<II", raw, opt + 112 + 3 * 8)
functions = list(struct.iter_unpack("<III", raw[offset(unwind):offset(unwind) + unwind_size]))
targets = {}
for literal in sys.argv[1:]:
    needle = literal.encode("ascii")
    at = -1
    while (at := raw.find(needle, at + 1)) >= 0:
        targets[rva(at)] = raw[at:raw.find(b"\0", at)].decode("ascii", errors="replace")
text = next(s for s in sections if s[0].rstrip(b"\0") == b".text")
_, _, start, size, disk = text
for at in range(disk, disk + size - 7):
    if raw[at] not in (0x48, 0x4c) or raw[at + 1] not in (0x8d, 0x8b) or raw[at + 2] & 0xc7 != 5:
        continue
    address = start + at - disk
    target = address + 7 + struct.unpack_from("<i", raw, at + 3)[0]
    if target in targets:
        bounds = next(((a, b) for a, b, _ in functions if a <= address < b), None)
        print(repr(targets[target]), hex(base + address), tuple(hex(base + x) for x in bounds) if bounds else None)
