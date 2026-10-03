// DFHack help has its own catalogue. It never contributes global word rules
// and executable command examples retain their original source text.
static std::string normalize_dfhack_help(std::string_view source) {
    std::string result;
    for (unsigned char ch : source) {
        if (native_prose_space(ch)) {
            if (!result.empty() && result.back() != ' ') result.push_back(' ');
        } else result.push_back(static_cast<char>(ch));
    }
    if (!result.empty() && result.back() == ' ') result.pop_back();
    return result;
}

static std::vector<std::string> dfhack_help_native_wrap(std::string_view source, int width) {
    std::vector<std::string> rows;
    if (width <= 0) return rows;
    std::string row;
    for (size_t at = 0; at < source.size();) {
        const size_t end = source.find(' ', at);
        const std::string_view word = source.substr(at,
            (end == std::string_view::npos ? source.size() : end) - at);
        if (!row.empty() && row.size() + 1 + word.size() > static_cast<size_t>(width)) {
            rows.push_back(std::move(row));
            row.clear();
        }
        if (!row.empty()) row.push_back(' ');
        row.append(word);
        while (row.size() > static_cast<size_t>(width)) {
            rows.push_back(row.substr(0, width));
            row.erase(0, width);
        }
        if (end == std::string_view::npos) break;
        at = end + 1;
    }
    if (!row.empty()) rows.push_back(std::move(row));
    return rows;
}

void Overlay::index_dfhack_help_paragraph(const Rule &rule) {
    constexpr std::string_view prefix = "DFHack help: ";
    const std::string source = normalize_dfhack_help(
        std::string_view(rule.source).substr(prefix.size()));
    if (source.empty() || rule.target.empty()) return;
    if (const auto found = dfhack_help_source_index_.find(source);
            found != dfhack_help_source_index_.end()) {
        dfhack_help_paragraphs_[found->second].target = rule.target;
        capture_translations_.insert_or_assign(std::string(prefix) + source, rule.target);
        return;
    }
    const size_t index = dfhack_help_paragraphs_.size();
    dfhack_help_paragraphs_.push_back({source, rule.target});
    dfhack_help_source_index_.emplace(source, index);
    capture_translations_.insert_or_assign(std::string(prefix) + source, rule.target);
    std::unordered_set<std::string> seen;
    std::istringstream words(source);
    for (std::string word; words >> word;)
        if (seen.insert(word).second) dfhack_help_words_[word].push_back(index);
    if (source.back() != '.' && contains_cjk_utf8(rule.target)) {
        const size_t last = source.find_last_of(' ');
        const std::string terminal = source.substr(
            last == std::string::npos ? 0 : last + 1) + '.';
        if (seen.insert(terminal).second) dfhack_help_words_[terminal].push_back(index);
    }
}

// Console templates belong to this catalog alone. In particular, a captured
// command, enum, path or address must never enter DF's generated-name grammar.
static std::vector<std::string> dfhack_output_anchor_words(std::string_view source) {
    std::vector<std::string> words;
    const auto letter = [](unsigned char ch) {
        return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z');
    };
    for (size_t at = 0; at < source.size();) {
        if (!letter(static_cast<unsigned char>(source[at]))) { ++at; continue; }
        const size_t begin = at++;
        while (at < source.size() && letter(static_cast<unsigned char>(source[at]))) ++at;
        words.emplace_back(source.substr(begin, at - begin));
    }
    return words;
}

// Console workers borrow this immutable publication. Reload builds a new
// catalog on the render thread; no console callback enters Overlay's locks or
// reads its changing rule containers.
using DfhackRawCreatureLabels = std::unordered_map<std::string, std::string>;
static std::shared_ptr<const DfhackRawCreatureLabels> native_dfhack_raw_creature_labels();
static std::shared_ptr<const DfhackRawCreatureLabels> native_dfhack_raw_creature_adjectives();

struct DfhackOutputSnapshot {
    std::unordered_map<std::string, std::string> literals, help, values;
    std::vector<Rule> templates;
    std::unordered_map<std::string, std::vector<size_t>> template_words;
    std::unordered_map<char, std::vector<std::pair<std::string, std::string>>> fragments;
    std::unordered_map<std::string, std::string> stonesense_literals;
    std::vector<Rule> stonesense_templates;
    std::unordered_map<std::string, std::vector<size_t>> stonesense_words;
    std::unordered_map<std::string, std::string> human_captions;
    std::unordered_map<std::string, std::string> gui_fields;
    std::unordered_map<std::string, std::string> calendar_months;
    std::unordered_map<std::string, std::string> calendar_seasons;
    std::unordered_map<std::string, std::string> death_causes;
    std::unordered_map<std::string, Rule> death_phrases;
    DFHack::DFZH::Hooks::RulesetsManager::CaptionSnapshot caption_grammar;
    std::shared_ptr<const DfhackRawCreatureLabels> raw_creature_labels;
    std::shared_ptr<const DfhackRawCreatureLabels> raw_creature_adjectives;
};
static std::atomic<std::shared_ptr<const DfhackOutputSnapshot>> g_dfhack_output_snapshot;

static std::optional<std::string> translate_dfhack_tag_list(
        const DfhackOutputSnapshot &, std::string_view source) {
    const auto normalized = normalize_dfhack_help(source);
    if (!normalized.starts_with("tags: ") && !normalized.starts_with("Tags: "))
        return std::nullopt;
    std::string_view list(normalized);
    list.remove_prefix(6);
    bool first = true;
    while (!list.empty()) {
        const size_t separator = list.find_first_of(",|");
        const auto tag = trim_view(list.substr(0, separator));
        if (tag.empty() || !std::all_of(tag.begin(), tag.end(), [](unsigned char ch) {
                return ch >= 'a' && ch <= 'z'; })) return std::nullopt;
        first = false;
        if (separator == std::string_view::npos) break;
        list.remove_prefix(separator + 1);
        if (trim_view(list).empty()) return std::nullopt;
    }
    return first ? std::nullopt : std::optional<std::string>(
        "标签：" + normalized.substr(5));
}

static bool dfhack_tag_metadata_tokens(std::string_view source) {
    constexpr std::string_view tags[] = {"adventure", "dfhack", "embark", "fort", "legends",
        "armok", "auto", "bugfix", "design", "dev", "fps", "gameplay", "inspection",
        "productivity", "animals", "buildings", "graphics", "interface", "items", "jobs",
        "labors", "map", "military", "plants", "stockpile", "units", "workorders", "unavailable"};
    bool found = false;
    for (size_t at = 0; at < source.size();) {
        const size_t end = source.find_first_of(", |", at);
        const auto token = source.substr(at,
            (end == std::string_view::npos ? source.size() : end) - at);
        if (!token.empty()) {
            if (std::find(std::begin(tags), std::end(tags), token) == std::end(tags)) return false;
            found = true;
        }
        at = end == std::string_view::npos ? source.size() : end + 1;
    }
    return found;
}

static std::optional<std::string> lookup_dfhack_help_message(
        const DfhackOutputSnapshot &catalog, std::string_view source) {
    const auto exact = catalog.help.find(std::string(source));
    if (exact != catalog.help.end()) return exact->second;
    // LuaApi's getCommandDescription appends a period when the plugin's
    // authored description does not end in one. Resolve that complete
    // description without changing its actual display/wrapping source.
    if (source.size() > 1 && source.back() == '.' && source[source.size() - 2] != '.') {
        const auto native = catalog.help.find(std::string(source.substr(0, source.size() - 1)));
        if (native != catalog.help.end() && contains_cjk_utf8(native->second)) return native->second;
    }
    return std::nullopt;
}

// Callers establish the native field's semantic role before using this
// resolver. It is never applied to commands, filter input or named entities.
static std::optional<std::string> translate_dfhack_caption_utf8(
        const DfhackOutputSnapshot &catalog, std::string_view kind,
        std::string_view text) {
    if (text.empty() || (kind != "item" && kind != "material" &&
            kind != "material_adjective" && kind != "tile" &&
            kind != "building" && kind != "profession" && kind != "creature" &&
            kind != "skill" && kind != "job" && kind != "creature_adjective"))
        return std::nullopt;
    if (kind == "creature_adjective") {
        if (!catalog.raw_creature_adjectives) return std::nullopt;
        const auto found = catalog.raw_creature_adjectives->find(lower(std::string(text)));
        return found == catalog.raw_creature_adjectives->end() ? std::nullopt :
            translate_dfhack_caption_utf8(catalog, "creature", found->second);
    }
    if (kind == "skill") {
        const auto scoped = catalog.human_captions.find("skill name: " + lower(std::string(text)));
        if (scoped != catalog.human_captions.end() && contains_cjk_utf8(scoped->second))
            return scoped->second;
    }
    if (kind == "job") {
        const auto scoped = catalog.human_captions.find("fortress activity: " + lower(std::string(text)));
        if (scoped != catalog.human_captions.end() && contains_cjk_utf8(scoped->second))
            return scoped->second;
    }
    if (catalog.caption_grammar) {
        try {
            if (auto target = catalog.caption_grammar(kind, text);
                    target && contains_cjk_utf8(*target)) return target;
        } catch (...) {}
    }
    const auto found = catalog.human_captions.find(lower(std::string(text)));
    return found != catalog.human_captions.end() && contains_cjk_utf8(found->second)
        ? std::optional<std::string>(found->second) : std::nullopt;
}

static std::optional<std::string> translate_dfhack_caption(
        std::string_view kind, std::string_view native_source) {
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    return catalog ? translate_dfhack_caption_utf8(*catalog, kind,
        native_text_to_utf8(native_source)) : std::nullopt;
}

// A native Lua print ticket already proved the item field and Console's
// df2console encoding. This detached resolver never enters Overlay/game data.
static std::optional<std::string> translate_dfhack_console_item_caption(
        std::string_view utf8_source) {
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    return catalog ? translate_dfhack_caption_utf8(*catalog, "item", utf8_source)
                   : std::nullopt;
}

