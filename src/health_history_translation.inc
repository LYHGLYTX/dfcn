// Health -> History emits dated treatments and separate provider identities.
// This parser consumes the complete native record, including wrapped anatomy,
// before the caller replaces any of its words or assigns its display geometry.
static std::optional<NativeCalendarDate> parse_health_history_date(
        std::string_view source) {
    return parse_native_calendar_date(source, true);
}

// Offset immediately after the colon, in the original source; zero means
// this is not a complete native health-history date prefix.
static size_t health_history_date_end(std::string_view source) {
    const auto date = parse_health_history_date(source);
    return date ? date->end : 0;
}

std::optional<std::string> Overlay::translate_health_history_record(
        std::string_view raw) const {
    const std::string normalized = normalize_utterance(raw);
    std::string_view source(normalized);
    if (source.empty() || source.size() > 4096 || source.ends_with("..."))
        return std::nullopt;

    // The provider row is a proved unit identity, including multi-part native
    // names, quoted nicknames and offices. The shared identity parser owns
    // each of those fields, rather than translating surviving name fragments.
    if (source.starts_with("- ")) {
        const auto provider = translate_unit_identity(trim_view(source.substr(2)), true);
        return provider ? std::optional<std::string>("- " + *provider) : std::nullopt;
    }

    std::string date_target;
    if (const auto date = parse_health_history_date(source)) {
        // A calendar month has a distinct semantic namespace from an item
        // material (Moonstone/Obsidian/etc.). Reuse the existing month terms.
        std::vector<size_t> origins;
        const auto month = RULESETS.translate_with_origins(
            std::string(date->month), "::day::month", origins);
        if (!month) return std::nullopt;
        date_target = "第" + std::string(date->year) + "年，" + *month +
            std::string(date->day) + "日：";
        source = trim_view(source.substr(date->end));
        // The row adapter can render the date and event as separate color
        // runs while still asking this parser to translate each whole field.
        if (source.empty()) return date_target;
    }

    const auto finish = [&](std::string target) -> std::optional<std::string> {
        if (target.empty()) return std::nullopt;
        return date_target + target;
    };
    for (const auto &[english, chinese] : {
            std::pair<std::string_view, std::string_view>{"Brought to rest", "被安置休息"},
            {"Brought to rest in Bed", "被安置于床上休息"},
            {"Evaluated", "接受诊断"},
            {"Cleaned", "接受清洁处理"},
            {"Bleeding stopped", "已止血"},
            {"Placed in traction", "接受牵引治疗"},
            {"No medical history", "没有病史"}}) {
        if (source == english) return finish(std::string(chinese));
    }

    const auto anatomy = [&](std::string_view value) {
        return RULESETS.translate_anatomy(native_text_to_utf8(trim_view(value)));
    };
    for (const auto &[prefix, suffix, before, after] : {
            std::array<std::string_view, 4>{"Compound fracture of ", " repaired", "", "的开放性骨折已修复"},
            {"Rotten tissue excised from ", "", "已切除", "的坏死组织"},
            {"", " amputated", "", "已截除"}}) {
        if (!source.starts_with(prefix) || !source.ends_with(suffix) ||
            source.size() <= prefix.size() + suffix.size()) continue;
        const auto body = anatomy(source.substr(prefix.size(),
            source.size() - prefix.size() - suffix.size()));
        return body ? finish(std::string(before) + *body + std::string(after))
                    : std::nullopt;
    }
    for (const auto &[prefix, action] : {
            std::pair<std::string_view, std::string_view>{"Brought to rest in ", "被安置于"},
            {"Placed in traction in ", "在"}}) {
        if (!source.starts_with(prefix)) continue;
        const auto furniture_source = trim_view(source.substr(prefix.size()));
        auto furniture = exact_literal_translation(furniture_source);
        if (!furniture) furniture = translate_legends_item(furniture_source);
        if (!furniture) return std::nullopt;
        return finish(std::string(action) + *furniture +
            (prefix == "Brought to rest in " ? "休息" : "接受牵引治疗"));
    }
    if (source.starts_with("Cleaned with ")) {
        const auto material = translate_material_name(source.substr(13));
        return material ? finish("已用" + *material + "清洁") : std::nullopt;
    }
    if (source.starts_with("Diagnosed with ")) {
        const auto condition = exact_literal_translation(trim_view(source.substr(15)));
        return condition ? finish("被诊断为" + *condition) : std::nullopt;
    }
    if (source.starts_with("Had ") && source.ends_with(" set")) {
        const auto body = anatomy(source.substr(4, source.size() - 8));
        return body ? finish(*body + "已复位") : std::nullopt;
    }
    constexpr std::string_view received = "Received ";
    if (!source.starts_with(received)) return std::nullopt;
    source = trim_view(source.substr(received.size()));

    // Parse the actual treatment connective first. It bounds both a complete
    // material and a complete body part, so a wrapped "left upper leg" can
    // never leave "on left" or a dangling hyphen in the displayed sentence.
    for (const auto &[kind, action] : {
            std::pair<std::string_view, std::string_view>{" sutures on ", "缝合"},
            {" dressing on ", "包扎"},
            {" splint on ", "夹板固定"}}) {
        const size_t at = source.find(kind);
        if (at == std::string_view::npos) continue;
        const auto material_source = trim_view(source.substr(0, at));
        const auto body = anatomy(source.substr(at + kind.size()));
        if (material_source.empty() || !body) return std::nullopt;
        auto material = kind == " dressing on "
            ? RULESETS.translate_woven_plant_material(native_text_to_utf8(material_source))
            : std::optional<std::string>{};
        if (!material) material = translate_material_name(material_source);
        if (!material) return std::nullopt;
        return finish(*body + "已用" + *material + std::string(action));
    }

    // The native cast record differs from splints: MATERIAL BODY-PART cast,
    // without an "on" separator. Both complete typed fields must resolve.
    if (source.ends_with(" cast")) {
        const auto fields = trim_view(source.substr(0, source.size() - 5));
        for (size_t at = fields.rfind(' '); at != std::string_view::npos;
             at = at == 0 ? std::string_view::npos : fields.rfind(' ', at - 1)) {
            const auto body = anatomy(fields.substr(at + 1));
            if (!body) continue;
            const auto material = translate_material_name(fields.substr(0, at));
            if (material) return finish(*body + "已用" + *material + "固定");
        }
        return std::nullopt;
    }

    // Crutches are complete finished items, so use the same material
    // qualifier as inventory (willow -> 柳木) rather than its raw tree noun.
    for (const auto &[noun, target] : {
            std::pair<std::string_view, std::string_view>{"crutch", "拐杖"},
            {"crutches", "拐杖"}}) {
        if (source == noun) return finish("获得" + std::string(target));
        const std::string suffix = " " + std::string(noun);
        if (!source.ends_with(suffix)) continue;
        const auto material_source = trim_view(source.substr(0, source.size() - suffix.size()));
        const auto material = translate_embark_item_material_qualifier(
            std::string(material_source), true);
        if (!material) return std::nullopt;
        return finish("获得" + *material + std::string(target));
    }
    // The crutch branch passes a complete item caption, which can also carry
    // native quality/designation marks. Keep those with the shared item name.
    const auto item = translate_legends_item(source);
    return item ? finish("获得" + *item) : std::nullopt;
}
