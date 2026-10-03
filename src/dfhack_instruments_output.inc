// scripts/instruments.lua:25-45,52-72 emits complete instrument heads and
// indented part-reaction rows. Its instrument/reaction names are raw names,
// job_skill is an enum, and non-thread reagents are raw codes. Translate only
// the authored placement/assembly words and reagentString's eight phrases.
// Callers retain record boundaries: a wrapped GUI row must not be combined
// with an unrelated row, and a continuation needs its actual saved prefix.
struct DfhackInstrumentOutputReplacement {
    size_t begin = 0, end = 0;
    std::string target;
};

static std::optional<size_t> dfhack_instruments_output_record_end(
        std::string_view source) {
    if (source.empty() || source.size() > 65536) return std::nullopt;
    size_t end = source.size();
    while (end && (source[end - 1] == ' ' || source[end - 1] == '\t' ||
            source[end - 1] == '\r' || source[end - 1] == '\n')) --end;
    if (!end || source[end - 1] != ')') return std::nullopt;
    for (size_t at = 0; at < end; ++at) {
        const auto ch = static_cast<unsigned char>(source[at]);
        if (ch < ' ' || ch == 0x7f) return std::nullopt;
    }
    return end;
}

static bool dfhack_instruments_output_replace(
        const DfhackOutputSnapshot &catalog, std::string_view role,
        std::string_view native, size_t begin, size_t end,
        std::vector<DfhackInstrumentOutputReplacement> &replacements) {
    const std::string key = "DFHack GUI Instrument " + std::string(role) +
        ": " + std::string(native);
    const auto found = catalog.gui_fields.find(key);
    if (found == catalog.gui_fields.end() || !contains_cjk_utf8(found->second))
        return false;
    replacements.push_back({begin, end, found->second});
    return true;
}

// A suffix is either JOB_SKILL: reagent, reagent) or JOB_SKILL/assemble).
// It starts after the placement marker, or after the part name's final " (".
// Commas and spaces are the original table.concat separators, never replaced.
static bool dfhack_instruments_output_suffix(
        const DfhackOutputSnapshot &catalog, std::string_view source,
        size_t begin, size_t end, bool allow_assembly,
        std::vector<DfhackInstrumentOutputReplacement> &replacements) {
    if (begin >= end || source[begin] < 'A' || source[begin] > 'Z') return false;
    size_t at = begin + 1;
    while (at < end && ((source[at] >= 'A' && source[at] <= 'Z') ||
            (source[at] >= '0' && source[at] <= '9') || source[at] == '_')) ++at;
    // Preserve the skill enum even if it looks like an English occupation.
    if (source.substr(at, end - at) == "/assemble)")
        return allow_assembly && dfhack_instruments_output_replace(catalog,
            "operation", "assemble", at + 1, end - 1, replacements);
    if (source.substr(at, 2) != ": " || source[end - 1] != ')') return false;
    at += 2;
    constexpr std::string_view thread_phrases[] = {
        "thread", "silk thread", "yarn thread", "plant thread",
        "silk yarn thread", "silk plant thread", "yarn plant thread",
        "silk yarn plant thread"
    };
    const size_t reagent_end = end - 1;
    if (at == reagent_end) return true; // An empty reagent array is valid.
    if (at > reagent_end) return false;
    while (at < reagent_end) {
        const size_t comma = source.find(", ", at);
        const size_t last = comma == std::string_view::npos || comma >= reagent_end
            ? reagent_end : comma;
        if (last == at) return false;
        const auto reagent = source.substr(at, last - at);
        if (std::find(std::begin(thread_phrases), std::end(thread_phrases), reagent)
                != std::end(thread_phrases) &&
                !dfhack_instruments_output_replace(catalog, "reagent", reagent,
                    at, last, replacements)) return false;
        // Any other reagent is its reaction_reagent.code, not a caption.
        if (last == reagent_end) break;
        at = last + 2;
        if (at == reagent_end) return false;
    }
    return true;
}

static std::optional<std::string> dfhack_instruments_output_apply(
        std::string_view source, bool console_utf8,
        const std::vector<DfhackInstrumentOutputReplacement> &replacements) {
    if (replacements.empty()) return std::nullopt;
    std::string target;
    size_t copied = 0;
    for (const auto &part : replacements) {
        if (part.begin < copied || part.end < part.begin || part.end > source.size())
            return std::nullopt;
        const auto original = source.substr(copied, part.begin - copied);
        target += console_utf8 ? std::string(original) : native_text_to_utf8(original);
        target += part.target;
        copied = part.end;
    }
    const auto tail = source.substr(copied);
    target += console_utf8 ? std::string(tail) : native_text_to_utf8(tail);
    return target;
}

