#!/usr/bin/env python3
"""Read the Windows 53.16 Escape menu's complete native source branches.

Offline disassembly only: no game execution, process attachment, runtime data
generation, translation execution, or build. Native unwind ranges retain the
whole renderer, mode constructor, input dispatcher, save update and save action.
Finite captions include inline vector-copied strings as well as LEA literals.
Printable MOV/MOVABS immediate operands are retained with their actual native
role: the progress slash is a drawn control; numeric selectors, lengths and
arithmetic constants are not captions. The constructor stores the complete
Dwarf Fortress Adventure title at state+0x8 and the renderer draws that field.
Adventure is not separately assembled by immediate writes in these routines.
The catalog retains the real action/mode/music jump tables and all instructions.

Renderer action ID 7 is a branch, not one caption. While night_counter > 0 it
selects Give in to the Night or Finish Game. Otherwise it selects Finish Game
or Give in to Starvation, then optionally appends (holding another's goods).
The night branch jumps past that suffix. Adventure mode constructs ID 7 or 8
according to night state, friendly-site availability, held goods and living
party members. Fortress mode constructs ID 4 or 6 from the invasion predicates,
and also ID 5 unless the native game type disables retire/abandon.

Dialog flags on the common menu state are +0x40 fortress retire, +0x41 adventure
retire, +0x42 fortress abandon, +0x43 adventure abandon, +0x44/+0x45 quit without
saving, +0x78 manual-save name, +0xa0 overwrite and +0xa1 timeline name.
These flags select complete render branches; their prose is three native rows,
not a dynamically generated English sentence. Save status is another complete
renderer branch and includes every native save-stage message.

Timeline folder names and entered save names remain dynamic opaque data.
Sound metadata defines arbitrary TITLE/AUTHOR values; the music map stores them
at +0x10/+0x30 and the renderer uses those fields for unmapped music IDs.
The native combat selector codes are internal comparisons, not displayed text.
"""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path
import re
import struct
import sys

from native_caption_image import CaptionImage


ROOT = Path(__file__).resolve().parents[1]
OBJDUMP = Path(r"C:\Users\WIN11\AppData\Local\Programs\dfcn-toolchains\w64devkit-2.9.1\w64devkit\bin\objdump.exe")
SPANS = (
    ("menu-render", "renderer_all_branches", 0x1DDD50),
    ("menu-input", "input_and_confirmation_dispatch", 0x1E3910),
    ("menu-update", "save_and_help_update", 0x1E5640),
    ("menu-open", "mode_constructor_and_end_state", 0x1E65A0),
    ("save-action", "timeline_and_save_folder_action", 0x1F8EA0),
    ("sound-metadata", "harvest_music_title_author", 0xB3D790),
    ("sound-metadata", "parse_music_file_title_author", 0xB3EA10),
)
ACTION_NAMES = (
    "Return to game", "Save and return to title menu",
    "Save and continue playing", "Settings", "Succumb to the invasion",
    "Abandon the fortress to ruin", "Retire the fortress (for the time being)",
    "conditional Give in to the Night / Give in to Starvation / Finish Game",
    "Retire at this location (or rest a while)", "Quit without saving",
    "Save world and return to title menu", "Save to this timeline / Save to timeline folder: {folder}",
    "Save to new timeline", "Save to new folder (same timeline)",
    "Return to title menu", "Continue",
)
MODE_NAMES = (
    "fortress pause", "fortress ended state", "save update", "fortress save to title",
    "fortress end-state save", "compact pause", "adventure pause", "adventure save to title",
    "adventure ended-state save", "adventure retired", "adventure dead",
)
INTERNAL_CODES = {"or", "en", "df9", "df3", "df15", "ww", "cg", "ff", "stia", "rcab", "ts", "pr", "SoW", "dr", "nabidas"}
CONTROL_LITERALS = {
    "_": "native input cursor, not an English caption",
    "[B]": "native paragraph-break markup, not an English caption",
    " - ": "native soundtrack title/author separator, not an English caption",
    " ": "native spacing separator, not an English caption",
}
PARAGRAPHS = (
    ("overwrite_confirmation", (0x1DFD34, 0x1DFD90)),
    ("timeline_explanation", (0x1E0190, 0x1E01EC)),
    ("manual_save_prompt", (0x1E04D4, 0x1E0530, 0x1E058C)),
    ("retire_fortress_confirmation", (0x1E08C4, 0x1E0920, 0x1E097C)),
    ("retire_adventurer_confirmation", (0x1E0CA4, 0x1E0D00, 0x1E0D5C)),
    ("abandon_fortress_confirmation", (0x1E1094, 0x1E10F0, 0x1E114C)),
    ("abandon_adventurer_confirmation", (0x1E1474, 0x1E14D0, 0x1E152C)),
    ("quit_without_saving_warning", (0x1E3290, 0x1E32EC)),
)