static std::optional<std::string> translate_dfhack_console_owned_literal(
        std::string_view scope, std::string_view source) {
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!catalog) return std::nullopt;
    if (scope == "DFHack GUI Item type counts: " && source == "TYPE           COUNT") {
        const auto type = catalog->gui_fields.find("DFHack GUI Item type counts: TYPE");
        const auto count = catalog->gui_fields.find("DFHack GUI Item type counts: COUNT");
        if (type == catalog->gui_fields.end() || count == catalog->gui_fields.end() ||
                !contains_cjk_utf8(type->second) || !contains_cjk_utf8(count->second)) return std::nullopt;
        return type->second + std::string(11, ' ') + count->second;
    }
    const auto target = catalog->gui_fields.find(std::string(scope) + std::string(source));
    return target != catalog->gui_fields.end() && contains_cjk_utf8(target->second)
        ? std::optional<std::string>(target->second) : std::nullopt;
}

#include "dfhack_creature_list_output.inc"
#include "dfhack_lever_output.inc"
#include "dfhack_instruments_output.inc"
#include "dfhack_item_output.inc"
#include "dfhack_item_console_report.inc"
#include "dfhack_lever_output_rows.inc"

static std::optional<std::string> translate_dfhack_console_item_report(
        std::string_view command, std::string_view raw) {
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    return catalog ? translate_dfhack_item_console_report(*catalog, command, raw) : std::nullopt;
}

// Only the render side reads game RAWs. Console workers continue to borrow
// owned immutable strings, including after a world is unloaded.
static void refresh_dfhack_raw_creature_labels() {
    const auto current = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!current) return;
    try {
        const auto labels = native_dfhack_raw_creature_labels();
        const auto adjectives = native_dfhack_raw_creature_adjectives();
        if (labels == current->raw_creature_labels &&
                adjectives == current->raw_creature_adjectives) return;
        auto replacement = std::make_shared<DfhackOutputSnapshot>(*current);
        replacement->raw_creature_labels = labels;
        replacement->raw_creature_adjectives = adjectives;
        std::shared_ptr<const DfhackOutputSnapshot> published = std::move(replacement);
        auto expected = current;
        g_dfhack_output_snapshot.compare_exchange_strong(expected, std::move(published),
            std::memory_order_acq_rel, std::memory_order_acquire);
    } catch (...) {}
}

static void index_dfhack_stonesense_text(DfhackOutputSnapshot &catalog, const Rule &input) {
    constexpr std::string_view message = "DFHack output: ";
    constexpr std::string_view fragment = "DFHack output fragment: ";
    const auto prefix = input.source.starts_with(message) ? message
        : input.source.starts_with(fragment) ? fragment : std::string_view{};
    if (prefix.empty()) return;
    Rule rule;
    rule.source = normalize_dfhack_help(std::string_view(input.source).substr(prefix.size()));
    rule.target = input.target;
    if (rule.source.empty() || rule.target.empty()) return;
    split_template(rule.source, &rule.template_literals, &rule.template_kinds);
    if (rule.template_kinds.empty()) {
        catalog.stonesense_literals.insert_or_assign(rule.source, rule.target);
        return;
    }
    if (!compile_template_target(rule)) return;
    std::string anchor;
    for (const auto &literal : rule.template_literals)
        for (const auto &word : dfhack_output_anchor_words(literal))
            if (word.size() > anchor.size()) anchor = word;
    if (anchor.empty()) return;
    catalog.stonesense_words[anchor].push_back(catalog.stonesense_templates.size());
    catalog.stonesense_templates.push_back(std::move(rule));
}

static bool dfhack_wildlife_creature_form(std::string_view source) {
    constexpr std::string_view script_prefix = "fix/wildlife: ";
    if (source.starts_with(script_prefix)) source.remove_prefix(script_prefix.size());
    return source == "{d} {s} is blocking new waves of wildlife" ||
        source == "{d} {s} are blocking new waves of wildlife" ||
        source == "{d} {s} is no longer blocking new waves of wildlife" ||
        source == "{d} {s} are no longer blocking new waves of wildlife";
}

static bool dfhack_output_identity_capture(const Rule &rule, size_t capture) {
    // pref-adjust's displayed values are matinfo tokens, enum values and
    // generated art-form names. Statistics contain a unit's readable name.
    // Building getName can also contain a custom name; these reports alone
    // cannot establish that its source is a translatable building caption.
    for (std::string_view form : {
            "Likes material: {s}", "Likes food: {s}", "Likes item type: {s}",
            "Likes plant: {s}", "Hates creature: {s}", "Likes color: {s}",
            "Likes shape: {s}", "Likes poetic form: {s}", "Likes musical form: {s}",
            "Likes dance form: {s}", "Unknown preference type: {s}",
            "Unrecognized preference type: {s}", "Unrecognized profile: {s}",
            "After adjusting, unit {s} has {d} preferences",
            "After clearing, unit {s} has {d} preferences",
            "Before, unit {s} has {d} preferences", "After, unit {s} has {d} preferences",
            "Unit {s} has no preferences.", "Preferences for {s}:",
            "... at {s}", "... by {s}",
            "Couldn't find either construct or destroy building job for {s}",
            "Couldn't find any job for {s}", "Couldn't find any job involving {s}",
            "Made the job {s} top priority", "The job {s} is already top priority",
            "{s} resized for {s}.", "{s} is already sized for {s}.",
            "{s} items resized for {s}.", "{d} items resized for {s}.",
            "All items are already sized for {s}",
            "Processing unit {s}",
            "WARNING: Unit {s} is a member of a squad from another site! This may be preventing them from doing any useful work. You can fix this by assigning them to a local squad and then unassigning them.",
            "WARNING: Unit {s} has the mining labor enabled, which conflicts with military uniforms.",
            "WARNING: Unit {s} has the woodcutting labor enabled, which conflicts with military uniforms.",
            "WARNING: Unit {s} has the hunting labor enabled, which conflicts with military uniforms.",
            "{s} is missing an assigned item, item #{d} '{s}'",
            "{s} cannot equip item: another unit has a claim on item #{d} '{s}'",
            "{s} has an improperly assigned item, item #{d} '{s}'; removing it",
            "{s} potentially has item #{d} '{s}' blocking a missing uniform item.",
            "Could not find drop location for item #{d} '{s}'",
            "Dropped item #{d} '{s}'", "Could not drop item #{d} '{s}'",
            "unreachable: {s} (skipping)", "worn: {s} (skipping)", "unforbid: {s}",
            "Type df.{s} doesn't exist!", "Unknown jobtype: {s}",
            "Invalid meal ingredients for managed order: {s} (is not a number).",
            "{s}: skipping citizen without historical figure: {s}",
            "Emptying wheelbarrow: {s}",
            "Item {d} assigned to squad member {d} of squad {s} is of unexpected type {s}. Detection only. No action performed.",
            "Would remove unit {d}: {s} ({s}), civ {d} ({s}, {s})",
            "Removing unit {d}: {s} ({s}), civ {d} ({s}, {s})",
            "Please wait for {s} to complete their objective and run this command again when they are on their way home.",
            "outcome weight {d}: {s}",
            "{s}: Unrecognized filename", "{s}: Unable to open file",
            "{s}: Name mismatch: expected {s}, found {s}",
            "{s}: None of {s} found", "{s}: No valid object names",
            "Multiple syndromes with the same name: {s}",
            "Invalid syndrome name: {s}", "Invalid syndrome class: {s}",
            "Invalid flow size: {s}", "Invalid flow type: {s}",
            "Invalid weight: {s}", "Invalid withProbability: {s}",
            "Could not find target: {s}", "Invalid syndrome: {s}",
            "Could not find syndrome {s}",
            "Removing corrupted unmanifested {s} (index {d})",
            "Removing corrupted unassigned {s} (index {d})",
            "Removing corrupted assigned {s} (index {d})",
            "Removing unmanifested {s} of invalid type {s} (index {d})",
            "Removing unassigned {s} of invalid type {s} (index {d})",
            "Removing assigned {s} of invalid type {s} (index {d})",
            "fix/stuck-squad: Squad rescue operation underway! the messenger is rescuing {s}",
            "Found stuck written material: {s}",
            "{s} can now be re-designated as a symbol of nobility.",
            "autocheese: dispatching cheesemaking job for {s} ({d} milk) to {s}",
            "Emptying {s}", "{s} was skipped (use --force to override)",
            "Adding {s} for burial with unit.",
            "Teleporting {d} {s} into a coffin.",
            "Tasking {d} {s} for immediate burial.",
            "{s} has been tasked to store away {s}.",
            "Ownership of {s} was removed from {s}.",
            "{d}: {s} caravan from {s}",
            "{d} unit {d} {s}: {s} -> {s}", "Slowdown: {s}",
            "A loud siren sounds throughout {s}, waking the sleeping and startling the awake.",
            "built {d} construction; highest construction now at z={s}",
            "built {d} constructions; highest construction now at z={s}",
            "TYPE 0 INORGANICS:{s}", "TYPE 1,3 CREATURES:{s}", "TYPE 2,5 PLANTS:{s}",
            "TYPE 4 ITEMS:{s}", "TYPE 7 COLORS:{s}", "TYPE 8 SHAPES:{s}",
            "TYPE 9 POEMS:{s}", "TYPE 10 MUSIC:{s}", "TYPE 11 DANCES:{s}"})
        if (rule.source == form) return true;
    // fix/wildlife's name[0]/name[1] field is translated only by its typed
    // resolver below; an unknown species cannot become a generic status.
    if (dfhack_wildlife_creature_form(rule.source)) return true;
    // workorder validates JSON schema values and native enum identifiers.
    // Its diagnostics quote those supplied values; they are not captions.
    if ((rule.source.starts_with("Invalid ") || rule.source.starts_with("Missing ")) &&
            rule.source.find("for manager order: ") != std::string::npos) return true;
    // These reports print native enums and RAW IDs beside a separate human
    // caption. The value glossary must not reinterpret those executable keys.
    if ((rule.source == "{s} ({s}), Type: {s}" && capture != 1) ||
            (rule.source == "{s} skill {s} is now legendary for {s}" && capture != 1) ||
            ((rule.source == "{d} tile(s) of {s} ({s})" ||
              rule.source == "{d} visible tile(s) of {s} ({s})") && capture != 0) ||
            rule.source == "Cannot find any undesignated {s}" ||
            rule.source == "Cannot find any undesignated visible {s}" ||
            rule.source == "Here is some {s}") return true;
    const auto before = lower(std::string(trim_view(rule.template_literals[capture])));
    if ((capture == 0 && before.empty()) || before.ends_with('"') ||
            before.ends_with('\'') || before.ends_with('[')) return true;
    // A coincidental match such as a command/alias named "on" cannot turn
    // that executable identity into the catalog's translated on/off status.
    for (std::string_view field : {"plugin", "script", "command", "alias", "option",
            "flag", "key", "name", "named", "path", "file", "directory", "symbol",
            "offset", "widget", "help", "tag", "tags"}) {
        if (before == field || before.ends_with(" " + std::string(field)) ||
                before.ends_with(std::string(field) + ':')) return true;
    }
    return false;
}

