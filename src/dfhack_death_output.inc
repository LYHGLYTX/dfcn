// deathcause assembles names, native creature/item captions and a known
// DEATH_TYPES clause. Recognize that complete narrative before translating
// its individual fields; the private cause/formatter tables never become
// global word or value rules.
static std::optional<std::string> translate_dfhack_death_message(
        const DfhackOutputSnapshot &catalog, std::string_view visible,
        bool console_utf8) {
    const auto source = trim_view(visible);
    if (catalog.death_causes.empty() || source.size() < 3 || !source.ends_with('.') ||
            source.find_first_of("\r\n") != std::string_view::npos) return std::nullopt;
    const auto body = source.substr(0, source.size() - 1);
    const auto utf8 = [&](std::string_view text) {
        return console_utf8 ? std::string(text) : native_text_to_utf8(text);
    };
    const auto named_creature = [&](std::string_view native) {
        const std::string text = utf8(native);
        if (auto target = translate_dfhack_caption_utf8(catalog, "creature", text))
            return *target;
        std::optional<std::string> translated;
        size_t matched = 0;
        // In the historical-figure and slayer clauses the species comes
        // first. Resolve a complete creature prefix and keep its named tail.
        for (size_t at = text.find(' '); at != std::string::npos;
                at = text.find(' ', at + 1)) {
            if (auto target = translate_dfhack_caption_utf8(catalog, "creature",
                    std::string_view(text).substr(0, at))) {
                translated = std::move(target);
                matched = at;
            }
        }
        return translated ? *translated + text.substr(matched) : text;
    };
    const auto format = [&](std::string_view key, const std::string &value)
            -> std::optional<std::string> {
        const auto found = catalog.death_phrases.find(std::string(key));
        if (found == catalog.death_phrases.end()) return std::nullopt;
        const std::vector<std::string> captures{value};
        const std::vector<std::optional<std::string>> resolved{value};
        auto target = fill_template(found->second, captures, nullptr, nullptr, &resolved);
        return contains_cjk_utf8(target) ? std::optional<std::string>(std::move(target))
                                        : std::nullopt;
    };
    struct DeathHead {
        std::string_view subject, cause;
        std::string target;
    };
    const auto head = [&](std::string_view text) -> std::optional<DeathHead> {
        std::optional<DeathHead> selected;
        for (const auto &[cause, target] : catalog.death_causes) {
            if (text.size() <= cause.size() + 1 || !text.ends_with(cause)) continue;
            const size_t at = text.size() - cause.size();
            if (text[at - 1] != ' ') continue;
            const auto subject = trim_view(text.substr(0, at - 1));
            if (subject.empty()) continue;
            if (!selected || cause.size() > selected->cause.size())
                selected = DeathHead{subject, cause, target};
        }
        return selected;
    };
    const auto render = [&](const DeathHead &entry, std::string_view year,
            std::string_view slayer, std::string_view weapon,
            std::string_view weapon_form) -> std::optional<std::string> {
        std::string target = entry.subject.starts_with("The ")
            ? "该" + named_creature(entry.subject.substr(4)) : utf8(entry.subject);
        if (!year.empty()) {
            const auto phrase = format("in year {d}", std::string(year));
            if (!phrase) return std::nullopt;
            target += ' ';
            target += *phrase;
        }
        if (!entry.cause.starts_with("'s ")) target += ' ';
        target += entry.target;
        if (!slayer.empty()) {
            const auto phrase = format("killed by the {s}", named_creature(slayer));
            if (!phrase) return std::nullopt;
            target += "，" + *phrase;
        }
        if (!weapon.empty()) {
            const auto native = utf8(weapon);
            const auto caption = translate_dfhack_caption_utf8(catalog, "item", native);
            const auto phrase = format(weapon_form, caption ? *caption : native);
            if (!phrase) return std::nullopt;
            target += "，" + *phrase;
        }
        return target + "。";
    };
    constexpr std::string_view year_prefix = " in year ";
    constexpr std::string_view slayer_prefix = ", killed by the ";
    constexpr std::string_view using_prefix = ", using a ";
    constexpr std::string_view shot_prefix = ", shot by a ";
    std::optional<std::string> selected;
    for (size_t at = body.find(year_prefix); at != std::string_view::npos;
            at = body.find(year_prefix, at + 1)) {
        const auto entry = head(body.substr(0, at));
        if (!entry) continue;
        const size_t begin = at + year_prefix.size();
        size_t end = begin;
        if (end < body.size() && (body[end] == '-' || body[end] == '+')) ++end;
        const size_t digits = end;
        while (end < body.size() && body[end] >= '0' && body[end] <= '9') ++end;
        if (digits == end) continue;
        const auto year = body.substr(begin, end - begin);
        auto suffix = body.substr(end);
        std::string_view slayer, weapon, weapon_form;
        size_t weapon_at = suffix.find(using_prefix);
        const size_t shot_at = suffix.find(shot_prefix);
        if (shot_at != std::string_view::npos &&
                (weapon_at == std::string_view::npos || shot_at < weapon_at)) {
            weapon_at = shot_at;
            weapon_form = "shot by a {s}";
        } else if (weapon_at != std::string_view::npos) weapon_form = "using a {s}";
        if (weapon_at != std::string_view::npos) {
            const auto prefix = weapon_form == "shot by a {s}" ? shot_prefix : using_prefix;
            weapon = suffix.substr(weapon_at + prefix.size());
            if (weapon.empty()) continue;
            suffix = suffix.substr(0, weapon_at);
        }
        if (!suffix.empty()) {
            if (!suffix.starts_with(slayer_prefix)) continue;
            slayer = suffix.substr(slayer_prefix.size());
            if (slayer.empty()) continue;
        }
        const auto target = render(*entry, year, slayer, weapon, weapon_form);
        if (!target) continue;
        if (selected && *selected != *target) return std::nullopt;
        selected = target;
    }
    if (selected) return selected;
    // No incident exists for some units and remains. Those messages consist
    // solely of one subject followed by one complete known cause clause.
    if (body.find(slayer_prefix) == std::string_view::npos &&
            body.find(using_prefix) == std::string_view::npos &&
            body.find(shot_prefix) == std::string_view::npos)
        if (const auto entry = head(body)) return render(*entry, {}, {}, {}, {});
    return std::nullopt;
}
