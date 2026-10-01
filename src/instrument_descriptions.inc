// Complete, context-scoped instrument types and RAW descriptions. The same
// glossary serves the embark equipment compositor and the art-image picker.
void Overlay::load_instrument_translations() {
    instrument_terms_.clear();
    instrument_patterns_.clear();
    instrument_description_cache_.clear();
    described_instrument_items_.clear();
    native_instrument_names_.clear();
    instrument_names_epoch_ = 0;
    workshop_recipe_translation_cache_.clear();
    const auto path = fs::path(config_.mapping_path).parent_path() / "instrument-translations.tsv";
    std::ifstream input(path, std::ios::binary);
    if (!input) {
        log_line("WARN", "Cannot open instrument translations: " + path.string());
        return;
    }
    std::string line;
    while (std::getline(input, line)) {
        if (!line.empty() && line.back() == '\r') line.pop_back();
        if (line.empty() || line.front() == '#') continue;
        const size_t first = line.find('\t');
        const size_t second = first == std::string::npos ? first : line.find('\t', first + 1);
        if (second == std::string::npos) continue;
        InstrumentPattern entry{line.substr(0, first),
            lower(line.substr(first + 1, second - first - 1)), line.substr(second + 1)};
        if (entry.source.find('{') == std::string::npos)
            instrument_terms_[entry.scope + ":" + entry.source] = entry.target;
        else instrument_patterns_.push_back(std::move(entry));
    }
    std::error_code ec;
    instrument_translations_mtime_ = fs::last_write_time(path, ec);
    log_line("INFO", "Loaded instrument glossary/grammar: " +
        std::to_string(instrument_terms_.size()) + " terms, " +
        std::to_string(instrument_patterns_.size()) + " patterns");
}

void Overlay::refresh_native_instrument_names() const {
    const auto epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
    if (instrument_names_epoch_ == epoch) return;
    std::vector<std::pair<std::string, std::string>> names;
    std::unordered_map<std::string, std::string> current;
    if (capture_native_instrument_names(names)) {
        for (const auto &[singular, plural] : names) {
            const std::string name = lower_native_name(singular);
            if (name.empty()) continue;
            current.emplace(name, name);
            if (!plural.empty()) current.emplace(lower_native_name(plural), name);
        }
    }
    // Own strings, not native pointers. Re-read once per draw epoch so world
    // unload/reload and newly generated definitions cannot retain stale name
    // evidence. Failed reads withdraw that evidence instead of guessing.
    instrument_names_epoch_ = epoch;
    if (current == native_instrument_names_) return;
    native_instrument_names_ = std::move(current);
    described_instrument_items_.clear();
    instrument_description_cache_.clear();
    workshop_recipe_translation_cache_.clear();
    item_description_cache_.clear();
    item_translation_cache_.clear();
    item_translation_cache_order_.clear();
}

std::optional<std::string> Overlay::translate_instrument_native_name(
        std::string_view source, bool generated_namespace) const {
    std::string name = lower_native_name(trim(std::string(source)));
    if (const auto found = native_instrument_names_.find(name);
        found != native_instrument_names_.end()) {
        name = found->second;
        generated_namespace = true;
    }
    std::istringstream words{name};
    std::string word, result;
    uint8_t languages = 0x0f;
    while (words >> word) {
        const auto found = native_name_language_masks_.find(word);
        if (found == native_name_language_masks_.end()) {
            // DF also invents instrument words outside the vanilla T_WORD
            // lexicons. Permit these only inside a proven instrument field,
            // never in the generic equipment/material or creature fallback.
            if (!generated_namespace || !std::all_of(word.begin(), word.end(), [](unsigned char c) {
                    return (c >= 'a' && c <= 'z') || is_cp437_latin_letter_byte(c) ||
                        c == '\'' || c == '-';
                })) return std::nullopt;
        } else {
            languages &= found->second;
            if (!languages && !generated_namespace) return std::nullopt;
        }
        const auto reviewed = native_name_reviewed_transliterations_.find(word);
        if (reviewed != native_name_reviewed_transliterations_.end())
            result += reviewed->second;
        else {
            const auto phonetic = translate_procedural_fragment(word, true);
            if (!phonetic || phonetic->empty()) return std::nullopt;
            result += *phonetic;
        }
    }
    if (result.empty()) return std::nullopt;
    return result;
}

