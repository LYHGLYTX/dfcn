// Thoughts, the Memories tab and overview memories share the psychology grammar and
// source offsets. Native wrapping, justification and color runs are not
// sentence boundaries: only a sentence stop followed by another constructor is.
static bool is_character_thought_entry_start(std::string_view source) {
    source = trim_view(source);
    if (source.starts_with("He ") || source.starts_with("She ") || source.starts_with("It "))
        return true;
    // Memories omit the subject. Match the complete emotion through the shared
    // vocabulary, including multiword emotions, before accepting its action.
    // A personality-change continuation beginning with Became stays attached.
    for (const std::string_view action : {" remembering", " dwelling upon", " reliving"}) {
        const size_t action_at = source.find(action);
        if (action_at == std::string_view::npos || action_at == 0) continue;
        const size_t action_end = action_at + action.size();
        if (action_end < source.size() && source[action_end] != ' ') continue;
        const std::string emotion = normalize_utterance(source.substr(0, action_at));
        std::vector<size_t> origins;
        for (const char *context : {"::psychology::memory::mind::text",
                "::psychology::thought::mind::text", "::psychology::thought::mind::predicate"}) {
            if (RULESETS.translate_with_origins(emotion, context, origins)) return true;
        }
    }
    return false;
}

static size_t character_thought_sentence_end(std::string_view source, size_t begin) {
    for (size_t stop = source.find(". ", begin); stop != std::string_view::npos;
         stop = source.find(". ", stop + 2)) {
        const auto next = trim_view(source.substr(stop + 2));
        if (is_character_thought_entry_start(next))
            return stop + 1;
    }
    return source.size();
}

std::optional<std::string> Overlay::translate_character_thought_paragraph(
        std::string_view source, std::vector<size_t> *origins) const {
    if (origins) origins->clear();
    if (!config_.compositional_rules) return std::nullopt;
    std::vector<size_t> normalized_origins;
    const auto normalized = normalize_utterance(source, &normalized_origins);
    std::string utf8;
    std::vector<size_t> utf8_origins;
    for (size_t i = 0; i < normalized.size(); ++i) {
        const auto glyph = cp437_to_utf8(std::string_view(normalized).substr(i, 1));
        utf8 += glyph;
        utf8_origins.insert(utf8_origins.end(), glyph.size(), normalized_origins[i]);
    }
    std::string target;
    std::vector<size_t> result_origins;
    for (size_t begin = 0; begin < utf8.size();) {
        while (begin < utf8.size() && utf8[begin] == ' ') ++begin;
        if (begin == utf8.size()) break;
        const size_t end = character_thought_sentence_end(utf8, begin);
        std::vector<size_t> sentence_origins;
        // The shared psychology entry also accepts memory headings and
        // subjectless recollections, not just He/She/It thought sentences.
        // Retain semantic origins through that dispatch for native colors.
        const auto sentence = RULESETS.translate_with_origins(
            utf8.substr(begin, end - begin), "::psychology", sentence_origins);
        if (!sentence || sentence->size() != sentence_origins.size()) return std::nullopt;
        if (!target.empty()) {
            target.push_back('\n');
            result_origins.push_back(utf8_origins[begin]);
        }
        target += *sentence;
        for (size_t origin : sentence_origins) {
            if (origin >= end - begin) return std::nullopt;
            result_origins.push_back(utf8_origins[begin + origin]);
        }
        begin = end;
    }
    if (target.empty()) return std::nullopt;
    if (origins) *origins = std::move(result_origins);
    return target;
}