// Returns the placement word's byte range in a complete first print fragment:
// instrument.name .. " (building, " or " (handheld, ". A literal marker alone
// cannot establish context; the original generated name must be present.
static std::optional<std::pair<size_t, std::string_view>>
dfhack_instruments_output_prefix_kind(std::string_view source) {
    if (source.empty() || source.size() > 65536 ||
            std::any_of(source.begin(), source.end(), [](unsigned char ch) {
                return ch < ' ' || ch == 0x7f;
            })) return std::nullopt;
    constexpr std::string_view kinds[] = {"building", "handheld"};
    for (const auto kind : kinds) {
        const std::string marker = " (" + std::string(kind) + ", ";
        if (!source.ends_with(marker) || source.size() == marker.size()) continue;
        const size_t name_end = source.size() - marker.size();
        if (std::none_of(source.begin(), source.begin() + name_end,
                [](unsigned char ch) { return ch != ' '; })) continue;
        return std::pair{name_end + 2, kind};
    }
    return std::nullopt;
}

static bool is_dfhack_instruments_output_prefix(std::string_view source) {
    return dfhack_instruments_output_prefix_kind(source).has_value();
}

static std::optional<std::string> translate_dfhack_instruments_output_prefix(
        const DfhackOutputSnapshot &catalog, std::string_view source,
        bool console_utf8) {
    const auto kind = dfhack_instruments_output_prefix_kind(source);
    if (!kind) return std::nullopt;
    std::vector<DfhackInstrumentOutputReplacement> replacements;
    if (!dfhack_instruments_output_replace(catalog, "kind", kind->second,
            kind->first, kind->first + kind->second.size(), replacements))
        return std::nullopt;
    return dfhack_instruments_output_apply(source, console_utf8, replacements);
}

// Returns ONLY the translated second print fragment. The caller must save
// the original prefix per console/thread and consume it on the next actual
// continuation, clearing it across unrelated output/batches. With no known
// thread phrase the recipe continuation has no translatable field, so nullopt
// means to retain that continuation while keeping the translated first part.
static std::optional<std::string> translate_dfhack_instruments_output_continuation(
        const DfhackOutputSnapshot &catalog, std::string_view original_prefix,
        std::string_view source, bool console_utf8) {
    if (!is_dfhack_instruments_output_prefix(original_prefix)) return std::nullopt;
    const auto end = dfhack_instruments_output_record_end(source);
    if (!end) return std::nullopt;
    std::vector<DfhackInstrumentOutputReplacement> replacements;
    if (!dfhack_instruments_output_suffix(catalog, source, 0, *end, true,
            replacements)) return std::nullopt;
    return dfhack_instruments_output_apply(source, console_utf8, replacements);
}

static std::optional<std::string> translate_dfhack_instruments_output(
        const DfhackOutputSnapshot &catalog, std::string_view source,
        bool console_utf8) {
    const auto end = dfhack_instruments_output_record_end(source);
    if (!end) return std::nullopt;
    const auto record = source.substr(0, *end);
    std::vector<DfhackInstrumentOutputReplacement> replacements;
    if (record.starts_with("  ")) {
        // INSTRUMENT_PIECE rows always start with exactly the authored two
        // spaces (a raw reaction name may have further spaces of its own).
        // Parse this role first so marker-like text inside reaction.name is
        // never mistaken for an instrument head's placement caption.
        const size_t suffix = record.rfind(" (");
        if (suffix == std::string_view::npos || suffix <= 2 ||
                std::none_of(record.begin() + 2, record.begin() + suffix,
                    [](unsigned char ch) { return ch != ' '; }) ||
                !dfhack_instruments_output_suffix(catalog, source, suffix + 2,
                    *end, false, replacements)) return std::nullopt;
        return dfhack_instruments_output_apply(source, console_utf8, replacements);
    }
    // Require exactly one placement marker. Joined GUI records or a raw
    // generated name containing another full marker must remain ambiguous,
    // allowing the caller to retry with the actual single-record boundary.
    constexpr std::string_view kinds[] = {"building", "handheld"};
    size_t marker_at = std::string_view::npos;
    std::string_view kind;
    for (const auto candidate : kinds) {
        const std::string marker = " (" + std::string(candidate) + ", ";
        for (size_t found = record.find(marker); found != std::string_view::npos;
                found = record.find(marker, found + 1)) {
            if (marker_at != std::string_view::npos) return std::nullopt;
            marker_at = found;
            kind = candidate;
        }
    }
    if (marker_at != std::string_view::npos) {
        if (!marker_at || std::none_of(record.begin(), record.begin() + marker_at,
                [](unsigned char ch) { return ch != ' '; })) return std::nullopt;
        const size_t kind_begin = marker_at + 2;
        if (!dfhack_instruments_output_replace(catalog, "kind", kind, kind_begin,
                kind_begin + kind.size(), replacements) ||
                !dfhack_instruments_output_suffix(catalog, source,
                    kind_begin + kind.size() + 2, *end, true, replacements))
            return std::nullopt;
    } else return std::nullopt;
    return dfhack_instruments_output_apply(source, console_utf8, replacements);
}
