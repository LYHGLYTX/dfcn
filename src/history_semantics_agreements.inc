// Modern agreement parties, in native HF-then-entity order (e2b80).
const auto agreement_data = [&](size_t index) -> int32_t {
    const auto &values = numbers("agreement_data");
    if (index >= values.size()) throw MissingField{"agreement_data." + std::to_string(index)};
    return values[index];
};
const auto agreement_party = [&](int32_t id) -> std::optional<Pieces> {
    const std::string prefix = "agreement.party." + std::to_string(id);
    const auto figures = event.fields.find(prefix + ".figures");
    const auto entities = event.fields.find(prefix + ".entities");
    if (figures == event.fields.end() || entities == event.fields.end())
        return term("an unknown party");
    std::vector<Pieces> members;
    for (int32_t person : figures->second) {
        const auto name = subject(NativeHistoryObjectKind::Figure, person);
        if (!name) return std::nullopt;
        members.push_back(*name);
    }
    for (int32_t entity : entities->second) {
        const auto name = subject(NativeHistoryObjectKind::Entity, entity);
        if (!name) return std::nullopt;
        members.push_back(*name);
    }
    if (members.empty()) return Pieces{};
    std::optional<Pieces> result = members.front();
    for (size_t index = 1; index < members.size(); ++index) {
        result = apply(index + 1 == members.size() ? "{a} and {a}" : "{a}, {a}",
            {*result, members[index]});
        if (!result) return std::nullopt;
    }
    return result;
};
const auto agreement_title = [&]() -> std::optional<Pieces> {
    if (!number("agreement_present")) return term("an agreement");
    const int32_t type = number("agreement_type");
    // The native conclusion formatter has no specific noun for demonic
    // binding or a subjectless agreement. Preserve the known object kind.
    if (type == -1 || type == 1) return term("an agreement");
    static constexpr const char *titles[] = {
        "", "", "a residency agreement", "a citizenship agreement", "a parley",
        "corrupt dealing", "a theft deal", "a promise of position", "an assassination plot",
        "an abduction plot", "a sabotage plot", "", "", "an infiltration plot",
        "a framing plot", "a war starting plot", "a request to offer service", "",
    };
    if (type < 0 || type >= static_cast<int32_t>(std::size(titles))) return std::nullopt;
    if (type == 0) {
        const char *title = "an agreement";
        switch (agreement_data(0)) {
        case 0: title = "an insurrection mission"; break;
        case 1: title = "an adventure"; break;
        case 2: title = "a guide agreement"; break;
        case 23: title = "a journey to safety"; break;
        case 24: title = "a rescue mission"; break;
        case 39: title = "bound service"; break;
        case 42: title = "a performance tour"; break;
        default: break;
        }
        return term(title);
    }
    if (type == 11) {
        const int32_t corruption = number("agreement_corruption");
        return corruption == 0 ? term("a foiled bribery conspiracy") : corruption == 2 ?
            term("a foiled corruption conspiracy") : corruption == 3 ?
            term("a foiled embezzlement conspiracy") : std::nullopt;
    }
    if (type == 12) return agreement_data(3) == 2 ? term("an agreement to establish a temple") :
        agreement_data(3) == 11 ? term("an agreement to establish a guildhall") : std::nullopt;
    if (type == 17) {
        const auto artifact = subject(NativeHistoryObjectKind::Artifact, agreement_data(2));
        if (!artifact) return std::nullopt;
        if (agreement_data(4) < 0) return apply("an agreement to retrieve {p}", {*artifact});
        const auto receiver = subject(NativeHistoryObjectKind::Entity, agreement_data(4));
        return receiver ? apply("an agreement to retrieve {p} for {a}", {*artifact, *receiver}) : std::nullopt;
    }
    auto title = term(titles[type]);
    if (type == 16 && title && agreement_data(2) >= 0) {
        const auto entity = subject(NativeHistoryObjectKind::Entity, agreement_data(2));
        return entity ? apply("{s} to {a}", {*title, *entity}) : std::nullopt;
    }
    return title;
};
(void)agreement_party;
(void)agreement_title;

