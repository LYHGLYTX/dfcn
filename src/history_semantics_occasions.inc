case 81:
case 82:
case 83:
case 84: {
    const bool scheduled = number("schedule_present") != 0;
    std::string key = event.native_type == 81 ? "performance" : event.native_type == 82 ?
        "competition" : event.native_type == 83 ? "procession" : "ceremony";
    std::vector<Pieces> fields;
    std::optional<Pieces> host;
    if (scheduled) {
        host = subject(NativeHistoryObjectKind::Entity, number("entity"));
        if (!host) return std::nullopt;
        key = "held a " + key;
        const int type = number("schedule_type"), value = number("schedule_value");
        if (event.native_type == 81 && type >= 0 && type <= 2) {
            auto work = schedule_form(type == 0 ? NativeHistoryObjectKind::Dance :
                type == 1 ? NativeHistoryObjectKind::Music : NativeHistoryObjectKind::Poem, value);
            if (!work) return std::nullopt;
            if (work->empty()) key = type == 0 ? "held a dance" : type == 1 ? "held a concert" :
                "held a poetry recital";
            else { key = type == 2 ? "held a recital of {b}" : "held a performance of {b}"; fields = {*work}; }
        } else if (event.native_type == 81 && type == 3) {
            if (value == -1) key = "held a story recital";
            else {
                auto content = story(value);
                if (!content) return std::nullopt;
                key = "Native history held story {e}";
                fields = {*content};
            }
        } else if (event.native_type == 82) {
            if (type >= 4 && type <= 6) {
                auto work = schedule_form(type == 4 ? NativeHistoryObjectKind::Dance :
                    type == 5 ? NativeHistoryObjectKind::Music : NativeHistoryObjectKind::Poem, value);
                if (!work) return std::nullopt;
                if (work->empty()) key = type == 4 ? "held a dance competition" : type == 5 ?
                    "held a music competition" : "held a poetry competition";
                else { key = "held a competition involving {b}"; fields = {*work}; }
            } else if (type == 7) key = "held a foot race";
            else if (type == 8) key = "held a flying race";
            else if (type == 9) {
                auto species = schedule_raw_term("race_species");
                if (!species) return std::nullopt;
                key = "held a {s} race";
                fields = {*species};
            } else if (type == 10) key = "held a wrestling competition";
            else if (type == 11) {
                auto implement = item("prize");
                if (!implement) return std::nullopt;
                key = "held a {i} throwing competition";
                fields = {*implement};
            } else if (type == 12) key = "held a gladiatory competition";
        }
    } else key = "there was a " + key;
    auto action = apply(key, fields);
    if (!action) return std::nullopt;
    if (host) join(result, *host);
    join(result, *action);
    // All four formatters select site, otherwise region, otherwise layer.
    // Their jumps after a match skip the remaining location branches.
    for (const auto &[field, kind] : {
            std::pair{"site", NativeHistoryObjectKind::Site},
            std::pair{"region", NativeHistoryObjectKind::Region},
            std::pair{"layer", NativeHistoryObjectKind::Underground}}) {
        if (number(field) == -1) continue;
        auto place = subject(kind, number(field));
        auto where = place ? apply("in {p}", {*place}) : std::nullopt;
        if (!where) return std::nullopt;
        append_clause(result, *where);
        break;
    }
    if (number("occasion_named")) {
        auto occasion = subject(NativeHistoryObjectKind::Occasion, number("entity"), false, number("occasion"));
        auto part = occasion ? apply("as part of {e}", {*occasion}) : std::nullopt;
        if (!part) return std::nullopt;
        append_clause(result, *part);
    }
    result.push_back(piece("。", neutral));
    if (!native_title && scheduled && event.native_type == 83 && number("route_present")) {
        const int start = number("schedule_value"), end = number("schedule_extra"), site = number("site");
        const auto route_name = [&](int id) -> std::optional<Pieces> {
            for (const auto &entry : event.subjects) {
                if (entry.kind != NativeHistoryObjectKind::Building || entry.id != site || entry.subid != id)
                    continue;
                // b8e0b9 / b8e192 call getName directly. There is no generic
                // building label or LPAGE markup in this route description.
                if (!entry.name.has_name) return Pieces{piece("", neutral)};
                auto name = translate_history_name(entry.name);
                return name ? std::optional<Pieces>(Pieces{piece(*name, neutral)}) : std::nullopt;
            }
            return std::nullopt;
        };
        std::optional<Pieces> first, last;
        if (start != -1) first = route_name(start);
        if (end != -1) last = route_name(end);
        if ((start != -1 && !first) || (end != -1 && !last)) return std::nullopt;
        std::optional<Pieces> route;
        if (first && last) route = start == end ?
            apply("It started at {p} and returned there after following its route", {*first}) :
            apply("It started at {p} and ended at {p}", {*first, *last});
        else if (first) route = apply("It started at {p}", {*first});
        else if (last) route = apply("It ended at {p}", {*last});
        if ((first || last) && !route) return std::nullopt;
        if (route) { join(result, *route); result.push_back(piece("。", neutral)); }
    }
    const auto &features = numbers("features");
    if (features.size() % 3) return std::nullopt;
    if (!native_title && !features.empty()) {
        auto introduction = apply("The event featured", {});
        if (!introduction) return std::nullopt;
        join(result, *introduction);
        auto combined = schedule_features();
        if (!combined) return std::nullopt;
        join(result, *combined);
        result.push_back(piece("。", neutral));
    }
    if (!native_title && event.native_type == 82) {
        const auto list_people = [&](const std::vector<int32_t> &ids) -> std::optional<Pieces> {
            Pieces people;
            for (size_t index = 0; index < ids.size(); ++index) {
                auto who = subject(NativeHistoryObjectKind::Figure, ids[index]);
                if (!who) return std::nullopt;
                if (people.empty()) people = *who;
                else {
                    auto joined = apply(index + 1 == ids.size() ? "{a} and {a}" : "{a}, {a}", {people, *who});
                    if (!joined) return std::nullopt;
                    people = *joined;
                }
            }
            return people;
        };
        const auto report = [&](const std::vector<int32_t> &ids, bool winners) -> bool {
            if (ids.empty()) return true;
            std::optional<Pieces> sentence;
            if (ids.size() >= 5) {
                sentence = apply(winners ? "Victory was spread among {c} winners" : "There were {c} competitors",
                    {Pieces{piece(std::to_string(ids.size()), neutral)}});
                if (!sentence) return false;
                const int focus = context_number("histfig_id");
                // b8d1e5 / b8d399 use babe0: narrow to 64 entries, then
                // scan that range, preserving the native ordered-ID rule.
                size_t begin = 0, count = ids.size();
                while (count > 64) {
                    const size_t half = count / 2, middle = begin + half;
                    if (focus >= ids[middle]) begin = middle;
                    count -= half;
                }
                if (focus != -1 && std::find(ids.begin() + begin, ids.begin() + begin + count, focus) !=
                        ids.begin() + begin + count) {
                    auto who = subject(NativeHistoryObjectKind::Figure, focus);
                    auto included = who ? apply("including {a}", {*who}) : std::nullopt;
                    if (!included) return false;
                    append_clause(*sentence, *included);
                }
            } else {
                auto people = list_people(ids);
                if (!people) return false;
                sentence = apply(winners ? ids.size() == 1 ? "{n} was the victor" : "The victory was shared by {a}" :
                    "Competing were {a}", {*people});
            }
            if (!sentence) return false;
            join(result, *sentence);
            result.push_back(piece("。", neutral));
            return true;
        };
        const auto &competitors = numbers("competitors"), &winners = numbers("winners");
        if ((competitors.size() > winners.size() && !report(competitors, false)) || !report(winners, true))
            return std::nullopt;
    }
    translated = true;
    break;
}