static std::optional<std::string> translate_dfhack_human_capture(
        const DfhackOutputSnapshot &catalog, const Rule &rule, size_t capture,
        std::string_view source, bool console_utf8) {
    if (rule.template_kinds[capture] != 's') return std::nullopt;
    // These scripts print getReadableDescription without df2console, so
    // their owned item fields retain native bytes at either output sink.
    const bool raw_item = (capture == 0 &&
            (rule.source == "Emptying wheelbarrow: {s}" || rule.source == "Emptying {s}" ||
             rule.source == "{s} was skipped (use --force to override)" ||
             rule.source == "Adding {s} for burial with unit." ||
             rule.source == "Ownership of {s} was removed from {s}." ||
             rule.source == "{s} can now be re-designated as a symbol of nobility.")) ||
        (capture == 1 && (rule.source == "Teleporting {d} {s} into a coffin." ||
             rule.source == "Tasking {d} {s} for immediate burial." ||
             rule.source == "{s} has been tasked to store away {s}."));
    if (raw_item) {
        const std::string utf8 = native_text_to_utf8(source);
        if (auto target = translate_dfhack_caption_utf8(catalog, "item", utf8)) return target;
        // Keep unknown artifact/name text while rendering its proved native
        // glyphs in Console's encoding; the authored sentence can translate.
        return utf8;
    }
    if ((rule.source == "{s} has been tasked to store away {s}." && capture == 0) ||
            (rule.source == "Ownership of {s} was removed from {s}." && capture == 1))
        return native_text_to_utf8(source);
    const bool stuck_merchant = rule.source == "Would remove unit {d}: {s} ({s}), civ {d} ({s}, {s})" ||
        rule.source == "Removing unit {d}: {s} ({s}), civ {d} ({s}, {s})";
    if (stuck_merchant && (capture == 2 || capture == 5)) {
        if (capture == 5 && source == "unknown race") {
            const auto fallback = catalog.gui_fields.find("DFHack GUI Stuck merchants race: unknown race");
            if (fallback != catalog.gui_fields.end()) return fallback->second;
        }
        return translate_dfhack_caption_utf8(catalog, "creature", native_text_to_utf8(source));
    }
    if (stuck_merchant && capture == 4 && source == "unknown civ") {
        const auto fallback = catalog.gui_fields.find("DFHack GUI Stuck merchants civilization: unknown civ");
        return fallback == catalog.gui_fields.end() ? std::nullopt :
            std::optional<std::string>(fallback->second);
    }
    // Unlike getRaceName's RAW ID, wildlife uses the readable singular and
    // plural RAW name fields. It prints both without df2console.
    if (dfhack_wildlife_creature_form(rule.source) && capture == 1)
        return translate_dfhack_caption_utf8(catalog, "creature", native_text_to_utf8(source));
    // resize-armor prints these native descriptions directly, without
    // df2console. Its item and plural race fields therefore need native
    // decoding even when the actual recipient is Console.
    const bool resized_item = rule.source == "{s} resized for {s}." ||
        rule.source == "{s} is already sized for {s}.";
    const bool resized_count = rule.source == "{s} items resized for {s}." ||
        rule.source == "{d} items resized for {s}.";
    if (resized_item || resized_count || rule.source == "All items are already sized for {s}") {
        if (resized_count && capture == 0) return std::nullopt;
        return translate_dfhack_caption_utf8(catalog,
            resized_item && capture == 0 ? "item" : "creature", native_text_to_utf8(source));
    }
    const auto sex_suffix = [&](std::string_view value) {
        // The launcher also echoes silent output to Console without df2console.
        // Decode only the known glyph; an already UTF-8 name stays untouched.
        if (!console_utf8 || value == " (\x0b)" || value == " (\x0c)")
            return native_text_to_utf8(value);
        return std::string(value);
    };
    if (console_utf8 && capture == 0 && rule.source.starts_with("{s} ")) {
        const std::string_view suffix = std::string_view(rule.source).substr(4);
        const bool orientation = suffix == "indeterminate (probably adventurer)" ||
            suffix == "likes males" || suffix == "will marry males" ||
            suffix == "likes females" || suffix == "will marry females" ||
            suffix == "likes males and likes females" ||
            suffix == "likes males and will marry females" ||
            suffix == "will marry males and likes females" ||
            suffix == "will marry males and will marry females" ||
            suffix == "is asexual" || suffix == "is not biologically capable of sex";
        if (orientation && (source.ends_with(" (\x0b)") || source.ends_with(" (\x0c)")))
            return std::string(source.substr(0, source.size() - 4)) +
                sex_suffix(source.substr(source.size() - 4));
    }
    // gaydar's unnamed branch places a caste caption before its independent
    // parenthesized sex symbol. The ID and that symbol are native values.
    if (capture == 1 && rule.source.starts_with("Unit #{d} ({s})")) {
        const auto text = trim_view(source);
        const size_t symbol = text.rfind(" (");
        const auto caption = symbol != std::string_view::npos && text.ends_with(')')
            ? text.substr(0, symbol) : text;
        const auto target = translate_dfhack_caption_utf8(catalog, "creature",
            console_utf8 ? std::string(caption) : native_text_to_utf8(caption));
        if (target) return *target + (symbol == std::string_view::npos ? std::string{} :
            sex_suffix(text.substr(symbol)));
        if (console_utf8 && symbol != std::string_view::npos &&
                (text.substr(symbol) == " (\x0b)" || text.substr(symbol) == " (\x0c)"))
            return std::string(caption) + sex_suffix(text.substr(symbol));
        return std::nullopt;
    }
    // UnitInfo's calendar field is a month, even when its native spelling is
    // also a material name. Ordinals are dates, never generic string values.
    const bool age_date = rule.source == "She is {s}, born on the {s} of {s} in the year {d}." ||
        rule.source == "He is {s}, born on the {s} of {s} in the year {d}." ||
        rule.source == "It is {s}, born on the {s} of {s} in the year {d}.";
    if (age_date && capture == 2) {
        const auto month = catalog.calendar_months.find(std::string(source));
        return month == catalog.calendar_months.end() ? std::nullopt
            : std::optional<std::string>(month->second);
    }
    const bool wave_month = rule.source.starts_with(
        "Wave {d} consisted of {d} unit(s) and arrived in year {d}, month {d} ({s})");
    const bool wave_season = rule.source.starts_with(
        "Wave {d} consisted of {d} unit(s) and arrived in the {s} of year {d}");
    if ((wave_month && capture == 4) || (wave_season && capture == 2)) {
        const auto season = catalog.calendar_seasons.find(std::string(source));
        return season == catalog.calendar_seasons.end() ? std::nullopt
            : std::optional<std::string>(season->second);
    }
    if (age_date && capture == 1) {
        size_t digits = 0;
        unsigned day = 0;
        while (digits < source.size() && source[digits] >= '0' && source[digits] <= '9') {
            if (digits >= 2) return std::nullopt;
            day = day * 10 + source[digits++] - '0';
        }
        const auto suffix = source.substr(digits);
        if (day >= 1 && day <= 28 &&
                (suffix == "st" || suffix == "nd" || suffix == "rd" || suffix == "th"))
            return std::string(source.substr(0, digits));
        return std::nullopt;
    }
    const bool adult_milk = rule.source == "She secretes {s} every {s} days." ||
        rule.source == "He secretes {s} every {s} days." ||
        rule.source == "It secretes {s} every {s} days.";
    const bool juvenile_milk = rule.source == "{s} secrete {s} every {s} days.";
    if ((adult_milk && capture == 1) || (juvenile_milk && capture == 2)) {
        const auto numeric = [](std::string_view value) {
            bool digit = false, decimal = false;
            for (unsigned char ch : value) {
                if (ch >= '0' && ch <= '9') digit = true;
                else if (ch == '.' && !decimal) decimal = true;
                else return false;
            }
            return digit;
        };
        const size_t separator = source.find(" to ");
        if (separator != std::string_view::npos && numeric(source.substr(0, separator)) &&
                numeric(source.substr(separator + 4)))
            return std::string(source.substr(0, separator)) + " 至 " +
                std::string(source.substr(separator + 4));
        return std::nullopt;
    }
    std::string_view kind;
    if (rule.source == "{d}: {s} caravan from {s}" && capture == 1)
        kind = "creature_adjective";
    else if (rule.source == "autocheese: dispatching cheesemaking job for {s} ({d} milk) to {s}" &&
            capture == 0) kind = "item";
    else if ((rule.source == "{s} ({s}), Type: {s}" ||
            rule.source == "{s} skill {s} is now legendary for {s}") && capture == 1)
        kind = "skill";
    else if ((rule.source == "{s} is now a legendary {s}" && capture == 1) ||
            (rule.source == "and become a legendary {s}" && capture == 0) ||
            (capture == 1 && (rule.source.starts_with("Establish a Guildhall for ") ||
                rule.source.starts_with("Establish a Grand Guildhall for ")))) kind = "profession";
    else if (rule.source == "Unnamed {s} civilisation" && capture == 0) kind = "creature";
    else if (capture == 0 && (rule.source == "Made the job {s} top priority" ||
            rule.source == "The job {s} is already top priority")) kind = "job";
    else if ((rule.source == "Could not move item: {s}" ||
            rule.source == "Description: {s}" || rule.source == "- Description: {s}" ||
            rule.source == "deteriorate: {s} crumbles away to dust" ||
            rule.source == "Found stuck instrument: {s}" ||
            rule.source == "Found stuck written material: {s}" ||
            rule.source == "{s} must be in a job! (look for 'TSK')") &&
            capture == 0) kind = "item";
    else if (capture == 2 &&
            (rule.source == "{s} is missing an assigned item, item #{d} '{s}'" ||
             rule.source == "{s} cannot equip item: another unit has a claim on item #{d} '{s}'" ||
             rule.source == "{s} has an improperly assigned item, item #{d} '{s}'; removing it" ||
             rule.source == "{s} potentially has item #{d} '{s}' blocking a missing uniform item."))
        kind = "item";
    else if (capture == 1 &&
            (rule.source == "Could not find drop location for item #{d} '{s}'" ||
             rule.source == "Dropped item #{d} '{s}'" ||
             rule.source == "Could not drop item #{d} '{s}'")) kind = "item";
    else if (rule.source == "The {s} died." && capture == 0) kind = "creature";
    else if (capture == 0 && (rule.source == "{s} only die of unnatural causes." ||
            rule.source == "{s} usually die at a very young age." ||
            rule.source == "{s} live about 1 year." ||
            rule.source == "{s} live about {d} years." || juvenile_milk ||
            rule.source == "{s} produce {s}.")) kind = "creature";
    else if ((adult_milk && capture == 0) || (juvenile_milk && capture == 1) ||
            (capture == 0 && (rule.source == "She produces {s}." ||
                             rule.source == "He produces {s}." ||
                             rule.source == "It produces {s}.")) ||
            (rule.source == "{s} produce {s}." && capture == 1)) kind = "material";
    else if ((rule.source == "Layer material: {d} / {s} / {s}" ||
              rule.source.starts_with("Vein material (final): {d} / {s} / {s}")) && capture == 2)
        kind = "material";
    else if ((rule.source == "Base material: {s} / {s}" ||
              rule.source == "Static material: {s} / {s}") && capture == 1)
        kind = "material";
    else if (capture == 1 && rule.source.find("[{d}] {s} (wear level {d})") !=
            std::string::npos && (rule.source.starts_with('[') ||
            rule.source.starts_with("Fixing") || rule.source.starts_with("Confiscating") ||
            rule.source.starts_with("Dumping"))) kind = "item";
    else if (capture == 1 && (rule.source.starts_with("tiletype: {d} = {s} ({s})") ||
            rule.source.starts_with("static: {d} = {s} ({s})") ||
            rule.source.starts_with("base: {d} = {s} ({s})"))) kind = "tile";
    else if (capture == 1 && rule.source.starts_with("Building {d}, \"{s}\", type {s} ({d})"))
        kind = "building";
    else {
        // showmood builds these rows from a native material caption. Its
        // numeric Item prefix and flag suffix do not change that field's role.
        std::string_view form = rule.source;
        size_t field = 0;
        if (form.starts_with("Item {d}: ")) { form.remove_prefix(10); field = 1; }
        if (const size_t got = form.find(", got {d} of {d}"); got != std::string_view::npos)
            form = form.substr(0, got);
        if (form == "item {s} material {s} flags ({s}:{s}:{s})") {
            if (capture == field) kind = "item";
            if (capture == field + 1) kind = "material";
        } else if (capture == field) {
            for (std::string_view caption : {"{s} boulder", "{s} blocks", "{s} logs",
                    "{s} wafers", "{s} bars", "{s} cut gems", "{s} rough gems", "raw {s}",
                    "{s} leather", "{s} cloth", "{s} bones", "{s} shells", "{s} horns",
                    "{s} pearls", "{s} ivory/teeth", "{s} unknown body parts ({s}:{s}:{s})",
                    "{s} remains", "{s} corpse", "{s} murdered corpse"})
                if (form == caption) { kind = "material"; break; }
        }
    }
    if (kind.empty()) return std::nullopt;
    const auto text = console_utf8 ? std::string(source) : native_text_to_utf8(source);
    // Whole-caption overrides are scoped to this already proved human field.
    // They cannot rename a command, material token, enum, path or flag value.
    return translate_dfhack_caption_utf8(catalog, kind, text);
}

