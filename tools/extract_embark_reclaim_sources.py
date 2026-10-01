#!/usr/bin/env python3
"""Extract the installed Windows reclaim selector's native text sources.

This is offline disassembly/source extraction, not a translator, generator for
runtime data, test, or execution of game code. The output preserves the native
selector, every reachable event formatter, their site predicates, and shared
date/name producers with all instructions and resolved literal operands.

DF 53.16 Windows selection, decoded from 0x141054010..0x14105419b:
    site = world_data.reclaim_site_ids[screen.selected_index]
    newest = oldest = null
    for event in reverse(world.history.events):
        if event.getType() in native_switch and event.involves_site(site.id):
            if newest is null: newest = event
            oldest = event
    if newest == oldest: newest = null
    screen[0x330], screen[0x338] = newest, oldest
The switch is read below from its real two-level jump table, not a guessed list.
The renderer calls paragraph vtable slot +0xd0 (context initialized by 0x140072080,
r9=true, fifth argument=false), oldest first and then newest, with one blank
separator. Native wrapped string pointers remain in screen+0x318. Only rows
0..11 of that vector are drawn, at y=24..35; the complete retained text is still
available independently of the visible clipping. Row width is 34 cells.

Proper names, figures and numbers are dynamic data, not a finite set of English
sentences. Their shared native producer bodies are retained as source boundaries
alongside all finite sentence branches. The translation uses native event
fields/name resolvers rather than enumerating possible generated world names.
"""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path
import re
import struct
import subprocess
import sys

from extract_legends_catalog import NativeImage


OBJDUMP = Path(r"C:\Users\WIN11\AppData\Local\Programs\dfcn-toolchains\w64devkit-2.9.1\w64devkit\bin\objdump.exe")
WORKSPACE = Path(__file__).resolve().parent.parent

# These describe the native branches, with field names matching the existing
# native_history_fields / history_semantics definitions. They are navigation
# notes for the disassembly emitted below, not translation matching rules.
BRANCHES = {
    1: "attacker; unless flags&1: defeated defender [of defender_civ when different] and; destroyed site",
    2: "builder_hf when present, otherwise site_civ [of civ] or civ; site_type 10/subtype1: created, site_type10/other or8: constructed, otherwise founded; optional for resident_civ",
    23: "site_civ when present [of civ when civ!=-1], otherwise civ; flags&1: were taken by a mood to act against their better judgment at; otherwise launched an expedition to reclaim; site",
    24: "attacker_hf routed site_civ [of civ when different] and destroyed site",
    25: "flags&1: site_civ abandoned the settlement of site; otherwise site_civ and [their when civ==site_civ, otherwise civ] settlement of site withered",
    26: "site_civ of civ at the settlement of site; flags&1: regained their senses after an initial period of questionable judgment; otherwise after another period",
    47: "attacker; unless flags&1: defeated defender [of defender_civ when different] and; flags4/8 choose treasure+livestock,treasure,livestock,or plain raid; flags16 chooses stole/raided versus looted/seized/pillaged",
    48: "attacker defeated defender [of defender_civ when different]; nonempty leaders: and placed leader list [one,two,comma-separated,and others when contextual figure is in list] in charge of site; empty leaders: at site; optional second sentence The new government was called new_government",
    49: "one-time: demanded [and received unless failure] treasure from defender; recurring: tried to secure/secured tribute from defender; optional of defender_civ; failure suffix but they had nothing left to give; success recurring suffix to be delivered from site every Spring/Summer/Autumn/Winter; success one-time suffix in site",
    50: "attacker defeated defender [of defender_civ when different] and took over site; optional second sentence The new government was called new_government",
    110: "site_civ [of civ when different] surrendered site to attacker",
}


def native_functions(image: NativeImage):
    layouts = WORKSPACE / "data/extracted/native-history-event-layouts.tsv"
    for line in layouts.read_text(encoding="utf-8-sig").splitlines():
        if not line or line.startswith("#"):
            continue
        name, vtable, _, _ = line.split("\t")
        vtable = int(vtable, 16)
        at = image.offset(vtable - image.base)
        get_type = struct.unpack_from("<Q", image.raw, at)[0]
        code = image.raw[image.offset(get_type - image.base):][:6]
        if code[:1] != b"\xb8" or code[5:] != b"\xc3":
            continue
        event_type = struct.unpack_from("<I", code, 1)[0]
        predicate = struct.unpack_from("<Q", image.raw, at + 0x90)[0]
        formatter = struct.unpack_from("<Q", image.raw, at + 0xD0)[0]
        yield event_type, name.removeprefix(".?AVhistory_event_").removesuffix("st@@"), vtable, predicate, formatter


