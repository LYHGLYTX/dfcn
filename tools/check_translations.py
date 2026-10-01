#!/usr/bin/env python3
"""Validate the generated DFCN dictionary and prove it is reproducible."""

from __future__ import annotations

import subprocess
import sys
import tempfile
import re
import tomllib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def unescape(value: str) -> bytes:
    result = bytearray()
    index = 0
    while index < len(value):
        if value[index] != "\\":
            result.extend(value[index].encode("utf-8"))
            index += 1
            continue
        index += 1
        if index >= len(value):
            raise ValueError("trailing backslash")
        escape = value[index]
        index += 1
        if escape == "\\":
            result.append(0x5C)
        elif escape == "t":
            result.append(0x09)
        elif escape == "n":
            result.append(0x0A)
        elif escape == "r":
            result.append(0x0D)
        elif escape == "#":
            result.append(0x23)
        elif escape == "x" and index + 2 <= len(value):
            result.append(int(value[index : index + 2], 16))
            index += 2
        else:
            result.extend(("\\" + escape).encode("utf-8"))
    return bytes(result)


def main() -> int:
    dictionary = ROOT / "data/runtime/translations.tsv"
    with tempfile.TemporaryDirectory(prefix="dfcn-check-") as temporary:
        regenerated = Path(temporary) / "translations.tsv"
        subprocess.run(
            [sys.executable, str(ROOT / "tools/build_translations.py"), "--output", str(regenerated)],
            check=True,
            stdout=subprocess.DEVNULL,
        )
        if regenerated.read_bytes() != dictionary.read_bytes():
            raise SystemExit("data/runtime/translations.tsv is stale; use the current host's build-deploy.sh or build-deploy.ps1 entry point when a code build is required")

    sources: set[bytes] = set()
    mappings: dict[bytes, bytes] = {}
    flags_by_source: dict[bytes, str] = {}
    casefold_sources: dict[bytes, bytes] = {}
    rules = 0
    templates = 0
    boundaries = 0
    for line_no, line in enumerate(dictionary.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) not in (2, 3):
            raise SystemExit(f"translations.tsv:{line_no}: expected 2 or 3 fields")
        source = unescape(fields[0])
        target = unescape(fields[1])
        flags = fields[2] if len(fields) == 3 else ""
        if not source or b"\n" in source + target or b"\r" in source + target:
            raise SystemExit(f"translations.tsv:{line_no}: empty or multi-line rule")
        if any(flag not in "wtilx" for flag in flags):
            raise SystemExit(f"translations.tsv:{line_no}: invalid flags {flags!r}")
        if source in sources:
            raise SystemExit(f"translations.tsv:{line_no}: duplicate source")
        sources.add(source)
        mappings[source] = target
        flags_by_source[source] = flags
        if "i" in flags:
            folded = bytes(
                value + 32 if 0x41 <= value <= 0x5A else value
                for value in source
            )
            previous = casefold_sources.get(folded)
            if previous is not None:
                raise SystemExit(
                    f"translations.tsv:{line_no}: duplicate case-insensitive source "
                    f"{source!r} conflicts with {previous!r}"
                )
            casefold_sources[folded] = source
        if "t" in flags:
            templates += 1
            source_kinds = re.findall(rb"\{([ds])\}", source)
            target_kinds = re.findall(rb"\{([ds])\}", target)
            if not source_kinds or source_kinds != target_kinds:
                raise SystemExit(f"translations.tsv:{line_no}: mismatched template placeholders")
        if "w" in flags:
            boundaries += 1
        rules += 1

    if rules < 9000 or templates < 100 or boundaries < 9000:
        raise SystemExit(
            f"unexpectedly small corpus: rules={rules}, templates={templates}, boundaries={boundaries}"
        )
    required_casefold_rules = {
        b"Good": "善良".encode(),
        b"Low": "低".encode(),
        b"Nickel": "镍".encode(),
        b"Iron": "铁".encode(),
        b"Sand": "沙".encode(),
        b"Zinc": "锌".encode(),
        b"Platinum": "铂".encode(),
    }
    for source, expected in required_casefold_rules.items():
        if mappings.get(source) != expected or "i" not in flags_by_source.get(source, ""):
            raise SystemExit(f"required unambiguous case-insensitive rule missing: {source!r}")

    def runtime_mapping(source: bytes) -> bytes | None:
        """Resolve a literal as the runtime's exact and ASCII-folded tries do."""
        direct = mappings.get(source)
        if direct is not None:
            return direct
        folded = bytes(
            value + 32 if 0x41 <= value <= 0x5A else value
            for value in source
        )
        canonical = casefold_sources.get(folded)
        return mappings.get(canonical) if canonical is not None else None
    # Collector syntax must round-trip to raw CP437 bytes. A former build path
    # double-escaped these rules and made every sex-glyph template unreachable.
    if b"{s}, \x0b" not in sources or b"{s}, \x0c" not in sources:
        raise SystemExit("CP437 \\xNN local-source escapes were not decoded")
    if b"{s}, \\x0B" in sources or b"{s}, \\x0C" in sources:
        raise SystemExit("CP437 \\xNN local-source escapes were double-escaped")
    required_worldgen = {
        b"A shorter history means certain game elements might not be available.":
            "较短的历史可能会使某些游戏内容无法出现。".encode(),
        b"Allow Necromancer Summons": "允许死灵法师召唤物".encode(),
        b"Vanilla Interface {d}.{d}": "原版界面 {d}.{d}".encode(),
        b"The world generator is having trouble placing enough civilizations.":
            "世界生成器无法放置足够的文明。".encode(),
        b"Embark Points": "出发点数".encode(),
        b"End Year": "历史终止年份".encode(),
        b"Population Cap After Civ Creation": "文明生成后的人口上限".encode(),
        b"Site Cap After Civ Creation": "文明生成后的聚落上限".encode(),
        b"Percentage Beasts Dead For Stoppage":
            "停止历史演算所需的巨兽死亡比例".encode(),
        b"Year to Begin Checking Megabeast Percentage":
            "开始检查巨兽死亡比例的年份".encode(),
        b"Range: {d} to {d}": "范围：{d}～{d}".encode(),
        b"Range: -{d} to {d}": "范围：-{d}～{d}".encode(),
        b"Preparing elevation...": "正在生成地形高度……".encode(),
        b"Setting temperature...": "正在设置温度……".encode(),
        b"Running rivers...": "正在生成河流……".encode(),
        b"Forming lakes...": "正在生成湖泊……".encode(),
        b"The Fair Crest": "公正山巅".encode(),
        b"Surroundings: Joyous Wilds": "周边环境：欢悦荒野".encode(),
        b"Brook: Tribegladness": "小溪：欢欣部落".encode(),
        b"Taiga": "北方针叶林".encode(),
        b"Glacier": "冰川".encode(),
        b'C\x8Athuthaethera': "塞图瑟拉".encode(),
        b'"Minescald"': "“灼热矿井”".encode(),
        b"Mysterious lair": "神秘巢穴".encode(),
    }
    for source, expected in required_worldgen.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"required complete world-generation translation missing: {source!r}")

    required_settings_enums = {
        b"Seasonal": "每季度".encode(),
        b"Semiannual": "每半年".encode(),
        b"Yearly": "每年".encode(),
    }
    for source, expected in required_settings_enums.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"required settings enum translation missing: {source!r}")

    # Complete key identifiers are deliberately absent from the ordinary
    # dictionary.  The structured key-binding renderer preserves them as
    # canonical English and maps only SDL punctuation names to glyphs.  A
    # dictionary rule here could flash a localized key before page detection.
    forbidden_keycode_rules = {
        b"Up", b"Backspace", b"Space", b"Numpad Enter", b"Numpad 3",
        b"Shift+Right", b"Shift+Left", b"Shift+Numpad Enter",
        b"Shift+Numpad 4", b"Shift+Numpad 6", b"Shift+Numpad 7",
        b"Shift+Numpad 8", b"Mwheel down", b"Shift+Mwheel down",
        b"Ctrl+Mwheel up", b"Ctrl+Mwheel down",
    }
    leaked_keycode_rules = sorted(forbidden_keycode_rules & sources)
    if leaked_keycode_rules:
        raise SystemExit(
            "complete key codes leaked into translations.tsv: "
            + ", ".join(source.decode() for source in leaked_keycode_rules)
        )

    required_common_ui = {
        b"Population: \xf7{d}": "人口：约 {d}".encode(),
        b"Number of sites: {d}": "地点数量：{d}".encode(),
        b"Historical figure": "历史人物".encode(),
        b"Action or relationship": "行为或关系".encode(),
        b"Name your group": "为你的势力命名".encode(),
        b"Name your settlement": "为你的定居点命名".encode(),
        b"To save these settings, choose a name for this embark profile:":
            "要保存这些设置，请为此出发配置命名：".encode(),
        b"Placing caves... ({d})": "正在放置洞穴……（{d}）".encode(),
        b"Forming lakes... ({d})": "正在生成湖泊……（{d}）".encode(),
        b"Pickup equipment": "拾取装备".encode(),
        b"Unavailable as pet": "不可作为宠物".encode(),
        b"Grazer: requires pasture": "食草动物：需要牧场".encode(),
        b"Overall Training": "总体训练水平".encode(),
        b"save will be lost.": "都将丢失。".encode(),
    }
    for source, expected in required_common_ui.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"required common UI translation missing: {source!r}")

    required_secondary_ui = {
        b"This Version of DF uses FMOD Studio":
            "本版本《矮人要塞》使用 FMOD Studio".encode(),
        b"See the SDL folder for license information.":
            "许可证信息请参阅 SDL 文件夹。".encode(),
        b"Click a mod to open its folder.":
            "单击模组即可打开其文件夹。".encode(),
        b"These are the default Dwarf Fortress interactions,":
            "这些是《矮人要塞》的默认互动，".encode(),
        b"Sorting creature bodies...": "正在整理生物身体结构……".encode(),
        b"Placing creatures": "正在放置生物".encode(),
        b"Right click when done": "完成后单击右键".encode(),
        b"Assume Control": "接管控制".encode(),
        b"with {d} items": "携带 {d} 件物品".encode(),
        b"Last track: {s}": "上一首曲目：{s}".encode(),
        b"A Dwarven Outpost: You have arrived. After a":
            "矮人前哨：你终于抵达。经过漫长的".encode(),
        b"It speaks rapidly when it's excited.":
            "它激动时语速很快。".encode(),
    }
    for source, expected in required_secondary_ui.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"required secondary UI translation missing: {source!r}")

    # Arena condition names are fixed semantic labels.  They must never fall
    # through to the historical-name transliterator, and the selected-creature
    # summary uses a native ellipsized form of ``Animated corpse``.
    required_arena_conditions = {
        b"Animated c...": "活尸".encode(),
        b"Cursed": "受诅咒".encode(),
        b"Raised pale one": "复生苍白者".encode(),
        b"Raised hollow zombie": "复生空洞僵尸".encode(),
        b"Raised ruined ghoul": "复生破败食尸鬼".encode(),
        b"Raised interred slayer": "复生埋葬杀手".encode(),
        b"Raised coffin one": "复生棺中者".encode(),
        b"Raised fetid stalker": "复生腐臭潜行者".encode(),
        b"Raised sepulcher zombie": "复生墓穴僵尸".encode(),
        b"Follower of change": "变革追随者".encode(),
        b"Adept of change": "变革行家".encode(),
        b"Lord of change": "变革领主".encode(),
        b"Maelstrom priest": "漩涡祭司".encode(),
        b"Maelstrom worshipper": "漩涡信徒".encode(),
        b"Maelstrom ancient": "漩涡古老者".encode(),
        b"Maelstrom follower": "漩涡追随者".encode(),
        b"Ancient of chaos": "混沌古老者".encode(),
    }
    for source, expected in required_arena_conditions.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"required arena condition translation missing: {source!r}")

    required_credits = {
        b"Audio Director": "音频总监".encode(),
        b"Music By": "音乐".encode(),
        b"Lead Audio Programmer": "首席音频程序员".encode(),
        b"Created By": "创作".encode(),
        b"Artwork": "美术".encode(),
        b"Captain": "负责人".encode(),
        b"Commmunications": "社区沟通".encode(),
        b"Illustrator": "插画".encode(),
        b"Trailers": "宣传片".encode(),
        b"UX Advisor": "UX 顾问".encode(),
        b"Special Thanks": "特别感谢".encode(),
        b"Thank you to all of our supporters over the years,":
            "感谢多年来支持我们的所有人，".encode(),
        b"and everybody who has helped out on the forum and":
            "也感谢所有在论坛及其他地方伸出援手、".encode(),
        b"elsewhere to keep the project afloat these two":
            "让这个项目在过去二十年间得以延续的".encode(),
        b"decades.": "每一位朋友。".encode(),
    }
    for source, expected in required_credits.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"required credits translation missing: {source!r}")

    required_history_name_words = {
        b"Menace": "威胁".encode(),
        b"Nourishment": "滋养".encode(),
        b"Continents": "大陆".encode(),
    }
    for source, expected in required_history_name_words.items():
        if mappings.get(source) != expected:
            raise SystemExit(
                f"required wrapped historical-name word missing: {source!r}"
            )

    required_arena = {
        b"Welcome to the arena!": "欢迎来到竞技场！".encode(),
        b"Here you can test mods or just play around.":
            "你可以在此测试模组，也可以随意游玩。".encode(),
        b"Small arena": "小型竞技场".encode(),
        b"Forest": "森林".encode(),
        b"Classic Arena": "经典竞技场".encode(),
        b"Create arena": "创建竞技场".encode(),
        b"Arena profile": "竞技场配置".encode(),
        b"Creature": "生物".encode(),
        b"Skills": "技能".encode(),
        b"Equipment": "装备".encode(),
        b"Conditions": "状态".encode(),
        b"Create a creature to begin.": "请先创建一个生物。".encode(),
        b"Conflict Level": "冲突等级".encode(),
        b"Encounter": "遭遇战".encode(),
        b"Brawl": "斗殴".encode(),
        b"Non-lethal": "非致命".encode(),
        b"Horseplay": "打闹".encode(),
        b"Training": "训练".encode(),
        b"Lethal": "致命".encode(),
        b"No Quarter": "不留活口".encode(),
        b"Morale/Fear Off": "士气/恐惧：关闭".encode(),
        b"Morale/Fear On": "士气/恐惧：开启".encode(),
        b"No team/side": "无队伍/阵营".encode(),
        b"Independent": "独立阵营".encode(),
        b"Tame/mountable": "已驯服/可骑乘".encode(),
        b"afrovenator": "强颈猎龙".encode(),
        b"afrovenator man": "强颈猎龙人".encode(),
        b"afrovenator woman": "强颈猎龙人".encode(),
        b"Create a creature to": "创建一个生物，".encode(),
        b"place in the arena.": "并将其放入竞技场。".encode(),
        b"Hotkey: k": "快捷键：k".encode(),
        b"Add or remove fluids.": "添加或移除流体。".encode(),
        b"Hotkey: f": "快捷键：f".encode(),
        b"Change the weather,": "调整天气、".encode(),
        b"temperature, and time.": "温度和时间。".encode(),
        b"Hotkey: p": "快捷键：p".encode(),
    }
    for source, expected in required_arena.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"required complete arena translation missing: {source!r}")

    # Arena's procedural equipment generator draws its adjective, material,
    # and item type as separate runs. The runtime can only merge those runs
    # into one complete Chinese row when every finite adjective has an exact
    # translation; an unknown word would remain visible beside the overlay.
    entity_generator = (
        ROOT.parent
        / "data/vanilla/vanilla_procedural/scripts/generators/entities.lua"
    )
    if entity_generator.is_file():
        generator_prefix = entity_generator.read_text(
            encoding="utf-8", errors="replace"
        ).split("angel_item_info.armor.pants.gen.greaves", 1)[0]
        generated_equipment_adjectives = set(
            re.findall(r'^\s*"([a-z]+(?:-[a-z]+)*)"\s*,?\s*$',
                       generator_prefix, re.MULTILINE)
        )
        if len(generated_equipment_adjectives) < 25:
            raise SystemExit("vanilla generated-equipment adjective list is incomplete")
        for adjective in sorted(generated_equipment_adjectives):
            source = adjective.encode()
            target = mappings.get(source)
            if target is None or re.search(rb"[A-Za-z]", target):
                raise SystemExit(
                    f"generated equipment adjective is not fully translated: {adjective!r}"
                )

    # Mythical remnants are not a few fixed darkness entries. Vanilla's Lua
    # generator combines every one of six age adjectives with nineteen sphere
    # materials plus its explicit fallback. Require the complete 120-member
    # product so a newly encountered relic cannot expose a native suffix.
    remnant_adjectives = {
        "primordial": "原初", "elder": "上古", "cosmic": "宇宙",
        "primal": "原始", "elemental": "元素", "primeval": "太古",
    }
    remnant_materials = {
        "stone": "石质", "crystal": "晶质", "chaos": "混沌质",
        "darkness": "暗质", "dreamstuff": "梦质", "fire": "火质",
        "light": "光质", "lightning": "雷质", "metal": "金属质",
        "moonstone": "月石质", "mudstone": "泥石质", "ice": "冰质",
        "leaf": "叶质", "salt": "盐质", "cloudstuff": "云质",
        "stardust": "星尘质", "sunstone": "日石质", "wood": "木质",
        "obsidian": "黑曜石质", "glitchstuff": "异常质",
    }
    expected_remnants = {
        f"{adjective} {material}".encode():
            (adjective_zh + material_zh).encode()
        for adjective, adjective_zh in remnant_adjectives.items()
        for material, material_zh in remnant_materials.items()
    }
    if len(expected_remnants) != 120:
        raise SystemExit("mythical-remnant test product is incomplete")
    for source, expected in expected_remnants.items():
        if runtime_mapping(source) != expected:
            raise SystemExit(
                f"mythical-remnant material is not fully translated: {source!r}"
            )

    required_wood_material_words = {
        b"oaken": "橡木".encode(),
        b"mahogany": "桃花心木".encode(),
        b"chestnut": "栗木".encode(),
        b"ashen": "白蜡木".encode(),
        b"goblin-cap": "哥布林菇".encode(),
        b"wagon wood": "货车木质".encode(),
        b"wagon wooden": "货车木质".encode(),
    }
    for source, expected in required_wood_material_words.items():
        if runtime_mapping(source) != expected:
            raise SystemExit(f"wood material translation is missing: {source!r}")

    # These are the complete generated equipment rows collected from the live
    # Arena screen on this installation.  DF renders the adjective, material,
    # and item type as separately positioned runs, so every word range must be
    # coverable by one or more literal rules before the overlay can merge the
    # row without leaving an English fragment behind.
    observed_arena_equipment = {
        b"jagged candlenut arrows",
        b"jagged birchen arrows",
        b"jagged alder arrows",
        b"jagged iron spears",
        b"jagged nickel helms",
        b"jagged zinc helms",
        b"jagged brass helms",
        b"jagged steel helms",
        b"jagged lay pewter helms",
        b"jagged lead helms",
        b"jagged sterling silver helms",
        b"jagged black bronze helms",
        b"jagged billon helms",
        b"jagged rose gold helms",
        b"jagged rusted metal helms",
        b"jagged blazing metal helms",
        b"jagged slick metal helms",
        b"jagged singing metal helms",
        b"jagged frosty metal helms",
        b"jagged twisting metal helms",
    }

    def literal_equipment_coverage(source: bytes) -> list[tuple[bytes, bytes]] | None:
        words = source.split()
        covered: list[list[tuple[bytes, bytes]] | None] = [None] * (len(words) + 1)
        covered[0] = []
        for begin in range(len(words)):
            if covered[begin] is None:
                continue
            # Prefer longer material/item phrases when more than one complete
            # segmentation exists (for example `rose gold`).
            for end in range(len(words), begin, -1):
                phrase = b" ".join(words[begin:end])
                target = runtime_mapping(phrase)
                if not target or re.search(rb"[A-Za-z]", target):
                    continue
                if covered[end] is None:
                    covered[end] = covered[begin] + [(phrase, target)]
        return covered[-1]

    for source in sorted(observed_arena_equipment):
        if literal_equipment_coverage(source) is None:
            raise SystemExit(
                f"arena equipment row contains an untranslated fragment: {source!r}"
            )

    # The vanilla extinct-creature pack contains 100 animals plus one
    # animal-person record for every animal.  Keep this coverage finite and
    # reviewable: none may fall through to phonetic transliteration, and names
    # must not reintroduce real-world locations embedded in scientific names.
    extinct_rows: list[tuple[str, str, str]] = []
    extinct_table = ROOT / "data/runtime/extinct-creatures.tsv"
    for line_no, raw in enumerate(extinct_table.read_text(encoding="utf-8-sig").splitlines(), 1):
        if not raw or raw.startswith("#"):
            continue
        fields = raw.split("\t")
        if len(fields) != 3 or not all(field.strip() for field in fields):
            raise SystemExit(f"extinct-creatures.tsv:{line_no}: malformed row")
        extinct_rows.append(tuple(field.strip() for field in fields))
    if len(extinct_rows) != 100:
        raise SystemExit(f"expected all 100 vanilla extinct creatures, found {len(extinct_rows)}")
    if len({singular for singular, _plural, _target in extinct_rows}) != 100:
        raise SystemExit("extinct-creatures.tsv contains duplicate English names")
    if len({target for _singular, _plural, target in extinct_rows}) != 100:
        raise SystemExit("extinct-creatures.tsv contains duplicate Chinese names")

    earth_locations = {
        "非洲", "欧洲", "亚洲", "美洲", "北美", "南美", "中国", "印度",
        "蒙古", "犹他", "埃及", "苏州", "青岛", "热河", "海口", "阿根廷",
        "加拿大", "墨西哥", "巴西", "德国", "法国", "英国", "美国", "日本",
        "俄罗斯", "澳洲", "澳大利亚",
    }
    for singular, plural, translated in extinct_rows:
        if re.search(r"[A-Za-z]", translated):
            raise SystemExit(f"extinct creature was left as Latin text: {singular!r}")
        if any(location in translated for location in earth_locations):
            raise SystemExit(f"extinct creature contains an Earth location: {singular!r}")
        for source_text in {singular, plural}:
            source = source_text.encode()
            if mappings.get(source) != translated.encode():
                raise SystemExit(f"extinct creature translation missing: {source_text!r}")
            if not {"w", "i"}.issubset(flags_by_source.get(source, "")):
                raise SystemExit(f"extinct creature rule is not case-safe: {source_text!r}")
        for suffix in (" man", " men", " woman", " women"):
            source = (singular + suffix).encode()
            expected = (translated + "人").encode()
            if mappings.get(source) != expected:
                raise SystemExit(f"extinct animal-person translation missing: {singular + suffix!r}")

    # Longer local rules win over their contained base name at runtime.  Make
    # sure derivatives such as juveniles, trained animals, and leather do not
    # preserve an older phonetic name after the base vocabulary is corrected.
    extinct_by_source = {singular: target for singular, _plural, target in extinct_rows}
    for line_no, raw in enumerate(
        (ROOT / "data/runtime/local-overrides.tsv").read_text(encoding="utf-8-sig").splitlines(), 1
    ):
        if not raw or raw.startswith("#"):
            continue
        fields = raw.split("\t")
        if len(fields) < 2:
            continue
        local_source, local_target = fields[:2]
        for singular, translated in extinct_by_source.items():
            if singular in local_source.lower() and local_source.lower() != singular:
                if translated not in local_target:
                    raise SystemExit(
                        f"local-overrides.tsv:{line_no}: extinct derivative uses an "
                        f"inconsistent name for {singular!r}"
                    )

    raw_root = ROOT.parent / "data/vanilla/vanilla_creatures_extinct/objects"
    if raw_root.is_dir():
        raw_names: set[tuple[str, str]] = set()
        for path in sorted(raw_root.glob("creature_*.txt")):
            current_is_base = False
            for line in path.read_text(encoding="cp437", errors="replace").splitlines():
                stripped = line.strip()
                match = re.match(r"^\[CREATURE:([^]]+)\]", stripped)
                if match:
                    current_is_base = not match.group(1).endswith("_MAN")
                    continue
                if current_is_base and stripped.startswith("[NAME:"):
                    names = stripped[6:-1].split(":")
                    if len(names) >= 2:
                        raw_names.add((names[0], names[1]))
                    current_is_base = False
        table_names = {(singular, plural) for singular, plural, _target in extinct_rows}
        if raw_names != table_names:
            missing = sorted(raw_names - table_names)
            stale = sorted(table_names - raw_names)
            raise SystemExit(
                f"extinct table does not match installed raws; missing={missing}, stale={stale}"
            )

    # Cover several upstream naming styles and a multiword animal name. All
    # animal-person sexes share one label because the picker displays ♀/♂ in
    # a separate column.
    required_animal_people = {
        b"aardvark man": "土豚人".encode(),
        b"aardvark woman": "土豚人".encode(),
        b"alligator man": "短吻鳄人".encode(),
        b"alligator woman": "短吻鳄人".encode(),
        b"brown recluse spider man": "棕色遁蛛人".encode(),
        b"brown recluse spider woman": "棕色遁蛛人".encode(),
    }
    for source, expected in required_animal_people.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"animal-person naming is not normalized: {source!r}")

    # These are bespoke subterranean fantasy species, not generic biological
    # categories.  Their raw descriptions identify a walking frog, a scaled
    # lizard humanoid, a serpent humanoid, and a spiky-furred rodent humanoid
    # respectively.  The serpent's current sprite is green, so its UI name
    # must not hard-code the raw description's contradictory white color.
    # Do not regress to mechanical labels such as
    # ``两栖动物人`` or ``啮齿动物人``.
    required_subterranean_people = {
        b"amphibian man": "地底蛙人".encode(),
        b"amphibian men": "地底蛙人".encode(),
        b"amphibian woman": "地底蛙人".encode(),
        b"amphibian women": "地底蛙人".encode(),
        b"reptile man": "地底蜥蜴人".encode(),
        b"reptile men": "地底蜥蜴人".encode(),
        b"reptile woman": "地底蜥蜴人".encode(),
        b"reptile women": "地底蜥蜴人".encode(),
        b"serpent man": "地底蛇人".encode(),
        b"serpent men": "地底蛇人".encode(),
        b"serpent woman": "地底蛇人".encode(),
        b"serpent women": "地底蛇人".encode(),
        b"rodent man": "地底刺毛鼠人".encode(),
        b"rodent men": "地底刺毛鼠人".encode(),
        b"rodent woman": "地底刺毛鼠人".encode(),
        b"rodent women": "地底刺毛鼠人".encode(),
    }
    for source, expected in required_subterranean_people.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"subterranean-person name is still mechanical: {source!r}")
    required_serpent_derivatives = {
        b"serpent man venom": "地底蛇人毒液".encode(),
        b"frozen serpent man venom": "冻结的地底蛇人毒液".encode(),
        b"boiling serpent man venom": "沸腾的地底蛇人毒液".encode(),
        b"serpent man bite": "地底蛇人咬伤".encode(),
        b"weregila monster": "狂化钝尾毒蜥".encode(),
    }
    for source, expected in required_serpent_derivatives.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"reviewed fantasy-creature translation regressed: {source!r}")
    required_combat_skills = {
        b"Fighter": "战士".encode(),
        b"Archer": "射手".encode(),
        b"Axeman": "斧手".encode(),
        b"Swordsman": "剑士".encode(),
        b"Knife User": "短刀手".encode(),
        b"Maceman": "钉头锤手".encode(),
        b"Hammerman": "战锤手".encode(),
        b"Spearman": "矛手".encode(),
        b"Pikeman": "长枪手".encode(),
        b"Lasher": "鞭手".encode(),
        b"Crossbowman": "弩手".encode(),
        b"Bowman": "弓手".encode(),
        b"Blowgunner": "吹箭手".encode(),
        b"Wrestler": "摔跤手".encode(),
        b"Striker": "拳击手".encode(),
        b"Kicker": "踢击手".encode(),
    }
    for source, expected in required_combat_skills.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"combat skill terminology regressed: {source!r}")
    if mappings.get(b"Adept") != "精熟".encode():
        raise SystemExit("Adept skill tier regressed to an inconsistent adjective")
    if any("地底白蛇人" in target.decode("utf-8", errors="ignore")
           for target in mappings.values()):
        raise SystemExit("sprite-inconsistent term 地底白蛇人 remains")
    if any("兽化" in target.decode("utf-8", errors="ignore")
           for target in mappings.values()):
        raise SystemExit("semantically inverted werebeast term 兽化 remains")
    if any("变形怪" in target.decode("utf-8", errors="ignore")
           for target in mappings.values()):
        raise SystemExit("overly generic werebeast term 变形怪 remains")
    if any("月咒" in target.decode("utf-8", errors="ignore")
           for target in mappings.values()):
        raise SystemExit("superseded werebeast term 月咒 remains")
    mechanical_person_terms = (
        "两栖动物人", "爬行动物人", "啮齿动物人",
    )
    for source, target in mappings.items():
        decoded = target.decode("utf-8", errors="ignore")
        if any(term in decoded for term in mechanical_person_terms):
            raise SystemExit(f"mechanical biological-category name remains: {source!r}")

    required_ant_people = {
        b"worker ant woman": "工蚁人".encode(),
        b"worker ant women": "工蚁人".encode(),
        b"soldier ant woman": "兵蚁人".encode(),
        b"soldier ant women": "兵蚁人".encode(),
        b"drone ant man": "蚁人".encode(),
        b"drone ant men": "蚁人".encode(),
        b"queen ant woman": "蚁人".encode(),
        b"queen ant women": "蚁人".encode(),
    }
    for source, expected in required_ant_people.items():
        if mappings.get(source) != expected:
            raise SystemExit(f"ant-person caste name is inconsistent: {source!r}")
    if any("蚁后人" in target.decode("utf-8", errors="ignore")
           for target in mappings.values()):
        raise SystemExit("queen ant person must be rendered as 蚁人, not 蚁后人")

    required_creature_names = {
        b"blizzard man": "暴雪魔人".encode(),
        b"blizzard men": "暴雪魔人".encode(),
        b"bogeyman": "夜魔".encode(),
        b"bogeymen": "夜魔".encode(),
        b"Cat": "猫".encode(),
        b"cat": "猫".encode(),
        b"cow": "牛".encode(),
        b"cows": "牛".encode(),
        b"bull": "牛".encode(),
        b"bulls": "牛".encode(),
        b"duck": "鸭".encode(),
        b"ducks": "鸭".encode(),
        b"Giant": "巨人".encode(),
        b"giants": "巨人".encode(),
        b"hydra": "九头蛇".encode(),
        b"hydras": "九头蛇".encode(),
        b'{s}, "{s}", female hydra': '{s}，“{s}”，九头蛇'.encode(),
        b'{s}, "{s}", male hydra': '{s}，“{s}”，九头蛇'.encode(),
        b"goblin": "哥布林".encode(),
        b"goblins": "哥布林".encode(),
        b"Goblins": "哥布林".encode(),
        b"Dark goblin pits": "黑暗哥布林坑".encode(),
        b"Gremlin": "小精怪".encode(),
        b"gremlin": "小精怪".encode(),
        b"gremlins": "小精怪".encode(),
        b"grimeling": "沼泽草怪".encode(),
        b"grimelings": "沼泽草怪".encode(),
        b"ogre": "食人魔".encode(),
        b"ogres": "食人魔".encode(),
        b"ogress": "食人魔".encode(),
        b"ogresses": "食人魔".encode(),
        b"pike": "狗鱼".encode(),
        b"pike fry": "狗鱼幼鱼".encode(),
        b"satyr": "半羊人".encode(),
        b"satyrs": "半羊人".encode(),
        b"kingsnake": "王蛇".encode(),
        b"kingsnakes": "王蛇".encode(),
        b"giant kingsnake": "巨型王蛇".encode(),
        b"giant kingsnakes": "巨型王蛇".encode(),
        b"kingsnake man": "王蛇人".encode(),
        b"kingsnake men": "王蛇人".encode(),
        b"kingsnake woman": "王蛇人".encode(),
        b"kingsnake women": "王蛇人".encode(),
        b"gigantic panda": "巨型熊猫".encode(),
        b"gigantic pandas": "巨型熊猫".encode(),
        b"gigantic squid": "巨型鱿鱼".encode(),
        b"gigantic squids": "巨型鱿鱼".encode(),
        b"gigantic tortoise": "巨型陆龟".encode(),
        b"gigantic tortoises": "巨型陆龟".encode(),
        b"glyptodon sow": "雕齿兽".encode(),
        b"glyptodon sows": "雕齿兽".encode(),
        b"glyptodon boar": "雕齿兽".encode(),
        b"glyptodon boars": "雕齿兽".encode(),
        b"kelenken hen": "窃鹤".encode(),
        b"kelenken hens": "窃鹤".encode(),
        b"kelenken cock": "窃鹤".encode(),
        b"kelenken cocks": "窃鹤".encode(),
        b"moa hen": "恐鸟".encode(),
        b"moa hens": "恐鸟".encode(),
        b"moa cock": "恐鸟".encode(),
        b"moa cocks": "恐鸟".encode(),
        b"dodo": "渡渡鸟".encode(),
        b"dodos": "渡渡鸟".encode(),
        b"dodo hen": "渡渡鸟".encode(),
        b"dodo hens": "渡渡鸟".encode(),
        b"dodo cock": "渡渡鸟".encode(),
        b"dodo cocks": "渡渡鸟".encode(),
        b"dodo man": "渡渡鸟人".encode(),
        b"dodo woman": "渡渡鸟人".encode(),
    }
    for source, expected in required_creature_names.items():
        if runtime_mapping(source) != expected:
            raise SystemExit(f"reviewed creature name regressed: {source!r}")
    for source in (b"duck", b"ducks"):
        if "i" not in flags_by_source.get(source, ""):
            raise SystemExit(f"creature capitalization is not covered: {source!r}")
    rejected_creature_terms = (
        "暴风雪人", "博盖玛恩", "钝喙地鸟", "皇帝蛇", "超巨型", "雕齿兽猪",
        "小妖出现", "麻烦鬼", "水鬼", "萨堤尔", "萨提尔",
    )
    for source, target in mappings.items():
        decoded = target.decode("utf-8", errors="ignore")
        if any(term in decoded for term in rejected_creature_terms):
            raise SystemExit(f"rejected creature translation remains: {source!r}")

    caste_path = ROOT / "data/runtime/rulesets/zh-Hans/creatures/caste.toml"
    caste_document = tomllib.loads(caste_path.read_text(encoding="utf-8"))
    caste_sources: set[str] = set()
    for ruleset in caste_document.get("rulesets", []):
        caste_sources.update(
            source for source in ruleset.get("rules", {}) if isinstance(source, str)
        )
    male_bases = {source[:-4] for source in caste_sources if source.endswith(" man")}
    female_bases = {
        source[:-6] for source in caste_sources if source.endswith(" woman")
    }
    animal_person_bases = male_bases & female_bases
    if len(animal_person_bases) < 180:
        raise SystemExit("upstream animal-person family list is unexpectedly incomplete")
    for base in animal_person_bases:
        rendered: dict[str, str] = {}
        for suffix in (" man", " men", " woman", " women"):
            source = (base + suffix).encode()
            target = mappings.get(source)
            if target is None:
                raise SystemExit(f"animal-person family is incomplete: {base + suffix!r}")
            rendered[suffix] = target.decode()
        if not (rendered[" man"].endswith("人") and
                rendered[" man"] == rendered[" men"] ==
                rendered[" woman"] == rendered[" women"] and
                not any(marker in rendered[" man"] for marker in "雌雄公母")):
            raise SystemExit(f"animal-person family is inconsistent: {base!r}")

    # Exhaustively audit every installed vanilla creature and caste name. This
    # catches ordinary animal sex castes (hen/cock, bull/cow, etc.), extinct
    # creatures, animal people, and special castes without touching prose such
    # as 母语, 父母, 公告, or 公平.
    raw_roots = (
        ROOT.parent / "data/vanilla/vanilla_creatures/objects",
        ROOT.parent / "data/vanilla/vanilla_creatures_extinct/objects",
    )
    raw_creature_sources: set[bytes] = set()
    name_pattern = re.compile(r"^\[(?:NAME|CASTE_NAME):([^]:]*):([^]:]*)[:\]]")
    for raw_root in raw_roots:
        if not raw_root.is_dir():
            continue
        for path in sorted(raw_root.glob("creature_*.txt")):
            for line in path.read_text(encoding="cp437", errors="replace").splitlines():
                match = name_pattern.match(line.strip())
                if match:
                    raw_creature_sources.update(
                        part.strip().encode("cp437") for part in match.groups() if part.strip()
                    )
    forbidden_gender_markers = tuple(marker.encode() for marker in "雌雄公母")
    offenders = []
    for source in raw_creature_sources:
        if source not in mappings:
            continue
        target = mappings[source]
        # 水母 is the ordinary Chinese noun for jellyfish, not a caste marker.
        # Strip only this source-qualified homograph before auditing the name.
        if b"jellyfish" in source.lower():
            target = target.replace("水母".encode(), b"")
        if any(marker in target for marker in forbidden_gender_markers):
            offenders.append(source)
    if offenders:
        raise SystemExit(f"gender marker remains in creature names: {sorted(offenders)[:10]!r}")

    neutral_name_rows = {
        b"Select crow man": "选择乌鸦人".encode(),
        b"Crow man, Ordinary": "乌鸦人，普通".encode(),
        b"Crow woman, \x0C": "乌鸦人，♀".encode(),
        b"Crow man, \x0B": "乌鸦人，♂".encode(),
        b'{s}, "{s}", female dragon': '{s}，“{s}”，巨龙'.encode(),
        b'{s}, "{s}", male dragon': '{s}，“{s}”，巨龙'.encode(),
        b'{s}, "{s}", female hydra': '{s}，“{s}”，九头蛇'.encode(),
        b'{s}, "{s}", male hydra': '{s}，“{s}”，九头蛇'.encode(),
        b'{s}, "{s}", female roc': '{s}，“{s}”，大鹏'.encode(),
        b'{s}, "{s}", male roc': '{s}，“{s}”，大鹏'.encode(),
    }
    for source, expected in neutral_name_rows.items():
        source = source.replace(b"\\x0C", bytes([0x0C])).replace(b"\\x0B", bytes([0x0B]))
        if mappings.get(source) != expected:
            raise SystemExit(f"derived creature-name row is not gender-neutral: {source!r}")

    arena_sidebar_labels = {
        b"Conflict Level", b"Encounter", b"Brawl", b"Non-lethal",
        b"Horseplay", b"Training", b"Lethal", b"No Quarter",
        b"Morale/Fear Off", b"Morale/Fear On", b"No team/side",
    }
    for source in arena_sidebar_labels:
        if "l" not in flags_by_source.get(source, ""):
            raise SystemExit(f"arena sidebar translation must be left-aligned: {source!r}")

    # Every vanilla surface biome and world-site type that can appear in the
    # embark sidebar must have a finite literal rule. The procedural resolver
    # remains the fallback for modded combinations and generated proper names.
    required_embark_labels = {
        "Mountain", "Glacier", "Tundra", "Taiga",
        "Temperate Conifer Forest", "Temperate Coniferous Forest",
        "Temperate Conif Forest", "Temperate Broadleaf Forest",
        "Temperate Brdlf Forest", "Tropical Conifer Forest",
        "Tropical Coniferous Forest", "Tropical Conif Forest",
        "Tropical Dry Broadleaf Forest", "Tropical Dry Brdlf Forest",
        "Tropical Dry Brdlf Forst", "Tropical Moist Broadleaf Forest",
        "Tropical Moist Brdlf Forest", "Tropical Moist Brdlf Forst",
        "Temperate Grassland", "Tropical Grassland", "Temperate Savanna",
        "Tropical Savanna", "Temperate Shrubland", "Tropical Shrubland",
        "Temperate Freshwater Swamp", "Temperate Saltwater Swamp",
        "Tropical Freshwater Swamp", "Tropical Saltwater Swamp",
        "Mangrove Swamp", "Temperate Freshwater Marsh",
        "Temperate Saltwater Marsh", "Tropical Freshwater Marsh",
        "Tropical Saltwater Marsh", "Badland", "Badlands", "Rock Desert",
        "Rocky Wasteland", "Sand Desert", "Arctic Ocean", "Temperate Ocean",
        "Tropical Ocean", "Temperate Freshwater Lake", "Temperate Brackish Lake",
        "Temperate Saltwater Lake", "Tropical Freshwater Lake",
        "Tropical Brackish Lake", "Tropical Saltwater Lake",
        "Temperate Freshwater Pool", "Temperate Brackish Pool",
        "Temperate Saltwater Pool", "Tropical Freshwater Pool",
        "Tropical Brackish Pool", "Tropical Saltwater Pool",
        "Temperate Freshwater River", "Temperate Brackish River",
        "Temperate Saltwater River", "Tropical Freshwater River",
        "Tropical Brackish River", "Tropical Saltwater River",
        "Fortress", "Mountain halls", "Hillocks", "Dark fortress", "Pits",
        "Cave", "Forest retreat", "Town", "Hamlet", "Important location",
        "Labyrinth", "Lair", "Shrine", "Tower", "Monastery", "Fort",
        "Castle", "Camp", "Tomb", "Vault", "Monument", "Site",
        "Mysterious lair", "Abandoned hillock", "Abandoned hillocks",
        "Ruined hillock", "Ruined hillocks", "Abandoned house",
        "Abandoned houses", "Abandoned shop", "Ruined house", "Ruined houses",
    }
    missing_embark = sorted(
        source for source in required_embark_labels if source.encode() not in mappings
    )
    if missing_embark:
        raise SystemExit("incomplete embark label coverage: " + ", ".join(missing_embark))
    latin = re.compile(rb"[A-Za-z]")
    leaked_embark = sorted(
        source for source in required_embark_labels if latin.search(mappings[source.encode()])
    )
    if leaked_embark:
        raise SystemExit("English remains in embark label translations: " + ", ".join(leaked_embark))
    procedural = ROOT / "data/runtime/procedural-terms.tsv"
    overrides = ROOT / "data/runtime/procedural-term-overrides.tsv"
    procedural_mappings: dict[str, str] = {}
    for line_no, line in enumerate(procedural.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) != 2 or not fields[0] or not fields[1]:
            raise SystemExit(f"procedural-terms.tsv:{line_no}: expected 2 fields")
        source, target = fields
        if source != source.lower() or not re.fullmatch(r"[a-z]+(?:-[a-z]+)*", source):
            raise SystemExit(f"procedural-terms.tsv:{line_no}: invalid English form {source!r}")
        if source in procedural_mappings:
            raise SystemExit(f"procedural-terms.tsv:{line_no}: duplicate form {source!r}")
        repeated = any(
            target[start : start + size] * 3 == target[start : start + size * 3]
            for start in range(len(target))
            for size in range(1, min(4, (len(target) - start) // 3) + 1)
        )
        if len(target) > 12 or not re.fullmatch(r"[\u3400-\u9fff]+", target) or repeated:
            raise SystemExit(f"procedural-terms.tsv:{line_no}: unsafe gloss {target!r}")
        procedural_mappings[source] = target
    if len(procedural_mappings) < 5900:
        raise SystemExit(f"procedural vocabulary is incomplete: {len(procedural_mappings)} forms")
    for line_no, line in enumerate(overrides.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) != 2 or procedural_mappings.get(fields[0]) != fields[1]:
            raise SystemExit(
                f"procedural-term-overrides.tsv:{line_no}: generated vocabulary is stale"
            )
    required_procedural = {
        "fair": "公正",
        "crest": "山巅",
        "joyous": "欢悦",
        "wilds": "荒野",
        "gladness": "欢欣",
        "tribe": "宗族",
        "taiga": "北方针叶林",
        "glacier": "冰川",
        "lair": "巢穴",
        "minescald": "灼热矿井",
    }
    for source, expected in required_procedural.items():
        if procedural_mappings.get(source) != expected:
            raise SystemExit(f"required procedural gloss missing: {source!r}")

    print(
        f"DFCN translation checks passed: {rules} rules, {templates} templates, "
        f"{len(procedural_mappings)} procedural forms, "
        f"{len(required_embark_labels)} complete embark labels"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
