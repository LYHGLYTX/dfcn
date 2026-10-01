"""Import scoped, recursive announcement grammar into the ordinary reloadable map.

Rows are scope<TAB>source<TAB>target<TAB>field scopes<TAB>native provenance.
The enclosing grammar gives every capture a semantic type. Its synthetic key
cannot match visible game text and is deliberately not a global word rule.
"""

from pathlib import Path
import re


def combat_entries(path: Path, entry_type):
    entries = []
    seen = {}
    for line_no, raw in enumerate(path.read_text(encoding="utf-8-sig").splitlines(), 1):
        if not raw.strip() or raw.lstrip().startswith("#"):
            continue
        fields = raw.split("\t")
        if len(fields) != 5:
            raise ValueError(f"{path}:{line_no}: expected five combat grammar fields")
        scope, source, target, signature, provenance = fields
        kinds = signature.split(",") if signature else []
        if not re.fullmatch(r"[a-z][a-z-]*", scope) or not source or not target or not provenance:
            raise ValueError(f"{path}:{line_no}: incomplete scoped combat rule")
        if any(not re.fullmatch(r"\$?[a-z][a-z-]*", kind) for kind in kinds):
            raise ValueError(f"{path}:{line_no}: invalid combat field scope")
        if re.sub(r"\{s\}", "", source).count("{") or "}" in re.sub(r"\{s\}", "", source):
            raise ValueError(f"{path}:{line_no}: combat captures must use {{s}}")
        count = source.count("{s}")
        if len(kinds) != count:
            raise ValueError(f"{path}:{line_no}: semantic field count mismatch")
        target_fields = re.findall(r"\{s([1-9][0-9]*)\}", target)
        if sorted(map(int, target_fields)) != list(range(1, count + 1)) or re.search(
                r"[{}]", re.sub(r"\{s[1-9][0-9]*\}", "", target)):
            raise ValueError(f"{path}:{line_no}: target must retain every capture once")
        key = f"Announcement combat {scope} [{signature}]: {source}"
        if key in seen:
            if seen[key] != target:
                raise ValueError(f"{path}:{line_no}: conflicting combat grammar target")
            continue
        seen[key] = target
        # Parsing is scoped and performed by announcement_combat.inc. Ordinary
        # lt only knows its own capture semantics and must not compile this key.
        entries.append(entry_type(key, target, "l", "DFCN announcement combat", 410))
    return entries