def function_end(image: NativeImage, start: int, path: Path, objdump: Path) -> int:
    rva = start - image.base
    owner = image.function_owners.get(rva, rva)
    if owner in image.function_ends:
        return image.base + image.function_ends[owner]
    # Reviewed leaf context/predicate methods have no unwind record. Follow
    # their instruction branches so neither an immediate 0xc3 nor an earlier
    # successful return hides a later fallback return (inhabited-site lookup).
    instructions = list(disassemble(path, objdump, start, start + 0x400))
    decoded = {address: (opcode, operands, instructions[index + 1][0])
               for index, (address, opcode, operands) in enumerate(instructions[:-1])}
    pending, reached = [start], set()
    while pending:
        address = pending.pop()
        if address in reached or address not in decoded:
            continue
        reached.add(address)
        opcode, operands, following = decoded[address]
        if opcode.startswith("j"):
            target = re.match(r"0x([0-9a-f]+)$", operands)
            if target:
                pending.append(int(target[1], 16))
        if opcode not in ("ret", "jmp", "int3"):
            pending.append(following)
    if not reached:
        raise ValueError(f"No source function boundary at {start:#x}")
    return max(decoded[address][2] for address in reached)


def disassemble(image: Path, objdump: Path, start: int, end: int):
    native = subprocess.check_output([
        str(objdump), "-d", "-M", "intel", "--no-show-raw-insn",
        f"--start-address={start:#x}", f"--stop-address={end:#x}", str(image),
    ], text=True)
    for line in native.splitlines():
        parsed = re.match(r"\s*([0-9a-f]+):\s+(\w+)\s*(.*?)\s*$", line)
        if parsed:
            address, opcode, operands = parsed.groups()
            yield int(address, 16), opcode, operands


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("image", type=Path)
    parser.add_argument("--objdump", type=Path, default=OBJDUMP)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    image = NativeImage(args.image)
    # dec(getType), unsigned bound 0x6d; 110 byte selectors index two RVA targets.
    branches = struct.unpack_from("<II", image.raw, image.offset(0x1055FD8))
    table = image.raw[image.offset(0x1055FE0):image.offset(0x1055FE0) + 0x6E]
    selected = {index + 1 for index, branch in enumerate(table)
                if branches[branch] == 0x1054144}
    output = args.output.open("w", encoding="utf-8", newline="") if args.output else sys.stdout
    try:
        for line in (__doc__ or "").splitlines():
            output.write("# " + line + "\n")
        output.write("# Native switch event IDs: " + ",".join(map(str, sorted(selected))) + "\n")
        writer = csv.writer(output, delimiter="\t", lineterminator="\n")
        writer.writerow(("group", "event_type", "native_name", "producer_va", "instruction_va", "kind", "target", "source"))
        spans = [
            ("panel", "", "select_earliest_latest", 0x141054010, 0x14105419B),
            ("panel", "", "reclaim_list_and_retained_history", 0x141050FDC, 0x141051A5B),
        ]
        for event_type, name, vtable, predicate, formatter in native_functions(image):
            if event_type not in selected:
                continue
            writer.writerow(("event", event_type, name, hex(formatter), "", "vtable", hex(vtable), "+0x90 involves_site; +0xd0 paragraph"))
            writer.writerow(("event", event_type, name, hex(formatter), "", "native_branches", "", BRANCHES.get(event_type, "")))
            spans.append(("event", event_type, name, formatter, function_end(image, formatter, args.image, args.objdump)))
            spans.append(("predicate", event_type, name, predicate, function_end(image, predicate, args.image, args.objdump)))
        for name, start in (
            ("event_context_defaults", 0x140072080),
            ("event_date", 0x140B92640),
            ("entity_name", 0x140B92900),
            ("historical_figure_name", 0x140B92F10),
            ("site_name", 0x140B93930),
            ("native_site_name_in_list", 0x140A94030),
            ("english_site_gloss_in_list", 0x140A946E0),
            ("site_is_inhabited", 0x1409B4ED0),
            ("wrap_history_paragraph", 0x1408E7310),
        ):
            spans.append(("shared", "", name, start, function_end(image, start, args.image, args.objdump)))
        for group, event_type, name, start, end in spans:
            writer.writerow((group, event_type, name, hex(start), "", "function_span", hex(end), "end-exclusive"))
            for address, opcode, operands in disassemble(args.image, args.objdump, start, end):
                writer.writerow((group, event_type, name, hex(start), hex(address), "instruction", "", opcode + " " + operands))
                reference = re.search(r"#\s*(0x[0-9a-f]+)", operands)
                if opcode == "lea" and reference:
                    target = int(reference[1], 16)
                    value = image.string(target - image.base)
                    if value:
                        writer.writerow((group, event_type, name, hex(start), hex(address), "literal", hex(target), json.dumps(value[1], ensure_ascii=False)))
                # MSVC also writes short strings directly, including date's
                # inline " of "; retain them instead of only scanning .rdata.
                immediate = re.fullmatch(r"(?:BYTE|WORD|DWORD|QWORD) PTR \[[^]]+\],0x([0-9a-f]+)", operands)
                if opcode == "mov" and immediate:
                    width = {"BYTE": 1, "WORD": 2, "DWORD": 4, "QWORD": 8}[operands.split()[0]]
                    number = int(immediate[1], 16)
                    if number < 1 << (8 * width):
                        raw = number.to_bytes(width, "little").rstrip(b"\0")
                        if raw and all(32 <= byte <= 126 for byte in raw):
                            writer.writerow((group, event_type, name, hex(start), hex(address), "inline_literal_candidate", "", json.dumps(raw.decode("ascii"))))
    finally:
        if args.output:
            output.close()


if __name__ == "__main__":
    main()
