// 0x841440 appends charge targets without a delimiter. Only the actual
// 0x841609 append boundaries may split these identities, including empty
// names and identical spellings belonging to different units.
std::optional<std::string> Overlay::translate_native_adventure_charge(
        std::string_view source, const std::vector<NativeAdventureChargePart> &parts) const {
    TranslationStateScope translation_scope;
    constexpr std::string_view prefix = "Charge ";
    if (!source.starts_with(prefix) || parts.empty()) return std::nullopt;
    size_t end = prefix.size();
    std::string targets;
    for (const auto &part : parts) {
        translation_work_step();
        if (part.offset != end || part.length != part.source.size() ||
                end > source.size() || part.length > source.size() - end ||
                source.substr(end, part.length) != part.source) return std::nullopt;
        end += part.length;
        if (part.source.empty()) continue;
        auto target = part.target;
        if (!target) target = native_unit_identity_source_target(part.source);
        if (!target) target = translate_ui_message_capture(part.source, true);
        if (!target) target = native_text_to_utf8(part.source);
        if (!targets.empty()) targets += "、";
        targets += *target;
    }
    std::string result = "冲锋攻击" + targets;
    const std::string_view suffix = source.substr(end);
    if (suffix.empty()) return result;
    if (!suffix.starts_with(" (") || !suffix.ends_with(')')) return std::nullopt;
    const std::string_view location = suffix.substr(2, suffix.size() - 3);
    constexpr std::string_view media[] = {"", "/Air", "/Water", "/Lava", "/Magma",
        "/Air/Water", "/Air/Lava", "/Air/Magma"};
    constexpr std::string_view directions[] = {"Here", "Above", "Below", "North", "South",
        "East", "West", "NW", "NE", "SW", "SE"};
    for (const auto horizontal : directions) {
        for (const auto vertical : {std::string_view{}, std::string_view{"/Above"},
                                   std::string_view{"/Below"}}) {
            if ((horizontal == "Here" || horizontal == "Above" || horizontal == "Below") &&
                    !vertical.empty()) continue;
            const std::string direction = std::string(horizontal) + std::string(vertical);
            if (!location.starts_with(direction)) continue;
            const auto medium = location.substr(direction.size());
            if (std::find(std::begin(media), std::end(media), medium) == std::end(media)) continue;
            const auto bearing = translate_ui_message_capture(direction, false);
            if (!bearing || bearing->empty()) return std::nullopt;
            result += "（" + *bearing;
            for (size_t at = 0; at < medium.size();) {
                const size_t next = medium.find('/', at + 1);
                const auto token = medium.substr(at + 1, next == std::string_view::npos
                    ? medium.size() - at - 1 : next - at - 1);
                result += "／";
                if (token == "Air") result += "空气";
                else if (token == "Water") result += "水";
                else if (token == "Lava") result += "熔岩";
                else if (token == "Magma") result += "岩浆";
                at = next == std::string_view::npos ? medium.size() : next;
            }
            return result + "）";
        }
    }
    return std::nullopt;
}
