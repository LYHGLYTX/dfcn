"""Extract the native appearance constructor's literal sources and assembly.

This is a read-only source inventory for the Windows game image. It does not
run the game, translation engine, generators, or any verification procedure.
The branch meanings and dynamic RAW inputs are described in the project's
data/extracted/appearance-source-notes.md. Addresses belong to the supplied PE build.
"""
from __future__ import annotations

import argparse
import csv
from pathlib import Path
import re
import struct

from native_caption_image import CaptionImage


START = 0x140712370
CODE_END = 0x140716A5B
SECTIONS = (
    (0x140712370, "prologue"),
    (0x14071247C, "current_wounds"),
    (0x140712AF5, "body_build_dispatch"),
    (0x14071365E, "body_modifier_fallback"),
    (0x140713B10, "missing_anatomy"),
    (0x140713D79, "cheekbones_and_chin"),
    (0x1407144B1, "voice"),
    (0x1407148DF, "feature_noun"),
    (0x140714CAA, "feature_modifiers"),
    (0x1407158C2, "color_and_age_mix"),
    (0x14071606D, "feature_sentence_assembly"),
    (0x1407161FF, "hair_style"),
    (0x14071663A, "old_wounds_and_scars"),
)
MODIFIERS = (
    "HEIGHT", "BROADNESS", "LENGTH", "CLOSE_SET", "DEEP_SET",
    "HIGH_POSITION", "LARGE_IRIS", "WRINKLY", "CURLY", "CONVEX",
    "DENSE", "THICKNESS", "UPTURNED", "SPLAYED_OUT", "HANGING_LOBES",
    "GAPS", "HIGH_CHEEKBONES", "BROAD_CHIN", "JUTTING_CHIN",
    "SQUARE_CHIN", "ROUND_VS_NARROW", "GREASY", "DEEP_VOICE",
    "RASPY_VOICE",
)


def section(address: int) -> str:
    result = SECTIONS[0][1]
    for start, label in SECTIONS:
        if address < start:
            break
        result = label
    return result


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("exe", type=Path)
    parser.add_argument("--objdump", required=True)
    parser.add_argument("--output-dir", type=Path,
                        default=Path(__file__).resolve().parents[1] / "data/extracted")
    args = parser.parse_args()
    image = CaptionImage(args.exe, args.objdump)
    instructions = list(image.instructions(START, CODE_END))
    lines = [f"; {image.identity}; native appearance constructor {START:#x}..{CODE_END:#x}"]
    sources = []
    for address, instruction in instructions:
        target = re.search(r"# (?:0x)?([0-9a-f]+)", instruction)
        value = image.string(int(target[1], 16)) if target else None
        lines.append(f"{address:#x}: {instruction}" + (f"  {value!r}" if value else ""))
        if value and instruction.startswith("lea "):
            sources.append((image.identity, section(address), f"{address:#x}",
                            f"{int(target[1], 16):#x}", value))
    args.output_dir.mkdir(parents=True, exist_ok=True)
    (args.output_dir / "appearance-native-features.asm").write_text(
        "\n".join(lines) + "\n", encoding="utf-8")
    with (args.output_dir / "appearance-feature-sources.tsv").open(
            "w", encoding="utf-8", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow(("image", "section", "instruction_va", "literal_va", "source"))
        writer.writerows(sources)
    with (args.output_dir / "appearance-modifier-dispatch.tsv").open(
            "w", encoding="utf-8", newline="") as stream:
        writer = csv.writer(stream, delimiter="\t", lineterminator="\n")
        writer.writerow(("image", "enum", "modifier", "body_branch_va", "feature_branch_va"))
        body = struct.unpack_from("<24I", image.raw, image.offset(0x140716A84))
        feature = struct.unpack_from("<22I", image.raw, image.offset(0x140716AE4))
        for number, modifier in enumerate(MODIFIERS):
            writer.writerow((image.identity, number, modifier,
                             f"{image.base + body[number]:#x}",
                             f"{image.base + feature[number]:#x}" if number < len(feature)
                             else "separate voice constructor"))
    print(f"Extracted {len(sources)} addressed literal references from {image.identity}.")


if __name__ == "__main__":
    main()