static bool match_dfhack_output_template(const Rule &rule, std::string_view source,
        std::vector<std::string> &captures,
        std::vector<std::pair<size_t, size_t>> *ranges = nullptr) {
    captures.clear();
    if (ranges) ranges->clear();
    if (rule.template_literals.empty()) return false;
    const auto literal_at = [&](size_t at, std::string_view literal) -> std::optional<size_t> {
        for (size_t text = 0; text < literal.size();) {
            if (native_prose_space(static_cast<unsigned char>(literal[text]))) {
                while (text < literal.size() && native_prose_space(
                        static_cast<unsigned char>(literal[text]))) ++text;
                if (at == source.size() || !native_prose_space(
                        static_cast<unsigned char>(source[at]))) return std::nullopt;
                while (at < source.size() && native_prose_space(
                        static_cast<unsigned char>(source[at]))) ++at;
            } else {
                if (at == source.size() || source[at] != literal[text]) return std::nullopt;
                ++at; ++text;
            }
        }
        return at;
    };
    const auto first = literal_at(0, rule.template_literals.front());
    if (!first) return false;
    std::unordered_set<size_t> failed;
    const auto match = [&](auto &&self, size_t index, size_t at) -> bool {
        if (index == rule.template_kinds.size()) return at == source.size();
        const size_t state = index * (source.size() + 1) + at;
        if (failed.contains(state)) return false;
        const auto &suffix = rule.template_literals[index + 1];
        for (size_t end = source.size(); end > at; --end) {
            const auto following = literal_at(end, suffix);
            if (!following) continue;
            const auto value = source.substr(at, end - at);
            if (native_prose_space(static_cast<unsigned char>(value.front())) ||
                    native_prose_space(static_cast<unsigned char>(value.back()))) continue;
            if (rule.template_kinds[index] == 'd') {
                const size_t digit = value.front() == '+' || value.front() == '-' ? 1 : 0;
                if (digit == value.size() || !std::all_of(value.begin() + digit, value.end(),
                        [](unsigned char ch) { return ch >= '0' && ch <= '9'; })) continue;
            }
            captures.emplace_back(value);
            if (ranges) ranges->emplace_back(at, end - at);
            if (self(self, index + 1, *following)) return true;
            captures.pop_back();
            if (ranges) ranges->pop_back();
        }
        failed.insert(state);
        return false;
    };
    // Fold only authored literal whitespace. Captured paths, identifiers and
    // user text retain their exact bytes, including meaningful double spaces.
    return match(match, 0, *first);
}

#include "dfhack_death_output.inc"

static std::optional<std::string> translate_dfhack_output_message(
        const DfhackOutputSnapshot &catalog, std::string_view visible, int depth = 0,
        bool templates = true, bool fragments = true, bool console_utf8 = false);

#include "dfhack_agreement_output.inc"
#include "dfhack_workorder_output.inc"

static std::vector<std::optional<std::string>> resolve_dfhack_output_captures(
        const DfhackOutputSnapshot &catalog, const Rule &rule,
        const std::vector<std::string> &captures, int depth, bool console_utf8) {
    std::vector<std::optional<std::string>> resolved(captures.size());
    for (size_t at = 0; at < captures.size(); ++at) {
        resolved[at] = translate_dfhack_human_capture(catalog, rule, at,
            captures[at], console_utf8);
        if (resolved[at]) continue;
        const bool identity = dfhack_output_identity_capture(rule, at);
        if (const auto value = catalog.values.find(captures[at]); !identity &&
                value != catalog.values.end()) resolved[at] = value->second;
        else if (!identity && depth < 2 && rule.template_kinds[at] == 's') {
            const auto nested = translate_dfhack_output_message(catalog,
                captures[at], depth + 1, true, false, console_utf8);
            if (nested && contains_cjk_utf8(*nested)) resolved[at] = *nested;
        }
        if (!resolved[at] && console_utf8) resolved[at] = captures[at];
    }
    return resolved;
}

