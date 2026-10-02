"""Compile reviewed Legends event families, not save-specific sentences.

Input: source<TAB>target<TAB>mode. `action` supplies a predicate and compiles
named/unnamed/entity participants, omitted subjects and coordinated actions.
`event` supplies a complete clause. Both support native location/time suffixes.
`clause` is a literal/template used as-is; `term` is a scoped semantic term.
`reputation` also exposes that complete label to adventurer People cards,
including scrolled labels whose Reputation heading is no longer visible.
`statement` is a complete clause with its own subject, also emitted in native
sentence-initial/lowercase and "and ..." forms. Chinese separates the latter
with a comma, not the noun-list connector or a shared-subject action prefix.
`title` is a reviewed event summary, also usable inside another event's {e}.
`interaction-action` is a reviewed procedural IS_HIST_STRING pair. It supplies
the ordinary action and its native "the moment when ..." event summary from
the same predicate, retaining both participants and the complete interaction.
`age` is a named historical era, shared by event terms and BOOK_INSTRUCTION's
`[NAME] In [ANY_AGE]` titles, with optional article and title-case spelling.
`description` is a recursive physical-description noun phrase, not prose.
`identity` is a quoted or unnamed historical identity; it never enters the
prose or participant grammars and preserves a complete person's link.
`creature-status` is a description prefix shared with typed species/castes.
Its source and target each end in one {s}; vocabulary generation reuses it.
`continuation` is a visible clipped prefix, isolated from complete prose in hC.
`office` and `office-prefix` supply the finite generated office vocabulary.
Their combinations compile into complete scoped terms, never global words.
`civic-domain` and `civic-office` supply the separate municipal duty/title
family. Its components are not standalone terms or court-rank combinations.
`religious-prefix` combines a priest-rank prefix with the installed RAW
noun forms and their shared WORD-aware senses, not the court/civic roles.
Homonymous nouns may reuse the existing procedural-name default when it is
one of their shared noun senses. Only complete titles become scoped terms.
`behavior` supplies a generated creature sentence, including its native
coordination with an optional "It has ..." appendage description.
`experiment-origin` and `failed-experiment-origin` frame the native night
creature origin. Their {s} is a compile-time method slot, replaced by one
reviewed `experiment-method`, `failed-experiment-method` or shared
`experiment-power`. The method's {a} slot receives an optional reviewed
`experiment-subject`; all resulting person/species/place captures stay typed.
`response` is an action that can carry a reviewed `concession`. These two
finite catalogues compile whole "..., despite ..." clauses in Chinese order;
the reason is not an unrestricted prose/name capture.
`mortality-action` and `mortality-reason` compile the reviewed mortality
predicate and its single terminal motivation with the cause before the action.
Their ordinary action/clause forms remain available for other native contexts.
`{q}` is a color capture resolved only through the shared color vocabulary.
All emitted entries stay in the h namespace and retain numbered link captures.
"""

from collections import Counter
from pathlib import Path
import re
from extract_workshop_tooltip_catalog import native_game_directory


FIELD = re.compile(r"\{([anpsricdebtqkmvuf])([1-9][0-9]*)?\}")


def creature_status_prefix(source: str, target: str) -> tuple[str, str]:
    if (not re.fullmatch(r"[a-z]+(?: [a-z]+)* \{s\}", source) or
            not target.endswith("{s}") or not target[:-3] or
            "{" in target[:-3] or "}" in target[:-3]):
        raise ValueError(f"creature status requires one trailing species field: {source!r}")
    return source[:-4], target[:-3]