def string_root(image: CaptionImage, target: int):
    """Rejoin RIP loads of consecutive 16-byte literal chunks to their source."""
    try:
        at = image.offset(target)
    except ValueError:
        return None
    previous = image.raw.rfind(b"\0", max(0, at - 4096), at)
    start = previous + 1
    end = image.raw.find(b"\0", at, at + 4096)
    if end <= start:
        return None
    raw = image.raw[start:end]
    if not raw or any(byte < 32 or byte > 126 for byte in raw):
        return None
    return image.address(start), raw.decode("ascii"), target - image.address(start)


def printable_immediate(instruction: str):
    """Retain readable immediate bytes without treating numeric values as text."""
    match = re.fullmatch(r"mov(?:abs)?\s+.+,0x([0-9a-f]+)\s*", instruction)
    if not match:
        return None
    value = int(match[1], 16)
    raw = value.to_bytes(max(1, (value.bit_length() + 7) // 8), "little")
    if any(byte < 32 or byte > 126 for byte in raw):
        return None
    return raw.decode("ascii"), value


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("image", type=Path, nargs="?")
    parser.add_argument("--edition", choices=("steam", "classic"), default="steam")
    parser.add_argument("--objdump", type=Path, default=OBJDUMP)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    config = json.loads((ROOT / "data/runtime/native-pe-images.json").read_text(encoding="utf-8"))
    images = [(args.edition, args.image)] if args.image else [
        ("steam", Path(config["reference"])), ("classic", Path(config["classic"])),
    ]
    output = args.output.open("w", encoding="utf-8", newline="") if args.output else sys.stdout
    try:
        for line in (__doc__ or "").splitlines():
            output.write("# " + line + "\n")
        writer = csv.writer(output, delimiter="\t", lineterminator="\n")
        writer.writerow(("edition", "group", "producer", "producer_rva", "instruction_rva", "kind", "target_rva", "source", "notes"))
        for edition, path in images:
            image = CaptionImage(path, str(args.objdump))
            # Menu methods have the same instruction layout in both 53.16 PE
            # editions; the classic build lacks a preceding 0x70-byte routine.
            delta = -0x70 if edition == "classic" else 0
            sources_by_instruction = {}
            writer.writerow((edition, "image", path.name, "", "", "identity", "", image.identity, "offline PE image"))
            for group, name, rva in SPANS:
                # Sound metadata methods are far beyond edition-specific code
                # insertions; use the existing native build mapping for them.
                mapped = rva + delta
                if group == "sound-metadata" and edition == "classic":
                    binding = (ROOT / "src/native_pe_build_bindings.inc").read_text(encoding="utf-8")
                    for a, b, c in re.findall(r"\{(0x[0-9a-f]+), (0x[0-9a-f]+), (0x[0-9a-f]+)\}", binding):
                        begin, end, classic = int(a, 16), int(b, 16), int(c, 16)
                        if begin <= rva < end:
                            mapped = classic + rva - begin
                            break
                start = image.base + mapped
                end = image.functions.get(start)
                if end is None:
                    raise ValueError(f"No unwind source boundary for {edition} {name} at {start:#x}")
                writer.writerow((edition, group, name, hex(mapped), "", "function_span", hex(end - image.base), "", "end-exclusive"))
                seen = set()
                for address, instruction in image.instructions(start, end):
                    instruction_rva = address - image.base
                    writer.writerow((edition, group, name, hex(mapped), hex(instruction_rva), "instruction", "", instruction, ""))
                    immediate = printable_immediate(instruction)
                    if immediate:
                        readable, scalar = immediate
                        kind = "immediate_operand"
                        notes = f"numeric operand {scalar}; readable low bytes alone do not establish displayed text; instruction retained for provenance"
                        if group == "menu-render" and instruction_rva == 0x1DE1D5 + delta:
                            kind = "native_control"
                            notes = "drawn progress separator; dl=0x2f followed by glyph writer RVA0bb190, between offloaded-unit count and total"
                        elif group == "menu-render" and 0x1E2C58 + delta <= instruction_rva < 0x1E2DDB + delta:
                            notes = f"internal numeric combat music ID {scalar}, selected by comparison; not drawn as ASCII"
                        elif scalar == 0x55555556:
                            notes = "integer-division multiplication constant; followed by IMUL/SAR, not a text write"
                        elif group == "sound-metadata" and readable in ("music_fi", "sound_fi", "le", "_"):
                            kind = "internal_immediate"
                            notes = "inline filename-prefix comparison component; never passed to text drawing"
                        writer.writerow((edition, group, name, hex(mapped), hex(instruction_rva), kind, "", readable, notes))
                    reference = re.search(r"# (?:0x)?([0-9a-f]+)", instruction)
                    if not reference:
                        continue
                    target = int(reference[1], 16)
                    source = string_root(image, target)
                    if not source:
                        continue
                    root, value, offset = source
                    notes = "literal copied from .rdata" if not instruction.startswith("lea") else "literal address operand"
                    if offset:
                        notes += f"; first referenced chunk is +{offset:#x} within whole source"
                    kind = "literal"
                    if value in CONTROL_LITERALS:
                        kind = "native_control"
                        notes = CONTROL_LITERALS[value]
                    elif value.startswith("basic_string::") or value == "directory_iterator::operator++":
                        kind = "internal_literal"
                    elif group == "menu-render" and 0x1E2C58 + delta <= instruction_rva < 0x1E2DDB + delta and value in INTERNAL_CODES:
                        kind = "internal_literal"
                        notes = "combat music code comparison, never drawn"
                    elif group == "menu-render" and 0x1E05DA + delta <= instruction_rva <= 0x1E0613 + delta:
                        kind = "internal_literal"
                        notes = "reserved save-folder name comparison, not displayed"
                    elif group in ("menu-input", "menu-update", "save-action", "sound-metadata"):
                        kind = "internal_literal"
                        notes += "; path/tag/implementation constant, not a displayed caption"
                    sources_by_instruction[instruction_rva] = value
                    if root in seen:
                        kind = {"internal_literal": "internal_literal_ref", "native_control": "native_control_ref"}.get(kind, "literal_ref")
                    seen.add(root)
                    writer.writerow((edition, group, name, hex(mapped), hex(instruction_rva), kind, hex(root - image.base), value, notes))
            for name, table, count, labels in (
                ("action_caption_switch", 0x1E3754, 16, ACTION_NAMES),
                ("input_action_switch", 0x1E55F4, 16, ACTION_NAMES),
                ("mode_constructor_switch", 0x1E89F8, 11, MODE_NAMES),
            ):
                values = struct.unpack_from(f"<{count}I", image.raw, image.offset(image.base + table + delta))
                for selector, target in enumerate(values):
                    writer.writerow((edition, "branch", name, "", hex(table + delta), "jump_table", hex(target), labels[selector], f"selector={selector}"))
            for name, refs in PARAGRAPHS:
                actual_refs = tuple(rva + delta for rva in refs)
                source = " ".join(sources_by_instruction[rva].strip() for rva in actual_refs)
                writer.writerow((edition, "paragraph", name, hex(0x1DDD50 + delta), ";".join(hex(rva) for rva in actual_refs), "sentence_branch", "", source, "complete native row sequence; renderer draws each source row separately"))
            for name, table, count, selector_base in (
                ("main_music_switch", 0x1E3794, 33, 0),
                ("interlude_music_switch", 0x1E3894, 16, 61),
                ("combat_music_switch", 0x1E38D4, 15, 106),
            ):
                values = struct.unpack_from(f"<{count}I", image.raw, image.offset(image.base + table + delta))
                selectors = list(range(count))
                if name == "main_music_switch":
                    selectors = list(image.raw[image.offset(image.base + 0x1E3818 + delta):image.offset(image.base + 0x1E3818 + delta) + 121])
                for selector, entry in enumerate(selectors):
                    target = values[entry]
                    title = sources_by_instruction.get(target)
                    if title is None:
                        # Some cases first assign string length/color registers;
                        # the real caption LEA is within their branch body.
                        title = next((sources_by_instruction[rva] for rva in sorted(sources_by_instruction)
                                      if target <= rva < target + 24), "{TITLE} / {AUTHOR} from music map")
                    writer.writerow((edition, "music-branch", name, hex(0x1DDD50 + delta), hex(table + delta), "jump_table", hex(target), title, f"selector={selector + selector_base}; table_index={entry}"))
            writer.writerow((edition, "dynamic", "music_metadata_fields", "", "", "dynamic_source", "", "TITLE / AUTHOR", "MUSIC_FILE metadata; map value title +0x10, author +0x30; custom-map renderer fallback"))
            writer.writerow((edition, "dynamic", "timeline_folder", "", "", "dynamic_source", "", "Save to timeline folder: {folder}", "state+0xd0 vector of folder strings; opaque filesystem identifiers"))
            writer.writerow((edition, "dynamic", "entered_save_names", hex(0x1DDD50 + delta), hex(0x1E0248 + delta), "dynamic_source", "", "{timeline_name} / {manual_save_name}", "state+0xa8 / state+0x80 string fields are user input; renderer copies them and draws native underscore cursor separately"))
            writer.writerow((edition, "dynamic", "offloading_unit_progress", hex(0x1DDD50 + delta), hex(0x1DE196 + delta), "dynamic_source", "", "Offloading units... {n}/{total}", "only when state+0x314!=-1; number formatter RVA52c2b0; total from unit vector size; slash glyph emitted by mov dl,0x2f at RVA1de1d5 and glyph writer RVA0bb190"))
            writer.writerow((edition, "branch", "adventure_title_field", hex(0x1DDD50 + delta), ";".join(hex(rva + delta) for rva in (0x1E7655, 0x1E765C, 0x1E7660, 0x1E1923, 0x1E1934)), "branch_pseudocode", "", "Dwarf Fortress Adventure", "constructor literal -> std::string assignment at state+0x8; renderer directly draws state+0x8 through RVAad9960; no separately assembled Adventure caption"))
            for name, rva, source, refs in (
                ("music_filename_prefix", 0xB3EA10, "music_file_", (0xB3EC03, 0xB3EC09, 0xB3EDED, 0xB3EDFC, 0xB3EE09)),
                ("sound_filename_prefix", 0xB3EA10, "sound_file_", (0xB3FB10, 0xB3FB16, 0xB3FBBF)),
            ):
                metadata_delta = -0x2FC0 if edition == "classic" else 0
                writer.writerow((edition, "sound-metadata", name, hex(rva + metadata_delta), ";".join(hex(ref + metadata_delta) for ref in refs), "internal_literal", "", source, "full inline filename-prefix comparison reconstructed from QWORD immediate plus WORD/BYTE components; not displayed"))
            writer.writerow((edition, "handoff", "settings", hex(0x1E3910 + delta), hex(0x1E52F1 + delta), "external_screen", hex(0x234AD0 if edition == "steam" else 0x234A60), "Settings", "action ID3 invokes the independent Settings screen constructor; parameter2 in Adventure, parameter1 in Fortress; Settings subpage text belongs to that separate screen"))
            writer.writerow((edition, "handoff", "help_guide", hex(0x1E3910 + delta), hex(0x1E421D + delta), "external_screen", hex(0x1F2310 + delta), "Interactive tutorial / Information and guides", "help-index selection invokes independent guide constructor RVA1f2310; full guide prose has existing data/extracted/help-sources.tsv provenance; pause index fixed headings remain in menu-render literal rows"))
            writer.writerow((edition, "dynamic", "adventure_action_7", hex(0x1DDD50 + delta), hex(0x1E1D34 + delta), "branch_pseudocode", "", "Give in to the Night / Give in to Starvation / Finish Game", "night_counter>0: night or finish; otherwise: starvation or finish; held-goods suffix only on non-night path"))
            for name, rva, source, notes in (
                ("adventure_night", 0x1E1D34, "Give in to the Night", "night_counter RVA2640c04 >0 AND party nonempty AND current adventurer exists AND (flags+0x110 &2 is clear OR another living party member exists); otherwise Finish Game; jumps directly to common draw"),
                ("adventure_starvation", 0x1E1D8F, "Give in to Starvation", "night_counter<=0 AND party/current adventurer permit continuation; without current adventurer, game-state WORD RVA2640b70 values25 or26 still choose Starvation; otherwise Finish Game"),
                ("adventure_held_goods", 0x1E1DE4, " (holding another's goods)", "friendly-site lookup RVA143f610 succeeds AND held-item predicate RVAcb2450(item,31) is true; append only after non-night Finish Game/Starvation branch"),
                ("adventure_menu_choice", 0x1E770D, "Retire at this location (or rest a while)", "constructor mode6, unless gametype RVA189c2c4==5; choose ID7 if night_counter>0, site unavailable, held goods, or dead active unit without viable companion; otherwise choose ID8"),
                ("fortress_menu_choice", 0x1E7AE5, "Retire the fortress (for the time being) / Succumb to the invasion", "constructor mode0 unless gametype RVA189c2c4==4; invasion scan of world vector RVA2393558 uses figure lookup RVA0ba0a0, flags+0x18 &3 and figure flags+0x3a0 bit4; qualifying enemy picks ID4, otherwise ID6; then ID5 abandon"),
                ("ended_fortress", 0x1E7DA8, "Abandoned / Retired / Conquered / Withered", "constructor mode1; WORD RVA2391230 values3/2/1/other choose corresponding whole state prose; draws Save world and return to title menu ID10"),
                ("ended_adventure", 0x1E80B5, "Retired / Dead", "constructor mode9 selects Retired and You settle in this location...; mode10 selects Dead and Your adventure has come to an end.; both draw ID10"),
                ("timeline_choices", 0x1E8612, "Save to this timeline / Save to timeline folder: {folder}", "constructor modes3,4,7,8 collect matching timeline saves into state+0xd0; emits ID11 for each matching folder then ID12+ID13; modes3 and7 also ID0 return"),
            ):
                writer.writerow((edition, "branch", name, "", hex(rva + delta), "branch_pseudocode", "", source, notes))
    finally:
        if args.output:
            output.close()


if __name__ == "__main__":
    main()