static std::optional<std::string> translate_dfhack_output_message(
        const DfhackOutputSnapshot &catalog, std::string_view visible, int depth,
        bool templates, bool fragments, bool console_utf8) {
    if (depth == 0)
        if (auto target = translate_dfhack_workorder_output(catalog, visible, console_utf8))
            return target;
    if (depth == 0)
        if (auto target = translate_dfhack_lever_output(catalog, visible, console_utf8))
            return target;
    const auto normalized = normalize_dfhack_help(visible);
    if (templates && depth == 0)
        if (auto target = translate_dfhack_creature_list_record(catalog, visible, console_utf8))
            return target;
    if (auto target = translate_dfhack_tag_list(catalog, normalized)) return target;
    if (const auto exact = catalog.literals.find(normalized);
            exact != catalog.literals.end()) return exact->second;
    if (templates && depth == 0)
        if (auto target = translate_dfhack_death_message(catalog, visible, console_utf8))
            return target;
    std::unordered_set<size_t> candidates;
    if (templates)
        for (const auto &word : dfhack_output_anchor_words(visible)) {
            const auto found = catalog.template_words.find(word);
            if (found != catalog.template_words.end())
                candidates.insert(found->second.begin(), found->second.end());
        }
    const Rule *selected = nullptr;
    std::vector<std::string> selected_captures;
    size_t specificity = 0;
    bool ambiguous = false;
    for (size_t index : candidates) {
        const auto &rule = catalog.templates[index];
        size_t bytes = 0;
        for (const auto &literal : rule.template_literals) bytes += literal.size();
        if (selected && bytes < specificity) continue;
        std::vector<std::string> captures;
        if (!match_dfhack_output_template(rule, visible, captures)) continue;
        if (selected && bytes == specificity) {
            if (fill_template(*selected, selected_captures) != fill_template(rule, captures))
                ambiguous = true;
            continue;
        }
        selected = &rule;
        selected_captures = std::move(captures);
        specificity = bytes;
        ambiguous = false;
    }
    if (selected && !ambiguous) {
        const auto resolved = resolve_dfhack_output_captures(catalog, *selected,
            selected_captures, depth, console_utf8);
        return fill_template(*selected, selected_captures, nullptr, nullptr, &resolved);
    }
    if (depth == 0)
        if (auto target = translate_dfhack_instruments_output(catalog, visible, console_utf8))
            return target;
    if (depth == 0)
        if (auto target = lookup_dfhack_help_message(catalog, normalized)) return target;
    // Lua adds a source:line prefix to its real message. Retain that precise
    // location and resolve only a complete known message after it; a path
    // itself, or an arbitrary colon-separated table, is never a template.
    if (depth < 3) {
        for (size_t separator = visible.find(": "); separator != std::string_view::npos;
                separator = visible.find(": ", separator + 2)) {
            if (separator == 0) continue;
            const size_t line_colon = visible.rfind(':', separator - 1);
            if (line_colon == std::string_view::npos || line_colon >= separator) continue;
            const auto file = visible.substr(0, line_colon);
            const auto line = visible.substr(line_colon + 1, separator - line_colon - 1);
            if (line.empty() || !std::all_of(line.begin(), line.end(),
                    [](unsigned char ch) { return ch >= '0' && ch <= '9'; }) ||
                    !(file.ends_with(".lua") || file == "?" ||
                      (file.starts_with("[string ") && file.ends_with(']')))) continue;
            const auto target = translate_dfhack_output_message(catalog,
                visible.substr(separator + 2), depth + 1, true, false, console_utf8);
            if (target && contains_cjk_utf8(*target)) {
                const auto location = visible.substr(0, separator + 2);
                return (console_utf8 ? std::string(location) : native_text_to_utf8(location)) + *target;
            }
        }
    }
    if (!fragments || catalog.fragments.empty()) return std::nullopt;
    // Unknown structured records must keep their keys and values. Authored
    // complete messages/tables above can translate; prose fragments cannot
    // reinterpret JSON, tab-separated data, or compact CSV export rows.
    if (!visible.empty() && (visible.front() == '{' ||
            (visible.front() == '[' && visible.back() == ']') ||
            visible.find('\t') != std::string_view::npos)) return std::nullopt;
    if (std::count(visible.begin(), visible.end(), ',') >= 2 &&
            visible.find(' ') == std::string_view::npos) return std::nullopt;
    // Only authored output assembly pieces can compose an unknown result.
    // Quoted values, code identifiers, paths and flags remain native values.
    std::vector<bool> protected_bytes(visible.size());
    for (size_t at = 0; at < visible.size();) {
        if (visible[at] == '[') {
            const size_t close = visible.find(']', at + 1);
            const size_t end = close == std::string_view::npos ? visible.size() : close + 1;
            std::fill(protected_bytes.begin() + at, protected_bytes.begin() + end, true);
            at = end;
            continue;
        }
        if ((visible[at] == '\'' || visible[at] == '"') &&
                (at == 0 || !ascii_word_byte(static_cast<unsigned char>(visible[at - 1])))) {
            const size_t close = visible.find(visible[at], at + 1);
            const size_t end = close == std::string_view::npos ? visible.size() : close + 1;
            std::fill(protected_bytes.begin() + at, protected_bytes.begin() + end, true);
            at = end;
            continue;
        }
        if (native_prose_space(static_cast<unsigned char>(visible[at]))) { ++at; continue; }
        const size_t begin = at;
        while (at < visible.size() && !native_prose_space(static_cast<unsigned char>(visible[at]))) ++at;
        const auto word = visible.substr(begin, at - begin);
        bool code = word.find_first_of("/\\_@") != std::string_view::npos ||
            word.starts_with('-') || word.starts_with("0x") || word.find("::") != std::string_view::npos;
        for (size_t dot = word.find('.'); !code && dot != std::string_view::npos;
                dot = word.find('.', dot + 1))
            code = dot > 0 && dot + 1 < word.size() &&
                ascii_word_byte(static_cast<unsigned char>(word[dot - 1])) &&
                ascii_word_byte(static_cast<unsigned char>(word[dot + 1]));
        if (code) std::fill(protected_bytes.begin() + begin, protected_bytes.begin() + at, true);
    }
    std::string target;
    size_t copied = 0;
    bool translated = false;
    for (size_t at = 0; at < visible.size();) {
        const auto bucket = catalog.fragments.find(visible[at]);
        const std::pair<std::string, std::string> *selected_fragment = nullptr;
        if (!protected_bytes[at] && bucket != catalog.fragments.end())
            for (const auto &fragment : bucket->second) {
                if (!visible.substr(at).starts_with(fragment.first)) continue;
                const size_t end = at + fragment.first.size();
                if ((at > 0 && ascii_word_byte(static_cast<unsigned char>(visible[at - 1])) &&
                        ascii_word_byte(static_cast<unsigned char>(fragment.first.front()))) ||
                    (end < visible.size() && ascii_word_byte(static_cast<unsigned char>(visible[end])) &&
                        ascii_word_byte(static_cast<unsigned char>(fragment.first.back()))) ||
                    std::any_of(protected_bytes.begin() + at, protected_bytes.begin() + end,
                        [](bool value) { return value; })) continue;
                selected_fragment = &fragment;
                break;
            }
        if (!selected_fragment) { ++at; continue; }
        const auto original = visible.substr(copied, at - copied);
        target += console_utf8 ? std::string(original) : native_text_to_utf8(original);
        target += selected_fragment->second;
        at += selected_fragment->first.size();
        copied = at;
        translated = true;
    }
    if (!translated) return std::nullopt;
    target += console_utf8 ? std::string(visible.substr(copied))
        : native_text_to_utf8(visible.substr(copied));
    return target;
}

void Overlay::index_dfhack_output(const Rule &input) {
    constexpr std::string_view fragment_prefix = "DFHack output fragment: ";
    if (input.source.starts_with(fragment_prefix)) {
        const auto raw = std::string_view(input.source).substr(fragment_prefix.size());
        auto source = normalize_dfhack_help(raw);
        if (!source.empty()) {
            if (native_prose_space(static_cast<unsigned char>(raw.front()))) source.insert(0, 1, ' ');
            if (native_prose_space(static_cast<unsigned char>(raw.back()))) source.push_back(' ');
        }
        if (!source.empty()) dfhack_output_fragments_.insert_or_assign(source, input.target);
        return;
    }
    constexpr std::string_view value_prefix = "DFHack output value: ";
    if (input.source.starts_with(value_prefix)) {
        dfhack_output_values_.insert_or_assign(
            normalize_dfhack_help(std::string_view(input.source).substr(value_prefix.size())),
            input.target);
        return;
    }
    constexpr std::string_view prefix = "DFHack output: ";
    if (!input.source.starts_with(prefix)) return;
    Rule rule;
    rule.source = normalize_dfhack_help(std::string_view(input.source).substr(prefix.size()));
    rule.target = input.target;
    rule.help_prose = true; // use the complete, whitespace-aware catalog matcher
    if (rule.source.empty() || rule.target.empty()) return;
    split_template(rule.source, &rule.template_literals, &rule.template_kinds);
    if (!rule.template_kinds.empty()) {
        if (!compile_template_target(rule)) return;
        if (const auto found = dfhack_output_template_source_index_.find(rule.source);
                found != dfhack_output_template_source_index_.end()) {
            dfhack_output_templates_[found->second] = std::move(rule);
            return;
        }
        std::string anchor;
        for (const auto &literal : rule.template_literals)
            for (const auto &word : dfhack_output_anchor_words(literal))
                if (word.size() > anchor.size()) anchor = word;
        // A template made entirely of unconstrained captures has no prose to
        // translate and could reinterpret arbitrary user code as a message.
        if (anchor.empty()) return;
        const size_t index = dfhack_output_templates_.size();
        dfhack_output_template_source_index_.emplace(rule.source, index);
        dfhack_output_templates_.push_back(std::move(rule));
        dfhack_output_template_words_[anchor].push_back(index);
        return;
    }
    capture_translations_.insert_or_assign(std::string(prefix) + rule.source, rule.target);
    if (const auto found = dfhack_output_source_index_.find(rule.source);
            found != dfhack_output_source_index_.end()) {
        dfhack_output_paragraphs_[found->second].target = rule.target;
        return;
    }
    const size_t index = dfhack_output_paragraphs_.size();
    dfhack_output_paragraphs_.push_back({rule.source, rule.target});
    dfhack_output_source_index_.emplace(rule.source, index);
    std::unordered_set<std::string> seen;
    std::istringstream words(rule.source);
    for (std::string word; words >> word;)
        if (seen.insert(word).second) dfhack_output_words_[word].push_back(index);
}

