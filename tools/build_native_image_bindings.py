#!/usr/bin/env python3
"""Extract address-only bindings between native ELF editions of the same game.

Reads ELF files, unwind boundaries and objdump output; never launches the game.
Function bodies require equal size and identical instruction/operand shapes.
Callable entries may also be established by agreeing callers and an unchanged
ABI prologue; this never admits offsets inside a differently compiled body.
Changed relative addresses are recorded as expected-byte relocations, not ignored.
"""

from __future__ import annotations

import argparse
import bisect
import difflib
import hashlib
from pathlib import Path
import re
import struct
import subprocess
import xml.etree.ElementTree as ET


ROOT = Path(__file__).resolve().parents[1]


class Image:
    def __init__(self, path: Path):
        self.path = path.resolve()
        self.data = self.path.read_bytes()
        if self.data[:6] != b"\x7fELF\x02\x01":
            raise ValueError(f"Expected a native little-endian ELF64 image: {path}")
        if struct.unpack_from("<H", self.data, 18)[0] != 62:
            raise ValueError(f"Expected x86-64: {path}")
        phoff = struct.unpack_from("<Q", self.data, 32)[0]
        phsize, phcount = struct.unpack_from("<HH", self.data, 54)
        self.segments = []
        for i in range(phcount):
            kind, flags, offset, va, _, size, memory, _ = struct.unpack_from(
                "<IIQQQQQQ", self.data, phoff + phsize * i)
            if kind == 1:
                self.segments.append((va, va + memory, offset, size, flags))
        notes = subprocess.check_output(["readelf", "-n", str(self.path)], text=True)
        self.build = re.search(r"Build ID: ([0-9a-f]+)", notes)[1]
        frames = subprocess.check_output(["readelf", "-wf", str(self.path)], text=True)
        self.functions = sorted((int(a, 16), int(b, 16)) for a, b in re.findall(
            r" FDE .* pc=([0-9a-f]+)\.\.([0-9a-f]+)", frames))
        self.starts = [a for a, _ in self.functions]
        self.instructions: dict[int, list[tuple[int, bytes, str]]] = {}
        self.data_references: dict[int, int] = {}
        self.call_references: dict[int, int] = {}

    def read(self, va: int, length: int) -> bytes:
        for begin, end, offset, size, _ in self.segments:
            if begin <= va and va + length <= min(end, begin + size):
                return self.data[offset + va - begin:offset + va - begin + length]
        raise ValueError(f"No file-backed bytes at {va:#x} + {length:#x}")

    def disassemble(self):
        line_pattern = re.compile(r"^\s*([0-9a-f]+):\s*\t([0-9a-f ]+)\t(.*)$")
        process = subprocess.Popen(["objdump", "-d", "-w", "-M", "intel", str(self.path)],
                                   stdout=subprocess.PIPE, text=True)
        assert process.stdout is not None
        try:
            for line in process.stdout:
                match = line_pattern.match(line)
                if not match:
                    continue
                va = int(match[1], 16)
                index = bisect.bisect_right(self.starts, va) - 1
                if index < 0 or va >= self.functions[index][1]:
                    continue
                begin, end = self.functions[index]
                code = bytes.fromhex(match[2])
                if va + len(code) > end:
                    continue
                reference = re.search(r"\[rip[+-]0x[0-9a-f]+\].*#\s*([0-9a-f]+)", match[3])
                if reference:
                    self.data_references[va] = int(reference[1], 16)
                assembly = match[3].split("#", 1)[0]
                assembly = re.sub(r"\s*<[^>]*>", "", assembly).strip()
                # Keep register operands, field displacements, immediate
                # values, instruction lengths and all internal control flow.
                assembly = re.sub(r"\[rip[+-]0x[0-9a-f]+\]", "[rip+address]", assembly)
                branch = re.match(r"((?:bnd\s+)?(?:call|j\w+)\s+)([0-9a-f]+)$", assembly)
                if branch:
                    target = int(branch[2], 16)
                    if branch[1].strip() == "call":
                        self.call_references[va] = target
                    operand = f"local:{target - begin:x}" if begin <= target < end else "address"
                    assembly = branch[1] + operand
                self.instructions.setdefault(begin, []).append((va, code, assembly))
        finally:
            process.stdout.close()
        if process.wait() != 0:
            raise RuntimeError(f"objdump failed: {self.path}")