// 2aaf70's eighteen first-subject branches. These are direct semantic keys
// into the reviewed agreement grammar, without invoking its text matcher.
const auto agreement_formation = [&]() -> std::optional<Pieces> {
    const auto render = [&](std::string_view key, const std::vector<Pieces> &values = {}) {
        return scoped_apply("agreement-core", key, values);
    };
    if (!number("agreement_present")) return render("a corrupt agreement was formed");
    const int32_t type = number("agreement_type");
    if (type < 0 || type > 17) return render("a corrupt agreement was formed");
    bool valid = true;
    const auto require = [&](const std::optional<Pieces> &value) {
        if (!value) valid = false;
        return value.value_or(Pieces{});
    };
    const auto party_exists = [&](int32_t id) {
        return event.fields.find("agreement.party." + std::to_string(id) + ".figures") != event.fields.end();
    };
    const auto party = [&](size_t index) { return require(agreement_party(agreement_data(index))); };
    const auto object = [&](NativeHistoryObjectKind kind, size_t index) {
        // Native target formatters are skipped for -1. This preserves that
        // explicit absence without manufacturing a replacement participant.
        const int32_t id = agreement_data(index);
        return id < 0 ? Pieces{} : require(subject(kind, id));
    };
    const auto party_list = [&](const std::vector<int32_t> &ids) -> std::optional<Pieces> {
        if (ids.empty()) return Pieces{};
        auto value = agreement_party(ids.front());
        for (size_t i = 1; value && i < ids.size(); ++i) {
            const auto next = agreement_party(ids[i]);
            if (!next) return std::nullopt;
            value = scoped_apply("agreement-party-list", i + 1 == ids.size() ?
                "{s} and {s}" : "{s}, {s}", {*value, *next});
        }
        return value;
    };
    std::optional<Pieces> body;
    int32_t influence = -1, messenger = -1;
    bool approach = (number("agreement_flags") & 1) != 0;
    switch (type) {
    case 0: {
        std::vector<Pieces> values{party(1), party(2)};
        std::string key = "{s} joined with {s}";
        const int32_t reason = agreement_data(0);
        if (reason == 0) {
            key += " to oust {s} from {s}";
            values.push_back(object(NativeHistoryObjectKind::Entity, 4));
            values.push_back(object(NativeHistoryObjectKind::Site, 3));
        } else if (reason == 1) key += " to live a life of adventure";
        else if (reason == 23) key += " in order to be brought to safety";
        else if (reason == 39) key += " after being compelled to serve";
        else if (reason == 42) key += " to entertain the world";
        else if (reason == 2 || reason == 24) {
            if (reason == 2) key += " as a guide";
            else key += " to help rescue {s}";
            if (agreement_data(5) >= 0 || agreement_data(4) >= 0) {
                if (reason == 2) key += " to find {s}";
                values.push_back(agreement_data(5) >= 0 ?
                    object(NativeHistoryObjectKind::Figure, 5) :
                    require(identity(agreement_data(4), "agreement_identity")));
            } else if (reason == 2 && agreement_data(3) >= 0) {
                key += " to {s}";
                values.push_back(object(NativeHistoryObjectKind::Site, 3));
            } else if (reason == 24) return std::nullopt;
        }
        body = render(key, values);
        break;
    }
    case 1: {
        body = render("{s} aided {s} in becoming a permanent part of the living world", {party(2), party(1)});
        if (!body) return std::nullopt;
        const int32_t reason_id = agreement_data(0);
        const int32_t reason_data = reason_id == 4 ? agreement_data(5) : -1;
        auto reason = history_event_reason_clause(reason_id);
        if (!reason) return std::nullopt;
        if (reason_id == 4 && reason_data == -1)
            reason = HistoryEventClause{4, "due to their cosmic similarity", 0};
        const auto motive = clause(*reason, reason_data);
        if (!motive) return std::nullopt;
        if (!motive->empty()) body = render(
            "{s} aided {s} in becoming a permanent part of the living world {s}",
            {party(2), party(1), *motive});
        if (!body) return std::nullopt;
        if (agreement_data(3) >= 0) {
            std::vector<Pieces> values{*body, object(NativeHistoryObjectKind::Site, 3)};
            std::string key = "{s}. The ritual took place in {s}";
            if (agreement_data(4) >= 0) {
                key += " using {s}";
                values.push_back(object(NativeHistoryObjectKind::Artifact, 4));
            }
            body = render(key, values);
        } else if (agreement_data(4) >= 0) body = render("{s}. The ritual involved {s}",
            {*body, object(NativeHistoryObjectKind::Artifact, 4)});
        break;
    }
    case 2: case 3: {
        const bool resident = type == 2;
        std::vector<Pieces> values{party(resident ? 1 : 0), party(resident ? 2 : 1)};
        std::string key = "{s} made an agreement with {s}";
        const size_t site_index = resident ? 3 : 2;
        if (agreement_data(site_index) >= 0) {
            key += resident ? ", becoming a resident of {s}" : ", becoming a citizen of {s}";
            values.push_back(object(NativeHistoryObjectKind::Site, site_index));
        }
        if (resident) switch (agreement_data(0)) {
        case 41: key += " to eradicate monsters"; break;
        case 42: key += " to entertain the citizenry"; break;
        case 43: key += " to work as a mercenary"; break;
        case 44: key += " to study"; break;
        default: break;
        }
        body = render(key, values);
        break;
    }
    case 4:
        body = render("{s} agreed to a parley with {s}", {party(1), party(2)});
        break;
    case 5: {
        const int32_t action = agreement_data(0);
        if (action < 247 || action > 249) return std::nullopt;
        std::string key = action == 247 ? "{s} began accepting bribes in exchange for leniency" :
            action == 248 ? "{s} began embezzling funds" :
            "{s} began passing a portion of corruptly-obtained funds";
        std::vector<Pieces> values{party(1)};
        if (number("agreement_position_present")) {
            auto title = office(text("agreement_position"));
            if (!title) {
                const auto translated = exact_literal_translation(text("agreement_position"));
                if (translated) title = Pieces{piece(*translated, neutral)};
            }
            values.push_back(require(title));
            values.push_back(object(NativeHistoryObjectKind::Entity, 4));
            key += number("agreement_position_unique") ? " as the {s} of {s}" : " as a {s} of {s}";
        }
        if (action == 249 && party_exists(agreement_data(2))) {
            key += " to {s}";
            values.push_back(party(2));
        } else if (action != 249) influence = agreement_data(2);
        // Unlike the plot branches, corruption always says under influence.
        approach = false;
        messenger = agreement_data(3);
        body = render(key, values);
        break;
    }
    case 6: case 8: case 9: case 10: {
        std::vector<Pieces> values{party(0)};
        std::string key;
        if (type == 6) {
            key = "{s} plotted to steal {s}";
            values.push_back(require(subject(NativeHistoryObjectKind::Artifact, agreement_data(3))));
        } else if (type == 8 || type == 9) {
            key = type == 8 ? "{s} plotted to assassinate {s}" : "{s} plotted to abduct {s}";
            values.push_back(object(NativeHistoryObjectKind::Figure, 3));
        } else {
            key = "{s} plotted to sabotage the activities of {s}";
            if (agreement_data(3) >= 0) values.push_back(object(NativeHistoryObjectKind::Figure, 3));
            else if (agreement_data(4) >= 0) values.push_back(object(NativeHistoryObjectKind::Entity, 4));
            else values.push_back(object(NativeHistoryObjectKind::Site, 5));
            if (agreement_data(5) >= 0 && (agreement_data(3) >= 0 || agreement_data(4) >= 0)) {
                key += " at {s}";
                values.push_back(object(NativeHistoryObjectKind::Site, 5));
            }
        }
        influence = agreement_data(1);
        messenger = agreement_data(2);
        body = render(key, values);
        break;
    }
    case 7: {
        std::string key = "{s} promised {s}";
        std::vector<Pieces> values{party(1), party(2)};
        const bool same = agreement_data(0) == agreement_data(2) ||
            (!party_exists(agreement_data(0)) && !party_exists(agreement_data(2)));
        if (!same) {
            key += " to give";
            if (party_exists(agreement_data(0))) {
                key += " {s}";
                values.push_back(party(0));
            }
        }
        key += " a position";
        if (number("agreement_entity") >= 0) {
            key += " in {s}";
            values.push_back(require(subject(NativeHistoryObjectKind::Entity, number("agreement_entity"))));
        }
        influence = agreement_data(3);
        body = render(key, values);
        break;
    }
    case 11: {
        const int32_t corruption = number("agreement_corruption");
        const char *key = corruption == 0 ? "{s} concocted a bribery conspiracy" :
            corruption == 2 ? "{s} concocted a corruption conspiracy" :
            corruption == 3 ? "{s} concocted a embezzlement conspiracy" : nullptr;
        if (!key) return std::nullopt;
        body = render(key, {require(party_list(numbers("agreement_criminals")))});
        break;
    }
    case 12: {
        const int32_t building = agreement_data(3), tier = number("agreement_location_tier");
        if ((building != 2 && building != 11) || (tier != 1 && tier != 2)) return std::nullopt;
        std::string key = "{s} agreed to establish ";
        key += building == 2 ? (tier == 2 ? "a temple complex" : "a temple") :
            (tier == 2 ? "a grand guildhall" : "a guildhall");
        key += " for {s}";
        body = render(key, {party(1), party(0)});
        break;
    }
    case 13: {
        std::vector<Pieces> values{party(0), object(NativeHistoryObjectKind::Entity, 2)};
        std::string key = "{s} plotted to infiltrate {s}";
        const uint32_t flags = static_cast<uint32_t>(agreement_data(3));
        // 2ab40d..2ab4e1 inserts 1,2,4,8; the caption dispatcher emits
        // treasures, sabotage, terror, coup in that same native order.
        static constexpr const char *goals[] = {
            "steal treasures", "initiate sabotage", "instill terror", "prepare a coup",
        };
        std::vector<Pieces> parts;
        for (size_t i = 0; i < std::size(goals); ++i)
            if (flags & (1u << i)) parts.push_back(require(scoped_apply("agreement-goals", goals[i], {})));
        if (!parts.empty()) {
            Pieces list = parts.front();
            for (size_t i = 1; i < parts.size(); ++i) list = require(scoped_apply("agreement-party-list",
                i + 1 == parts.size() ? "{s} and {s}" : "{s}, {s}", {list, parts[i]}));
            values.push_back(std::move(list));
            key += " in order to {s}";
        }
        influence = agreement_data(1);
        body = render(key, values);
        break;
    }
    case 14: {
        // Exact jump-table order at 2ad754, rather than TSV row order.
        static constexpr const char *crimes[] = {
            "production order violation", "export prohibition violation", "job order violation",
            "a conspiracy to slow labor", "murder", "disorderly conduct", "building destruction",
            "vandalism", "theft", "robbery", "blood-drinking", "embezzlement", "attempted murder",
            "kidnapping", "attempted kidnapping", "attempted theft", "treason", "espionage", "bribery",
        };
        const int32_t crime = agreement_data(4);
        if (crime < 0 || crime >= static_cast<int32_t>(std::size(crimes))) return std::nullopt;
        body = render("{s} plotted to frame {s} for {s} by fooling {s}",
            {party(0), object(NativeHistoryObjectKind::Figure, 2),
             require(scoped_apply("agreement-crime", crimes[crime], {})), object(NativeHistoryObjectKind::Figure, 3)});
        if (agreement_data(1) != agreement_data(0)) influence = agreement_data(1);
        break;
    }
    case 15:
        body = render("{s} plotted to induce a war of {s} upon {s}",
            {party(0), object(NativeHistoryObjectKind::Entity, 2), object(NativeHistoryObjectKind::Entity, 3)});
        influence = agreement_data(1);
        break;
    case 16: {
        std::string key = "{s} requested that {s} make an offer of service";
        std::vector<Pieces> values{party(0), party(1)};
        if (agreement_data(2) >= 0) {
            key += " to {s}";
            values.push_back(object(NativeHistoryObjectKind::Entity, 2));
        }
        body = render(key, values);
        break;
    }
    case 17: {
        std::string key = "{s} asked that {s} retrieve {s}";
        std::vector<Pieces> values{party(1), party(0),
            require(subject(NativeHistoryObjectKind::Artifact, agreement_data(2)))};
        if (agreement_data(3) >= 0) {
            key += " from {s}";
            values.push_back(object(NativeHistoryObjectKind::Entity, 3));
        }
        if (agreement_data(4) >= 0) {
            key += " for {s}";
            values.push_back(object(NativeHistoryObjectKind::Entity, 4));
        }
        body = render(key, values);
        break;
    }
    }
    if (!valid || !body) return std::nullopt;
    if (party_exists(influence)) {
        const auto actor = agreement_party(influence);
        if (!actor) return std::nullopt;
        body = scoped_apply("agreement-record", approach ?
            "{s} approached by {s} to handle the matter directly or through another party" :
            "{s} under the influence of {s}", {*body, *actor});
        if (!body) return std::nullopt;
    }
    std::optional<Pieces> via;
    if (type == 7 && !numbers("agreement_messengers").empty()) via = party_list(numbers("agreement_messengers"));
    else if (party_exists(messenger)) via = agreement_party(messenger);
    else return body;
    return via ? scoped_apply("agreement-record", "{s} via {s}", {*body, *via}) : std::nullopt;
};
(void)agreement_formation;