def religious_name_nouns(root: Path) -> dict[str, str]:
    """Use native noun inflections without creating another title glossary.

    The highest-priest builder appends one generated language WORD's noun,
    singular or plural, to its chosen prefix. English alone cannot distinguish
    different WORD IDs with homonymous nouns. Reuse the existing text-only
    name default only when it agrees with one of their reviewed noun senses;
    otherwise leave the form unresolved. Never choose by RAW iteration order.
    """
    senses = {}
    senses_path = root / "procedural-word-senses.tsv"
    for number, line in enumerate(senses_path.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) != 4:
            raise ValueError(f"{senses_path}:{number}: expected WORD, POS, lemma, target")
        word, part, lemma, target = fields
        if part == "NOUN":
            if word in senses or not lemma or not target:
                raise ValueError(f"{senses_path}:{number}: invalid/duplicate noun sense")
            senses[word] = (lemma, target)

    raw_path = native_game_directory() / "data/vanilla/vanilla_languages/objects/language_words.txt"
    forms: dict[str, set[str]] = {}
    word = ""
    for match in re.finditer(r"^\s*\[(WORD|NOUN):([^\]]+)\]",
                             raw_path.read_text(encoding="utf-8"), re.MULTILINE):
        if match[1] == "WORD":
            word = match[2]
            continue
        nouns = match[2].split(":")
        sense = senses.get(word)
        if len(nouns) != 2 or sense is None or nouns[0] != sense[0]:
            raise ValueError(f"{raw_path}: missing/mismatched shared noun sense for {word}")
        for noun in nouns:
            if noun:
                forms.setdefault(noun.lower(), set()).add(sense[1])
    defaults: dict[str, str] = {}
    for filename in ("procedural-terms.tsv", "procedural-term-overrides.tsv"):
        defaults_path = root / filename
        for number, line in enumerate(defaults_path.read_text(encoding="utf-8").splitlines(), 1):
            if not line or line.startswith("#"):
                continue
            fields = line.split("\t")
            if len(fields) != 2 or not fields[0] or not fields[1]:
                raise ValueError(f"{defaults_path}:{number}: expected source and target")
            defaults[fields[0].lower()] = fields[1]

    resolved = {}
    for form, targets in forms.items():
        if len(targets) == 1:
            resolved[form] = next(iter(targets))
        elif defaults.get(form) in targets:
            # A title contains no WORD ID. Keep its homonym on the same
            # default as other text-only names, without changing explicit
            # WORD senses or admitting unrelated UI/verb dictionary meanings.
            resolved[form] = defaults[form]
    return resolved


def indexed(source: str, target: str) -> tuple[str, Counter]:
    counts = Counter(kind for kind, _ in FIELD.findall(source))
    cursors: Counter = Counter()
    used = set()

    def replace(match):
        kind, index = match.groups()
        if index is None:
            cursors[kind] += 1
            index = cursors[kind]
        else:
            index = int(index)
        if index > counts[kind] or (kind, index) in used:
            raise ValueError(f"invalid/repeated capture in {source!r}: {match.group()}")
        used.add((kind, index))
        return f"{{{kind}{index}}}"

    result = FIELD.sub(replace, target)
    if len(used) != sum(counts.values()):
        raise ValueError(f"missing target capture: {source!r}")
    return result, counts


