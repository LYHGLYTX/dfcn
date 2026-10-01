"""Expand native supernatural-material generators into noun/attributive pairs.

Chinese vocabulary lives in data/runtime/magical-material-vocabulary.tsv. The native Lua
tables define the complete domain, including phase variants and fallbacks;
neither screenshots nor English suffix guesses define which names are valid.
"""

from collections import Counter
from pathlib import Path
import re


def material_names(root: Path) -> list[tuple[str, str, str]]:
    vocabulary: dict[tuple[str, str], tuple[str, str]] = {}
    path = root / "data/runtime/magical-material-vocabulary.tsv"
    for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) != 4 or not all(fields):
            raise ValueError(f"{path}:{number}: expected family, English, noun, qualifier")
        family, source, noun, qualifier = fields
        key = (family, source)
        if key in vocabulary:
            raise ValueError(f"{path}:{number}: duplicate material term {key}")
        vocabulary[key] = (noun, qualifier)

    directory = root.parent / "data/vanilla/vanilla_procedural/scripts/generators"
    materials = (directory / "materials.lua").read_text(encoding="utf-8")
    divine = (directory / "divine.lua").read_text(encoding="utf-8")
    evil = (directory / "evil.lua").read_text(encoding="utf-8")

    def table(text: str, name: str) -> str:
        # Generator tables end with an unindented brace; their nested entries
        # are indented. Remove Lua line comments so commented examples cannot
        # silently create fictitious material names.
        match = re.search(r"^" + re.escape(name) + r"\s*=\s*\{(.*?)^\}",
                          text, re.MULTILINE | re.DOTALL)
        if not match:
            raise ValueError(f"missing native material table: {name}")
        return re.sub(r"--[^\n]*", "", match[1])

    def words(text: str, name: str) -> list[str]:
        result = re.findall(r'"([a-z -]+)"', table(text, name))
        if not result:
            raise ValueError(f"empty native material table: {name}")
        return result

    used: set[tuple[str, str]] = set()

    def term(family: str, source: str) -> tuple[str, str]:
        key = (family, source)
        if key not in vocabulary:
            raise ValueError(f"untranslated native magical material term: {key}")
        used.add(key)
        return vocabulary[key]

    result: dict[str, tuple[str, str]] = {}
    counts: Counter[str] = Counter()

    def emit(family: str, source: str, parts: list[tuple[str, str]]) -> None:
        pair = ("".join(p[0] for p in parts), "".join(p[1] for p in parts))
        if source in result and result[source] != pair:
            raise ValueError(f"conflicting material forms: {source}")
        if source not in result:
            counts[family] += 1
        result[source] = pair

    remnant_block = materials.split("materials.mythical_remnant.default", 1)
    if len(remnant_block) != 2:
        raise ValueError("missing mythical-remnant generator")
    bases = set(re.findall(r'name\s*=\s*"([a-z]+)"', remnant_block[0]))
    fallback = re.search(r'or\s*\{name\s*=\s*"([a-z]+)"', remnant_block[1])
    if not fallback:
        raise ValueError("missing mythical-remnant fallback")
    bases.add(fallback[1])
    for adjective in words(materials, "mythical_remnant_adjectives"):
        for base in sorted(bases):
            emit("remnant", adjective + " " + base,
                 [term("remnant-adjective", adjective), term("remnant-material", base)])

    for group, phase in (("liquids", "frozen"), ("globs", "molten")):
        for adjective in words(materials, "mythical_healing_adjectives"):
            for base in words(materials, "mythical_healing_" + group):
                name = adjective + " " + base
                parts = [term("healing-adjective", adjective), term("healing-material", base)]
                emit("healing", name, parts)
                for state in (phase, "boiling"):
                    emit("healing", state + " " + name, [term("state", state), *parts])

    for family, table_name in (("divine-metal", "metal_by_sphere"),
                               ("divine-silk", "silk_by_sphere")):
        names = set(re.findall(r'name\s*=\s*"([a-z -]+)"', table(divine, table_name)))
        if not names:
            raise ValueError(f"empty divine-material table: {table_name}")
        for name in sorted(names):
            emit(family, name, [term(family, name)])

    clouds = re.findall(r'\{\s*"([a-z ]+)"\s*,', table(evil, "cloud_names"))
    if not clouds:
        raise ValueError("empty native cloud-material table")
    for adjective in words(evil, "cloud_adjs"):
        for base in clouds:
            emit("cloud", adjective + " " + base,
                 [term("cloud-adjective", adjective), term("cloud-material", base)])
    for adjective in words(evil, "rain_adjs"):
        for base in words(evil, "rain_names"):
            name = adjective + " " + base
            parts = [term("rain-adjective", adjective), term("rain-material", base)]
            emit("rain", name, parts)
            for state in ("frozen", "boiling"):
                emit("rain", state + " " + name, [term("state", state), *parts])

    # Fail publication rather than silently omit an added/renamed native
    # generator or an untranslated member of one of the above finite sets.
    native_generators = set()
    for file in directory.rglob("*.lua"):
        text = file.read_text(encoding="utf-8")
        native_generators.update(re.findall(r"^materials\.([a-z_.]+)\s*=\s*function", text,
                                           re.MULTILINE))
    supported = {"mythical_remnant.default", "mythical_healing.default",
                 "divine.metal.default", "divine.silk.default", "clouds.default", "rain.default"}
    if native_generators != supported:
        raise ValueError(f"native material generators changed: {native_generators ^ supported}")
    if used != vocabulary.keys():
        raise ValueError(f"stale magical material vocabulary: {vocabulary.keys() - used}")
    print("Magical material forms: " + ", ".join(f"{name}={count}" for name, count in counts.items()))
    return [(name, *pair) for name, pair in sorted(result.items())]
