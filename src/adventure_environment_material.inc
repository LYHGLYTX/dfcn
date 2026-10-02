// PE 0x835460/0x8389f0 prepend every qualifying tile contaminant's
// STATE_ADJ, then optional stagnant/salt and the chosen STATE_NAME. Each
// material can own NAME_PREFIX and a historical person's possessive name.
// Parse complete typed fields backwards; no wordwise or name fallback.
std::optional<std::string> Overlay::translate_adventure_environment_material(
        std::string_view raw) const {
    const std::string source = normalize_utterance(raw);
    if (source.empty() || source.ends_with("...")) return std::nullopt;
    const auto material = [&](auto &&self, std::string_view value, bool adjective)
            -> std::optional<std::string> {
        std::optional<std::string> target;
        if (!adjective && (value == "stagnant water" || value == "salt water" ||
                value == "stagnant salt water")) {
            std::string title(value);
            title.front() -= 'a' - 'A';
            target = exact_literal_translation(title);
        }
        // Keep established dead/salt-water names; water's phase can also
        // be ice/steam, so the two independent prefixes are not water-only
        // English literals. No ordinary adjective permits a free name slot.
        if (!target && !adjective) {
            std::string_view noun = value;
            std::string modifiers;
            for (std::string_view prefix : {"stagnant ", "salt "}) {
                if (!noun.starts_with(prefix)) continue;
                const auto modifier = exact_literal_translation(
                    "Adventure environment modifier: " + std::string(trim_view(prefix)));
                if (!modifier) return std::nullopt;
                modifiers += *modifier;
                noun.remove_prefix(prefix.size());
            }
            if (!modifiers.empty()) {
                const auto suffix = self(self, noun, false);
                if (suffix) target = modifiers + *suffix;
            }
        }
        if (!target) target = translate_material_name(value, false);
        if (!target && adjective) {
            // Deposited STATE_ADJ is a substance, not a manufacturing
            // qualifier. Resolve owners before the shared adjective grammar
            // to avoid adding a finished item's "质" to blood and similar names.
            for (size_t at = value.find("'s "); at != std::string_view::npos;
                    at = value.find("'s ", at + 1)) {
                const auto owner = translate_legends_actor(value.substr(0, at));
                const auto suffix = self(self, value.substr(at + 3), true);
                if (translation_complete_with_native_nicknames(owner, value.substr(0, at)) && suffix) {
                    target = *owner + "的" + *suffix;
                    break;
                }
            }
            if (!target) {
                std::vector<size_t> origins;
                target = RULESETS.translate_with_origins(native_text_to_utf8(value),
                    "::materials::adjective", origins);
            }
        }
        return translation_complete_with_native_nicknames(target, value)
            ? target : std::nullopt;
    };
    struct MaterialFields {
        std::string noun;
        std::vector<std::string> deposits;
    };
    std::vector<size_t> starts{0};
    for (size_t at = 1; at < source.size(); ++at)
        if (source[at - 1] == ' ' && source[at] != ' ') starts.push_back(at);
    std::unordered_map<size_t, MaterialFields> suffixes;
    for (auto start = starts.rbegin(); start != starts.rend(); ++start) {
        const std::string_view tail = std::string_view(source).substr(*start);
        if (const auto noun = material(material, tail, false)) {
            suffixes.emplace(*start, MaterialFields{*noun, {}});
            continue;
        }
        for (auto end = starts.rbegin(); end != starts.rend() && *end > *start; ++end) {
            translation_work_step();
            const auto suffix = suffixes.find(*end);
            if (suffix == suffixes.end()) continue;
            const auto adjective = material(material, trim_view(std::string_view(source).substr(
                *start, *end - *start)), true);
            if (!adjective) continue;
            MaterialFields fields = suffix->second;
            fields.deposits.insert(fields.deposits.begin(), *adjective);
            suffixes.emplace(*start, std::move(fields));
            break;
        }
    }
    const auto found = suffixes.find(0);
    if (found == suffixes.end()) return std::nullopt;
    const auto &fields = found->second;
    if (fields.deposits.empty()) return fields.noun;
    std::string target = "混有";
    for (const auto &deposit : fields.deposits) {
        if (target != "混有") target += "、";
        target += deposit;
    }
    return target + "的" + fields.noun;
}
