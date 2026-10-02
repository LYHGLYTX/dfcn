#!/usr/bin/env python3
"""Compile shared creature, mythical-title and sphere naming vocabulary.

No historical figure or world-specific name is enumerated. The prefix/suffix
directions and all three tiers of titles come from the game's Lua generator.
"""

from pathlib import Path
import json
import re
from build_translations import CREATURE_RAW_ROOTS, atomic_dictionary_output
from legends_grammar import creature_status_prefix
from extract_workshop_tooltip_catalog import native_game_directory


ROOT = Path(__file__).resolve().parents[1]
GAME = native_game_directory(ROOT)
SOURCE = ROOT / "data/runtime/creature-name-vocabulary.tsv"
STATUS_SOURCE = ROOT / "data/runtime/legends-creature-descriptions.tsv"
MYTHICAL = GAME / "data/vanilla/vanilla_procedural/scripts/generators/interactions/mythical.lua"
PROFILES = GAME / "data/vanilla/vanilla_procedural/scripts/generators/creatures/rcp.lua"
CREATURES = PROFILES.parent.parent / "creatures.lua"
INTERACTIONS = PROFILES.parent.parent / "interactions"
EVIL = PROFILES.parent.parent / "evil.lua"
GLOBALS = GAME / "data/init/globals.lua"
WORD_SENSES = ROOT / "data/runtime/procedural-word-senses.tsv"
TARGET = ROOT / "src/creature_vocabulary.inc"


def lua_table(source: str, name: str) -> str:
    """Read an installed literal table, including nested rows and lazy defaults."""
    start = re.search(r"\b" + re.escape(name) + r"\s*=\s*(?:" +
                      re.escape(name) + r"\s+or\s*)?\{", source)
    if not start:
        raise ValueError(f"Missing native creature table: {name}")
    depth = 1
    # Ignore quoted strings/comments while finding the matching closing brace.
    tokens = re.finditer(r'--\[\[.*?\]\]|--[^\n]*|"(?:\\.|[^"\\])*"|'
                         r"'(?:\\.|[^'\\])*'|[{}]", source[start.end():], re.S)
    for token in tokens:
        if token.group() == "{":
            depth += 1
        elif token.group() == "}":
            depth -= 1
            if depth == 0:
                return source[start.end():start.end() + token.start()]
    raise ValueError(f"Unclosed native creature table: {name}")


def enabled_lua_keys(source: str, name: str) -> set[str]:
    block = re.sub(r"--[^\n]*", "", lua_table(source, name))
    return set(re.findall(r"\b([A-Z_]+)\s*=\s*true\b", block))


