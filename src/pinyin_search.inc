// Search the actual displayed Chinese caption. The same policy is used by
// every native picker; no query text or source game record is rewritten here.
struct PinyinReading {
    uint32_t codepoint;
    const char *readings;
};
#include "../third_party/pinyin-data/pinyin_data.inc"

static const char *search_pinyin_readings(uint32_t codepoint) {
    const auto found = std::lower_bound(std::begin(pinyin_readings),
        std::end(pinyin_readings), codepoint,
        [](const PinyinReading &entry, uint32_t value) {
            return entry.codepoint < value;
        });
    return found != std::end(pinyin_readings) && found->codepoint == codepoint
        ? found->readings : nullptr;
}

// Accept untoned spelling, tone-marked spelling, and the usual v/u:/ü forms.
// Apostrophes and hyphens separate syllables rather than interrupting them.
static std::string normalize_search_pinyin(std::string_view text) {
    std::string normalized;
    normalized.reserve(text.size());
    for (size_t cursor = 0; cursor < text.size();) {
        const auto decoded = decode_utf8_at(text, cursor);
        if (!decoded) return {};
        uint32_t cp = decoded->first;
        const auto original = text.substr(cursor, decoded->second);
        cursor += decoded->second;
        if ((cp <= 0x7f && std::isspace(static_cast<unsigned char>(cp))) ||
            cp == 0x3000 || cp == '\'' || cp == '-' || cp == 0x2019 ||
            cp == 0xb7 || cp == 0x30fb) continue;
        if (cp == 0x308 && !normalized.empty() && normalized.back() == 'u') {
            normalized.back() = 'v';
            continue;
        }
        if (cp == ':' && !normalized.empty() && normalized.back() == 'u') {
            normalized.back() = 'v';
            continue;
        }
        if (cp == 0x300 || cp == 0x301 || cp == 0x302 ||
            cp == 0x304 || cp == 0x30c) continue;
        switch (cp) {
        case 0x100: case 0x101: case 0xc1: case 0xe1:
        case 0x1cd: case 0x1ce: case 0xc0: case 0xe0: cp = 'a'; break;
        case 0x112: case 0x113: case 0xc9: case 0xe9:
        case 0x11a: case 0x11b: case 0xc8: case 0xe8:
        case 0xca: case 0xea: case 0x1ebe: case 0x1ebf:
        case 0x1ec0: case 0x1ec1: cp = 'e'; break;
        case 0x12a: case 0x12b: case 0xcd: case 0xed:
        case 0x1cf: case 0x1d0: case 0xcc: case 0xec: cp = 'i'; break;
        case 0x14c: case 0x14d: case 0xd3: case 0xf3:
        case 0x1d1: case 0x1d2: case 0xd2: case 0xf2: cp = 'o'; break;
        case 0x16a: case 0x16b: case 0xda: case 0xfa:
        case 0x1d3: case 0x1d4: case 0xd9: case 0xf9: cp = 'u'; break;
        case 0xdc: case 0xfc: case 0x1d5: case 0x1d6:
        case 0x1d7: case 0x1d8: case 0x1d9: case 0x1da:
        case 0x1db: case 0x1dc: cp = 'v'; break;
        case 0x1e3e: case 0x1e3f: cp = 'm'; break;
        case 0x143: case 0x144: case 0x147: case 0x148:
        case 0x1f8: case 0x1f9: cp = 'n'; break;
        default: break;
        }
        if (cp >= 0xff01 && cp <= 0xff5e) cp -= 0xfee0;
        if (cp >= 'A' && cp <= 'Z') cp += 'a' - 'A';
        if (cp <= 0x7f) normalized.push_back(static_cast<char>(cp));
        else normalized.append(original);
    }
    return normalized;
}

struct PinyinSearchUnit {
    size_t begin, length;
    const char *readings;
};
struct PinyinSearchIndex {
    std::string literal, full, initials;
    std::vector<PinyinSearchUnit> units;
    bool has_pinyin = false, multiple_readings = false;
    size_t bytes() const {
        return literal.size() + full.size() + initials.size() +
            units.capacity() * sizeof(PinyinSearchUnit);
    }
};

static PinyinSearchIndex make_search_pinyin_index(std::string_view text) {
    PinyinSearchIndex index;
    for (size_t cursor = 0; cursor < text.size();) {
        const auto decoded = decode_utf8_at(text, cursor);
        if (!decoded) return {};
        const auto literal = normalize_search_pinyin(text.substr(cursor, decoded->second));
        cursor += decoded->second;
        const char *readings = search_pinyin_readings(decoded->first);
        if (!readings && literal.empty()) continue;
        index.units.push_back({index.literal.size(), literal.size(), readings});
        index.literal.append(literal);
        if (readings) {
            const std::string_view choices(readings);
            const size_t end = choices.find(' ');
            index.full.append(choices.substr(0, end));
            index.initials.push_back(choices.front());
            index.has_pinyin = true;
            index.multiple_readings |= end != std::string_view::npos;
        } else {
            index.full.append(literal);
            index.initials.append(literal);
        }
    }
    return index;
}