def symbol_pairs(reference: Image, image: Image, symbols: Path):
    root = ET.parse(symbols).getroot()
    tables = []
    for binary in (reference, image):
        md5 = hashlib.md5(binary.data).hexdigest()
        selected = [table for table in root.iter("symbol-table")
                    if any(node.get("value") == md5 for node in table.findall("md5-hash"))]
        candidates = [{(node.tag, node.get("name")): int(node.get("value"), 16)
                       for node in table
                       if node.tag in ("global-address", "vtable-address") and node.get("value")}
                      for table in selected]
        if not candidates or any(table != candidates[0] for table in candidates[1:]):
            raise ValueError(f"No unambiguous reviewed symbol table for {binary.path} ({md5})")
        tables.append(candidates[0])
    a, b = tables
    pairs = sorted(set((address, b[name]) for name, address in a.items() if name in b))
    result = []
    for i, (start, target) in enumerate(pairs):
        if start < 0x2000000:  # Code is established from unwind/assembly instead.
            continue
        segment = next((s for s in reference.segments if s[0] <= start < s[1]), None)
        native_segment = next((s for s in image.segments if s[0] <= target < s[1]), None)
        if not segment or not native_segment:
            continue
        end = min(segment[1], pairs[i + 1][0] if i + 1 < len(pairs) else segment[1])
        length = end - start
        if i + 1 < len(pairs) and pairs[i + 1][1] - target != length:
            # Do not infer an object's extent across an edition-specific gap.
            length = 1
        if length > 0 and target + length <= native_segment[1]:
            result.append((start, start + length, target))
    return result


