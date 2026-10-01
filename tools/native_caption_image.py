"""Native binary adapter for read-only caption source inventories.

Only image layout and unwind metadata differ here. Caption extraction uses the
same disassembler, instruction walk and string rules for every image format.
This module never loads the image, attaches to a process or runs translations.
"""
from __future__ import annotations

from pathlib import Path
import re
import shutil
import struct
import subprocess

from extract_workshop_tooltip_catalog import NativeELF, NativePE


class CaptionImage:
    def __init__(self, path: Path, objdump: str | None = None):
        self.path = path.resolve()
        self.objdump = objdump or shutil.which("objdump")
        if not self.objdump:
            raise ValueError("Native objdump is required; supply its full path")
        magic = self.path.read_bytes()[:4]
        self.image = NativeELF(self.path) if magic == b"\x7fELF" else NativePE(self.path)
        self.raw = self.image.raw
        if isinstance(self.image, NativeELF):
            self.base = 0
            self.regions = [(v, d, s) for _, d, v, s in self.image.segments]
            notes = subprocess.check_output(["readelf", "-n", str(self.path)], text=True)
            self.identity = "ELF:" + re.search(r"Build ID: (\w+)", notes)[1]
            frames = subprocess.check_output(
                ["readelf", "--debug-dump=frames", str(self.path)], text=True)
            self.functions = {int(a, 16): int(b, 16) for a, b in
                              re.findall(r"pc=([0-9a-f]+)\.\.([0-9a-f]+)", frames)}
        else:
            self.base = self.image.base
            self.regions = [(self.base + v, d, s) for _, _, v, s, d in self.image.sections]
            pe = struct.unpack_from("<I", self.raw, 0x3c)[0]
            timestamp = struct.unpack_from("<I", self.raw, pe + 8)[0]
            image_size = struct.unpack_from("<I", self.raw, pe + 24 + 56)[0]
            self.identity = f"PE:{timestamp:08x}:{image_size:08x}"
            unwind, size = struct.unpack_from("<II", self.raw, pe + 24 + 112 + 3 * 8)
            at = self.offset(self.base + unwind)
            self.functions = {self.base + a: self.base + b for a, b, _ in
                              struct.iter_unpack("<III", self.raw[at:at + size])}

    def offset(self, address: int) -> int:
        for v, d, s in self.regions:
            if v <= address < v + s:
                return d + address - v
        raise ValueError(f"Unmapped address {address:#x}")

    def address(self, offset: int) -> int:
        for v, d, s in self.regions:
            if d <= offset < d + s:
                return v + offset - d
        raise ValueError(f"Unmapped file offset {offset:#x}")

    def uint64(self, address: int) -> int:
        return struct.unpack_from("<Q", self.raw, self.offset(address))[0]

    def string(self, address: int) -> str | None:
        try:
            at = self.offset(address)
        except ValueError:
            return None
        end = self.raw.find(b"\0", at, at + 4096)
        if end <= at or any(c < 32 or c > 126 for c in self.raw[at:end]):
            return None
        return self.raw[at:end].decode("ascii")

    def instructions(self, start: int, end: int | None = None):
        end = end or self.functions[start]
        output = subprocess.check_output([
            self.objdump, "-d", "-M", "intel", "--no-show-raw-insn",
            f"--start-address={start:#x}", f"--stop-address={end:#x}", str(self.path),
        ], text=True)
        for line in output.splitlines():
            match = re.match(r"\s*([0-9a-f]+):\s+(.*)", line)
            if match:
                yield int(match[1], 16), re.sub(r" <[^>]*>", "", match[2])

    def literal_refs(self, start: int, end: int | None = None):
        for address, instruction in self.instructions(start, end):
            match = re.search(r"\blea\s+\w+,\[rip[^]]*\].*# (?:0x)?([0-9a-f]+)", instruction)
            if not match:
                continue
            target = int(match[1], 16)
            value = self.string(target)
            if value and not value.startswith("basic_string::"):
                yield address, target, value


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("exe", type=Path)
    parser.add_argument("start", type=lambda v: int(v, 0))
    parser.add_argument("end", nargs="?", type=lambda v: int(v, 0))
    parser.add_argument("--objdump")
    args = parser.parse_args()
    image = CaptionImage(args.exe, args.objdump)
    for address, instruction in image.instructions(args.start, args.end):
        match = re.search(r"# (?:0x)?([0-9a-f]+)", instruction)
        value = image.string(int(match[1], 16)) if match else None
        print(f"{address:#x}: {instruction}" + (f"  {value!r}" if value else ""))