void Overlay::load_dfhack_help_catalog() {
    const auto directory = fs::u8path(config_.mapping_path).parent_path();
    auto snapshot = std::make_shared<DfhackOutputSnapshot>();
    for (size_t file = 0; file < dfhack_catalog_names_.size(); ++file) {
        const auto path = directory / dfhack_catalog_names_[file];
        std::error_code error;
        const auto mtime = fs::last_write_time(path, error);
        dfhack_help_mtimes_[file] = error ? fs::file_time_type{} : mtime;
        std::ifstream input(path, std::ios::binary);
        if (!input) continue;
        size_t line_number = 0;
        for (std::string line; std::getline(input, line);) {
            ++line_number;
            if (!line.empty() && line.back() == '\r') line.pop_back();
            if (line_number == 1 && line.starts_with("\xef\xbb\xbf")) line.erase(0, 3);
            if (line.empty() || line.front() == '#') continue;
            const size_t tab = line.find('\t');
            if (tab == std::string::npos) continue;
            const size_t flags = line.find('\t', tab + 1);
            bool source_ok = false, target_ok = false;
            Rule rule;
            rule.source = unescape_tsv(std::string_view(line).substr(0, tab), &source_ok);
            rule.target = unescape_tsv(std::string_view(line).substr(tab + 1,
                flags == std::string::npos ? std::string::npos : flags - tab - 1), &target_ok);
            std::vector<uint32_t> codepoints;
            const bool gui_field = rule.source.starts_with("DFHack GUI ");
            constexpr std::string_view death_prefix = "DFHack death cause: ";
            constexpr std::string_view death_phrase_prefix = "DFHack deathcause phrase: ";
            constexpr std::string_view month_prefix = "DFHack human month: ";
            constexpr std::string_view season_prefix = "DFHack human season: ";
            const bool death_cause = rule.source.starts_with(death_prefix);
            const bool death_phrase = rule.source.starts_with(death_phrase_prefix);
            const bool calendar_month = rule.source.starts_with(month_prefix);
            const bool calendar_season = rule.source.starts_with(season_prefix);
            const bool output = rule.source.starts_with("DFHack output: ") ||
                rule.source.starts_with("DFHack output value: ") ||
                rule.source.starts_with("DFHack output fragment: ");
            if (!source_ok || !target_ok ||
                    (!gui_field && !output && !death_cause && !death_phrase &&
                     !calendar_month && !calendar_season &&
                     !rule.source.starts_with("DFHack help: ")) ||
                    trim(rule.target).empty() || !decode_utf8(rule.target, codepoints)) continue;
            if (std::string_view(dfhack_catalog_names_[file]) == "dfhack-output-stonesense.tsv")
                index_dfhack_stonesense_text(*snapshot, rule);
            if (calendar_season) {
                if (contains_cjk_utf8(rule.target)) snapshot->calendar_seasons.insert_or_assign(
                    rule.source.substr(season_prefix.size()), rule.target);
            } else if (calendar_month) {
                if (contains_cjk_utf8(rule.target)) snapshot->calendar_months.insert_or_assign(
                    rule.source.substr(month_prefix.size()), rule.target);
            } else if (death_cause) {
                if (contains_cjk_utf8(rule.target)) snapshot->death_causes.insert_or_assign(
                    rule.source.substr(death_prefix.size()), rule.target);
            } else if (death_phrase) {
                rule.source.erase(0, death_phrase_prefix.size());
                split_template(rule.source, &rule.template_literals, &rule.template_kinds);
                if (rule.template_kinds.size() == 1 && compile_template_target(rule))
                    snapshot->death_phrases.insert_or_assign(rule.source, rule);
            } else if (output) index_dfhack_output(rule);
            else if (gui_field) {
                snapshot->gui_fields.insert_or_assign(rule.source, rule.target);
                capture_translations_.insert_or_assign(rule.source, rule.target);
            }
            else index_dfhack_help_paragraph(rule);
        }
    }
    for (const auto &paragraph : dfhack_output_paragraphs_)
        snapshot->literals.emplace(paragraph.source, paragraph.target);
    for (const auto &paragraph : dfhack_help_paragraphs_)
        snapshot->help.emplace(paragraph.source, paragraph.target);
    snapshot->values = dfhack_output_values_;
    snapshot->templates = dfhack_output_templates_;
    snapshot->template_words = dfhack_output_template_words_;
    for (const auto &[source, target] : dfhack_output_fragments_)
        snapshot->fragments[source.front()].emplace_back(source, target);
    for (auto &[first, fragments] : snapshot->fragments)
        std::sort(fragments.begin(), fragments.end(), [](const auto &a, const auto &b) {
            return a.first.size() > b.first.size();
        });
    g_dfhack_output_snapshot.store(std::move(snapshot), std::memory_order_release);
}

void Overlay::publish_dfhack_caption_snapshot() {
    const auto current = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!current) return;
    auto snapshot = std::make_shared<DfhackOutputSnapshot>(*current);
    // Copy world-independent exceptional material spellings while holding
    // the translation state. Detached Console callbacks never read Overlay.
    std::unordered_map<std::string, std::string> material_qualifiers;
    for (const auto &[source, material] : g_magical_materials)
        material_qualifiers.emplace(source, material.qualifier);
    snapshot->caption_grammar = RULESETS.make_caption_snapshot(std::move(material_qualifiers));
    snapshot->raw_creature_labels = native_dfhack_raw_creature_labels();
    snapshot->raw_creature_adjectives = native_dfhack_raw_creature_adjectives();
    for (const auto &[source, target] : capture_translations_)
        if (!source.empty() && contains_cjk_utf8(target))
            snapshot->human_captions.try_emplace(lower(native_text_to_utf8(source)), target);
    g_dfhack_output_snapshot.store(std::move(snapshot), std::memory_order_release);
}

std::optional<std::string> Overlay::translate_dfhack_help_rows(
        const std::vector<Match> &rows, int native_width,
        NativeParagraphViewport *viewport, std::string *complete_source) const {
    std::string visible;
    for (const auto &row : rows) {
        if (!visible.empty()) visible += ' ';
        visible += row.source;
    }
    if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
        if (auto target = translate_dfhack_tag_list(*catalog, visible)) {
            if (viewport) *viewport = {};
            if (complete_source) *complete_source = normalize_dfhack_help(visible);
            return target;
        }
        if (auto target = lookup_dfhack_help_message(*catalog, normalize_dfhack_help(visible))) {
            if (viewport) *viewport = {};
            if (complete_source) *complete_source = normalize_dfhack_help(visible);
            return target;
        }
    }
    return translate_dfhack_catalog_rows(rows, native_width, "DFHack help: ",
        dfhack_help_paragraphs_, dfhack_help_words_, viewport, complete_source);
}

std::optional<std::string> Overlay::translate_dfhack_catalog_rows(
        const std::vector<Match> &rows, int native_width, std::string_view prefix,
        const std::vector<DfhackHelpParagraph> &paragraphs,
        const std::unordered_map<std::string, std::vector<size_t>> &catalog_words,
        NativeParagraphViewport *viewport, std::string *complete_source) const {
    if (viewport) *viewport = {};
    if (complete_source) complete_source->clear();
    if (rows.empty() || native_width <= 0) return std::nullopt;
    std::string visible;
    for (const Match &row : rows) {
        if (!visible.empty()) visible.push_back(' ');
        visible += row.source;
    }
    visible = normalize_dfhack_help(visible);
    if (visible.empty()) return std::nullopt;
    if (auto target = exact_literal_translation(std::string(prefix) + visible)) {
        if (complete_source) *complete_source = visible;
        return target;
    }
    // The version/commit is a runtime value. Preserve it as one value rather
    // than putting its English prefix through unrelated noun/name grammars.
    constexpr std::string_view version_prefix = "You're running DFHack ";
    if (prefix == "DFHack help: " && visible.starts_with(version_prefix)) {
        if (auto target = exact_literal_translation("DFHack help: You're running DFHack")) {
            if (complete_source) *complete_source = visible;
            return *target + " " + visible.substr(version_prefix.size());
        }
    }
    // Use the rarest visible word to recover a complete documented block.
    // Every visible byte must occur contiguously in that source, with actual
    // word boundaries. A shared short suffix cannot select another document.
    const std::vector<size_t> *candidates = nullptr;
    std::istringstream words(visible);
    size_t word_count = 0;
    for (std::string word; words >> word;) {
        ++word_count;
        const auto found = catalog_words.find(word);
        if (found != catalog_words.end() &&
                (!candidates || found->second.size() < candidates->size()))
            candidates = &found->second;
    }
    if (!candidates || word_count < 3 || visible.size() < 20) return std::nullopt;
    const DfhackHelpParagraph *selected = nullptr;
    std::string selected_source;
    NativeParagraphViewport selected_viewport{};
    for (size_t index : *candidates) {
        const auto &paragraph = paragraphs[index];
        const bool plugin_period = prefix == "DFHack help: " && !paragraph.source.empty() &&
            paragraph.source.back() != '.' && contains_cjk_utf8(paragraph.target);
        for (int form = 0; form < (plugin_period ? 2 : 1); ++form) {
            // Keep the native period in the complete source returned to the
            // launcher's subsequent console and graphical wrapping passes.
            const std::string source = paragraph.source + (form ? "." : "");
            const size_t at = source.find(visible);
            if (at == std::string::npos ||
                    (at > 0 && source[at - 1] != ' ') ||
                    (at + visible.size() < source.size() &&
                     source[at + visible.size()] != ' ')) continue;
            const auto wrapped = dfhack_help_native_wrap(source, native_width);
            int first_line = -1;
            for (size_t first = 0; first + rows.size() <= wrapped.size(); ++first) {
                bool same = true;
                for (size_t line = 0; same && line < rows.size(); ++line)
                    same = normalize_dfhack_help(wrapped[first + line]) ==
                        normalize_dfhack_help(rows[line].source);
                if (same) { first_line = static_cast<int>(first); break; }
            }
            int total_lines = static_cast<int>(wrapped.size());
            if (first_line < 0) {
                // helpdb also preserves hard line breaks and list indents from
                // rendered docs before WrappedLabel wraps them. Their exact
                // contiguous source still proves the paragraph; determine the
                // scroll position from its preceding native text allocation.
                const auto preceding = dfhack_help_native_wrap(
                    trim_view(std::string_view(source).substr(0, at)), native_width);
                first_line = static_cast<int>(preceding.size());
                const auto following = dfhack_help_native_wrap(
                    trim_view(std::string_view(source).substr(at + visible.size())), native_width);
                total_lines = first_line + static_cast<int>(rows.size() + following.size());
            }
            if (selected && selected_source.size() < source.size()) continue;
            if (selected && selected_source.size() == source.size() &&
                    (selected_source != source || selected->target != paragraph.target))
                return std::nullopt;
            selected = &paragraph;
            selected_source = source;
            selected_viewport = {first_line, std::max(total_lines,
                first_line + static_cast<int>(rows.size()))};
        }
    }
    if (!selected) return std::nullopt;
    if (viewport) *viewport = selected_viewport;
    if (complete_source) *complete_source = selected_source;
    return selected->target;
}

