#!/usr/bin/env python3
"""Build the finite English vocabulary used by DF procedural place names.

The game exposes the possible word forms in ``language_words.txt``.  ECDICT is
used only as an offline bilingual dictionary; no text is sent to a translation
service.  ``dfcn/data/runtime/procedural-term-overrides.tsv`` contains the small number of
DF-specific senses and dictionary gaps that require manual wording.
"""

from __future__ import annotations

import argparse
import csv
import re
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_WORDS = ROOT / "data/vanilla/vanilla_languages/objects/language_words.txt"
DEFAULT_OVERRIDES = ROOT / "dfcn/data/runtime/procedural-term-overrides.tsv"
DEFAULT_OUTPUT = ROOT / "dfcn/data/runtime/procedural-terms.tsv"

TAG_RE = re.compile(r"^\s*\[(NOUN|ADJ|VERB|PREFIX):([^\]]*)\]", re.MULTILINE)
HAN_RE = re.compile(r"[\u3400-\u9fff]")
ASCII_OR_PUNCT_RE = re.compile(r"[A-Za-z0-9?:：!！,，;；/\\\[\]{}<>《》“”\"']")
POS_PREFIXES = {
    "n": ("n.", "num.", "pl."),
    "a": ("a.", "adj."),
    "v": ("v.", "vt.", "vi."),
    "prefix": (),
}
POS_ORDER = {"n": 0, "a": 1, "v": 2, "prefix": 3}


def read_forms(path: Path) -> dict[str, list[tuple[str, str, bool]]]:
    """Return form -> (lemma, part of speech, is lemma) candidates."""
    result: dict[str, list[tuple[str, str, bool]]] = defaultdict(list)
    text = path.read_text(encoding="utf-8")
    for match in TAG_RE.finditer(text):
        tag, body = match.groups()
        forms = [part.strip().lower() for part in body.split(":") if part.strip()]
        if not forms:
            continue
        lemma = forms[0]
        pos = {"NOUN": "n", "ADJ": "a", "VERB": "v", "PREFIX": "prefix"}[tag]
        for index, form in enumerate(forms):
            item = (lemma, pos, index == 0)
            if item not in result[form]:
                result[form].append(item)
    return result


def read_overrides(path: Path) -> dict[str, str]:
    result: dict[str, str] = {}
    for number, raw in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if not raw or raw.startswith("#"):
            continue
        fields = raw.split("\t")
        if len(fields) != 2 or not fields[0] or not fields[1]:
            raise SystemExit(f"{path}:{number}: expected source<TAB>translation")
        result[fields[0].lower()] = fields[1]
    return result


def load_ecdict(path: Path, wanted: set[str]) -> dict[str, str]:
    result: dict[str, str] = {}
    with path.open(encoding="utf-8", newline="") as source:
        for row in csv.DictReader(source):
            word = row["word"].strip().lower()
            if word in wanted and word not in result:
                result[word] = row.get("translation", "")
    return result


def clean_gloss(gloss: str, pos: str) -> str | None:
    # ECDICT represents embedded line breaks as the two characters "\\n".
    lines = [part.strip() for part in re.split(r"\\n|\n", gloss) if part.strip()]
    lines = [part for part in lines if not part.startswith("[")]
    prefixes = POS_PREFIXES[pos]
    preferred = [part for part in lines if prefixes and part.lower().startswith(prefixes)]
    for line in preferred + lines:
        line = re.sub(
            r"^(?:n|num|pl|a|adj|v|vt|vi|adv|ad|prep|conj|pron|int|interj|aux)\.\s*",
            "",
            line,
            flags=re.IGNORECASE,
        )
        for clause in re.split(r"[,，;；]", line):
            clause = re.sub(r"\([^)]*\)|（[^）]*）|<[^>]*>", "", clause)
            clause = re.sub(r"\.{2,}.*$", "", clause).strip().replace(" ", "")
            if not clause or not re.fullmatch(r"[\u3400-\u9fff]+", clause):
                continue
            repeated = any(
                clause[start : start + size] * 3
                == clause[start : start + size * 3]
                for start in range(len(clause))
                for size in range(1, min(4, (len(clause) - start) // 3) + 1)
            )
            if ASCII_OR_PUNCT_RE.search(clause) or len(clause) > 12 or repeated:
                continue
            return clause
    return None


def choose_gloss(
    form: str,
    candidates: list[tuple[str, str, bool]],
    dictionary: dict[str, str],
) -> str | None:
    # A form which is itself a lemma is less ambiguous than an inflection.
    candidates = sorted(candidates, key=lambda item: (not item[2], POS_ORDER[item[1]]))
    for lemma, pos, is_lemma in candidates:
        lookup = form if is_lemma else lemma
        translated = clean_gloss(dictionary.get(lookup, ""), pos)
        if translated:
            return translated
    return None


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--ecdict", type=Path, required=True, help="path to ECDICT ecdict.csv")
    parser.add_argument("--words", type=Path, default=DEFAULT_WORDS)
    parser.add_argument("--overrides", type=Path, default=DEFAULT_OVERRIDES)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    forms = read_forms(args.words)
    overrides = read_overrides(args.overrides)
    for extra in overrides:
        forms.setdefault(extra, [(extra, "n", True)])

    wanted = set(forms)
    wanted.update(lemma for candidates in forms.values() for lemma, _, _ in candidates)
    dictionary = load_ecdict(args.ecdict, wanted)

    result: dict[str, str] = {}
    missing: list[str] = []
    for form in sorted(forms):
        translated = overrides.get(form) or choose_gloss(form, forms[form], dictionary)
        if translated:
            result[form] = translated
        else:
            missing.append(form)

    if missing:
        raise SystemExit(
            "No safe Chinese gloss for " + str(len(missing)) + " forms: " + ", ".join(missing)
        )

    with args.output.open("w", encoding="utf-8", newline="\n") as output:
        output.write("# GENERATED vocabulary for complete procedural English place-name translation.\n")
        output.write("# Source: DF language_words + ECDICT; edit data/runtime/procedural-term-overrides.tsv, not this file.\n")
        for source, target in result.items():
            output.write(f"{source}\t{target}\n")
    print(f"Generated {args.output}: {len(result)} safe procedural word forms")


if __name__ == "__main__":
    main()
