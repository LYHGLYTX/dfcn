// Reviewed dynamic fields of native performance announcements.
// Sentence structure stays in the announcement TSV; this parser accepts only
// the finite native passage vocabulary, including every comma/and list item.
// Native constructor: 0x1400aef5e..0x1400af2ab (Windows DF 53.16).
std::optional<std::string> Overlay::translate_announcement_music_passages(
        std::string_view source) const {
    source = trim_view(source);
    if (source.empty()) return std::nullopt;
    std::string result;
    size_t cursor = 0;
    bool final_item = false;
    while (cursor < source.size()) {
        const size_t comma = source.find(", ", cursor);
        const size_t conjunction = source.find(" and ", cursor);
        const size_t next = std::min(comma == std::string_view::npos
                ? source.size() : comma,
            conjunction == std::string_view::npos
                ? source.size() : conjunction);
        if (final_item && next != source.size()) return std::nullopt;
        const std::string_view item = source.substr(cursor, next - cursor);
        if (item.empty() || item != trim_view(item)) return std::nullopt;
        const auto translated = exact_literal_translation(
            "Announcement music passage: " + std::string(item));
        if (!translated || translated->empty()) return std::nullopt;
        result += *translated;
        if (next == source.size()) return result;
        if (next == comma) {
            result += "、";
            cursor = next + 2;
        } else {
            result += "和";
            cursor = next + 5;
            final_item = true;
        }
    }
    return std::nullopt;
}
