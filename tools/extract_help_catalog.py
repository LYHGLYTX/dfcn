#!/usr/bin/env python3
"""Inventory native help, tutorial objectives, and adventure guidance from PE.

This reads the installed executable without loading or running it. Native help
constructors, draw calls, and all their branch-local literal references are
inventoried together. Key and paragraph markup is decoded at construction
boundaries. Dynamic branches retain their constituent provenance.

The catalog contains English sources only.  Translations remain in
data/runtime/help-translations.tsv, and the build checks that every catalog entry is covered.
"""

from __future__ import annotations

import argparse
import re
import struct
from pathlib import Path
from native_help_sources import (
    HELP_FUNCTIONS, NativeHelpImage, constructed_sources, key_templates,
    referenced_literals, visible_parts,
)

# Shared labels are pooled outside the contiguous prose region or constructed
# using short immediate stores.  These are native help menu/control labels,
# retained from the reviewed 53.16 help initializer catalog.
SHARED_LABELS = (
    "Alerts", "Bins, bags, and barrels", "Building", "Camera controls",
    "Clothing", "Combat", "Conversations", "Dig deeper", "Done",
    "Fortress mode", "Goals", "Handling light aquifers", "Happiness and stress",
    "Information sheets", "Meeting areas and locations", "Menu overview",
    "Military", "Mining", "Movement", "Offices and administrative work",
    "Okay", "Ore and smelting", "Other food sources", "Planting", "Previous",
    "Quests and reputation", "Ramps and channels", "Refuse and dumping",
    "Retirement", "Stockpiles", "Survival", "The party and followers", "Trade",
    "Trading", "Traps and levers", "Wells", "Woodcutting", "Work details",
    "Work orders", "[Completed]", "[Viewed]",
)

INTRO_FIXED = (
    "You've finally got your equipment together, such as it is.  Now it's time for action and adventure!  ",
    "In the rush of excitement, you've forgotten where you were going to go.",
    "After a long journey, you are here to meet your most trusted companion.",
    "Your most trusted companions have made the journey to meet you here today.",
    "Your most trusted companion has made the journey to meet you here today.",
    "Your most trusted local companions are meeting you here today.",
    "Just reunited after a long journey, you are together with your companions again.  ",
    "Your wanderings have brought you to this place after a long journey.",
    "  Perhaps some of the people here will be worth talking to before you continue on your way.",
    "  Let the party venture forth!",
    "  Perhaps some of your friends here can remind you.",
    "  Perhaps some of your friends here have ideas.",
)

DIVINE_FIXED = (
    '"You will have to leave this structure first before you can travel.  Try to make your way out to the settlement."',
    '"Do you feel the pull?  You sense the direction of my representative.  It is possible to travel quickly to reach them, or you may journey more deliberately.  It is your decision."',
    '"Congratulations!  Now you must return this precious object to its proper home."',
    '"This place is dangerous.  Steel yourself against ancient enemies.  Try not to let yourself be surrounded, and remain standing.  Enter and vanquish!  Or slip in unseen.  Securing the treasure is all that matters."',
    '"You are close.  Follow your senses to the entrance.',
    '  Remember that ice and snow can be heated by a campfire.',
    '"Congratulations, my faithful chosen!  There are other ways you can serve, if you offer your service again.  You may also live your life as you see fit now if you choose.  You have done well."',
    '"With the treasure, you are near to glory and fulfillment of your task.  Your senses can lead you on your return journey."',
    '"You may return the object to the faithful by gifting it to one of the priests, or you may simply drop it in this structure wherever you see fit."',
    '"My other worshippers?  As you wish, my faithful chosen!  There are other ways you can serve, if you offer your service again.  You may also live your life as you see fit now if you choose.  You have done well."',
    '"Ungrateful apostate!"',
    '"You are approaching your destination.  End your travels now and prepare yourself."',
)


def normalize(text: str) -> str:
    return " ".join(re.sub(r"\[C:\d+:\d+:\d+\]", "", text).split())