std::optional<std::string> Overlay::translate_dfhack_output_rows(
        const std::vector<Match> &rows, int native_width,
        NativeParagraphViewport *viewport, std::string *complete_source, int depth) const {
    if (viewport) *viewport = {};
    if (complete_source) complete_source->clear();
    if (rows.empty() || native_width <= 0) return std::nullopt;
    std::string visible;
    for (const auto &row : rows) {
        if (!visible.empty()) visible.push_back(' ');
        visible += row.source;
    }
    if (depth == 0)
        if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
            // workorder's very-verbose report uses real hard lines and all
            // fields begin at the same widget edge. Keep them separate;
            // joining an unrelated numeric table as prose loses its roles.
            std::string report;
            bool hard_rows = true;
            for (size_t at = 0; at < rows.size(); ++at) {
                if (rows[at].x != rows.front().x ||
                        rows[at].y != rows.front().y + static_cast<int>(at)) {
                    hard_rows = false;
                    break;
                }
                if (at) report.push_back('\n');
                report += rows[at].source;
            }
            if (hard_rows)
                if (auto target = translate_dfhack_workorder_output(*catalog, report, false)) {
                    if (complete_source) *complete_source = std::move(report);
                    return target;
                }
            if (auto target = translate_dfhack_agreement_output_rows(
                    *catalog, rows, native_width, visible)) {
                if (complete_source) *complete_source = visible;
                return target;
            }
            // Multiline lever output needs the widget's actual left edge
            // and hard-line indentation. Its dedicated caller proves those
            // rows; flattened prose must not absorb a following report.
            if (rows.size() == 1)
                if (auto target = translate_dfhack_lever_output(*catalog, visible, false)) {
                    if (complete_source) *complete_source = visible;
                    return target;
                }
            if (auto target = translate_dfhack_creature_list_record(*catalog, visible, false)) {
                if (complete_source) *complete_source = visible;
                return target;
            }
        }
    const std::string raw_visible = visible;
    visible = normalize_dfhack_help(visible);
    if (visible.empty() || visible.starts_with("> ")) return std::nullopt;
    if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
        if (auto target = translate_dfhack_tag_list(*catalog, visible)) {
            if (complete_source) *complete_source = visible;
            return target;
        }
    }
    // Prefer complete output messages to the help corpus, including when
    // native indentation and graphical wrapping introduce extra spaces.
    if (auto target = exact_literal_translation("DFHack output: " + visible)) {
        if (complete_source) *complete_source = visible;
        return target;
    }
    std::unordered_set<size_t> candidates;
    for (const auto &word : dfhack_output_anchor_words(visible)) {
        const auto found = dfhack_output_template_words_.find(word);
        if (found != dfhack_output_template_words_.end())
            candidates.insert(found->second.begin(), found->second.end());
    }
    const Rule *selected = nullptr;
    std::vector<std::string> selected_captures;
    size_t specificity = 0;
    bool ambiguous = false;
    // Several separately printed messages may have no blank row between
    // them. A trailing {s} must not swallow the next message as its value.
    bool template_block = true;
    if (rows.size() > 1) {
        const auto wrapped = dfhack_help_native_wrap(visible, native_width);
        template_block = wrapped.size() == rows.size();
        for (size_t at = 0; template_block && at < rows.size(); ++at)
            template_block = normalize_dfhack_help(wrapped[at]) ==
                normalize_dfhack_help(rows[at].source);
    }
    if (template_block && depth == 0)
        if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire))
            if (auto target = translate_dfhack_death_message(*catalog, visible, false)) {
                if (complete_source) *complete_source = visible;
                return target;
            }
    for (size_t index : candidates) {
        if (!template_block) break;
        const auto &rule = dfhack_output_templates_[index];
        size_t literal_bytes = 0;
        for (const auto &literal : rule.template_literals) literal_bytes += literal.size();
        if (selected && literal_bytes < specificity) continue;
        std::vector<std::string> captures;
        std::vector<std::pair<size_t, size_t>> ranges;
        if (!match_catalog_template(rule, visible, 0, captures, ranges)) continue;
        // Equally specific conflicting templates cannot safely select a
        // translation based on unordered-map iteration order.
        if (selected && literal_bytes == specificity) {
            if (fill_template(*selected, selected_captures) != fill_template(rule, captures))
                ambiguous = true;
            continue;
        }
        selected = &rule;
        selected_captures = std::move(captures);
        specificity = literal_bytes;
        ambiguous = false;
    }
    if (selected && !ambiguous) {
        std::vector<std::optional<std::string>> resolved(selected_captures.size());
        for (size_t at = 0; at < selected_captures.size(); ++at) {
            if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
                resolved[at] = translate_dfhack_human_capture(*catalog, *selected, at,
                    selected_captures[at], false);
                if (resolved[at]) continue;
            }
            const bool identity = dfhack_output_identity_capture(*selected, at);
            if (const auto found = dfhack_output_values_.find(selected_captures[at]);
                    !identity && found != dfhack_output_values_.end()) resolved[at] = found->second;
            else if (!identity && depth < 2 && selected->template_kinds[at] == 's') {
                // Error/Warning commonly wrap another complete command
                // message. Resolve that message within the output catalog;
                // identifiers and unknown runtime values remain unchanged.
                const auto &source = selected_captures[at];
                const std::vector<Match> value{{0, 0, static_cast<int>(source.size()),
                    kDfhackHotkeysHintRule, {}, source}};
                const auto translated = translate_dfhack_output_rows(value,
                    static_cast<int>(source.size()) + 1, nullptr, nullptr, depth + 1);
                if (translated && contains_cjk_utf8(*translated)) resolved[at] = *translated;
                else if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
                    const auto message = translate_dfhack_output_message(*catalog,
                        source, depth + 1, true, false);
                    if (message && contains_cjk_utf8(*message)) resolved[at] = *message;
                }
            }
        }
        if (complete_source) *complete_source = visible;
        return fill_template(*selected, selected_captures, nullptr, nullptr, &resolved);
    }
    if (depth == 0 && template_block)
        if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire))
            if (auto target = translate_dfhack_instruments_output(*catalog, raw_visible, false)) {
                if (complete_source) *complete_source = raw_visible;
                return target;
            }
    if (auto target = translate_dfhack_catalog_rows(rows, native_width, "DFHack output: ",
            dfhack_output_paragraphs_, dfhack_output_words_, viewport, complete_source))
        return target;
    // help, --help, ls and tags are console output too. Their documented
    // descriptions share the existing complete-paragraph and scroll reader.
    if (depth == 0) {
        if (auto target = translate_dfhack_help_rows(rows, native_width, viewport, complete_source))
            return target;
        if (const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire)) {
            const auto target = translate_dfhack_output_message(*catalog, visible, 1, false, true);
            if (target) {
                if (viewport) *viewport = {};
                if (complete_source) *complete_source = visible;
                return target;
            }
        }
    }
    return std::nullopt;
}

static std::optional<std::string> translate_dfhack_siren_announcement(std::string_view source) {
    constexpr std::string_view prefix = "A loud siren sounds throughout ";
    constexpr std::string_view suffix = ", waking the sleeping and startling the awake.";
    if (source.size() <= prefix.size() + suffix.size() || source.size() > 65536 ||
            !source.starts_with(prefix) || !source.ends_with(suffix) ||
            source.find_first_of("\r\n\t") != std::string_view::npos) return std::nullopt;
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!catalog) return std::nullopt;
    const std::string default_source = std::string(prefix) + "the halls and tunnels" + std::string(suffix);
    if (source == default_source) {
        const auto target = catalog->literals.find(default_source);
        return target != catalog->literals.end() && contains_cjk_utf8(target->second)
            ? std::optional<std::string>(target->second) : std::nullopt;
    }
    // Resolve only this authored frame, without whitespace normalization or
    // recursive values. Custom burrow names can contain the suffix's words,
    // punctuation, meaningful double spaces, or multiple names joined by Lua.
    const std::string form = std::string(prefix) + "{s}" + std::string(suffix);
    for (const auto &rule : catalog->templates) {
        if (rule.source != form) continue;
        std::vector<std::string> captures;
        if (!match_dfhack_output_template(rule, source, captures) || captures.size() != 1)
            return std::nullopt;
        const auto target = fill_template(rule, captures);
        return contains_cjk_utf8(target) ? std::optional<std::string>(target) : std::nullopt;
    }
    return std::nullopt;
}

