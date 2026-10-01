// Shared page helpers are in scope. Predicate selection uses native fields;
// names and RAW species labels keep the same reviewed vocabulary as events.
if (document.page && document.page->kind == NativeHistoryPageKind::AgeIntroduction) {
    const int32_t type = number("type"), ordinal = number("ordinal");
    auto title = term(text("age_title").empty() ? "Unknown Age" : text("age_title"));
    if (!title) {
        const auto translated = translate_legends_book(text("age_title"));
        if (translated) title = Pieces{piece(*translated, neutral)};
    }
    if (!title) return std::nullopt;
    if (ordinal > 0) {
        title = apply("Native Legends numbered age {d}: {s}",
            {Pieces{piece(std::to_string(ordinal), neutral)}, *title});
        if (!title) return std::nullopt;
    }
    std::optional<Pieces> predicate;
    if (type <= 2) {
        const size_t count = type == 0 ? 3 : type == 1 ? 2 : 1;
        Pieces powers;
        for (size_t index = 0; index < count; ++index) {
            auto power = subject(NativeHistoryObjectKind::Figure,
                number("power." + std::to_string(index)), true);
            if (!power) return std::nullopt;
            if (index) powers.push_back(piece("、", neutral));
            join(powers, *power);
        }
        predicate = apply(count == 1 ? "Native Legends only great power {a}" :
            "Native Legends only great powers {a}", {powers});
    } else if (type == 7) {
        auto species = translate_creature_descriptor(text("ruling_species"));
        if (!species) return std::nullopt;
        predicate = apply("Native Legends creatures ruled the world {s}", {Pieces{piece(*species, neutral)}});
    } else {
        std::string key;
        switch (type) {
        case 3: key = ordinal >= 2 ? "Native Legends living gods and beasts held sway" :
            "Native Legends living gods and beasts still held sway"; break;
        case 4: key = number("age_index") == 0 ? "Native Legends great powers still existed" :
            number("previous_type") == 3 ? "Native Legends great powers were fading" :
            "Native Legends great powers had returned"; break;
        case 5: key = "Native Legends fantastic creatures no longer numerous"; break;
        case 6: key = "Native Legends fantastic creatures few and doubted"; break;
        case 8: key = ordinal == 1 ? "Native Legends final battles of ancient powers" :
            "Native Legends final battles of powers"; break;
        case 9: key = "Native Legends civilized races peopled the world"; break;
        case 10: key = "Native Legends civilization crumbled completely"; break;
        case 11: key = "Native Legends fantastic creatures mere travelers stories"; break;
        case 12: key = number("age_index") == 0 ? "Native Legends only simple creatures existed" :
            "Native Legends no civilized peoples existed"; break;
        default: return std::nullopt;
        }
        predicate = term(key);
    }
    if (!predicate) return std::nullopt;
    if (type != 0 && type != 4 && ordinal >= 2) {
        predicate = apply(ordinal >= 3 ? "Native Legends once again {s}" : "Native Legends again {s}", {*predicate});
        if (!predicate) return std::nullopt;
    }
    return apply("Native Legends age was a time {s}: {s}", {*title, *predicate});
}
if (document.page && document.page->kind == NativeHistoryPageKind::CollectionIntroduction) {
    const int32_t marker = number("marker");
    if (marker) {
        const int32_t id = number("collection_id");
        auto title = collection_title(id);
        if (!title) return std::nullopt;
        for (const auto &token : document.tokens) {
            if (token.link_type != 9 || token.link_id != id) continue;
            for (auto &part : *title) {
                part.foreground_rgb = token.color;
                part.native_link_type = 9;
                part.native_link_id = id;
                part.native_link_subid = token.link_subid;
            }
            break;
        }
        if (marker == 1) return apply("Native Legends part of {s}", {*title});
        auto date = history_date(event.year, event.seconds);
        auto predicate = apply(marker == 2 ? "Native Legends collection ended {s}" :
            marker == 3 ? "Native Legends collection occurred {s}" :
            "Native Legends collection began {s}", {*title});
        if (!date || !predicate) return std::nullopt;
        join(*date, *predicate);
        return date;
    }
    const int32_t type = number("type");
    if (type == 0) {
        Pieces result;
        if (number("war_sides")) {
            auto title = collection_title(number("collection_id"));
            auto attacker = subject(NativeHistoryObjectKind::Entity, number("war_attacker"));
            auto defender = subject(NativeHistoryObjectKind::Entity, number("war_defender"));
            auto sentence = title && attacker && defender ?
                apply("Native Legends war waged {e} by {p} on {p}", {*title, *attacker, *defender}) : std::nullopt;
            if (!sentence) return std::nullopt;
            join(result, *sentence);
        }
        const int32_t count = number("war_candidates");
        if (!count) {
            auto debated = term("Native Legends war causes debated");
            if (!debated) return std::nullopt;
            join(result, *debated);
            return result;
        }
        const int32_t category = number("war_category"), kind = number("war_type"), value = number("war_value");
        std::optional<Pieces> cause = Pieces{};
        if (category == 0) {
            auto figure = subject(NativeHistoryObjectKind::Figure, value);
            if (!figure) return std::nullopt;
            if (kind == 0 || kind == 9) cause = apply(kind == 0 ?
                "Native Legends war godlessness {n}" : "Native Legends war family matter {n}", {*figure});
            else if (kind >= 1 && kind <= 4) {
                auto key = history_event_sphere_key(number("war_sphere"));
                if (!key) return std::nullopt;
                const auto sphere = deity_sphere_translations_.find(std::string(*key));
                if (sphere == deity_sphere_translations_.end()) return std::nullopt;
                static constexpr const char *reasons[]{
                    "Native Legends war religious worship {n} {s}",
                    "Native Legends war religious association {n} {s}",
                    "Native Legends war natural worship {n} {s}",
                    "Native Legends war natural association {n} {s}"};
                cause = apply(reasons[kind - 1], {*figure, Pieces{piece(sphere->second, neutral)}});
            } else cause = figure;
        } else if (category == 1) {
            if (kind == 12) cause = term("Native Legends war disturbed eternal rest");
            else if (kind == 11) cause = term("Native Legends war kill living");
            else if (kind == 8 && value == 10) cause = term("Native Legends war cannot communicate");
            else if (kind == 7) {
                const char *topic = value == 3 || value == 8 || value == 21 ? "Native Legends war animal treatment" :
                    value == 4 ? "Native Legends war plant treatment" : value == 7 ? "Native Legends war torture" :
                    value == 10 ? "Native Legends war formal agreement" : value == 11 ? "Native Legends war truthfulness" :
                    value == 17 || value == 18 ? "Native Legends war eating sapients" :
                    value == 19 || value == 20 ? "Native Legends war trophies" : nullptr;
                auto dispute = topic ? term(topic) : std::optional<Pieces>(Pieces{});
                cause = dispute ? apply("Native Legends war dispute {s}", {*dispute}) : std::nullopt;
            }
        } else if (category == 2 && kind == 10) {
            auto artifact = subject(NativeHistoryObjectKind::Artifact, value);
            cause = artifact ? apply("Native Legends war artifact ownership {i}", {*artifact}) : std::nullopt;
        } else if (category == 2 && kind == 6) {
            const int32_t collection_type = number("war_collection_type");
            if (collection_type < 0) cause = term("Native Legends war historical ill feelings");
            else {
                static constexpr const char *labels[]{
                    "Native Legends previous war", "Native Legends previous battle", "Native Legends previous duel",
                    "Native Legends previous conquest", "Native Legends abduction", "Native Legends act of theft",
                    "Native Legends beast attack", "Native Legends journey", "Native Legends previous insurrection",
                    "Native Legends special occasion", "a performance", "a competition", "a procession", "a ceremony",
                    "Native Legends purge", "Native Legends raid", "Native Legends persecution", "Native Legends coup"};
                if (collection_type >= static_cast<int32_t>(std::size(labels))) return std::nullopt;
                cause = term(labels[collection_type]);
                if (cause) {
                    for (const auto &token : document.tokens) {
                        if (token.link_type != 9 || token.link_id != value) continue;
                        for (auto &part : *cause) {
                            part.foreground_rgb = token.color;
                            part.native_link_type = 9;
                            part.native_link_id = value;
                            part.native_link_subid = token.link_subid;
                        }
                        break;
                    }
                }
            }
        } else if (category == 2 && kind == 5) {
            const int32_t occurrence = number("war_event_type");
            const char *reason = "Native Legends war historical ill feelings";
            switch (occurrence) {
            case 0: case 1: case 46: case 47: case 48: case 49: case 50: case 101: case 104: case 110:
                reason = "Native Legends war prior aggression"; break;
            case 6: case 7: reason = "Native Legends war failed first contact"; break;
            case 9: reason = "Native Legends war treaty refusal"; break;
            case 51: reason = "Native Legends war fallen abuse"; break;
            case 13: reason = "Native Legends war lost diplomat"; break;
            case 8: case 10: case 14: case 75: case 77: reason = "Native Legends war treaty disagreement"; break;
            case 15: reason = "Native Legends war trade caravan"; break;
            case 76: {
                static constexpr const char *topics[]{"Native Legends war territory", "Native Legends war water rights",
                    "Native Legends war grazing rights", "Native Legends war fishing rights",
                    "Native Legends war rights of way", "Native Legends war livestock ownership"};
                const int32_t dispute = number("war_dispute");
                auto topic = dispute >= 0 && dispute < static_cast<int32_t>(std::size(topics)) ?
                    term(topics[dispute]) : std::optional<Pieces>(Pieces{});
                cause = topic ? apply("Native Legends war dispute {s}", {*topic}) : std::nullopt;
                reason = nullptr;
                break;
            }
            }
            if (reason) cause = term(reason);
        }
        if (!cause) return std::nullopt;
        auto sentence = apply(count > 1 ? "Native Legends one significant war cause {s}" :
            "Native Legends significant war cause {s}", {*cause});
        if (!sentence) return std::nullopt;
        join(result, *sentence);
        return result;
    }
    if (type == 6) {
        const int32_t count = number("count");
        auto species = text("species") == "beast" || text("species") == "beasts" ?
            term("Native Legends attacking beast") :
            std::optional<Pieces>{};
        if (!species) {
            auto translated = translate_creature_descriptor(text("species"));
            if (translated) species = Pieces{piece(*translated, neutral)};
        }
        if (!species) return std::nullopt;
        return apply(count == 1 ? "Native Legends fearsome beast attacks {s}" :
            "Native Legends beasts attack {d} {s}", count == 1 ? std::vector<Pieces>{*species} :
            std::vector<Pieces>{Pieces{piece(std::to_string(count), neutral)}, *species});
    }
    if (type >= 9 && type <= 13) {
        auto result = history_date(event.year, event.seconds);
        if (!result) return std::nullopt;
        std::optional<Pieces> action;
        if (type == 9) {
            const int32_t kind = number("occasion_type"), value = number("occasion_value");
            if (kind == 1) action = term("Native Legends fair occurred");
            else if (kind == 0) {
                if (value == -1) action = term("Native Legends commemorative festival");
                else {
                    auto content = story(value);
                    if (!content) return std::nullopt;
                    action = apply("Native Legends commemorative festival {e}", {*content});
                }
            } else if (kind == 2) {
                auto deity = subject(NativeHistoryObjectKind::Figure, value);
                if (!deity) return std::nullopt;
                action = apply("Native Legends holy period dedicated to {n}", {*deity});
                if (!action) return std::nullopt;
                if (number("sphere") != -1) {
                    auto key = history_event_sphere_key(static_cast<int16_t>(number("sphere")));
                    if (!key) return std::nullopt;
                    const auto translated = deity_sphere_translations_.find(std::string(*key));
                    if (translated == deity_sphere_translations_.end()) return std::nullopt;
                    auto aspect = apply("Native Legends centered on divine aspect {s}",
                        {Pieces{piece(translated->second, neutral)}});
                    if (!aspect) return std::nullopt;
                    join(*action, *aspect);
                }
            } else return std::nullopt;
        } else {
            const int32_t kind = number("schedule_type"), value = number("schedule_value");
            std::string key = type == 10 ? "held a performance" : type == 11 ?
                "there was a competition" : type == 12 ? "held a procession" : "held a ceremony";
            std::vector<Pieces> fields;
            if ((type == 10 && kind >= 0 && kind <= 2) || (type == 11 && kind >= 4 && kind <= 6)) {
                const int32_t form = type == 10 ? kind : kind - 4;
                auto work = schedule_form(form == 0 ? NativeHistoryObjectKind::Dance :
                    form == 1 ? NativeHistoryObjectKind::Music : NativeHistoryObjectKind::Poem, value);
                if (!work) return std::nullopt;
                if (!work->empty()) {
                    key = type == 11 ? "held a competition involving {b}" : form == 2 ?
                        "held a recital of {b}" : "held a performance of {b}";
                    fields = {*work};
                } else {
                    key = type == 11 ? form == 0 ? "held a dance competition" : form == 1 ?
                        "held a music competition" : "held a poetry competition" : form == 0 ?
                        "held a dance" : form == 1 ? "held a concert" : "held a poetry recital";
                    // This branch retains the native dance producer's explicit
                    // performance phrase when its non-sentinel form vanished.
                    if (type == 10 && form == 0 && value != -1) {
                        auto dance = term("a dance");
                        if (!dance) return std::nullopt;
                        key = "held a performance of {b}";
                        fields = {*dance};
                    }
                }
            } else if (type == 10 && kind == 3) {
                key = "held a story recital";
                if (value != -1) {
                    auto content = story(value);
                    if (!content) return std::nullopt;
                    key = "Native history held story {e}";
                    fields = {*content};
                }
            } else if (type == 11) {
                if (kind == 7) key = "held a foot race";
                else if (kind == 8) key = "held a flying race";
                else if (kind == 9) {
                    auto species = schedule_raw_term("race_species");
                    if (!species) return std::nullopt;
                    key = "held a {s} race";
                    fields = {*species};
                } else if (kind == 10) key = "held a wrestling competition";
                else if (kind == 11) {
                    auto implement = item("prize");
                    if (!implement) return std::nullopt;
                    key = "held a {i} throwing competition";
                    fields = {*implement};
                } else if (kind == 12) key = "held a gladiatory competition";
            }
            action = apply(key, fields);
        }
        if (!action) return std::nullopt;
        join(*result, *action);
        result->push_back(piece("。", neutral));
        if (type == 12 && number("route_present")) {
            const int32_t first = number("schedule_value"), last = number("schedule_extra"), site = number("site");
            const auto route_name = [&](int32_t id) -> std::optional<Pieces> {
                for (const auto &entry : event.subjects) {
                    if (entry.kind != NativeHistoryObjectKind::Building || entry.id != site || entry.subid != id) continue;
                    if (!entry.name.has_name) return Pieces{piece("", neutral)};
                    return subject(NativeHistoryObjectKind::Building, site, false, id);
                }
                return std::nullopt;
            };
            std::optional<Pieces> start, end;
            if (first != -1) start = route_name(first);
            if (last != -1) end = route_name(last);
            if ((first != -1 && !start) || (last != -1 && !end)) return std::nullopt;
            std::optional<Pieces> route;
            if (start && end) route = apply(first == last ?
                "It started at {p} and returned there after following its route" :
                "It started at {p} and ended at {p}", first == last ?
                std::vector<Pieces>{*start} : std::vector<Pieces>{*start, *end});
            else if (start) route = apply("It started at {p}", {*start});
            else if (end) route = apply("It ended at {p}", {*end});
            if ((start || end) && !route) return std::nullopt;
            if (route) { join(*result, *route); result->push_back(piece("。", neutral)); }
        }
        if (type != 9 && !numbers("features").empty()) {
            auto features = schedule_features();
            auto introduction = apply("The event featured", {});
            if (!features || !introduction) return std::nullopt;
            join(*result, *introduction);
            join(*result, *features);
            result->push_back(piece("。", neutral));
        }
        return result;
    }
    if (type == 1) {
        Pieces result;
        for (size_t side = 0; side < 2; ++side) {
            const std::string key = side ? "defender." : "attacker.";
            const int32_t total = number(key + "total");
            if (side && total <= 0) continue;
            Pieces forces;
            const int32_t groups = number(key + "groups");
            for (int32_t index = 0; index < groups; ++index) {
                const std::string item = key + std::to_string(index) + ".";
                auto species = translate_creature_descriptor(text(item + "species"));
                if (!species) return std::nullopt;
                auto force = apply(number(item + "animated") ?
                    "Native Legends animated force {d} {s}" : "Native Legends force {d} {s}",
                    {Pieces{piece(std::to_string(number(item + "count")), neutral)}, Pieces{piece(*species, neutral)}});
                if (!force) return std::nullopt;
                if (!forces.empty()) forces.push_back(piece("、", neutral));
                join(forces, *force);
            }
            const int32_t unknown = number(key + "unknown");
            if (unknown > 0) {
                auto force = apply("Native Legends unknown force {d}",
                    {Pieces{piece(std::to_string(unknown), neutral)}});
                if (!force) return std::nullopt;
                if (!forces.empty()) forces.push_back(piece("、", neutral));
                join(forces, *force);
            }
            const int32_t lost = number(key + "losses");
            auto losses = lost == total ? term("Native Legends all forces lost") :
                lost == 0 ? term("Native Legends no forces lost") :
                apply("Native Legends forces lost {d}", {Pieces{piece(std::to_string(lost), neutral)}});
            if (!losses) return std::nullopt;
            auto sentence = apply(side ? "Native Legends defender forces {s}: {s}" :
                "Native Legends attacker forces {s}: {s}", {forces, *losses});
            if (!sentence) return std::nullopt;
            join(result, *sentence);
        }
        const int32_t outcome = number("outcome");
        if (outcome == 0 || outcome == 1) {
            auto victory = term(outcome == 1 ? "Native Legends defender victorious" :
                number("defender.total") == 0 ? "Native Legends attacker uncontested" :
                "Native Legends attacker victorious");
            if (!victory) return std::nullopt;
            join(result, *victory);
        }
        return result;
    }
    return std::nullopt;
}