def extract(path: Path) -> list[tuple[str, str, str]]:
    raw = path.read_bytes()
    if raw[:2] != b"MZ" or len(raw) < 0x40:
        raise ValueError("Expected the native Windows x64 Dwarf Fortress PE executable")
    header = struct.unpack_from("<I", raw, 0x3C)[0]
    if (raw[header:header + 4] != b"PE\0\0"
            or struct.unpack_from("<H", raw, header + 4)[0] != 0x8664
            or struct.unpack_from("<H", raw, header + 24)[0] != 0x20B):
        raise ValueError("Expected a PE32+ AMD64 executable")

    image = NativeHelpImage(path)
    section_count = struct.unpack_from("<H", raw, header + 6)[0]
    optional_size = struct.unpack_from("<H", raw, header + 20)[0]
    rdata_ranges = []
    for index in range(section_count):
        at = header + 24 + optional_size + index * 40
        if raw[at:at + 8].rstrip(b"\0") == b".rdata":
            size, offset = struct.unpack_from("<II", raw, at + 16)
            rdata_ranges.append((offset, offset + size))

    # Prefer the actual RIP-relative LEA targets in the reviewed introduction
    # constructor. A raw search for a short pool literal such as "a" otherwise
    # matches PE headers, numeric tables or individual UTF-16 characters.
    intro_literal_offsets: dict[str, int] = {}
    intro_start, intro_end = 0x1407EA2B6, 0x1407EB302
    for _, operation, _, target in image.disassemble(intro_start, intro_end):
        if operation != "lea" or target is None:
            continue
        try:
            offset = image.offset(target)
            if not any(start <= offset < end for start, end in rdata_ranges):
                continue
            literal = image.literal(target)
        except ValueError:
            continue
        if offset > 0 and raw[offset - 1] == 0:
            intro_literal_offsets.setdefault(literal, offset)

    def locate(text: str) -> int:
        if text in intro_literal_offsets:
            return intro_literal_offsets[text]
        needle = text.encode("ascii") + b"\0"
        for start, end in rdata_ranges:
            position = raw.find(needle, start, end)
            while position >= 0:
                if position == start or raw[position - 1] == 0:
                    return position
                position = raw.find(needle, position + 1, end)
        raise ValueError(f"Reviewed native help source changed or is missing: {text!r}")

    rows: list[tuple[str, str, str]] = []
    seen: set[str] = set()

    def add(family: str, source: str, *constituents: str) -> None:
        source = normalize(source)
        provenance = "+".join(f"PE:file:0x{locate(part):X}" for part in constituents)
        if source and source not in seen:
            seen.add(source)
            rows.append((family, provenance, source))

    def add_native(family: str, source: str, provenance: str):
        source = normalize(source)
        if source and source not in seen:
            seen.add(source)
            rows.append((family, provenance, source))

    ignored = {"{adventure-introduction}", "Room completed (", "of 20)", "{d}"}
    controls = {*SHARED_LABELS, "Start tutorial", "Skip tutorial", "Next", "Next page",
                "Previous page", "Don't show again"}
    key_tails = set()
    for family, start, end in HELP_FUNCTIONS:
        if family not in ("tutorial-objective", "help-tutorial"):
            continue
        submissions, _ = constructed_sources(image, start, end)
        for kind, address, parts in submissions:
            for literal, provenance in parts:
                if literal.startswith("]"):
                    key_tails.add(provenance)
            for source, provenance in visible_parts(parts):
                if source in ignored:
                    continue
                scope = "help-control" if kind == "title" or source in controls else family
                add_native(scope, source, provenance)
            if kind == "paragraph":
                for source, provenance in key_templates(parts):
                    add_native("help-key-template", source, provenance)
    # These references also cover alternate branches sharing one append call,
    # introductory text, alert objects and inline SIMD string constructors.
    # No arbitrary string-pool start/end can silently exclude a shared label.
    for family, start, end in HELP_FUNCTIONS:
        for literal, provenance in referenced_literals(image, start, end):
            if literal.startswith("]"):
                if provenance not in key_tails:
                    raise ValueError(f"Help key tail has no recovered opening marker: {provenance}")
                continue  # Decoded together with its opening marker above.
            if literal in ignored or literal == "[KEY:":
                continue
            for source, _ in visible_parts([(literal, provenance)]):
                if source in ignored:
                    continue
                add_native("help-control" if source in controls else family, source, provenance)

    add("tutorial-objective", "Room completed ({d} of {d})", "Room completed (", " of 20)")
    for source in SHARED_LABELS:
        try:
            provenance = f"PE:file:0x{locate(source):X}"
        except ValueError:
            provenance = "DF53.16:help-initializer:shared-control"
        if source not in seen:
            seen.add(source)
            rows.append(("help-control", provenance, source))

    for literal in INTRO_FIXED:
        add("adventure-introduction", literal, literal)
    rescue = "  A foolhardy soul might try to rescue the "
    for ending in ("child that has been kidnapped.", "children that have been kidnapped."):
        add("adventure-introduction", rescue + ending, rescue, ending)
    add("adventure-introduction", "{p} is from here and might have some local information.",
        " is from here and might have some local information.")

    town, threatened, march = (
        "The peaceful town of ", " is threatened!  The forces of ", " are on the march.  ")
    # 0x1407EA5B9 calls the same historical-figure formatter as the commander
    # and bandit leader: its output can include a caste and curse, not a faction.
    add("adventure-siege", "The peaceful town of {e} is threatened! The forces of {p} are on the march.",
        town, threatened, march)
    add("adventure-siege", "The peaceful town of {e} is threatened! The forces of darkness are on the march.",
        town, threatened, "darkness", march)
    warning = " will have no mercy.  There is little time -- you must flee.  Perhaps your family and friends can be convinced to leave."
    add("adventure-siege", "The enemy" + warning, "The enemy", warning)
    add("adventure-siege", "Commanded by {p}, they" + warning,
        "Commanded by ", ", they", warning)
    citizens, bandits = "The citizens of ", " are plagued by bandits.  The gang"
    trouble = " has even sent some troublemakers to harass people right here in town."
    add("adventure-bandits", "The citizens of {e} are plagued by bandits.", citizens, bandits)
    add("adventure-bandits", "The gang" + trouble, bandits, trouble)
    add("adventure-bandits", "The gang led by {p}" + trouble, bandits, " led by ", trouble)

    vault_tail = " true name.  The location of this place is well-known, but none have penetrated its secrets.  If the true name of the monster can be uncovered, you might be able to end this terror forever."
    # PE 0x1407EA97A appends the single person from [rdi+0xE0].  The
    # pronoun helper at 0x140AA4850 uses that person's [rdi+6] sex and
    # returns his/her/its into one string at [rbp+0x420].  Both appends
    # (0x1407EA9CC, 0x1407EA9F2) reuse that exact string: no second
    # person or independent pronoun is present in these six branches.
    for article in ("an ancient", "a"):
        for pronoun in ("his", "her", "its"):
            add("adventure-vault", f"Legends speak of {article} vault, {{e}}, where {{p}} wrested {pronoun} power from the Underworld by invoking {pronoun} true name.",
                "Legends speak of ", article, " vault, ", ", where ", " wrested ",
                " power from the Underworld by invoking ", vault_tail)
    add("adventure-vault", vault_tail.partition("  ")[2], vault_tail)

    for literal in DIVINE_FIXED:
        add("divine-guidance", normalize(literal).strip('"'), literal)
    greeting, chosen = '"Greetings.  I am ', ", and I have chosen you"
    add("divine-guidance", "Greetings. I am {p}, and I have chosen you.", greeting, chosen)
    add("divine-guidance", "Greetings. I am {p}, and I have chosen you as my instrument of {r}.",
        greeting, chosen, " as my instrument of ")
    add("divine-guidance", "The remnants of creation, {e}, belong with my followers, {e}.",
        "The remnants of creation, ", ", belong with my followers, ")
    add("divine-guidance", "Seek out {p} in {e} and fulfill your destiny.",
        "Seek out ", " in ", ' and fulfill your destiny."')
    add("divine-guidance", "You've found {p}! My chosen, you must speak to them and offer your service.",
        '"You\'ve found ', '!  My chosen, you must speak to them and offer your service."')
    add("divine-guidance", "You seek {e}.", "You seek ")
    directions = '.  If you do not find the location in your log, ask others for directions.  You may also follow the pull from your senses."'
    add("divine-guidance", normalize(directions)[2:].rstrip('"'), directions)
    add("divine-guidance", "The journey is long. Be sure to travel to {e}, rather than walking leisurely.",
        "The journey is long.  Be sure to travel to ", ', rather than walking leisurely."')
    needs = (
        "in a state", "in need of drink and sustenance", "in need of sustenance and sleep",
        "in need of sustenance", "in need of drink and sleep", "in need of drink", "in need of sleep",
    )
    for need in needs:
        add("divine-guidance", f"But my chosen, you are {need}! See to yourself before you face what's ahead.",
            "  But my chosen, you are ", need, "!  See to yourself before you face what's ahead.")
    return rows


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    root = Path(__file__).resolve().parents[1]
    parser.add_argument("executable", nargs="?", type=Path, default=root.parent / "Dwarf Fortress.exe")
    parser.add_argument("--output", type=Path, default=root / "data/extracted/help-sources.tsv")
    args = parser.parse_args()
    rows = extract(args.executable)
    header = (
        "# Native Windows x64 DF 53.16 help, tutorial objectives, and adventure guidance.\n"
        "# Generated by tools/extract_help_catalog.py by statically reading the installed PE.\n"
        "# family<TAB>provenance<TAB>source; offsets document sources, not runtime hooks.\n"
        "# Dynamic branch constituents are assembled into complete semantic templates.\n"
        "# Key bindings, quotes, color tags, and screen wrapping are handled by the renderer.\n"
    )
    args.output.write_text(header + "".join("\t".join(row) + "\n" for row in rows), encoding="utf-8")
    print(f"Wrote {len(rows)} native help sources to {args.output}")


if __name__ == "__main__":
    main()