struct PinyinSearchQuery {
    std::string literal, phonetic;
    std::vector<size_t> failure;
    bool mixed = false;
    void assign(std::string compact) {
        literal = std::move(compact);
        phonetic = normalize_search_pinyin(literal);
        mixed = std::any_of(phonetic.begin(), phonetic.end(),
            [](unsigned char byte) { return byte > 0x7f; });
        failure.assign(phonetic.size(), 0);
        for (size_t i = 1, prefix = 0; i < phonetic.size(); ++i) {
            while (prefix && phonetic[i] != phonetic[prefix]) prefix = failure[prefix - 1];
            if (phonetic[i] == phonetic[prefix]) ++prefix;
            failure[i] = prefix;
        }
    }
    size_t advance(size_t state, unsigned char byte) const {
        while (state && static_cast<unsigned char>(phonetic[state]) != byte)
            state = failure[state - 1];
        if (static_cast<unsigned char>(phonetic[state]) == byte) ++state;
        return state;
    }
};

// Each character branches into its readings, then equal query-prefix states
// merge. This supports every pronunciation without enumerating whole names.
static bool match_search_pinyin_readings(const PinyinSearchIndex &index,
        const PinyinSearchQuery &query, bool initials) {
    std::vector<size_t> states{0}, next;
    std::vector<size_t> seen(query.phonetic.size(), 0);
    size_t generation = 0;
    for (const auto &unit : index.units) {
        next.clear();
        ++generation;
        const auto consume = [&](std::string_view spelling) {
            for (size_t state : states) {
                for (unsigned char byte : spelling) {
                    state = query.advance(state, byte);
                    if (state == query.phonetic.size()) return true;
                }
                if (seen[state] != generation) {
                    seen[state] = generation;
                    next.push_back(state);
                }
            }
            return false;
        };
        if (unit.readings) {
            std::string_view choices(unit.readings);
            while (!choices.empty()) {
                const size_t end = choices.find(' ');
                const auto spelling = choices.substr(0, end);
                if (consume(initials ? spelling.substr(0, 1) : spelling)) return true;
                if (end == std::string_view::npos) break;
                choices.remove_prefix(end + 1);
            }
            // A mixed Chinese/pinyin query can retain literal characters.
            if (query.mixed && consume(std::string_view(index.literal).substr(
                    unit.begin, unit.length))) return true;
        } else if (consume(std::string_view(index.literal).substr(unit.begin, unit.length))) {
            return true;
        }
        states.swap(next);
    }
    return false;
}

struct PinyinSearchCache {
    PinyinSearchQuery query;
    std::unordered_map<std::string, PinyinSearchIndex> indexes;
    std::deque<std::string> order;
    size_t bytes = 0;
};

static bool translated_search_text_matches(std::string_view target, std::string_view query) {
    if (target.empty() || target.size() > 65536 || query.empty() || query.size() > 4096)
        return false;
    auto &cache = reloadable_thread_state<PinyinSearchCache, struct PinyinSearchCacheTag>();
    std::string needle = lower(compact_translated_search_text(query));
    if (needle.empty()) return false;
    if (cache.query.literal != needle) cache.query.assign(std::move(needle));
    std::string compact = lower(compact_translated_search_text(target));
    if (compact.empty()) return false;
    if (compact.find(cache.query.literal) != std::string::npos) return true;
    if (cache.query.phonetic.empty()) return false;

    auto found = cache.indexes.find(compact);
    if (found == cache.indexes.end()) {
        auto index = make_search_pinyin_index(compact);
        const size_t cost = 2 * compact.size() + index.bytes();
        constexpr size_t maximum_records = 32768;
        constexpr size_t maximum_bytes = 32u * 1024u * 1024u;
        while (!cache.order.empty() && (cache.indexes.size() >= maximum_records ||
                cache.bytes + cost > maximum_bytes)) {
            const auto oldest = cache.indexes.find(cache.order.front());
            if (oldest != cache.indexes.end()) {
                cache.bytes -= 2 * oldest->first.size() + oldest->second.bytes();
                cache.indexes.erase(oldest);
            }
            cache.order.pop_front();
        }
        cache.order.push_back(compact);
        try { found = cache.indexes.emplace(std::move(compact), std::move(index)).first; }
        catch (...) { cache.order.pop_back(); throw; }
        cache.bytes += cost;
    }
    const auto &index = found->second;
    if (!index.has_pinyin) return false;
    if (index.full.find(cache.query.phonetic) != std::string::npos ||
        index.initials.find(cache.query.phonetic) != std::string::npos) return true;
    if (!index.multiple_readings && !cache.query.mixed) return false;
    return match_search_pinyin_readings(index, cache.query, false) ||
        match_search_pinyin_readings(index, cache.query, true);
}
