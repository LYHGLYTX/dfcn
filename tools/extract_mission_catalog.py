#!/usr/bin/env python3
"""Extract the native art-image history call graph and literal source catalogue.

This is offline reverse engineering of the installed PE. It does not invoke a
game function, translator, generator or test. Every concrete event subject
formatter and collection title formatter is read from its actual vtable. Direct
callee bodies are followed transitively; virtual/imported calls remain explicit
edges rather than being guessed from nearby strings. Output is source evidence,
not a coverage or game-display result.
"""
from __future__ import annotations

import argparse
import bisect
from collections import Counter, deque
import csv
import hashlib
from pathlib import Path
import re
import struct
import subprocess

from extract_legends_catalog import NativeImage


# These reviewed MSVC string operations append/copy their argument unchanged.
# Runtime allocation/error support is not a source of artwork vocabulary.
TERMINALS = {
    0x6F850: "std::string destruction",
    0x6F8D0: "std::string assign; text supplied by caller",
    0x6FA10: "std::string append; text supplied by caller",
    0x1539660: "security cookie support",
    0x1539680: "deallocation support",
}
INSTRUCTION = re.compile(r"^\s*([0-9a-f]+):\s+(?:[0-9a-f]{2}\s+)+\s*([a-z][a-z0-9]*)\s*(.*)$")
DIRECT = re.compile(r"^0x([0-9a-f]+)(?:\s|$)")
REFERENCE = re.compile(r"#\s*0x([0-9a-f]+)")
TABLE_LOAD = re.compile(r"DWORD PTR \[[^\]]+\*4\+(0x[0-9a-f]+)\]")
BYTE_TABLE = re.compile(r"BYTE PTR \[[^\]]+\*1\+(0x[0-9a-f]+)\]")
BOUND = re.compile(r",(0x[0-9a-f]+)$")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("image", type=Path)
    parser.add_argument("--objdump", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[1]
    image = NativeImage(args.image)
    base = image.base
    text_section = next(section for section in image.sections if section[0] == ".text")
    text_start, text_end = text_section[1], text_section[1] + text_section[2]

    def c_string(rva: int) -> str:
        offset = image.offset(rva)
        end = image.raw.index(b"\0", offset)
        return image.raw[offset:end].decode("ascii")

    pe = struct.unpack_from("<I", image.raw, 0x3C)[0]
    imports_rva = struct.unpack_from("<I", image.raw, pe + 24 + 112 + 8)[0]
    imports = {}
    for index in range(4096):
        original, _, _, name, first = struct.unpack_from("<IIIII", image.raw,
                                                        image.offset(imports_rva + index * 20))
        if not any((original, name, first)):
            break
        dll = c_string(name)
        for slot in range(65536):
            thunk = struct.unpack_from("<Q", image.raw, image.offset((original or first) + slot * 8))[0]
            if not thunk:
                break
            symbol = f"ordinal {thunk & 0xffff}" if thunk >> 63 else c_string(thunk + 2)
            imports[first + slot * 8] = dll + "!" + symbol

    def indirect_source(function: int, address: int, operands: str) -> tuple[str, str]:
        reference = REFERENCE.search(operands)
        if reference and int(reference[1], 16) - base in imports:
            return "import", imports[int(reference[1], 16) - base]
        if address in (0xB65093, 0xB8C43B, 0xB639CF, 0xB63A22, 0xB8BD3C, 0xD3C11F):
            return "history-event-subject", "virtual +0xd8; all 133 nested event subject root entries"
        if address == 0xB5B576:
            return "history-collection-title", "virtual +0x30; all 18 collection root entries"
        if function in (0xB8B3C0, 0xB73780, 0xB8B080, 0xB70870):
            return "typed-reference-getter", "general_ref type/artifact pointer; src/native_history_items.inc"
        if function == 0xB94400:
            return "artifact-book-identity", "item type/tool-use identity; src/native_history_items.inc and src/legends_books.inc"
        if function in (0xB69D30, 0xB94090, 0xB69280):
            return "abstract-building-kind", "typed building enum; src/native_history_structures.inc"
        if function == 0xB8DDD0:
            return "abstract-building-name", "building language_name pointer; native_history_structures.inc; text goes to a946e0"
        if function == 0xB93A90:
            return "world-construction-kind", "typed construction enum; src/native_history_geography.inc"
        if function in (0xB6D700, 0xB732F0, 0xB6CD90, 0xB70360):
            return "typed-reference-kind", "runtime reference subtype getter; history figure/squad typed fields"
        if function in (0xA82C10, 0xC65450):
            return "item-description-boundary", "item getters/name virtuals; item-info-title-sources.tsv, item-raw-title-sources.tsv, statue-art-sources.tsv and statue-history-sources.tsv and src/native_history_item_hooks.inc"
        if function >= 0x1530000:
            return "runtime-dispatch", "MSVC runtime exception/allocator support; no normal history sentence production"
        if function in (0x1458B0, 0x144890, 0x142CF0, 0x14A9D0, 0x14B080, 0xA4E900, 0x2847E0):
            return "source-storage-dispatch", "native art-image chunk/file-compressor/resource loading; no call executed by this extractor"
        return "unresolved-static-edge", operands

    def pointer(rva: int) -> int:
        return struct.unpack_from("<Q", image.raw, image.offset(rva))[0] - base

    def owner(rva: int) -> int:
        index = bisect.bisect_right(image.starts, rva) - 1
        if index >= 0:
            start, end = image.functions[index]
            if start <= rva < end:
                return image.function_owners[start]
        return rva

    records: list[tuple] = []
    pending = deque()
    roots = []
    def file_rva(offset: int) -> int:
        for _, rva, _, disk, count in image.sections:
            if disk <= offset < disk + count:
                return rva + offset - disk
        raise ValueError(f"RTTI offset outside PE sections: {offset:#x}")

    def occurrences(value: bytes):
        at = 0
        while (at := image.raw.find(value, at)) >= 0:
            yield at
            at += 1

    # Discover the complete concrete root set from the PE's MSVC RTTI, rather
    # than assuming the maintained profile already enumerates every subtype.
    for match in re.finditer(rb"\.\?AVhistory_event[a-z_]*st@@\0", image.raw):
        name = match.group()[:-1].decode("ascii")
        label = name.removeprefix(".?AV").removesuffix("@@")
        descriptor = file_rva(match.start()) - 16
        for hit in occurrences(struct.pack("<I", descriptor)):
            if hit < 12:
                continue
            col = hit - 12
            signature, offset, construction, _, hierarchy, self_id = struct.unpack_from("<6I", image.raw, col)
            if (signature, offset, construction, self_id) != (1, 0, 0, file_rva(col)):
                continue
            for reference in occurrences(struct.pack("<Q", base + self_id)):
                vtable = file_rva(reference) + 8
                get_type = pointer(vtable)
                code_at = image.offset(get_type)
                code = image.raw[code_at:code_at + 6]
                if code[0] == 0xB8 and code[5] == 0xC3:
                    native_type = struct.unpack_from("<i", code, 1)[0]
                elif code[:3] in (b"\x31\xc0\xc3", b"\x33\xc0\xc3"):
                    native_type = 0
                elif code[:4] == b"\x83\xc8\xff\xc3":
                    native_type = -1
                else:
                    raise ValueError(f"Unresolved RTTI root type getter: {label} {get_type:#x} {code.hex()}")
                kind = "collection" if label.startswith("history_event_collection") else "event"
                if native_type < 0:
                    records.append(("abstract_rtti", label, get_type, vtable, descriptor,
                                    f"getType={native_type}; no concrete event production"))
                    continue
                target = pointer(vtable + (0x30 if kind == "collection" else 0xD0))
                records.append(("concrete_rtti", label, get_type, vtable, descriptor,
                                f"{kind} getType={native_type}; COL={self_id:#x}; hierarchy={hierarchy:#x}"))
                roots.append((kind, label, vtable, target))
                if kind == "event":
                    roots.append(("nested-subject", label, vtable, pointer(vtable + 0xD8)))
    for kind, name, vtable, target in roots:
        records.append(("root", name, target, vtable, target,
                        f"{kind}: vtable+{'0xd0' if kind == 'event' else '0xd8' if kind == 'nested-subject' else '0x30'}"))
        pending.append(target)
    records.append(("mission_report_dispatch", "active_mission_report", 0x1D3AC0, 0x1D3CFB, 0,
                    "campaigns +0x404 event IDs, +0x704 count -> event lookup 0x7da30 -> history_event virtual +0xd0; no event-type filter"))
    records.append(("mission_report_wrapper", "active_mission_report", 0x1D3AC0, 0x1D3D38, 0x8E7310,
                    "getSentence output to common native wrap at width 53"))

    # The two finite report-only text ranges are recorded without recursing
    # into the unrelated world-map producer/rendering portions of their owner.
    for label, begin, end, owner_rva in (("report-title", 0x9DF8DC, 0x9DFB98, 0x9DF530),
                                        ("report-date", 0x1CFE0B, 0x1CFF24, 0x1C17E0)):
        records.append(("source_range", label, owner_rva, begin, end,
                        "Native report-only title/date branch; not the complete owner function"))
        output = subprocess.check_output([str(args.objdump), "-d", "-M", "intel", "--wide",
                   f"--start-address={base+begin:#x}", f"--stop-address={base+end:#x}", str(args.image)], text=True)
        for line in output.splitlines():
            match = INSTRUCTION.match(line)
            if not match:
                continue
            address, mnemonic, operands = int(match[1],16)-base, match[2], match[3]
            ref = REFERENCE.search(operands)
            if ref:
                target=int(ref[1],16)-base
                literal=image.string(target)
                if literal and not text_start <= target < text_end:
                    records.append(("literal", label, owner_rva, address, target, literal[1]))
            if mnemonic == "call":
                direct=DIRECT.match(operands)
                records.append(("source_call", label, owner_rva, address,
                                int(direct[1],16)-base if direct else 0, operands))
    for label, entry in (("diplomatic-proposal-title",0x1BB400), ("calendar-month",0x773390)):
        records.append(("helper_root",label,entry,entry,0,"Native report title/date helper"))
        pending.append(entry)
    for selector in range(7):
        target=struct.unpack_from("<I", image.raw, image.offset(0x9E36CC+selector*4))[0]
        records.append(("switch_case","report-raid-type",0x9DF530,0x9DFAAC,target,
                        f"goal=2; raid type={selector}; table=0x9e36cc; outside 0..6 uses Raid"))
    for selector in range(33):
        remap=image.raw[image.offset(0x1D39D8+selector)]
        target=struct.unpack_from("<I",image.raw,image.offset(0x1D39C8+remap*4))[0]
        records.append(("switch_case","report-day-suffix",0x1C17E0,0x1CFE8C,target,
                        f"zero-based day={selector}; remap=0x1d39d8; table=0x1d39c8; outside bound uses th"))
    records.append(("mission_report_dispatch","normal-playback",0x1BF520,0x1BFF9D,0,
                    "history_event virtual +0xd0; context initialized by 0x72080 (flags=0); r9=true; fifth parameter=false"))
    records.append(("mission_report_dispatch","normal-playback",0x1BF520,0x1C09F6,0,
                    "history_event virtual +0xd0; second production path; same default context"))
    records.append(("mission_report_render","active_mission_report",0x1C17E0,0x1D0622,0xAD9960,
                    "report body rendered from native wrapped strings"))
    records.append(("mission_report_render","active_mission_report_title",0x1C17E0,0x1CFE06,0xAD9960,
                    "report+0x28 stored title"))
    records.append(("mission_report_render","active_mission_report_date",0x1C17E0,0x1CFFE3,0xAD9960,
                    "report+0x83b8 year and +0x83bc tick; 28-day months; month formatter 0x773390"))

    seen = set()
    while pending:
        requested = pending.popleft()
        begin = owner(requested)
        if begin in seen:
            continue
        seen.add(begin)
        if begin in TERMINALS or begin >= 0x1539000:
            records.append(("terminal", "runtime", begin, requested, 0,
                            TERMINALS.get(begin, "native CRT allocation/exception/intrinsic support")))
            continue
        end = image.function_ends.get(begin)
        leaf = end is None
        if leaf:
            # Runtime-function tables omit stackless methods, including large
            # enum-to-text switches. Decode up to the next unwind entry and let
            # control flow, not an arbitrary byte limit, delimit the leaf.
            index = bisect.bisect_right(image.starts, begin)
            end = image.starts[index] if index < len(image.starts) else text_end
        output = subprocess.run([
            str(args.objdump), "-d", "-M", "intel", "--wide",
            f"--start-address={base + begin:#x}", f"--stop-address={base + end:#x}",
            str(args.image),
        ], check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True).stdout
        instructions = []
        for line in output.splitlines():
            match = INSTRUCTION.match(line)
            if match:
                address, mnemonic, operands = int(match[1], 16) - base, match[2], match[3]
                instructions.append((address, mnemonic, operands))
        # objdump renders embedded switch tables as instructions too. Recover
        # actual jump destinations, then traverse the instruction graph from
        # the entry; table bytes after RET must never become source call edges.
        switches = {}
        for index, (address, mnemonic, operands) in enumerate(instructions):
            if mnemonic != "jmp" or DIRECT.match(operands):
                continue
            prior = instructions[max(0, index - 64):index]
            load_index = next((i for i in range(len(prior) - 1, -1, -1)
                               if TABLE_LOAD.search(prior[i][2])), None)
            if load_index is None:
                continue
            table = int(TABLE_LOAD.search(prior[load_index][2])[1], 16)
            bound_index = next((i for i in range(load_index - 1, -1, -1)
                                if prior[i][1] == "cmp"), None)
            if bound_index is None:
                continue
            bound = BOUND.search(prior[bound_index][2])
            if not bound:
                register = prior[bound_index][2].split(",")[-1]
                bound = next((BOUND.search(prior[i][2]) for i in range(bound_index - 1, -1, -1)
                              if prior[i][1] == "mov" and prior[i][2].startswith(register + ",")
                              and BOUND.search(prior[i][2])), None)
            if bound is None:
                continue
            count = int(bound[1], 16) + 1
            if count > 65536:
                continue
            remap = next((BYTE_TABLE.search(entry[2]) for entry in prior[bound_index + 1:load_index]
                          if BYTE_TABLE.search(entry[2])), None)
            indices = list(range(count))
            if remap:
                offset = image.offset(int(remap[1], 16))
                indices = list(image.raw[offset:offset + count])
            try:
                cases = [(case, struct.unpack_from("<I", image.raw, image.offset(table + target * 4))[0])
                         for case, target in enumerate(indices)]
            except ValueError:
                continue
            if any(not begin <= target < end for _, target in cases):
                continue
            context = "; ".join(f"{pc:#x} {mn} {op}" for pc, mn, op in prior)
            switches[address] = (table, cases, context)
        by_address = {entry[0]: index for index, entry in enumerate(instructions)}
        reachable = set()
        walk = [begin, requested]
        while walk:
            address = walk.pop()
            if address in reachable or address not in by_address:
                continue
            reachable.add(address)
            index = by_address[address]
            _, mnemonic, operands = instructions[index]
            direct = DIRECT.match(operands)
            if mnemonic.startswith("j") and direct:
                walk.append(int(direct[1], 16) - base)
            if mnemonic == "jmp":
                if address in switches:
                    walk.extend(target for _, target in switches[address][1])
                continue
            if mnemonic.startswith("ret") or mnemonic in ("int3", "ud2"):
                continue
            if index + 1 < len(instructions):
                walk.append(instructions[index + 1][0])
        instructions = [entry for entry in instructions if entry[0] in reachable]
        records.append(("function", "direct-call-closure", begin, begin, end,
                        "leaf body" if leaf else "PE unwind owner, including chained ranges"))
        for address, mnemonic, operands in instructions:
            reference = REFERENCE.search(operands)
            if reference:
                target = int(reference[1], 16) - base
                literal = image.string(target)
                if literal and not text_start <= target < text_end:
                    records.append(("literal", "native", begin, address, target, literal[1]))
            if mnemonic not in ("call", "jmp"):
                continue
            direct = DIRECT.match(operands)
            if not direct:
                if mnemonic == "jmp" and address in switches:
                    table, cases, context = switches[address]
                    records.append(("switch", "native-normalized-selector", begin, address, table, context))
                    for case, target in cases:
                        records.append(("switch_case", str(case), begin, address, target,
                                        f"normalized selector {case}; table {table:#x}"))
                    continue
                category, detail = indirect_source(begin, address, operands)
                records.append(("indirect_" + mnemonic, category, begin,
                                address, 0, operands + "; " + detail))
                continue
            target = int(direct[1], 16) - base
            if begin <= target < end:
                continue
            records.append(("direct_" + mnemonic, "native", begin, address, target, operands))
            if text_start <= target < text_end:
                pending.append(target)

    # Record the existing typed capture/composition source associated with
    # each actual sentence vtable entry. This is a source map, not execution.
    field_sources = {18:"src/native_history_event.inc",64:"src/native_history_event.inc",73:"src/native_history_event.inc"}
    semantic_sources = {18:"src/history_events.inc: ArtifactCreated",64:"src/history_events.inc: CreateEntityPosition",73:"src/history_events.inc: HfGainsSecretGoal"}
    for suffix in ("early","middle","late","late_aux","justice","occasions"):
        for mapping, path in ((field_sources,root / f"src/native_history_fields_{suffix}.inc"),
                              (semantic_sources,root / f"src/history_semantics_{suffix}.inc")):
            for match in re.finditer(r"^case\s+(\d+):", path.read_text(encoding="utf-8"), re.M):
                mapping[int(match[1])] = path.relative_to(root).as_posix()
    for kind,name,vtable,entry in roots:
        if kind != "event":
            continue
        getter=pointer(vtable)
        code_at=image.offset(getter)
        native_type=struct.unpack_from("<i",image.raw,code_at+1)[0] if image.raw[code_at]==0xb8 else 0
        records.append(("semantic_binding",name,entry,vtable,native_type,
                        f"type={native_type}; capture={field_sources.get(native_type,'')}; composition={semantic_sources.get(native_type,'')}; vocabulary=legends-events.tsv; names=src/history_names.inc; clauses=src/history_event_clauses.inc"))
    records.append(("owner_range","normal-report-production",0x1BF520,0x1BF520,0x1C17DC,"Native PE unwind owner"))
    records.append(("owner_range","world-report-render",0x1C17E0,0x1C17E0,0x1D3ABC,"Native PE unwind owner; only report title/date literal range extracted above"))
    records.append(("owner_range","skip-report-production",0x1D3AC0,0x1D3AC0,0x1D84E4,"Native PE unwind owner"))

    args.output.parent.mkdir(parents=True, exist_ok=True)
    with args.output.open("w", encoding="utf-8", newline="") as stream:
        stream.write("# Native mission report history source catalogue; offline disassembly, not a translation result.\n")
        stream.write(f"# Image SHA-256: {hashlib.sha256(image.raw).hexdigest()}\n")
        stream.write("# Addresses are RVAs. Root entries are actual vtable reads, from the PE: sentence +0xd0, nested event subject +0xd8, nested collection title +0x30.\n")
        stream.write("# Literal references include structural punctuation and markup. Indirect edges are retained explicitly.\n")
        stream.write("# Direct-call closure is conservative; an edge does not prove every conditional path executes for a mission report.\n")
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow(("record", "source", "function_rva", "instruction_or_vtable_rva", "target_or_end_rva", "literal_or_edge"))
        for record, source, function, instruction, target, value in records:
            writer.writerow((record, source, f"0x{function:x}", f"0x{instruction:x}",
                             f"0x{target:x}" if target else "", value))
    print(f"Wrote {args.output}: {dict(Counter(record[0] for record in records))}; roots={len(roots)}")


if __name__ == "__main__":
    main()
