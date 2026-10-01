// Typed item subrecords choose the shared reviewed item-description rules.
// These helpers accept semantic pieces, not the producer's English text.
const auto item_improvement_apply = [&](std::string_view scope, std::string_view key,
        const std::vector<Pieces> &fields) -> std::optional<Pieces> {
    const auto &indices = scope == "sentence" ? item_description_sentence_rules_ :
        scope == "predicate" ? item_description_predicate_rules_ : item_description_term_rules_;
    for (const int index : indices)
        if (rules_[index].source == key) return apply_rule(rules_[index], fields);
    failure_detail = "item-semantic-template-missing; scope=" + std::string(scope) +
        "; key=" + std::string(key);
    return std::nullopt;
};
const auto item_improvement_material = [&](const std::string &key, bool shaped_gem = false)
        -> std::optional<Pieces> {
    const auto &prefix = text(key + ".material_prefix");
    const auto &state = text(key + ".material_state");
    // This is one independently captured RAW material label, shared with
    // inventory's vocabulary. It is never extracted from a description.
    const std::string gem = shaped_gem ? text(key + ".gem") : std::string{};
    const std::string raw = !gem.empty() ? gem : prefix.empty() ? state : prefix + " " + state;
    std::optional<Pieces> result;
    if (shaped_gem) {
        // Gem nouns and glass/bone qualifiers use the same scoped material
        // vocabulary as item captions, not homonymous colors in global terms.
        std::vector<size_t> origins;
        if (const auto material = RULESETS.translate_with_origins(
                lower(native_text_to_utf8(raw)), "::gems::details::materials", origins))
            result = Pieces{piece(*material, neutral)};
    }
    // Image materials, dyes and fabric subrecords are material snapshots,
    // not improvement records: they have no improvement-type field. Only
    // the instrument-component producer supplies this typed discriminator.
    if (event.fields.contains(key + ".component_present") && number(key + ".component_present")) {
        const std::string component = lower(trim(text(key + ".component_name")));
        if (component == "string" || component == "strings" ||
                component.ends_with(" string") || component.ends_with(" strings")) {
            if (const auto fiber = translate_instrument_string_material(raw))
                result = Pieces{piece(*fiber, neutral)};
        }
    }
    if (!result) result = term(raw);
    if (!result) {
        const auto translated = translate_legends_item(raw);
        if (translated) result = Pieces{piece(*translated, neutral)};
    }
    if (!result) return std::nullopt;
    if (number(key + ".owner")) {
        const auto owner = subject(NativeHistoryObjectKind::MaterialOwner,
            number(key + ".owner_id"), false, number(key + ".owner_subid"));
        return owner ? apply("{n}'s {s}", {*owner, *result}) : std::nullopt;
    }
    return result;
};
const auto item_improvement_list = [&](const std::vector<Pieces> &parts)
        -> std::optional<Pieces> {
    if (parts.empty()) return Pieces{};
    auto result = std::optional<Pieces>(parts.front());
    for (size_t i = 1; i < parts.size(); ++i) {
        result = item_improvement_apply("term", i + 1 == parts.size() ?
            "{s} and {s}" : "{s}, {s}", {*result, parts[i]});
        if (!result) return std::nullopt;
    }
    return result;
};
const auto item_improvement_sentence = [&](std::string_view predicate,
        const Pieces &value) -> std::optional<Pieces> {
    const auto p = item_improvement_apply("predicate", predicate, {value});
    return p ? item_improvement_apply("sentence", "It {e}.", {*p}) : std::nullopt;
};
const auto item_instrument_component_name = [&](const std::string &raw)
        -> std::optional<Pieces> {
    // c7691f..c76b9f selects an instrument RAW component, whose +48 name
    // retains the instrument glossary's sense (body = 琴身, not anatomy).
    // It can also contain the generated instrument name and a piece suffix.
    const std::string key = "piece:" + lower(trim(raw));
    if (const auto found = instrument_terms_.find(key); found != instrument_terms_.end())
        return Pieces{piece(found->second, neutral)};
    // Without a separately captured instrument-name identity, this fallback
    // requires the existing native lexicon for every name word. Unknown
    // English component words cannot become invented phonetic names.
    if (const auto named = translate_embark_instrument_item(raw, false, false))
        return Pieces{piece(*named, neutral)};
    return term(raw);
};
const auto item_improvement_quality = [&](Pieces value, const std::string &key,
        bool artifact, int mode, int32_t quality, int32_t maker, bool unknown_artist)
        -> std::optional<Pieces> {
    (void)key;
    if (artifact) return value;
    static constexpr const char *worked[] = {"", "well-crafted {s}",
        "finely-crafted {s}", "superior quality {s}",
        "exceptionally worked {s}", "masterfully worked {s}"};
    static constexpr const char *prepared[] = {"", "well-prepared {s}",
        "finely-prepared {s}", "superior quality {s}",
        "exceptionally prepared {s}", "masterfully prepared {s}"};
    static constexpr const char *woven[] = {"", "well-crafted {s}",
        "finely-crafted {s}", "superior quality {s}",
        "exceptional {s}", "masterful {s}"};
    if (quality > 0 && quality <= 5) {
        const auto result = item_improvement_apply("term", mode == 1 ? prepared[quality] :
            mode == 2 ? woven[quality] : worked[quality], {value});
        if (!result) return std::nullopt;
        value = *result;
    }
    if (quality == 5) {
        if (maker >= 0) {
            const auto person = subject(NativeHistoryObjectKind::Figure, maker, false);
            return person ? item_improvement_apply("term", mode == 2 ?
                "{s} woven by {n}" : "{s} by {n}", {value, *person}) : std::nullopt;
        }
        if (unknown_artist)
            return item_improvement_apply("term", "{s} by an unknown artist", {value});
    }
    return value;
};
const auto item_improvement_coloration = [&](const std::string &key) -> std::optional<Pieces> {
    if (!number(key + ".present")) return Pieces{};
    const auto translated_color = translate_item_color_pattern(text(key + ".pattern_name"));
    if (!translated_color) return std::nullopt;
    const auto color = Pieces{piece(*translated_color, neutral)};
    const int32_t quality = number(key + ".quality");
    const int32_t kind = number(key + ".subject");
    static constexpr const char *quality_color[] = {"", "well-colored",
        "finely colored", "superbly colored", "exceptionally colored",
        "masterfully colored"};
    static constexpr const char *quality_dye[] = {"colored with {j}",
        "well-colored with {j}", "finely colored with {j}", "superbly colored with {j}",
        "exceptionally colored with {j}", "masterfully colored with {j}"};
    const int q = quality >= 1 && quality <= 5 ? quality : 0;
    std::vector<Pieces> dyes;
    for (const int32_t i : numbers(key + ".dyes")) {
        const auto dye = item_improvement_material(key + ".dye." + std::to_string(i));
        if (!dye) return std::nullopt;
        dyes.push_back(*dye);
    }
    std::optional<Pieces> coloration;
    if (!dyes.empty()) {
        auto mixture = item_improvement_list(dyes);
        if (!mixture) return std::nullopt;
        if (dyes.size() > 1) mixture = item_improvement_apply("term", "a mixture of {j}", {*mixture});
        if (!mixture) return std::nullopt;
        // The c75000, cad270 and cadcb0 writers omit "colored" at quality zero.
        // Keep the color and dye slots independent, including a mixed dye.
        if (!q) {
            const std::string stem = kind == 0 ? "The thread is " :
                kind == 1 ? "The material is " : "The object is ";
            return item_improvement_apply("sentence", stem + "{v} with {j}.", {color, *mixture});
        }
        coloration = item_improvement_apply("term", quality_dye[q], {*mixture});
    } else if (q) coloration = item_improvement_apply("term", quality_color[q], {});
    else coloration = color;
    if (!coloration) return std::nullopt;
    if (quality == 5 && number(key + ".maker") >= 0) {
        const auto maker = subject(NativeHistoryObjectKind::Figure, number(key + ".maker"), false);
        if (!maker) return std::nullopt;
        coloration = item_improvement_apply("term", "{s} by {n}", {*coloration, *maker});
        if (!coloration) return std::nullopt;
    }
    // All four producers append the quality after COLOR + comma before
    // deciding whether a dye-material suffix exists. A quality-only color
    // must retain the same construction, including its optional maker.
    const std::string stem = kind == 0 ? "The thread is " :
        kind == 1 ? "The material is " : "The object is ";
    if (q)
        return item_improvement_apply("sentence", stem + "{v}, {s}.", {color, *coloration});
    return item_improvement_apply("sentence", stem + "{v}.", {color});
};
const auto item_improvements = [&](const std::string &prefix, const auto &image_renderer)
        -> std::optional<Pieces> {
    Pieces result;
    const bool artifact = number(prefix + ".artifact") != 0;
    const auto label = [&](const std::string &key, int mode, bool unknown_artist,
            int32_t quality_override = -1, int32_t maker_override = -2)
            -> std::optional<Pieces> {
        const bool shaped_gem = event.fields.contains(key + ".shape") && number(key + ".shape") >= 0;
        auto value = item_improvement_material(key, shaped_gem);
        if (!value) return std::nullopt;
        if (shaped_gem) {
            const int32_t flags = number(key + ".shape_flags");
            const auto &gem = text(key + ".gem");
            // RAW GEMS_USE_* flags select an existing production. Bind the
            // captured fields directly; never rebuild English prose or keep
            // a second shape/material/cut concatenator for native pages.
            const std::string family = flags & 4 ? "adjective_noun" :
                flags & 1 ? "noun" : "adjective";
            const std::string scope = "::gems::details::plural::" + family;
            const std::string shape_scope = "::gems::details::shapes::" + family;
            Pieces adjective;
            if (!text(key + ".shape_adjective").empty() && (flags & (2 | 4))) {
                const auto translated = apply_bound_toml(shape_scope + "::prefix",
                    lower(native_text_to_utf8(text(key + ".shape_adjective"))));
                if (!translated) return std::nullopt;
                adjective = *translated;
            }
            std::vector<std::pair<std::string, Pieces>> fields;
            if (flags & (1 | 4)) {
                const auto shape = apply_bound_toml(shape_scope + "::plural",
                    lower(native_text_to_utf8(text(key + ".shape_plural"))));
                if (!shape) return std::nullopt;
                if (flags & 4) fields.emplace_back(scope + "::^0", adjective);
                fields.emplace_back(scope + (flags & 4 ? "::^1" : "::^0"), *value);
                fields.emplace_back(scope + "::main", *shape);
            } else {
                const bool suffix = ((flags & 2) && gem.empty()) || number(key + ".gem_suffix");
                const auto main = suffix ? apply_bound_toml(shape_scope + "::plural", "gems") : value;
                if (!main) return std::nullopt;
                fields.emplace_back(scope + "::^0", adjective);
                fields.emplace_back(scope + "::^1", suffix ? *value : Pieces{});
                fields.emplace_back(scope + "::main", *main);
            }
            std::string pattern;
            for (const auto &[name, parts] : fields) pattern += "{" + name + "}";
            value = apply_bound_toml(scope, pattern, fields);
            if (!value) return std::nullopt;
        }
        if (mode == 2) {
            const auto cloth = term("cloth");
            if (!cloth) return std::nullopt;
            join(*value, *cloth);
        }
        return item_improvement_quality(*value, key, artifact, mode,
            quality_override < 0 ? number(key + ".quality") : quality_override,
            maker_override == -2 ? number(key + ".maker") : maker_override, unknown_artist);
    };
    const auto append = [&](const std::optional<Pieces> &sentence) {
        if (!sentence) return false;
        join(result, *sentence);
        return true;
    };
    // The native producer groups repeated decoration families, retaining
    // every entry's own material, shape, quality and maker.
    const auto decorate = [&](int type, int group, std::string_view predicate) {
        std::vector<Pieces> list;
        for (int32_t id : numbers(prefix + ".entries")) {
            const std::string key = prefix + "." + std::to_string(id);
            if (number(key + ".type") != type ||
                (type == 1 && number(key + ".group") != group)) continue;
            const auto value = label(key, type == 1 && group == 3 ? 1 : 0, type == 1);
            if (!value) return false;
            list.push_back(*value);
        }
        if (list.empty()) return true;
        const auto joined = item_improvement_list(list);
        return joined && append(item_improvement_sentence(predicate, *joined));
    };
    static constexpr const char *covered[] = {"is encrusted with {s}", "is studded with {s}",
        "is decorated with {s}", "is glazed with {s}"};
    for (int group = 0; group < 4; ++group) if (!decorate(1, group, covered[group])) return std::nullopt;
    if (!decorate(3, -1, "is encircled with bands of {s}")) return std::nullopt;
    // c765df..c76dee traverse these independent families in this order.
    for (int type : {7, 6, 14, 11, 5}) {
        for (int32_t id : numbers(prefix + ".entries")) {
            const std::string key = prefix + "." + std::to_string(id);
            if (number(key + ".type") != type) continue;
            if (type == 6 || type == 14) {
                if (!append(item_improvement_coloration(key + ".color"))) return std::nullopt;
                continue;
            }
            const auto value = label(key, type == 7 ? 2 : 0, false);
            if (!value) return std::nullopt;
            if (type == 7) {
                if (!append(item_improvement_sentence("is made from {s}", *value))) return std::nullopt;
            } else if (type == 5) {
                static constexpr const char *components[] = {"The handle is made from {s}.",
                    "The rollers are made from {s}.", "The rope is {s}.", "The chain is {s}."};
                const int32_t component = number(key + ".component");
                if (component < 0 || component >= 4) return std::nullopt;
                if (!append(item_improvement_apply("sentence", components[component], {*value})))
                    return std::nullopt;
            } else if (number(key + ".component_present")) {
                const auto name = item_instrument_component_name(text(key + ".component_name"));
                if (!name || !append(item_improvement_apply("sentence",
                        number(key + ".component_plural") ? "The {i} are made from {s}." :
                        "The {i} is made from {s}.", {*name, *value}))) return std::nullopt;
            }
        }
    }
    if (!decorate(2, -1, "is adorned with hanging rings of {s}") ||
        !decorate(4, -1, "menaces with spikes of {s}")) return std::nullopt;
    for (int type : {0, 8}) {
        for (int32_t id : numbers(prefix + ".entries")) {
            const std::string key = prefix + "." + std::to_string(id);
            if (number(key + ".type") != type || !number(key + ".image_present")) continue;
            if (!append(image_renderer(key + ".image", 16, artifact))) return std::nullopt;
            const bool woven = type == 8 && number(key + ".woven");
            if (woven || number(key + ".image_type") == 24) {
                const auto value = woven ? label(key + ".fabric", 2, false) : item_improvement_material(key);
                if (!value || !append(item_improvement_sentence("is made from {s}", *value)))
                    return std::nullopt;
            }
            if (woven && !append(item_improvement_coloration(key + ".color"))) return std::nullopt;
        }
    }
    return result;
};
(void)item_improvements;
