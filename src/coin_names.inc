// Minted coins prepend native civilization/ruler identities to the ordinary
// material + coin grammar. Keep those identities in the shared phonetic
// namespace, while material and item nouns retain the established glossary.
std::optional<std::string> Overlay::translate_coin_native_identity(
        std::string_view raw_source) const {
    std::string source = trim(std::string(raw_source));
    if (source.empty()) return std::nullopt;
    if (auto native = utf8_to_cp437(source)) source = std::move(*native);
    bool has_letter = false;
    for (const unsigned char ch : source) {
        const bool letter = (ch >= 'a' && ch <= 'z') ||
            (ch >= 'A' && ch <= 'Z') || is_cp437_latin_letter_byte(ch);
        if (ch == ' ') {
            if (!has_letter) return std::nullopt;
            has_letter = false;
        } else if (letter) {
            has_letter = true;
        } else if (ch != '\'' && ch != '-') {
            return std::nullopt;
        }
    }
    if (!has_letter) return std::nullopt;
    return translate_procedural_fragment(source, true);
}

std::optional<std::string> Overlay::translate_coin_item_name(
        std::string_view complete_source) const {
    std::string source = trim(std::string(complete_source));
    if (source.empty()) return std::nullopt;
    // Counts and quality/ownership markers wrap the complete item name. Peel
    // either order recursively, retaining the shared marker formatting and
    // leaving the inner parser responsible for proving a complete coin noun.
    if (const std::string_view suffix = item_number_suffix(source);
            !suffix.empty()) {
        const auto item = translate_coin_item_name(
            std::string_view(source).substr(0, source.size() - suffix.size()));
        if (!item) return std::nullopt;
        return *item + std::string(suffix);
    }
    const ItemDesignationText designation = split_item_designation(source);
    if (!designation.prefix.empty()) {
        const auto item = translate_coin_item_name(designation.item);
        if (!item) return std::nullopt;
        return designation.prefix + *item + designation.suffix;
    }
    // Native captures use CP437; other item grammar callers may pass UTF-8.
    // Normalize only valid UTF-8, retaining native accented bytes otherwise.
    if (auto native = utf8_to_cp437(source)) source = std::move(*native);
    const std::string folded = lower(source);
    const size_t noun_at = folded.rfind(' ');
    if (noun_at == std::string::npos) return std::nullopt;
    const std::string_view noun(folded.data() + noun_at + 1,
                                folded.size() - noun_at - 1);
    // A clipped coi.../c... does not prove a coin noun. The caller must first
    // recover the complete native item source rather than guessing its tail.
    if (noun != "coin" && noun != "coins") return std::nullopt;
    auto complete_target = [](const std::optional<std::string> &target) {
        return target && !target->empty() &&
            target->find("[C:") == std::string::npos &&
            std::none_of(target->begin(), target->end(), [](unsigned char ch) {
                return (ch >= 'a' && ch <= 'z') ||
                    (ch >= 'A' && ch <= 'Z') || ch == '\n' || ch == '\r';
            });
    };
    auto &rulesets = DFHack::DFZH::Hooks::RulesetsManager::getInstance();
    // Starting at the leftmost boundary selects the longest complete material
    // suffix (including alloys and multiword materials), never a partial word.
    for (size_t material_at = 0; material_at < noun_at;) {
        const std::string material_source = trim(folded.substr(
            material_at, noun_at - material_at));
        const std::string material_utf8 = cp437_to_utf8(material_source);
        // Resolve the entire material + coin phrase through the same TOML
        // grammar used by ordinary item names and minting/hauling tasks.
        // That grammar owns the compound suffix; standalone coin(s) keep
        // their existing noun translation.
        const auto coin = rulesets.translate_coin_name(
            material_utf8 + " " + std::string(noun));
        if (coin) {
            if (!complete_target(coin)) return std::nullopt;
            std::string identity = trim(source.substr(0, material_at));
            if (identity.empty()) return coin;
            // Dated native currency uses ISSUER YEAR MATERIAL coin(s).
            // The year belongs to the mint, not the issuer's name or the
            // stack count. Only peel a complete trailing decimal token;
            // keep the shared identity parser strict for all other callers.
            std::string year;
            const size_t year_at = identity.rfind(' ');
            if (year_at != std::string::npos) {
                const std::string_view token(identity.data() + year_at + 1,
                                             identity.size() - year_at - 1);
                if (!token.empty() && std::all_of(token.begin(), token.end(),
                        [](unsigned char ch) { return ch >= '0' && ch <= '9'; })) {
                    year = token;
                    identity = trim(identity.substr(0, year_at));
                }
            }
            const auto name = translate_coin_native_identity(identity);
            if (!complete_target(name)) return std::nullopt;
            if (!year.empty()) {
                // Use the same date wording as structured coin descriptions,
                // with already resolved identity/number captures.
                for (int index : item_description_term_rules_) {
                    const Rule &rule = rules_[static_cast<size_t>(index)];
                    if (rule.source != "{s} from the year {c}") continue;
                    const std::vector<std::optional<std::string>> resolved = {*name, year};
                    const auto dated = fill_template(rule, {identity, year},
                        nullptr, nullptr, &resolved);
                    if (!complete_target(dated)) return std::nullopt;
                    return dated + " " + *coin;
                }
                return std::nullopt;
            }
            return *name + " " + *coin;
        }
        const size_t boundary = folded.find(' ', material_at);
        if (boundary == std::string::npos || boundary >= noun_at) break;
        material_at = boundary + 1;
        while (material_at < noun_at && folded[material_at] == ' ') ++material_at;
    }
    return std::nullopt;
}