def generate(reference: Image, image: Image, symbols: Path, output: Path):
    # Address ranges serve every native snapshot. Relocated expected bytes
    # are needed only for the explicit hook signatures, not the entire game.
    profiles = [*sorted((ROOT / "src").glob("native_*search_profile.inc")),
                ROOT / "src/native_history_profile_elf.inc"]
    source_text = "\n".join(path.read_text() for path in profiles)
    signature_lengths = {}
    for address, byte_list in re.findall(
            r"\{(0x[0-9a-f]+),\s*\{((?:\s*0x[0-9a-f]{1,2}\s*,?)+)\}\}", source_text):
        length = len(re.findall(r"0x[0-9a-f]+", byte_list))
        for origin in (0, 0x400000):
            va = int(address, 16) + origin
            signature_lengths[va] = max(length, signature_lengths.get(va, 0))
    coordinates = {int(value, 16) for value in re.findall(r"\b0x([0-9a-fA-F]+)\b", source_text)
                   if 0x20000 <= int(value, 16) < 0x3000000}
    windows = sorted({coordinate + origin for coordinate in coordinates for origin in (0, 0x400000)})
    for binary in (reference, image):
        print(f"Reading instruction bindings: {binary.path}", flush=True)
        binary.disassemble()
    a, b = reference.functions, image.functions
    ordered = difflib.SequenceMatcher(None, [y - x for x, y in a],
                                     [y - x for x, y in b], autojunk=False)
    ranges = []
    changes = []
    rejected = []
    data_pairs: dict[int, set[int]] = {}
    call_pairs: dict[int, dict[int, set[int]]] = {}
    for block in ordered.get_matching_blocks():
        for i in range(block.size):
            begin, end = a[block.a + i]
            target, target_end = b[block.b + i]
            left, right = reference.instructions.get(begin, []), image.instructions.get(target, [])
            if (not left or len(left) != len(right) or
                any((x - begin, len(raw), asm) != (y - target, len(other), native_asm)
                    for (x, raw, asm), (y, other, native_asm) in zip(left, right)) or
                sum(len(raw) for _, raw, _ in left) != end - begin):
                rejected.append((begin, target))
                continue
            ranges.append((begin, end, target))
            for (address, _, _), (native_address, _, _) in zip(left, right):
                data = reference.data_references.get(address)
                native_data = image.data_references.get(native_address)
                if data is not None and native_data is not None:
                    data_pairs.setdefault(data, set()).add(native_data)
                callee = reference.call_references.get(address)
                native_callee = image.call_references.get(native_address)
                if callee is not None and native_callee is not None:
                    call_pairs.setdefault(callee, {}).setdefault(native_callee, set()).add(begin)
            # A routine descriptor may express later fragments relative to
            # its entry. Retain relocations for the entire referenced FDE,
            # rather than assuming every fragment has an absolute literal.
            at = bisect.bisect_left(windows, begin)
            if at == len(windows) or windows[at] >= end:
                continue
            source = reference.read(begin, end - begin)
            native = image.read(target, target_end - target)
            changes.extend((begin + j, x, y) for j, (x, y) in enumerate(zip(source, native))
                           if x != y)
    ranges += symbol_pairs(reference, image, symbols)
    ranges.sort()
    changes.sort()
    starts = [begin for begin, _, _ in ranges]
    def bound_address(address):
        at = bisect.bisect_right(starts, address) - 1
        if at >= 0 and address < ranges[at][1]:
            begin, _, target = ranges[at]
            return target + address - begin
        return None
    # Different editions can compile the same name producer's body at a
    # different size. Its entry remains usable by the shared ABI when at
    # least two independently matched callers agree on the exact FDE entry
    # and the complete declared prologue is unchanged. Bind ONLY that entry;
    # no internal hook site inherits an assumed constant displacement.
    entries = []
    reverse_calls: dict[int, set[int]] = {}
    for address, targets in call_pairs.items():
        for target in targets:
            reverse_calls.setdefault(target, set()).add(address)
    reference_entries, native_entries = set(reference.starts), set(image.starts)
    for address in windows:
        if bound_address(address) is not None or address not in reference_entries:
            continue
        targets = call_pairs.get(address, {})
        if len(targets) != 1:
            continue
        target, callers = next(iter(targets.items()))
        if (target not in native_entries or len(callers) < 2 or
                reverse_calls[target] != {address}):
            continue
        length = max(32, signature_lengths.get(address, 0))
        left, right = reference.instructions.get(address, []), image.instructions.get(target, [])
        covered = 0
        for (va, raw, asm), (native_va, native_raw, native_asm) in zip(left, right):
            if (va - address, raw, asm) != (native_va - target, native_raw, native_asm):
                break
            covered += len(raw)
            if covered >= length:
                entries.append((address, address + 1, target))
                print(f"Callable entry: {address:#x} -> {target:#x}; "
                      f"{len(callers)} agreeing callers, {covered} unchanged prologue bytes", flush=True)
                break
    literals = []
    for address in windows:
        segment = next((s for s in reference.segments if s[0] <= address < s[1]), None)
        if not segment or segment[4] & 3 or bound_address(address) is not None:
            continue
        targets = data_pairs.get(address, set())
        if len(targets) != 1:
            continue
        target = next(iter(targets))
        length = signature_lengths.get(address, 1)
        source, native = reference.read(address, length), image.read(target, length)
        if source != native:
            # Read-only jump tables contain rel32 entries relative to the
            # table itself. Prove every destination against the same code
            # bindings before admitting changed table bytes.
            if length % 4 or any(
                bound_address(address + struct.unpack_from("<i", source, i)[0]) !=
                target + struct.unpack_from("<i", native, i)[0]
                for i in range(0, length, 4)):
                continue
            changes.extend((address + i, x, y) for i, (x, y) in enumerate(zip(source, native)) if x != y)
        # Only the referenced point is needed for address lookup. Expected
        # byte spans are checked independently; adjacent string literals may
        # each have their own native instruction references.
        literals.append((address, address + 1, target))
    ranges += entries + literals
    changes.sort()
    # PLT entries carry stable imported symbol identities, independent of
    # edition-specific Steam imports and the resulting PLT displacement.
    def plt(binary):
        text = subprocess.check_output(["objdump", "-d", "-j", ".plt.sec", str(binary.path)], text=True)
        return {name: int(address, 16) for address, name in re.findall(
            r"^([0-9a-f]+) <(.+@plt)>:", text, re.MULTILINE)}
    lp, rp = plt(reference), plt(image)
    ranges += [(va, va + 16, rp[name]) for name, va in lp.items() if name in rp]
    ranges.sort()
    for previous, current in zip(ranges, ranges[1:]):
        if previous[1] > current[0]:
            raise ValueError(f"Overlapping bindings: {previous!r}, {current!r}")
    lines = ["// Generated by tools/build_native_image_bindings.py; address/byte data only.",
             f"// Reference: {reference.build}; SHA-256: {hashlib.sha256(reference.data).hexdigest()}",
             f"// Native: {image.build}; SHA-256: {hashlib.sha256(image.data).hexdigest()}",
             "static constexpr NativeImageRange native_elf_edition_ranges[]{"]
    lines += [f"    {{0x{x:x}, 0x{y:x}, 0x{z:x}}}," for x, y, z in ranges]
    lines += ["};", "static constexpr NativeImageByte native_elf_edition_bytes[]{"]
    lines += [f"    {{0x{x:x}, 0x{y:02x}, 0x{z:02x}}}," for x, y, z in changes]
    lines += ["};", ""]
    output.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {output}: {len(ranges)} address ranges, {len(changes)} relocated bytes; "
          f"{len(rejected)} unequal instruction shapes excluded", flush=True)
    for begin, target in rejected[:30]:
        print(f"Unbound instruction shape: {begin:#x} -> {target:#x}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--reference", type=Path, required=True)
    parser.add_argument("--image", type=Path, required=True)
    parser.add_argument("--symbols", type=Path, default=ROOT / "data/upstream/df-structures/symbols.xml")
    parser.add_argument("--output", type=Path, default=ROOT / "src/native_elf_build_bindings.inc")
    args = parser.parse_args()
    generate(Image(args.reference), Image(args.image), args.symbols, args.output)


if __name__ == "__main__":
    main()