std::optional<std::string> Overlay::translate_instrument_string_material(
        std::string_view raw) const {
    const std::string source = lower(trim(std::string(raw)));
    if (const auto literal = instrument_terms_.find("f:" + source);
        literal != instrument_terms_.end()) return literal->second;
    if (const auto plant = translate_plant_thread_material(source)) return plant;
    if (const auto wool = translate_animal_wool_item_name(source + " thread")) return wool;
    // Silk/gut retain the complete source creature and their scoped fiber
    // name. The same glossary serves named strings and instrument descriptions.
    for (size_t at = source.find(' '); at != std::string::npos;
         at = source.find(' ', at + 1)) {
        const auto fiber = instrument_terms_.find("f:" + source.substr(at + 1));
        if (fiber == instrument_terms_.end()) continue;
        if (const auto creature = translate_arena_material_creature(
                std::string_view(source).substr(0, at)))
            return *creature + fiber->second;
    }
    // Metal and other non-textile strings retain their material qualifiers.
    if (const auto material = instrument_terms_.find("m:" + source);
        material != instrument_terms_.end()) return material->second;
    return translate_embark_item_material_qualifier(source, true);
}

std::optional<std::string> Overlay::translate_instrument_description(
        std::string_view raw, bool complete_source, bool instrument_context) const {
    std::string source;
    std::istringstream words{std::string(raw)};
    for (std::string word; words >> word;) {
        if (!source.empty()) source += ' ';
        source += lower(word);
    }
    // The single-string branches in ebe8a0 assign "the" at ec477e/ec47db,
    // replacing the earlier definition. These exact native starts therefore
    // remain valid even without a preceding instrument-identification sentence.
    const bool native_single_string = [&]() {
        for (const std::string_view start : {
                "the string by stopping it against the neck",
                "the string by stopping it against the body"}) {
            if (source == start || (source.starts_with(start) &&
                    source.size() > start.size() && source[start.size()] == '.')) return true;
        }
        return false;
    }();
    if (!instrument_context && !native_single_string &&
        source.find("instrument") == std::string::npos) return std::nullopt;
    const std::string cache_key = std::string(complete_source ? "R:" : "P:") +
        (instrument_context ? "I:" : "A:") + source;
    if (const auto cached = instrument_description_cache_.find(cache_key);
        cached != instrument_description_cache_.end()) return cached->second;

    std::unordered_map<std::string, std::optional<std::string>> memo;
    // Native names are admissible only inside the reviewed instrument
    // grammar. Keep discovered identities local until the entire paragraph
    // succeeds, so an unsupported sentence cannot authorize noun fallback.
    std::unordered_map<std::string, std::string> described_items;
    auto translate = [&](auto &&self, std::string_view scope,
                         std::string_view text, int depth) -> std::optional<std::string> {
        text = trim_view(text);
        if (text.empty() || depth > 24) return std::nullopt;
        const std::string key = std::string(scope) + ":" + std::string(text);
        const std::string memo_key = key + "@" + std::to_string(depth);
        if (const auto found = memo.find(memo_key); found != memo.end()) return found->second;
        auto resolve = [&]() -> std::optional<std::string> {
            if (const auto literal = instrument_terms_.find(key);
                literal != instrument_terms_.end()) return literal->second;
            if (scope == "n") return translate_instrument_native_name(text, true);
            if (scope == "i") return translate_embark_instrument_item(text, false, true);
            if (scope == "f") return translate_instrument_string_material(text);
            if (scope == "d") {
                // Share shape qualifiers with the named component resolver;
                // a barrel drum is not a barrel material or a native name.
                const auto shape = instrument_terms_.find("shape:" + std::string(text));
                if (shape != instrument_terms_.end()) return shape->second;
            }
            if (scope == "p") {
                const auto piece = instrument_terms_.find("piece:" + std::string(text));
                if (piece != instrument_terms_.end()) return piece->second;
                const auto material = instrument_terms_.find("m:" + std::string(text));
                if (material != instrument_terms_.end()) return material->second;
            }
            if (scope == "m") {
                // Ordinary material names reuse the established qualifier
                // resolver; contextual exceptions (silk strings, gut, etc.)
                // live in the scoped TSV, never a second general glossary.
                // A dictionary hit alone does not identify a material:
                // `conical bore` must retain its instrument-structure sense,
                // not become two generic words with material suffixes.
                return translate_embark_item_material_qualifier(std::string(text), true);
            }
            if (scope == "c") {
                if (std::all_of(text.begin(), text.end(), [](unsigned char c) {
                        return c >= '0' && c <= '9';
                    })) return std::string(text);
                // DF writes larger string/pipe counts as English cardinals.
                // Parse complete tokens; never transliterate an unknown count.
                std::string count(text);
                std::replace(count.begin(), count.end(), '-', ' ');
                std::istringstream tokens(count);
                int total = 0, group = 0;
                bool valid = true, seen = false;
                for (std::string token; tokens >> token;) {
                    if (token == "and") continue;
                    if (token == "hundred") { group = std::max(1, group) * 100; continue; }
                    if (token == "thousand") { total += std::max(1, group) * 1000; group = 0; continue; }
                    const auto number = instrument_terms_.find("c:" + token);
                    if (number == instrument_terms_.end() || number->second.empty() ||
                        !std::all_of(number->second.begin(), number->second.end(), [](unsigned char c) {
                            return c >= '0' && c <= '9';
                        })) { valid = false; break; }
                    group += parse_int(number->second, 0);
                    seen = true;
                }
                if (valid && seen) return std::to_string(total + group);
            }
            for (const auto &pattern : instrument_patterns_) {
                if (pattern.scope != scope) continue;
                const size_t opening = pattern.source.find('{');
                if (!text.starts_with(std::string_view(pattern.source).substr(0, opening))) continue;
                std::unordered_map<std::string, std::string> captures;
                auto match = [&](auto &&next, size_t at, size_t pos) -> bool {
                    const size_t open = pattern.source.find('{', at);
                    if (open == std::string::npos)
                        return text.substr(pos) == std::string_view(pattern.source).substr(at);
                    const std::string_view literal(pattern.source.data() + at, open - at);
                    if (!text.substr(pos).starts_with(literal)) return false;
                    pos += literal.size();
                    const size_t close = pattern.source.find('}', open + 1);
                    if (close == std::string::npos || close == open + 1) return false;
                    const std::string token = pattern.source.substr(open + 1, close - open - 1);
                    const size_t following = pattern.source.find('{', close + 1);
                    const std::string_view delimiter(pattern.source.data() + close + 1,
                        (following == std::string::npos ? pattern.source.size() : following) - close - 1);
                    // Adjacent unbounded captures are not supported.
                    if (delimiter.empty() && following != std::string::npos) return false;
                    size_t end = delimiter.empty() ? text.size() : text.find(delimiter, pos + 1);
                    for (; end != std::string_view::npos && end > pos;) {
                        const auto value = self(self, std::string_view(token).substr(0, 1),
                            text.substr(pos, end - pos), depth + 1);
                        if (value) {
                            captures[token] = *value;
                            if (next(next, close + 1, end)) return true;
                            captures.erase(token);
                        }
                        if (delimiter.empty()) break;
                        end = text.find(delimiter, end + 1);
                    }
                    return false;
                };
                if (!match(match, 0, 0)) continue;
                std::string result = pattern.target;
                for (const auto &[token, value] : captures) {
                    const std::string marker = "{" + token + "}";
                    for (size_t at = result.find(marker); at != std::string::npos;
                         at = result.find(marker, at + value.size()))
                        result.replace(at, marker.size(), value);
                }
                return result;
            }
            return std::nullopt;
        };
        const auto result = resolve();
        if (result && (scope == "i" || scope == "n"))
            described_items.insert_or_assign(std::string(text), *result);
        // Include depth so a cutoff cannot poison a shallower attempt; cache
        // failed branches too, to bound ambiguous multi-part constructions.
        memo.emplace(memo_key, result);
        return result;
    };

    std::string translated;
    bool complete = true;
    size_t start = 0;
    while (start < source.size()) {
        size_t end = source.find('.', start);
        if (end == std::string::npos) {
            if (!complete_source) {
                log_line("WARN", "Instrument description has an incomplete ending: " +
                    cp437_to_utf8(source.substr(start)));
                complete = false;
                break;
            }
            // An owned RAW field has an independently known end. Its final
            // sentence still has to match one complete reviewed s production.
            end = source.size();
        }
        const std::string_view sentence = trim_view(std::string_view(source).substr(start, end - start));
        const auto target = translate(translate, "s", sentence, 0);
        if (!target) {
            log_line("WARN", "Instrument sentence not translated: " + cp437_to_utf8(std::string(sentence)));
            complete = false;
        } else {
            translated += *target + "。";
        }
        start = end < source.size() ? end + 1 : end;
        while (start < source.size() && source[start] == ' ') ++start;
    }
    // Diagnose every missing production in the same original paragraph, not
    // just the first one encountered on each round of manual acceptance.
    // Never publish the successful sentences with an unsupported one removed.
    std::optional<std::string> result;
    if (complete) {
        result = std::move(translated);
        bool new_identity = false;
        for (const auto &[name, target] : described_items) {
            const auto known = described_instrument_items_.find(name);
            if (known != described_instrument_items_.end() && known->second == target) continue;
            described_instrument_items_.insert_or_assign(name, target);
            new_identity = true;
        }
        // A name may have been encountered in the recipe before its complete
        // RAW description established that it denotes an instrument item.
        if (new_identity) workshop_recipe_translation_cache_.clear();
    }
    if (instrument_description_cache_.size() >= 1024) instrument_description_cache_.clear();
    instrument_description_cache_[cache_key] = result;
    return result;
}
