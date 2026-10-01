case NativeHistoryPageKind::EntityIntroduction: {
    auto entity = subject(NativeHistoryObjectKind::Entity, event.entity_id, false);
    auto world = subject(NativeHistoryObjectKind::World, 0, false);
    if (!entity || !world) return std::nullopt;
    std::string key = "{a} was a ";
    std::vector<Pieces> fields{*entity};
    if (!text("species").empty()) {
        auto species = translate_creature_descriptor(text("species"));
        if (!species) return std::nullopt;
        key += "{s} ";
        fields.push_back(Pieces{piece(*species, neutral)});
    }
    const int32_t entity_type = number("entity_type");
    switch (entity_type) {
    case 0: key += "civilization of {p}"; break;
    case 1: case 2: case 3: key += "group from {p}"; break;
    case 4: key += "bandit gang from {p}"; break;
    case 5: key += "religion of {p}"; break;
    case 6:
        key += number("cunning") > 10
            ? (number("martial_prowess") > 10 ? "versatile mercenary " : "shadowy military ")
            : "mercenary ";
        key += number("has_honors") ? "order from {p}" :
            number("martial_prowess") > 10 ? "company from {p}" : "band from {p}";
        break;
    case 7: key += "collection of outcasts from {p}"; break;
    case 8: key += "performance troupe from {p}"; break;
    case 9: key += "merchant company from {p}"; break;
    default: return std::nullopt;
    }
    fields.push_back(*world);
    auto result = apply(key, fields);
    if (!result) return std::nullopt;
    if (entity_type == 6) {
        const int32_t count = number("worship_count");
        if (count) {
            std::optional<Pieces> worship;
            if (number("linked_religion") >= 0) {
                auto religion = subject(NativeHistoryObjectKind::Entity, number("linked_religion"), false);
                if (!religion) return std::nullopt;
                worship = apply("linked to {p}", {*religion});
            } else if (count == 1) {
                auto actor = subject(NativeHistoryObjectKind::Figure, event.actor_id, false);
                if (!actor) return std::nullopt;
                worship = apply("devoted to the worship of {a}", {*actor});
            } else worship = term("devoted to worship");
            if (!worship) return std::nullopt;
            append_clause(*result, *worship);
        }
        if (number("specialty")) {
            const int32_t weapons = number("weapon_count");
            std::optional<Pieces> specialty;
            if (weapons) {
                Pieces names;
                for (int32_t index = 0; index < weapons; ++index) {
                    auto name = term(text("weapon." + std::to_string(index)));
                    if (!name) return std::nullopt;
                    if (index) names.push_back(piece(index + 1 == weapons ? "与" : "、", neutral));
                    join(names, *name);
                }
                specialty = apply(number("skill") > 10 ? "dedicated to the mastery of the {i}" :
                    "known for their use of {i}", {names});
            } else {
                static constexpr const char *unarmed[] = {"wrestling", "biting", "striking", "kicking"};
                const int32_t skill = number("unarmed_skill");
                if (skill < 99 || skill > 102) return std::nullopt;
                auto name = term(unarmed[skill - 99]);
                if (!name) return std::nullopt;
                specialty = apply(number("skill") > 10 ? "dedicated to the mastery of {s}" :
                    "known for {s}", {*name});
            }
            if (!specialty) return std::nullopt;
            append_clause(*result, *specialty);
        }
    }
    const int32_t count = entity_type == 5 ? number("worship_count") : 0;
    if (count > 1) {
        auto worship = term("centered around the worship of various beings");
        if (!worship) return std::nullopt;
        append_clause(*result, *worship);
    } else if (count == 1) {
        auto actor = subject(NativeHistoryObjectKind::Figure, event.actor_id, false);
        if (!actor) return std::nullopt;
        auto worship = apply("centered around the worship of {a}", {*actor});
        if (!worship) return std::nullopt;
        append_clause(*result, *worship);
        if (number("deity")) {
            std::string deity_key = ", a ";
            std::vector<Pieces> deity_fields;
            if (!text("deity_species").empty()) {
                auto species = translate_creature_descriptor(text("deity_species"));
                if (!species) return std::nullopt;
                deity_key += "{s} ";
                deity_fields.push_back(Pieces{piece(*species, neutral)});
            }
            const int32_t sex = number("sex");
            deity_key += sex == 0 ? "goddess" : sex == 1 ? "god" : "deity";
            const auto spheres = page_spheres();
            if (!spheres) return std::nullopt;
            if (!spheres->empty()) {
                deity_key += " of {r}";
                deity_fields.push_back(*spheres);
            }
            auto description = apply(deity_key, deity_fields);
            if (!description) return std::nullopt;
            join(*result, *description);
        }
        if (number("force")) {
            std::string force_key = ", a force";
            std::vector<Pieces> force_fields;
            if (number("force_region") >= 0) {
                auto region = subject(NativeHistoryObjectKind::Region, number("force_region"), false);
                if (!region) return std::nullopt;
                force_key += number("force_past") ? " which was said to permeate {p}" : " which permeates {p}";
                force_fields.push_back(*region);
            }
            auto force = apply(force_key, force_fields);
            if (!force) return std::nullopt;
            join(*result, *force);
        }
    }
    result->push_back(piece("。", neutral));
    if (!append_page_confidence(*result)) return std::nullopt;
    return result;
}