def compile_events(path: Path) -> list[tuple[str, str, str]]:
    entries: dict[tuple[str, str], tuple[str, str, str]] = {}
    priorities: dict[tuple[str, str], int] = {}
    offices: list[tuple[str, str]] = []
    office_prefixes: list[tuple[str, str]] = []
    civic_domains: list[tuple[str, str]] = []
    civic_offices: list[tuple[str, str]] = []
    religious_prefixes: list[tuple[str, str]] = []
    responses: list[tuple[str, str]] = []
    concessions: list[tuple[str, str]] = []
    mortality_actions: list[tuple[str, str]] = []
    mortality_reasons: list[tuple[str, str]] = []
    experiment_origins: list[tuple[str, str, bool]] = []
    experiment_methods: list[tuple[str, str, bool | None]] = []
    experiment_subjects: list[tuple[str, str]] = [("", "")]

    def emit(source, target, priority=3, namespace=""):
        # Validation is part of compilation: never publish a malformed rule
        # which could silently lose a participant or interchange two links.
        target, _ = indexed(source, target)
        entry = (source, target, ("ht" if FIELD.search(source) else "h") + namespace)
        # Clipped fragments and historical identities must not replace a
        # complete prose production of the same spelling, or each other.
        scope = next((flag for flag in ("C", "N") if flag in namespace), "")
        key = (source, scope)
        if priority < priorities.get(key, 0):
            return
        if priority == priorities.get(key, 0) and entries[key] != entry:
            raise ValueError(f"conflicting Legends family: {source!r}")
        entries[key] = entry
        priorities[key] = priority

    def event(source, target, connective="", namespace="", subject=None):
        target, counts = indexed(source, target)

        def adjunct(text):
            # Only action productions have a known subject/predicate boundary.
            # Keep location/time next to their predicate instead of producing
            # "date, at place, person ...". Complete clauses/titles retain their
            # independently reviewed ordering; never rewrite rendered text.
            if subject is None:
                return text + "，" + target
            return subject + text + target[len(subject):]

        suffixes = [("", target)]
        for preposition in ("in", "at", "within"):
            suffixes.append((f" {preposition} {{p}}",
                             adjunct(f"在{{p{counts['p'] + 1}}}")))
        suffixes.append((" during {e}", adjunct(f"在{{e{counts['e'] + 1}}}期间")))
        suffixes.append((" in the wilds", adjunct("在荒野中")))
        if "E" in namespace:
            suffixes.append((" in {d}", f"{{d{counts['d'] + 1}}}年的" + target))
        for suffix, rendered in suffixes:
            # A reviewed explicit location construction wins over a generic
            # adjunct expansion with the same spelling.
            priority = 2 if not suffix else 1
            emit(source + suffix, connective + rendered, priority, namespace)
            emit(source + suffix + ".", connective + rendered + "。", priority, namespace)

    def subject_shift(target):
        return FIELD.sub(lambda m: "{a" + str(int(m[2]) + 1) + "}"
                         if m[1] == "a" else m[0], target)

    def action(source, target):
        target, _ = indexed(source, target)
        # The injected subject becomes a1. Every predicate link still appears
        # exactly once, even when a concession moves before the response.
        shifted = subject_shift(target)
        for clause, rendered, connective, subject in (
                ("{a} " + source, "{a1}" + shifted, "", "{a1}"),
                (source, target, "", ""),
                ("and " + source, target, "并", "")):
            event(clause, rendered, connective, subject=subject)

    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if not line or line.startswith("#"):
            continue
        fields = line.split("\t")
        if len(fields) != 3:
            raise ValueError(f"{path}:{line_number}: expected source, target, mode")
        source, target, mode = fields
        if mode == "reputation":
            emit(source, target)
            emit("Adventurer log reputation: " + source.lower(), target)
        elif mode in ("clause", "term"):
            emit(source, target)
        elif mode == "age":
            # Reuse the era's reviewed term instead of treating Age as a
            # person's age or phoneticizing In/Of in a book's title. These
            # terms also own the complete native heading, whose article
            # must not route it through a generic generated-name grammar.
            emit(source, target)
            emit("The " + source, target, namespace="Ei")
            for article in ("", "The "):
                emit("{b} In " + article + source, target + "的{b}", namespace="bi")
        elif mode == "statement":
            # Native aftermath branches can switch Some/Several to lowercase
            # after "and", or keep the original heading case for other clauses.
            # Expand only reviewed complete statements: do not globally fold
            # UI/name rules or translate a bare "some" as a guessed participant.
            for spelling in dict.fromkeys((source, source[0].lower() + source[1:])):
                for prefix, connective in (("", ""), ("and ", "，")):
                    emit(prefix + spelling, connective + target)
                    emit(prefix + spelling + ".", connective + target + "。")
        elif mode == "concession":
            concessions.append((source, target))
            emit(source, target)
        elif mode == "mortality-reason":
            mortality_reasons.append((source, target))
            emit(source, target)
        elif mode == "office":
            offices.append((source, target))
            emit(source, target, namespace="i")
        elif mode == "office-prefix":
            office_prefixes.append((source, target))
        elif mode == "civic-domain":
            civic_domains.append((source, target))
        elif mode == "civic-office":
            civic_offices.append((source, target))
        elif mode == "religious-prefix":
            religious_prefixes.append((source, target))
        elif mode == "participant":
            emit(source, target, namespace="u")
        elif mode == "identity":
            emit(source, target, namespace="N")
        elif mode in ("description", "creature-status"):
            if mode == "creature-status":
                creature_status_prefix(source, target)
            emit(source, target, namespace="v")
        elif mode == "continuation":
            emit(source, target, namespace="C")
        elif mode == "behavior":
            emit(source[0].upper() + source[1:] + ".", target + "。")
            emit("It has {s} and " + source + ".", "它长有{s}，" + target + "。")
            emit("and " + source + ".", "，" + target + "。")
        elif mode in ("experiment-origin", "failed-experiment-origin"):
            if source.count("{s}") != 1 or target.count("{s}") != 1:
                raise ValueError(f"experiment origin requires one method slot: {source!r}")
            experiment_origins.append((source, target, mode == "failed-experiment-origin"))
        elif mode in ("experiment-method", "failed-experiment-method", "experiment-power"):
            if source.count("{a}") != 1 or target.count("{a}") != 1:
                raise ValueError(f"experiment method requires one subject slot: {source!r}")
            failed = None if mode == "experiment-power" else mode == "failed-experiment-method"
            experiment_methods.append((source, target, failed))
        elif mode == "experiment-subject":
            experiment_subjects.append((source, target))
        elif mode == "event":
            event(source, target)
        elif mode == "title":
            # Only reviewed noun phrases enter recursive event captures. DF
            # capitalizes them differently in headings and embedded stories.
            event(source, target, namespace="Ei")
        elif mode in ("action", "interaction-action", "response", "mortality-action"):
            action(source, target)
            if mode == "interaction-action":
                # Native 0x140b78aca..0x140b78c03 wraps the exact same
                # IS_HIST_STRING_1 / participant / IS_HIST_STRING_2 as an
                # event title before appending its location and date. Only
                # these reviewed interactions gain that wrapper; an arbitrary
                # action does not become a recursive historical subject.
                indexed_target, _ = indexed(source, target)
                event("the moment when {a} " + source,
                      "{a1}" + subject_shift(indexed_target) + "之时",
                      namespace="Ei")
            elif mode == "response":
                responses.append((source, target))
            elif mode == "mortality-action":
                mortality_actions.append((source, target))
        else:
            raise ValueError(f"{path}:{line_number}: unknown mode {mode!r}")
    # Native officials combine a court rank with a role OR a municipal duty
    # with a civic title. Keep those independent families out of each other.
    # Keep every English/Chinese term in the reviewed TSV, including plural
    # forms; neither the renderer nor the compiler maintains another glossary.
    for prefixes, roles in ((office_prefixes, offices), (civic_domains, civic_offices)):
        for prefix, prefix_target in prefixes:
            for office, office_target in roles:
                emit(f"{prefix} {office}", prefix_target + office_target, namespace="i")
    if religious_prefixes:
        for noun, noun_target in religious_name_nouns(path.parent).items():
            for prefix, prefix_target in religious_prefixes:
                emit(f"{prefix} {noun}", prefix_target + noun_target, namespace="i")
    for response, response_target in responses:
        response_target, counts = indexed(response, response_target)
        for concession, concession_target in concessions:
            concession_target, _ = indexed(concession, concession_target)
            concession_target = FIELD.sub(
                lambda m: "{" + m[1] + str(int(m[2]) + counts[m[1]]) + "}",
                concession_target)
            source = response + ", despite " + concession
            # Keep the named participant at the front; the complete reason
            # and response then form one predicate, including neutral text
            # whose source range is tracked for clipped worldgen continuations.
            # Native response/concession pairs end here. Do not multiply them
            # by unrelated locations, titles or coordinated "and though" forms.
            # Require the native sentence end: moving only the first member of
            # an unreviewed reason list would attach its remaining members to
            # the response and change the meaning. Such lists keep the existing
            # scoped clause fallback rather than a partly reordered sentence.
            for clause, rendered in (
                    (source, "虽然" + concession_target + "，但" + response_target),
                    ("{a} " + source, "{a1}虽然" + subject_shift(concession_target) +
                     "，但" + subject_shift(response_target))):
                emit(clause + ".", rendered + "。")
    for predicate, predicate_target in mortality_actions:
        for reason, reason_target in mortality_reasons:
            # These native phrases contain no participant fields; the subject
            # is supplied separately. Keep any future linked motives out of
            # this finite composition until their capture ordering is reviewed.
            if any(FIELD.search(text) for text in
                   (predicate, predicate_target, reason, reason_target)):
                raise ValueError("mortality actions and reasons must be literal phrases")
            source = predicate + " " + reason + "."
            target = reason_target + "，" + predicate_target + "。"
            # The native builder appends one space before the reason and a
            # final period afterwards. Require that period: another background
            # clause can follow the motive, and moving just the first reason
            # would leave its continuation attached to the wrong predicate.
            emit(source, target)
            emit("{a} " + source, "{a}" + target)
    # Native generators/creatures.lua experiment_description appends one
    # method, an optional subject and creation site, then the mandatory year.
    # Keep that complete origin together so all names and the year survive
    # Chinese reordering. The body/subject slots disappear during compilation;
    # they never admit unrestricted prose as a runtime species/person capture.
    for frame, frame_target, failed_origin in experiment_origins:
        frame_target, frame_counts = indexed(frame, frame_target)
        frame_counts["s"] -= 1
        for method, method_target, failed_method in experiment_methods:
            if failed_method is not None and failed_method != failed_origin:
                continue
            connector = " unleashed upon " if failed_method is None else " on "
            for subject, subject_target in experiment_subjects:
                cause = method.replace("{a}", connector + subject if subject else "")
                cause_target = method_target.replace("{a}", subject_target)
                for located in (False, True):
                    source = cause + (" in {p}" if located else "")
                    target = ("在{p}" if located else "") + cause_target
                    target, _ = indexed(source, target)
                    target = FIELD.sub(
                        lambda m: "{" + m[1] + str(int(m[2]) + frame_counts[m[1]]) + "}",
                        target)
                    emit(frame.replace("{s}", source), frame_target.replace("{s1}", target))
    return list(entries.values())