static std::optional<std::string> translate_dfhack_console_output(std::string_view source) {
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!catalog || source.empty() || source.size() > 262144) return std::nullopt;
    struct Line { std::string_view text, ending; };
    std::vector<Line> lines;
    for (size_t at = 0; at < source.size();) {
        const size_t newline = source.find('\n', at);
        const size_t end = newline == std::string_view::npos ? source.size() : newline;
        const bool cr = end > at && source[end - 1] == '\r';
        lines.push_back({source.substr(at, end - at - static_cast<size_t>(cr)),
            source.substr(end - static_cast<size_t>(cr),
                static_cast<size_t>(cr) + static_cast<size_t>(newline != std::string_view::npos))});
        at = newline == std::string_view::npos ? source.size() : newline + 1;
    }
    const auto identifier = [](std::string_view value) {
        return value == "?" || (!value.empty() && std::all_of(value.begin(), value.end(), [](unsigned char ch) {
            return ascii_word_byte(ch) || ch == '/' || ch == '-' || ch == '.';
        }));
    };
    const auto head = [&](size_t at) -> std::optional<std::pair<std::string_view, size_t>> {
        const auto line = lines[at].text;
        if (line.size() > 21 && line[20] == ' ') {
            const auto key = trim_view(line.substr(0, 20));
            if (identifier(key) && std::all_of(line.begin() + key.size(), line.begin() + 21,
                    [](char ch) { return ch == ' '; })) return std::pair{key, size_t{21}};
        }
        return std::nullopt;
    };
    std::string output;
    bool changed = false;
    for (size_t at = 0; at < lines.size();) {
        const auto raw = lines[at].text;
        const auto ink = trim_view(raw);
        if (ink.empty() || ink.starts_with("> ")) {
            output.append(raw); output.append(lines[at].ending); ++at; continue;
        }
        if (ink == "Milkable units:" || ink == "Shearable units:") {
            const auto footer = ink == "Milkable units:" ? "Milking jobs needed: "
                                                        : "Shearing jobs needed: ";
            std::string report;
            bool translated_report = false;
            for (size_t end = at; end < lines.size(); ++end) {
                if (end > at && (trim_view(lines[end].text).empty() ||
                        trim_view(lines[end].text).starts_with("> "))) break;
                if (end > at) report.push_back('\n');
                report.append(lines[end].text);
                if (!trim_view(lines[end].text).starts_with(footer)) continue;
                if (auto target = translate_dfhack_workorder_output(*catalog, report, true)) {
                    output += *target;
                    output.append(lines[end].ending);
                    at = end + 1;
                    changed = true;
                    translated_report = true;
                }
                break;
            }
            if (translated_report) continue;
        }
        if (dfhack_agreement_record_start(ink) && at + 1 < lines.size() &&
                lines[at + 1].text.starts_with("\tas agreed on ")) {
            std::string agreement(ink);
            agreement += '\n';
            agreement += lines[at + 1].text;
            if (auto target = translate_dfhack_output_message(*catalog, agreement,
                    0, true, false, true); target && contains_cjk_utf8(*target)) {
                output.append(raw.substr(0, static_cast<size_t>(ink.data() - raw.data())));
                output += *target;
                output.append(lines[at + 1].ending);
                at += 2;
                changed = true;
                continue;
            }
        }
        auto columns = head(at);
        size_t description_at = at;
        if (!columns && raw == ink && raw.size() > 20 && identifier(raw) &&
                at + 1 < lines.size() && lines[at + 1].text.starts_with(std::string(22, ' ')) &&
                !trim_view(lines[at + 1].text.substr(22)).starts_with("tags: ")) {
            columns = std::pair{ink, size_t{22}};
            description_at = at + 1;
        }
        if (columns) {
            std::string description(lines[description_at].text.substr(columns->second));
            size_t end = description_at + 1;
            while (end < lines.size() && lines[end].text.starts_with(std::string(22, ' ')) &&
                    !trim_view(lines[end].text.substr(22)).starts_with("tags: ")) {
                description += ' ';
                description += trim_view(lines[end].text.substr(22));
                ++end;
            }
            const auto target = translate_dfhack_output_message(*catalog,
                normalize_dfhack_help(description), 0, true, false, true);
            if (target && contains_cjk_utf8(*target)) {
                if (description_at != at) {
                    output.append(raw);
                    output.append(lines[at].ending);
                }
                output.append(lines[description_at].text.substr(0, columns->second));
                output += *target;
                const auto last_description = lines[end - 1].text;
                const auto last_ink = trim_view(last_description);
                if (!last_ink.empty()) output.append(last_description.substr(
                    static_cast<size_t>(last_ink.data() - last_description.data()) + last_ink.size()));
                output.append(lines[end - 1].ending);
                at = end; changed = true; continue;
            }
        }
        size_t end = at + 1;
        while (end < lines.size() && end - at < 64 && !trim_view(lines[end].text).empty() &&
                !head(end) && !trim_view(lines[end].text).starts_with("> ")) ++end;
        bool claimed = false;
        // A documented paragraph can contain explicit console newlines.
        // Multi-line templates cannot consume unrelated following messages.
        for (size_t count = end - at; count > 0; --count) {
            std::string visible;
            for (size_t line = at; line < at + count; ++line) {
                if (!visible.empty()) visible.push_back('\n');
                visible += lines[line].text;
            }
            const auto target = translate_dfhack_output_message(*catalog,
                count == 1 ? trim_view(visible) : std::string_view(visible),
                0, count == 1, count == 1, true);
            if (!target || !contains_cjk_utf8(*target)) continue;
            output.append(raw.substr(0, static_cast<size_t>(ink.data() - raw.data())));
            output += *target;
            const auto last_text = lines[at + count - 1].text;
            const auto last_ink = trim_view(last_text);
            if (!last_ink.empty()) output.append(last_text.substr(
                static_cast<size_t>(last_ink.data() - last_text.data()) + last_ink.size()));
            output.append(lines[at + count - 1].ending);
            at += count; changed = claimed = true; break;
        }
        if (!claimed) { output.append(raw); output.append(lines[at].ending); ++at; }
    }
    return changed ? std::optional<std::string>(std::move(output)) : std::nullopt;
}

static std::optional<std::string> translate_dfhack_console_prompt(std::string_view source) {
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!catalog || source.empty() || source.size() > 4096) return std::nullopt;
    // Input prompts must match one complete authored question. Partial prose
    // cannot change a command shell or an unknown interactive protocol.
    auto target = translate_dfhack_output_message(*catalog,
        normalize_dfhack_help(source), 0, true, false, true);
    if (!target || !contains_cjk_utf8(*target)) return std::nullopt;
    return target;
}

static std::optional<std::string> translate_dfhack_stonesense_text(std::string_view source) {
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    if (!catalog || source.empty() || source.size() > 65536) return std::nullopt;
    if (auto target = lookup_dfhack_stonesense_announcement(source)) return target;
    if (const auto exact = catalog->stonesense_literals.find(normalize_dfhack_help(source));
            exact != catalog->stonesense_literals.end()) return exact->second;
    std::unordered_set<size_t> candidates;
    for (const auto &word : dfhack_output_anchor_words(source)) {
        const auto found = catalog->stonesense_words.find(word);
        if (found != catalog->stonesense_words.end())
            candidates.insert(found->second.begin(), found->second.end());
    }
    const Rule *selected = nullptr;
    std::string target;
    size_t specificity = 0;
    bool ambiguous = false;
    for (size_t index : candidates) {
        const auto &rule = catalog->stonesense_templates[index];
        size_t literal_bytes = 0;
        for (const auto &literal : rule.template_literals) literal_bytes += literal.size();
        if (selected && literal_bytes < specificity) continue;
        std::vector<std::string> captures;
        if (!match_dfhack_output_template(rule, source, captures)) continue;
        std::vector<std::optional<std::string>> raw(captures.begin(), captures.end());
        auto translated = fill_template(rule, captures, nullptr, nullptr, &raw);
        if (selected && literal_bytes == specificity) {
            if (translated != target) ambiguous = true;
            continue;
        }
        selected = &rule;
        target = std::move(translated);
        specificity = literal_bytes;
        ambiguous = false;
    }
    // Allegro debug fields, key names, enums and nicknames are opaque native
    // UTF-8 captures. No help, fragment or generic value translation applies.
    return selected && !ambiguous && contains_cjk_utf8(target)
        ? std::optional<std::string>(std::move(target)) : std::nullopt;
}

// A DFHack title replaces a run of its own top edge. Prove the remaining
// corners, both connected sides, and the complete bottom edge/signature.
// Restored CP437 comes only from set_tile writes whose texture is live.
static std::optional<SDL_Rect> native_dfhack_frame(
        const std::vector<std::string> &rows, int title_y,
        int title_x, int title_length, int minimum_width = 26, int minimum_height = 7) {
    if (rows.empty() || title_y < 0 || title_y >= static_cast<int>(rows.size()) ||
            title_x < 0 || title_length < 0) return std::nullopt;
    const int width = static_cast<int>(rows[title_y].size());
    const auto ch = [&](int x, int y) { return static_cast<unsigned char>(rows[y][x]); };
    const auto vertical = [&](int x, int y) {
        const auto value = ch(x, y);
        return value == 0xb3 || value == 0xba || value == 0xc3 ||
            value == 0xcc || value == 0xb4 || value == 0xb9;
    };
    const auto horizontal = [&](int x, int y) {
        const auto value = ch(x, y);
        return value == 0xc4 || value == 0xcd || value == 0xc2 ||
            value == 0xcb || value == 0xc1 || value == 0xca;
    };
    for (int left = title_x - 1; left >= 0; --left) {
        if (ch(left, title_y) != 0xda && ch(left, title_y) != 0xc9) continue;
        for (int right = title_x + title_length; right < width; ++right) {
            if (ch(right, title_y) != 0xbf && ch(right, title_y) != 0xbb) continue;
            bool top = true;
            for (int x = left + 1; top && x < right; ++x)
                top = horizontal(x, title_y) ||
                    (x >= title_x && x < title_x + title_length) ||
                    (x >= title_x - 2 && x <= title_x + title_length + 1 && ch(x, title_y) == ' ');
            if (!top) continue;
            for (int bottom = title_y + 1; bottom < static_cast<int>(rows.size()); ++bottom) {
                const auto lc = ch(left, bottom), rc = ch(right, bottom);
                if ((lc == 0xc0 || lc == 0xc8) && (rc == 0xd9 || rc == 0xbc)) {
                    bool lower = true;
                    const size_t signature = rows[bottom].find("DFHack", left + 1);
                    const size_t pause = rows[bottom].find(" PAUSE FORCED ", left + 1);
                    const bool pause_blink = left + 16 < right &&
                        rows[bottom].compare(left + 2, 14, std::string(14, ' ')) == 0;
                    for (int x = left + 1; lower && x < right; ++x)
                        lower = horizontal(x, bottom) ||
                            (signature != std::string::npos &&
                             x >= static_cast<int>(signature) - 1 &&
                             x <= static_cast<int>(signature) + 6) ||
                            (pause != std::string::npos && x >= static_cast<int>(pause) &&
                             x < static_cast<int>(pause) + 14) ||
                            (pause_blink && x >= left + 2 && x < left + 16);
                    if (lower && right - left + 1 >= minimum_width &&
                            bottom - title_y + 1 >= minimum_height)
                        return SDL_Rect{left, title_y, right - left + 1, bottom - title_y + 1};
                    break;
                }
                if (!vertical(left, bottom) || !vertical(right, bottom)) break;
            }
        }
    }
    return std::nullopt;
}
