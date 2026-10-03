// exterminate emits a count, a RAW creature_id, and (only when distinct from
// the ID) a parenthesized creature name. Require the actual RAW ID/name pair;
// arbitrary numeric tables and generated personal names are never captions.
static std::optional<std::string> translate_dfhack_creature_list_record(
        const DfhackOutputSnapshot &catalog, std::string_view source, bool console_utf8) {
    if (!catalog.raw_creature_labels || catalog.raw_creature_labels->empty())
        return std::nullopt;
    const auto body = trim_view(source);
    size_t number_end = 0;
    while (number_end < body.size() && body[number_end] >= '0' && body[number_end] <= '9')
        ++number_end;
    if (!number_end || number_end >= body.size() || body[number_end] != ' ' ||
            !body.ends_with(')')) return std::nullopt;
    const size_t id_begin = number_end + 1;
    const size_t id_end = body.find(' ', id_begin);
    if (id_end == std::string_view::npos || id_end == id_begin) return std::nullopt;
    const auto id = body.substr(id_begin, id_end - id_begin);
    const auto native = catalog.raw_creature_labels->find(std::string(id));
    if (native == catalog.raw_creature_labels->end()) return std::nullopt;
    size_t caption_begin = id_end;
    while (caption_begin < body.size() && body[caption_begin] == ' ') ++caption_begin;
    if (caption_begin - id_end < 2 || caption_begin >= body.size() ||
            body[caption_begin++] != '(' || caption_begin >= body.size() - 1)
        return std::nullopt;
    const auto caption = body.substr(caption_begin, body.size() - caption_begin - 1);
    const std::string utf8 = console_utf8 ? std::string(caption) : native_text_to_utf8(caption);
    if (normalize_dfhack_help(utf8) != normalize_dfhack_help(native->second))
        return std::nullopt;
    const auto target = translate_dfhack_caption_utf8(catalog, "creature", utf8);
    if (!target || !contains_cjk_utf8(*target) || *target == utf8) return std::nullopt;
    const size_t at = static_cast<size_t>(body.data() - source.data()) + caption_begin;
    return (console_utf8 ? std::string(source.substr(0, at)) : native_text_to_utf8(source.substr(0, at))) +
        *target + (console_utf8 ? std::string(source.substr(at + caption.size())) :
            native_text_to_utf8(source.substr(at + caption.size())));
}
