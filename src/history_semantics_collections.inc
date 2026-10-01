// Collection IDs never resolve through event.children. The native adapter
// saved the collection's type and roles while the parent event was borrowed.
const auto collection_title = [&](int32_t id) -> std::optional<Pieces> {
    const std::string prefix = "collection." + std::to_string(id) + ".";
    const int32_t type = number(prefix + "type");
    if (type < 0 || type >= 18) return std::nullopt;
    const auto finish = [&](std::optional<Pieces> title) -> std::optional<Pieces> {
        if (!title) return std::nullopt;
        const int32_t ordinal = number(prefix + "ordinal");
        if (ordinal > 1) {
            title = apply("Native history collection ordinal {d}: {s}",
                {Pieces{piece(std::to_string(ordinal), neutral)}, *title});
            if (!title) return std::nullopt;
        }
        // The +30 title slot is unlinked. Its owning page can subsequently
        // apply the native Collection link; nested subject links stay plain.
        for (auto &part : *title) {
            part.foreground_rgb = neutral;
            part.source_end = 0;
            part.native_link_type = -1;
            part.native_link_id = -1;
            part.native_link_subid = -1;
        }
        return title;
    };
    const auto location = [&]() -> std::optional<Pieces> {
        const int32_t site = number(prefix + "site"), layer = number(prefix + "layer"),
            region = number(prefix + "region");
        return site >= 0 ? subject(NativeHistoryObjectKind::Site, site) :
            layer >= 0 ? subject(NativeHistoryObjectKind::Underground, layer) :
            region >= 0 ? subject(NativeHistoryObjectKind::Region, region) : term("the wilds");
    };
    if (type == 0 || type == 1) return finish(subject(NativeHistoryObjectKind::Collection, id));
    if (type == 2) {
        const auto first = subject(NativeHistoryObjectKind::Figure, number(prefix + "first"));
        const auto second = subject(NativeHistoryObjectKind::Figure, number(prefix + "second"));
        return first && second ? finish(apply("The Duel of {n} and {n}", {*first, *second})) : std::nullopt;
    }
    if (type == 3) {
        const int32_t outcome = number(prefix + "outcome");
        const char *source = outcome == 1 ? "The Destruction of {p}" :
            outcome == 47 ? "The Pillaging of {p}" :
            outcome >= 48 && outcome <= 50 ? "The Conquest of {p}" :
            outcome == 110 ? "The Surrender of {p}" : "Native history collection title of {p}";
        const auto site = subject(NativeHistoryObjectKind::Site, number(prefix + "site"));
        return site ? finish(apply(source, {*site})) : std::nullopt;
    }
    if (type == 7) {
        const auto &figures = numbers(prefix + "figures");
        if (figures.empty()) return finish(apply("The Journey", {}));
        const auto first = subject(NativeHistoryObjectKind::Figure, figures.front());
        if (!first) return std::nullopt;
        if (figures.size() != 2) return finish(apply("The Journey of {n}", {*first}));
        const auto second = subject(NativeHistoryObjectKind::Figure, figures[1]);
        return second ? finish(apply("The Journey of {n} and {n}", {*first, *second})) : std::nullopt;
    }
    if (type == 8 || type == 14) {
        const auto site = subject(NativeHistoryObjectKind::Site, number(prefix + "site"));
        if (!site) return std::nullopt;
        if (type == 8) return finish(apply("The Insurrection in {p}", {*site}));
        const auto &raw = text(prefix + "modifier");
        if (raw.empty()) return finish(apply("The Purge in {p}", {*site}));
        auto modifier = term(raw);
        // 9dc976 copies native effect type 31's independent name +98;
        // otherwise 9dca89 copies creature_raw.name[0] or uses Monster.
        // These labels use the same descriptor vocabulary as figure species.
        if (!modifier) if (const auto species = translate_creature_descriptor(raw))
            modifier = Pieces{piece(*species, neutral)};
        return modifier ? finish(apply("The {s} Purge in {p}", {*modifier, *site})) : std::nullopt;
    }
    if (type == 15) {
        const auto place = location();
        return place ? finish(apply("The Raid of {p}", {*place})) : std::nullopt;
    }
    if (type == 16 || type == 17) {
        const auto entity = subject(NativeHistoryObjectKind::Entity, number(prefix + "entity"));
        if (!entity) return std::nullopt;
        const std::string source = type == 16 ? "The Persecution of {p}" : "The Overthrow of {p}";
        const int32_t site_id = number(prefix + "site");
        if (type == 17 && site_id < 0) return finish(apply(source, {*entity}));
        const auto site = subject(NativeHistoryObjectKind::Site, site_id);
        return site ? finish(apply(source + " in {p}", {*entity, *site})) : std::nullopt;
    }
    if (type >= 9 && type <= 13) {
        const bool present = number(prefix + "occasion.present") != 0;
        std::optional<Pieces> occasion = Pieces{};
        if (present && number(prefix + "named")) occasion = subject(NativeHistoryObjectKind::Collection, id);
        if (!occasion) return std::nullopt;
        if (type == 9) {
            if (!present) return finish(apply("The Occasion", {}));
            if (number(prefix + "ordinal") <= 1) return finish(occasion);
            return finish(apply("The Occasion of {p}", {*occasion}));
        }
        std::optional<Pieces> title;
        if (type == 12) title = apply("a procession", {});
        else if (type == 13) {
            if (!present) title = apply("a ceremony", {});
            else {
                const int32_t ceremony = number(prefix + "ceremony");
                title = apply(ceremony == 0 ? "Opening Ceremony" :
                    ceremony == 1 ? "Closing Ceremony" : "Main Ceremony", {});
            }
        } else {
            const int32_t schedule = number(prefix + "schedule.type");
            if (!number(prefix + "schedule.present"))
                title = apply(type == 10 ? "a performance" : "a competition", {});
            else if (type == 10) {
                static constexpr const char *labels[] = {
                    "Dance Performance", "Musical Performance", "a poetry recital", "storytelling"};
                title = schedule >= 0 && schedule < 4 ? apply(labels[schedule], {}) : std::optional<Pieces>(Pieces{});
            } else {
                switch (schedule) {
                case 4: title = apply("a dance competition", {}); break;
                case 5: title = apply("a music competition", {}); break;
                case 6: title = apply("a poetry competition", {}); break;
                case 7: title = apply("a foot race", {}); break;
                case 8: title = apply("a flying race", {}); break;
                case 9: {
                    const auto species = translate_creature_descriptor(text(prefix + "species"));
                    if (species) title = apply("Native history collection {s} Race", {Pieces{piece(*species, neutral)}});
                    break;
                }
                case 10: title = apply("a wrestling competition", {}); break;
                case 11: {
                    const auto implement = item(prefix + "throwing");
                    if (implement) title = apply("a {i} throwing competition", {*implement});
                    break;
                }
                case 12: title = apply("a gladiatory competition", {}); break;
                default: title = Pieces{}; break;
                }
            }
        }
        if (!title) return std::nullopt;
        if (present) {
            if (title->empty()) title = occasion;
            else title = apply("Native history collection {s} of {p}", {*title, *occasion});
        }
        return finish(title);
    }
    std::string key;
    std::vector<Pieces> values;
    if (type == 4) {
        key = number(prefix + "attempted") ? "The Attempted Abduction" : "The Abduction";
        const int32_t figure = number(prefix + "figure");
        if (number(prefix + "figure.present")) {
            const auto person = subject(NativeHistoryObjectKind::Figure, figure);
            if (!person) return std::nullopt;
            key += " of {n}";
            values.push_back(*person);
        }
    } else if (type == 5) {
        key = number(prefix + "attempted") ? "The Attempted Theft" : "The Theft";
        const int32_t artifact_id = number(prefix + "artifact");
        if (number(prefix + "item.present")) {
            const auto artifact = artifact_id >= 0 ? subject(NativeHistoryObjectKind::Collection, id, false, artifact_id) :
                apply("an unknown artifact", {});
            if (!artifact) return std::nullopt;
            key += " of {p}";
            values.push_back(*artifact);
        }
    } else {
        const auto &figures = numbers(prefix + "figures");
        if (figures.size() == 1) {
            const auto beast = subject(NativeHistoryObjectKind::Figure, figures.front());
            if (!beast) return std::nullopt;
            key = "The Rampage of {n}";
            values.push_back(*beast);
        } else if (figures.empty()) key = "The Rampage";
        else if (text(prefix + "species") == "Monster") key = "The Monster Rampage";
        else {
            const auto species = translate_creature_descriptor(text(prefix + "species"));
            if (!species) return std::nullopt;
            key = "The {s} Rampage";
            values.push_back(Pieces{piece(*species, neutral)});
        }
    }
    const int32_t site = number(prefix + "site");
    const int32_t layer = number(prefix + "layer");
    const int32_t region = number(prefix + "region");
    if (site >= 0 || layer >= 0 || region >= 0) {
        const auto place = site >= 0 ? subject(NativeHistoryObjectKind::Site, site) :
            layer >= 0 ? subject(NativeHistoryObjectKind::Underground, layer) :
            subject(NativeHistoryObjectKind::Region, region);
        if (!place) return std::nullopt;
        key += (type == 4 || type == 5) && site >= 0 ? " at {p}" : " in {p}";
        values.push_back(*place);
    } else {
        const auto wilds = term("the wilds");
        if (!wilds) return std::nullopt;
        key += " in {p}";
        values.push_back(*wilds);
    }
    return finish(apply(key, values));
};