def main() -> None:
    tables = {name: {} for name in ("kind", "spouse", "modifier", "role", "profile",
                                   "sphere_adjective", "were_alias", "size_prefix", "form_prefix")}
    for number, line in enumerate(SOURCE.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        scope, source, target = line.split("\t")
        if scope not in tables or not source or not target or source in tables[scope]:
            raise ValueError(f"{SOURCE}:{number}: invalid or duplicate term")
        tables[scope][source] = target

    # Native identity status prefixes must agree with biography descriptions.
    # Export their reviewed templates instead of duplicating Chinese wording
    # in the renderer or adding a status-by-species cross-product dictionary.
    statuses = tables["status_prefix"] = {}
    for number, line in enumerate(STATUS_SOURCE.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        source, target, mode = line.split("\t")
        if mode != "creature-status":
            continue
        prefix, rendered = creature_status_prefix(source, target)
        if prefix in statuses:
            raise ValueError(f"{STATUS_SOURCE}:{number}: duplicate creature status")
        statuses[prefix] = rendered

    # Many random body profiles (gopher, mite, swift...) are not ordinary RAW
    # creatures. Resolve every installed profile semantically, not from an
    # English name dictionary that confuses mites with donations or swifts
    # with speed. Established literal species keep their existing names.
    literal = {}
    spheres = {}
    for line in (ROOT / "data/runtime/translations.tsv").read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) >= 3 and "r" in fields[2]:
            spheres[fields[0].lower()] = fields[1]
        if len(fields) < 3 or not any(flag in fields[2] for flag in "tahrq"):
            literal.setdefault(fields[0].lower(), fields[1])

    # The native experiment-origin sentence uses a race's NAME adjective,
    # which can differ from its species noun (dwarven, elven, draconic).
    # Only installed RAWs establish this relationship; an arbitrary translated
    # UI adjective must never make the start of a caste into a species.
    adjective_candidates = {}
    for raw_root in CREATURE_RAW_ROOTS:
        for path in sorted(raw_root.glob("creature_*.txt")):
            raw = path.read_text(encoding="cp437", errors="replace")
            for singular, adjective in re.findall(r"\[NAME:([^:\]]+):[^:\]]*:([^\]]+)\]", raw):
                singular, adjective = singular.strip().lower(), adjective.strip().lower()
                target = literal.get(singular)
                if adjective and adjective != singular and target:
                    adjective_candidates.setdefault(adjective, set()).add(target)
    tables["race_adjective"] = {
        source: next(iter(targets)) for source, targets in adjective_candidates.items()
        if len(targets) == 1
    }
    creature_lua = CREATURES.read_text(encoding="utf-8")
    profile_lua = PROFILES.read_text(encoding="utf-8")
    profiles = {}
    # Experiments also define local profiles directly in creatures.lua.
    for name in re.findall(r'name_string="([^"]+)"', profile_lua + "\n" + creature_lua):
        profiles[name] = literal[name] if name in literal else tables["profile"][name]
    tables["profile"] = profiles

    # Read NAME's singular/plural/adjective columns together. Adjectives such
    # as demonic/angelic are identities in a race-adjective field, never a
    # generic English suffix or an independent UI vocabulary.
    identity_adjectives = tables["kind_adjective"] = {}

    def identity_forms(singular: str, plural: str, adjective: str) -> None:
        singular, plural, adjective = singular.lower(), plural.lower(), adjective.lower()
        target = tables["kind"][singular]
        tables["kind"].setdefault(plural, target)
        if adjective != singular:
            identity_adjectives[adjective] = target

    for name in ("demon_names", "night_troll_names"):
        for forms in re.findall(r'name="([^"]+)",names="([^"]+)",name_adj="([^"]+)"',
                                lua_table(creature_lua, name)):
            identity_forms(*forms)
    for name in ("angel_names_humanoid_warrior", "angel_names_great_beast",
                 "angel_names_humanoid_generic"):
        for forms in re.findall(r'\{"([^"]+)","([^"]+)","([^"]+)"\}',
                                lua_table(creature_lua, name)):
            identity_forms(*forms)
    # Experiment origins concatenate the race adjective with these complete
    # interaction display names. Keep that split bounded by native identities.
    display_names = tables["display_name"] = {}
    interaction_sources = {
        path.stem: path.read_text(encoding="utf-8")
        for path in sorted(INTERACTIONS.glob("*.lua"))
    }

    def display_name(source: str, target: str) -> None:
        previous = display_names.setdefault(source.lower(), target)
        if previous != target:
            raise ValueError(f"Conflicting creature display-name translation: {source}")

    # Curse/secret/disturbance supply the fixed native display-name triples.
    for interaction_source in interaction_sources.values():
        for forms in re.findall(r'\[CE_DISPLAY_NAME:NAME:([a-z -]+):([a-z -]+):([a-z -]+):',
                                interaction_source):
            identity_forms(*forms)
            for form in forms[:2]:
                display_name(form, tables["kind"][forms[0]])

    # Resurrection, ghoul and ghost names use native adjective/noun families;
    # their wording comes from the same reviewed creature vocabulary.
    for script, adjective_table, noun_table in (
            ("secret", "necromancer_raise_adjectives", "necromancer_raise_nouns"),
            ("secret", "ghoul_adjectives", "ghoul_nouns"),
            ("secret", "necromancer_ghost_adjs", "necromancer_ghost_nouns"),
            ("disturbance", "mummy_raise_adjectives", "mummy_raise_nouns")):
        source = interaction_sources[script]
        adjectives = re.findall(r'"([^"]+)"', lua_table(source, adjective_table))
        nouns = re.findall(r'\{"([^"]+)","([^"]+)"\}', lua_table(source, noun_table))
        for adjective in adjectives:
            for singular, plural in nouns:
                target = tables["modifier"][adjective] + tables["kind"][singular]
                for noun in (singular, plural):
                    display_name(adjective + " " + noun, target)
    for name in ("night_troll_wife_names", "night_troll_husband_names"):
        for singular, plural in re.findall(r'\{"([^"]+)","([^"]+)"\}',
                                           lua_table(creature_lua, name)):
            tables["spouse"].setdefault(plural, tables["spouse"][singular])
    for singular, plural in re.findall(r'\{"([^"]+)","([^"]+)"\}',
                                       lua_table(creature_lua, "experiment_nouns")):
        tables["kind"].setdefault(plural, tables["kind"][singular])
    for singular, plural in re.findall(r'\{"([^"]+)","([^"]+)"\}',
                                       lua_table(EVIL.read_text(encoding="utf-8"), "cloud_zombie_names")):
        tables["kind"].setdefault(plural, tables["kind"][singular])

    region_names = re.findall(r'(?:return|and|or)\s+"([^"]+)"',
                              lua_table(creature_lua, "regiontypes"))
    for name in region_names:
        identity_adjectives[name + "-titan"] = tables["modifier"][name] + tables["kind"]["titan"]

    # Werebeasts use humanoidable terrestrial animal profiles and literally
    # append "s", including mouses, wolfs and monitors. Read that candidate
    # set from the same source as the names rather than maintain another
    # animal dictionary in the renderer.
    were_tokens = (enabled_lua_keys(profile_lua, "humanoidable_random_creature") -
                   enabled_lua_keys(profile_lua, "water_based_random_creature") -
                   enabled_lua_keys(profile_lua, "not_beast_random_creature"))
    were_names = tables["were_species"] = tables.pop("were_alias")
    for token, name in re.findall(r'\b([A-Z_]+)\s*=\s*\{\s*name_string="([^"]+)"',
                                  lua_table(profile_lua, "random_creature_types")):
        if token in were_tokens:
            were_names[name] = profiles[name]
    were_plurals = tables["were_plural"] = {name + "s": target for name, target in were_names.items()}
    # Also retain ordinary RAW plurals when another native caption uses them.
    for raw_root in CREATURE_RAW_ROOTS:
        for path in sorted(raw_root.glob("creature_*.txt")):
            raw = path.read_text(encoding="cp437", errors="replace")
            for singular, plural in re.findall(r"\[NAME:([^:\]]+):([^:\]]+):[^\]]*\]", raw):
                if singular.lower() in were_names:
                    were_plurals.setdefault(plural.lower(), were_names[singular.lower()])

    lua = MYTHICAL.read_text(encoding="utf-8")
    names = lua.split("mythical_names={", 1)[1].split("interactions.mythical.default", 1)[0]
    roles = {}
    for word in re.findall(r'"([a-z]+)"', names):
        # The vanilla generator pluralizes these particular roles with -s.
        roles[word] = roles[word + "s"] = tables["role"][word]
    tables["role"] = roles
    for name in ("mythical_prefix", "mythical_suffix"):
        tables[name] = {}
    for adjective, after in re.findall(r'adj="([^"]+)",adj_after=(true|false)', lua):
        root = re.sub(r"^(?:of )?(?:the )?", "", adjective)
        target = tables["modifier"][root]
        scope = "mythical_suffix" if after == "true" else "mythical_prefix"
        tables[scope][adjective] = target
    # All mythical tiers use the same native adjective directions. Reuse the
    # parsed singular/plural roles without inventing extra title combinations.
    for role, role_target in roles.items():
        for adjective, target in tables["mythical_prefix"].items():
            display_name(adjective + " " + role, target + role_target)
        for adjective, target in tables["mythical_suffix"].items():
            display_name(role + " " + adjective, target + role_target)

    # Angels use the complete installed sphere vocabulary, not a few names
    # observed in a particular world. Keep parts of speech: global UI `dead`
    # can describe a plant, and noun-only name senses mean something else.
    adjectives = {}
    for line in WORD_SENSES.read_text(encoding="utf-8").splitlines():
        if not line or line.startswith("#"):
            continue
        _, pos, source, target = line.split("\t")
        if pos == "ADJ":
            adjectives.setdefault(source, target)
    reviewed = tables.pop("sphere_adjective")
    sphere_terms = tables["sphere_modifier"] = {}
    globals_lua = GLOBALS.read_text(encoding="utf-8")
    nouns = globals_lua.split("random_sphere_nouns={", 1)[1].split("\n}", 1)[0]
    for sphere, forms in re.findall(r'^\s*([A-Z_]+)=(.+)$', nouns, re.MULTILINE):
        for source in re.findall(r'str="([^"]+)"', forms):
            sphere_terms[source] = spheres.get(source) or spheres[sphere.lower()]
    forms = globals_lua.split("random_sphere_adjective={", 1)[1].split("\n}", 1)[0]
    for source in re.findall(r'"([^"]+)"', forms):
        target = (reviewed.get(source) or tables["modifier"].get(source) or
                  adjectives.get(source) or literal.get(source))
        if not target:
            raise ValueError(f"Missing scoped sphere adjective: {source}; add it to {SOURCE}")
        sphere_terms[source] = target

    lines = ["// GENERATED by tools/build_creature_vocabulary.py; edit data/runtime/creature-name-vocabulary.tsv",
             "// or the creature-status rows in data/runtime/legends-creature-descriptions.tsv."]
    for name, terms in tables.items():
        lines.append("static const std::unordered_map<std::string_view, std::string_view>")
        lines.append(f"    creature_name_{name} = {{")
        for source, target in sorted(terms.items()):
            lines.append("    {" + json.dumps(source, ensure_ascii=False) + ", " +
                         json.dumps(target, ensure_ascii=False) + "},")
        lines.append("};")
    with atomic_dictionary_output(TARGET) as output:
        output.write("\n".join(lines) + "\n")
    print(f"Generated {TARGET} ({sum(map(len, tables.values()))} scoped forms)")


if __name__ == "__main__":
    main()
