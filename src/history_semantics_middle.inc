// Direct semantic composition for native event types 45..88.
case 75: { // agreement_formed
    const auto when = date_phrase(event.year, event.seconds);
    const auto body = agreement_formation();
    const auto support = diplomacy();
    if (!when || !body || !support) return std::nullopt;
    std::string key = context_number("flags") & 1 ?
        "Subject revealed that in {s}, {s}." : "In {s}, {s}.";
    std::vector<Pieces> values{*when, *body};
    if (!support->empty()) {
        key += " {s}";
        values.push_back(*support);
    }
    auto paragraph = scoped_apply("historical-event-paragraph", key, values);
    if (!paragraph) return std::nullopt;
    result = std::move(*paragraph);
    translated = true;
    break;
}
case 45: // change_hf_job
case 46: // war_field_battle
case 48: // war_site_new_leader
case 51: // body_abused
case 52: // hist_figure_abducted
case 53: // item_stolen
case 54: // hf_razed_building
case 55: // creature_devoured
case 56: // hist_figure_wounded
case 57: // hist_figure_simple_battle_event
case 58: // created_world_construction
case 59: // hist_figure_reunion
case 60: // hist_figure_reach_summit
case 61: // hist_figure_travel
case 62: // hist_figure_new_pet
case 63: // assume_identity
case 65: // change_creature_type
case 66: // hist_figure_revived
case 67: // hf_learns_secret
case 68: // change_hf_body_state
case 69: // hf_act_on_building
case 70: // hf_does_interaction
case 71: // hf_confronted
case 74: // artifact_stored
case 77: // agreement_concluded
case 85: // knowledge_discovered
case 86: // artifact_transformed
case 88: { // hf_relationship_denied
    const auto clause = [&](const std::optional<Pieces> &parts) {
        if (!parts) return false;
        append_clause(result, *parts);
        return true;
    };
    const auto figures = [&](const std::vector<int32_t> &ids, bool contextual)
            -> std::optional<Pieces> {
        if (ids.empty()) return std::nullopt;
        if (contextual) {
            const int32_t focus = context_number("histfig_id");
            if (focus >= 0 && std::find(ids.begin(), ids.end(), focus) != ids.end()) {
                const auto person = subject(NativeHistoryObjectKind::Figure, focus);
                if (!person) return std::nullopt;
                if (ids.size() > 2) return apply("{a} and others", {*person});
                if (ids.size() == 1) return person;
                const auto other = subject(NativeHistoryObjectKind::Figure,
                    ids.front() == focus ? ids.back() : ids.front());
                return other ? apply("{a} and {a}", {*person, *other}) : std::nullopt;
            }
        }
        auto people = subject(NativeHistoryObjectKind::Figure, ids.front());
        if (!people) return std::nullopt;
        for (size_t index = 1; index < ids.size(); ++index) {
            const auto person = subject(NativeHistoryObjectKind::Figure, ids[index]);
            if (!person) return std::nullopt;
            people = apply(index + 1 == ids.size() ? "{a} and {a}" : "{a}, {a}",
                {*people, *person});
            if (!people) return std::nullopt;
        }
        return people;
    };
    const auto region = [&]() -> std::optional<Pieces> {
        if (number("layer") >= 0)
            return subject(NativeHistoryObjectKind::Underground, number("layer"));
        return subject(NativeHistoryObjectKind::Region, number("region"));
    };
    const auto place = [&]() -> std::optional<Pieces> {
        // Some formatters print both the site and its region/layer. Preserve
        // each native reference; the location relation uses the shared table.
        std::optional<Pieces> location;
        if (number("site") >= 0) {
            location = subject(NativeHistoryObjectKind::Site, number("site"));
            if (!location) return std::nullopt;
        }
        if (number("region") >= 0 || number("layer") >= 0) {
            const auto area = region();
            if (!area) return std::nullopt;
            location = location ? apply("{p} of {p}", {*location, *area}) : area;
        }
        return location;
    };
    const auto sentence = [&](const std::optional<Pieces> &text) {
        if (!text) return false;
        const auto stop = apply(".", {});
        if (!stop) return false;
        join(result, *stop);
        join(result, *text);
        return true;
    };
    const auto creature = [&](std::string_view key) -> std::optional<Pieces> {
        const auto label = translate_creature_descriptor(std::string(key));
        return label ? std::optional<Pieces>{Pieces{piece(*label, neutral)}} : std::nullopt;
    };
    switch (event.native_type) {
    case 77: {
        const auto person = subject(NativeHistoryObjectKind::Figure, number("concluder"));
        auto title = agreement_title();
        if (!person || !title) return std::nullopt;
        if (number("agreement_present")) {
            // b82450 chooses the first party that does not contain concluder.
            for (int32_t id : numbers("agreement_parties")) {
                const auto &figures = numbers("agreement.party." + std::to_string(id) + ".figures");
                if (std::find(figures.begin(), figures.end(), number("concluder")) != figures.end()) continue;
                const auto other = agreement_party(id);
                if (!other) return std::nullopt;
                title = apply("{s} with {a}", {*title, *other});
                if (!title) return std::nullopt;
                break;
            }
        }
        const auto body = apply("{a} concluded {s}", {*person, *title});
        if (!body) return std::nullopt;
        join(result, *body);
        // Missing agreement exits before the native conclusion-reason switch.
        if (number("agreement_present")) {
            const char *reason = nullptr;
            switch (number("conclusion_reason")) {
            case 13: reason = "on a whim"; break;
            case 30: case 31: reason = "because the group travelled too slowly"; break;
            case 32: case 35: reason = "because the group went too far away"; break;
            case 33: case 40: reason = "after arriving at the destination"; break;
            case 34: reason = "because of a leadership change at the site"; break;
            case 36: reason = "after a joyous reunion"; break;
            case 37: reason = "after a violent disagreement"; break;
            case 38: reason = "after an adoption"; break;
            case 52: reason = "due to a lack of performances"; break;
            default: break; // Native jump table emits no reason clause.
            }
            if (reason && !clause(apply(reason, {}))) return std::nullopt;
        }
        break;
    }
    case 85: {
#include "history_knowledge_keys.inc"
        const int32_t category = number("knowledge_category");
        const uint32_t flag = static_cast<uint32_t>(number("knowledge_flag"));
        const char *key = nullptr;
        for (const auto &candidate : history_knowledge_keys)
            if (candidate.category == category && candidate.flag == flag) {
                key = candidate.key;
                break;
            }
        if (!key) return std::nullopt;
        const auto person = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        const auto discovery = term(key);
        if (!person || !discovery) return std::nullopt;
        const auto body = apply(number("discovery_flags") & 1 ?
            "{a} was the very first to discover {s}" : "{a} independently discovered {s}",
            {*person, *discovery});
        if (!body) return std::nullopt;
        join(result, *body);
        break;
    }
    case 63: {
        const auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        if (!actor) return std::nullopt;
        const auto disguise = identity(number("identity"), "identity");
        if (!disguise) return std::nullopt;
        std::optional<Pieces> body;
        if (number("target_entity") >= 0) {
            const auto target = subject(NativeHistoryObjectKind::Entity, number("target_entity"));
            if (!target) return std::nullopt;
            // Repeating the typed actor is gender-neutral and retains the
            // antecedent of the native he/she/it branch without English parsing.
            body = apply("{a} fooled {a} into believing {n} was {n}",
                {*actor, *target, *actor, *disguise});
        } else body = apply("{a} assumed the identity {n}", {*actor, *disguise});
        if (!body) return std::nullopt;
        join(result, *body);
        break;
    }
    case 66: {
        const auto person = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        if (!person) return std::nullopt;
        const int32_t flags = number("revival_flags"), ghost = number("ghost");
        const bool has_actor = number("actor") >= 0, once_more = (flags & 1) != 0;
        static constexpr const char *ghosts[] = {
            "a murderous ghost", "a sadistic ghost", "a secretive poltergeist",
            "an energetic poltergeist", "an angry ghost", "a violent ghost",
            "a moaning spirit", "a howling spirit", "a troublesome poltergeist",
            "a restless haunt", "a forlorn haunt",
        }; // Native jump table b70840, not presentation order in the glossary.
        std::optional<Pieces> form;
        if (ghost >= 0) {
            if (static_cast<size_t>(ghost) >= std::size(ghosts)) return std::nullopt;
            form = term(ghosts[ghost]);
            if (!form) return std::nullopt;
        } else if (!text("revival_form").empty()) {
            form = creature(text("revival_form"));
            if (!form) form = term(text("revival_form"));
            if (!form) return std::nullopt;
        }
        std::string key = has_actor ? (flags & 2 ? "{a} was disturbed from eternal rest" :
            "{a} was brought back from the dead") : "{a} came back from the dead";
        std::vector<Pieces> values{*person};
        if (form && !once_more) {
            key += " as {s}";
            values.push_back(*form);
        } else if (has_actor) {
            const auto actor = subject(NativeHistoryObjectKind::Figure, number("actor"));
            if (!actor) return std::nullopt;
            key += " by {n}";
            values.push_back(*actor);
        }
        const auto body = apply(key, values);
        if (!body) return std::nullopt;
        join(result, *body);
        if (once_more) {
            if (!clause(form ? apply("once more, this time as {s}", {*form}) :
                apply("once more", {}))) return std::nullopt;
        } else if (form && has_actor) {
            const auto actor = subject(NativeHistoryObjectKind::Figure, number("actor"));
            if (!actor || !clause(apply("by {a}", {*actor}))) return std::nullopt;
        }
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            const auto location = number("site") >= 0 ?
                subject(NativeHistoryObjectKind::Site, number("site")) : region();
            if (!location || !clause(apply("in {p}", {*location}))) return std::nullopt;
        }
        break;
    }
    case 51: {
        const auto people = figures(numbers("bodies"), true);
        if (!people) return std::nullopt;
        const bool plural = numbers("bodies").size() > 1;
        std::string key = plural ? "the bodies of {a} were " : "the body of {a} was ";
        std::vector<Pieces> values{*people};
        const int32_t type = number("abuse_type");
        bool generic = false;
        if (type == 0) {
            const auto spikes = item("item");
            if (!spikes) return std::nullopt;
            key += "impaled on {i}";
            values.push_back(*spikes);
        } else if (type == 2) {
            const auto building = structure(number("site"), number("abuse_data"));
            if (!building) return std::nullopt;
            key += "flayed and the skin stretched over {p}";
            values.push_back(*building);
        } else if (type == 3) {
            const auto raw_tree = exact_literal_translation(text("tree"));
            const auto rope = item("item");
            if (!raw_tree || !rope) return std::nullopt;
            key += "hung from a {s} on {i}";
            values.push_back(Pieces{piece(*raw_tree, neutral)});
            values.push_back(*rope);
        } else {
            const char *description = nullptr;
            if (type == 1) description = number("abuse_data") == 0 ? "added to a grisly mound" :
                number("abuse_data") == 1 ? "added to a grotesque pillar" : "added to a gruesome sculpture";
            else if (type == 4) description = "horribly mutilated";
            else if (type == 5) description = "animated";
            if (!description) return std::nullopt;
            const auto action = term(description);
            if (!action) return std::nullopt;
            key += "{s}";
            values.push_back(*action);
            generic = true;
        }
        if (number("histfig") >= 0 || number("civ") >= 0) {
            const auto actor = number("histfig") >= 0 ?
                subject(NativeHistoryObjectKind::Figure, number("histfig")) :
                subject(NativeHistoryObjectKind::Entity, number("civ"));
            if (!actor) return std::nullopt;
            if (generic && !plural) key = "the body of {n} was {s}";
            key += " by {a}";
            values.push_back(*actor);
        }
        const auto body = apply(key, values);
        if (!body) return std::nullopt;
        join(result, *body);
        if (number("histfig") >= 0 && number("civ") >= 0) {
            const auto civ = subject(NativeHistoryObjectKind::Entity, number("civ"));
            if (!civ || !clause(apply("on behalf of {a}", {*civ}))) return std::nullopt;
        }
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            const auto location = place();
            if (!location || !clause(apply("in {p}", {*location}))) return std::nullopt;
        }
        break;
    }
    case 53: {
        const auto stolen = number("artifact") >= 0 ?
            subject(NativeHistoryObjectKind::Artifact, number("artifact")) : item("item");
        const auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        if (!stolen || !actor) return std::nullopt;
        const int32_t method = number("theft_method");
        std::string key = method == 1 ? "{p} was confiscated" : method == 2 ?
            "{p} was looted" : method == 3 ? "{p} was recovered" : "{p} was stolen";
        std::vector<Pieces> values{*stolen};
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            auto location = number("site") >= 0 ?
                subject(NativeHistoryObjectKind::Site, number("site")) : region();
            if (!location) return std::nullopt;
            if (number("site") >= 0 && number("structure") >= 0) {
                const auto building = structure(number("site"), number("structure"));
                if (!building) return std::nullopt;
                location = apply("{p} of {p}", {*building, *location});
                if (!location) return std::nullopt;
            }
            key += " from {p}";
            values.push_back(*location);
        }
        key += " by {a}";
        values.push_back(*actor);
        const auto body = apply(key, values);
        if (!body) return std::nullopt;
        const auto context = event_clauses();
        if (!context) return std::nullopt;
        // The native collection circumstance is a time phrase. Put it
        // before the action in Chinese, using its captured title and count,
        // while retaining the independently captured reason and destination.
        if (event.circumstance == 233 && !context->second.empty()) {
            join(result, context->second);
            append_clause(result, *body);
        } else {
            join(result, *body);
            append_clause(result, context->second);
        }
        append_clause(result, context->first);
        // The d8 title at b8b3c0 ends with the date after shared clauses;
        // only the full sentence at b8b361 emits the stash destination.
        if (!native_title && number("stash_site") >= 0) {
            const auto stash = subject(NativeHistoryObjectKind::Site, number("stash_site"));
            if (!stash || !clause(apply("and brought to {p}", {*stash}))) return std::nullopt;
        }
        break;
    }
    case 56: {
        const int32_t injury = number("injury");
        if (injury < 0 || injury > 4) return std::nullopt;
        static constexpr const char *intact[] = {"smashed", "slashed", "stabbed", "ripped", "burned"};
        static constexpr const char *external[] = {"broken away", "slashed off", "ripped off", "torn off", "burned away"};
        static constexpr const char *internal[] = {"broken away", "slashed out", "stabbed out", "torn out", "burned out"};
        const char *caption = number("part_lost") ?
            (number("internal") ? internal[injury] : external[injury]) : intact[injury];
        const auto woundee = subject(NativeHistoryObjectKind::Figure, number("woundee"));
        const auto anatomy = translate_legends_anatomy(text("body_part"));
        const auto action = term(caption);
        if (!woundee || !anatomy || !action) return std::nullopt;
        std::string key = "{n}'s {t} was {s}";
        std::vector<Pieces> values{*woundee, Pieces{piece(*anatomy, neutral)}, *action};
        if (number("wounder") >= 0) {
            const auto attacker = subject(NativeHistoryObjectKind::Figure, number("wounder"));
            if (!attacker) return std::nullopt;
            key += " by {a}";
            values.push_back(*attacker);
            if (number("injury_flags") & 1) key += " as a means of torture";
        }
        const auto body = apply(key, values);
        if (!body) return std::nullopt;
        join(result, *body);
        break;
    }
    case 45: {
        const auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        if (!actor) return std::nullopt;
        const int32_t new_job = number("new_job"), old_job = number("old_job");
        std::string predicate;
        std::vector<Pieces> fields{*actor};
        const auto profession = [&](std::string_view key) -> std::optional<Pieces> {
            if (const auto value = term(key)) return value;
            const auto value = exact_literal_translation(std::string(key));
            return value ? std::optional<Pieces>{Pieces{piece(*value, neutral)}} : std::nullopt;
        };
        switch (new_job) {
        case 101: predicate = "decided to become a thief, operating"; break;
        case 106: predicate = "began wandering"; break;
        case 107: {
            predicate = "became a {s}";
            const auto scout = profession("Scout");
            if (!scout) return std::nullopt;
            fields.push_back(*scout);
            break;
        }
        case 108: predicate = "began hunting great beasts"; break;
        case 109: predicate = "decided to become a baby-snatcher, operating"; break;
        case 110: predicate = "decided to become a mercenary, operating"; break;
        default: {
            if (new_job < 0 || new_job > 134 || old_job < 0 || old_job > 134)
                return std::nullopt;
            if (new_job == 102 && old_job != 102) {
                const auto previous = profession(text("old_job"));
                if (!previous) return std::nullopt;
                predicate = "stopped being a {s}";
                fields.push_back(*previous);
            } else if (old_job != 102) {
                const auto previous = profession(text("old_job"));
                const auto current = profession(text("new_job"));
                if (!previous || !current) return std::nullopt;
                predicate = "gave up being a {s} to become a {s}";
                fields.push_back(*previous);
                fields.push_back(*current);
            } else {
                const auto current = profession(text("new_job"));
                if (!current) return std::nullopt;
                predicate = "became a {s}";
                fields.push_back(*current);
            }
            break;
        }
        }
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            const auto location = place();
            if (!location) return std::nullopt;
            if (number("site") >= 0 && (new_job == 101 || new_job == 109 || new_job == 110))
                predicate += " out of {p}";
            else if (number("site") >= 0 && new_job == 106) predicate += " around {p}";
            else predicate += " in {p}";
            fields.push_back(*location);
        } else predicate += new_job == 106 ? " the wilds" : " in the wilds";
        const auto career = apply("{a} " + predicate, fields);
        if (!career) return std::nullopt;
        join(result, *career);
        break;
    }
    case 46: {
        const auto attacker = subject(NativeHistoryObjectKind::Entity, number("attacker_civ"));
        const auto defender = subject(NativeHistoryObjectKind::Entity, number("defender_civ"));
        const auto location = region();
        if (!attacker || !defender || !location) return std::nullopt;
        const auto attack = apply("{a} attacked {a} in {p}", {*attacker, *defender, *location});
        if (!attack) return std::nullopt;
        join(result, *attack);
        const bool leading_attack = number("attacker_general") >= 0;
        const bool leading_defense = number("defender_general") >= 0;
        if (leading_attack || leading_defense) {
            std::vector<Pieces> leaders;
            for (const auto key : {"attacker_general", "defender_general"}) {
                if (number(key) < 0) continue;
                const auto person = subject(NativeHistoryObjectKind::Figure, number(key));
                if (!person) return std::nullopt;
                leaders.push_back(*person);
            }
            const std::string_view key = leading_attack
                ? (leading_defense ? "{a} led the attack, and the defenders were led by {a}"
                                   : "{a} led the attack")
                : "The defenders were led by {a}";
            if (!sentence(apply(key, leaders))) return std::nullopt;
        }
        if (number("attacker_merc") >= 0) {
            const auto mercenary = subject(NativeHistoryObjectKind::Entity, number("attacker_merc"));
            if (!mercenary || !sentence(apply((number("merc_roles") & 1)
                    ? "{a} were hired as scouts by the attackers"
                    : "{a} were hired by the attackers", {*mercenary}))) return std::nullopt;
        }
        if (number("defender_merc") >= 0) {
            const auto mercenary = subject(NativeHistoryObjectKind::Entity, number("defender_merc"));
            if (!mercenary || !sentence(apply((number("merc_roles") & 2)
                    ? "The defenders hired {a} as scouts"
                    : "The defenders hired {a}", {*mercenary}))) return std::nullopt;
        }
        break;
    }
    case 48: {
        const auto attacker = subject(NativeHistoryObjectKind::Entity, number("attacker_civ"));
        auto defender = subject(NativeHistoryObjectKind::Entity, number("site_civ"));
        const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!attacker || !defender || !site) return std::nullopt;
        if (number("site_civ") != number("defender_civ")) {
            const auto civilization = subject(NativeHistoryObjectKind::Entity, number("defender_civ"));
            if (!civilization) return std::nullopt;
            defender = apply("{a} of {a}", {*defender, *civilization});
            if (!defender) return std::nullopt;
        }
        const auto &ids = numbers("new_leaders");
        const auto victory = ids.empty()
            ? apply("{a} defeated {a} at {p}", {*attacker, *defender, *site})
            : apply("{a} defeated {a}", {*attacker, *defender});
        if (!victory) return std::nullopt;
        join(result, *victory);
        if (!ids.empty()) {
            const auto leaders = figures(ids, true);
            if (!leaders) return std::nullopt;
            const auto appointment = apply("and placed {a} in charge of {p}", {*leaders, *site});
            if (!appointment) return std::nullopt;
            join(result, *appointment);
        }
        if (number("new_site_civ") >= 0) {
            const auto government = subject(NativeHistoryObjectKind::Entity, number("new_site_civ"));
            if (!government || !sentence(apply("The new government was called {p}", {*government})))
                return std::nullopt;
        }
        break;
    }
    case 52: {
        const auto target = subject(NativeHistoryObjectKind::Figure, number("target"));
        const auto snatcher = subject(NativeHistoryObjectKind::Figure, number("snatcher"));
        if (!target || !snatcher) return std::nullopt;
        const bool active = context_number("histfig_id") == number("snatcher");
        std::optional<Pieces> action;
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            const auto location = place();
            if (!location) return std::nullopt;
            action = active ? apply("{a} abducted {a} from {p}", {*snatcher, *target, *location})
                : apply("{a} was abducted from {p} by {a}", {*target, *location, *snatcher});
        } else action = active ? apply("{a} abducted {a}", {*snatcher, *target})
            : apply("{a} was abducted by {a}", {*target, *snatcher});
        if (!action) return std::nullopt;
        join(result, *action);
        break;
    }
    case 54:
    case 69: {
        const auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        const auto building = structure(number("site"), number("structure"));
        if (!actor || !site || !building) return std::nullopt;
        std::string_view verb = "razed";
        if (event.native_type == 69) {
            switch (number("building_action")) {
            case 0: verb = "profaned"; break;
            case 1: verb = "disturbed"; break;
            case 2: verb = "prayed inside"; break;
            default: return std::nullopt;
            }
        }
        const auto action = apply("{a} " + std::string(verb) + " {p} in {p}",
            {*actor, *building, *site});
        if (!action) return std::nullopt;
        join(result, *action);
        break;
    }
    case 55: {
        const auto eater = subject(NativeHistoryObjectKind::Figure, number("eater"));
        if (!eater) return std::nullopt;
        std::optional<Pieces> victim;
        if (number("victim") >= 0) victim = subject(NativeHistoryObjectKind::Figure, number("victim"));
        else {
            victim = creature(text("victim_species"));
            if (!victim) return std::nullopt;
            if (number("victim_entity") >= 0) {
                const auto entity = subject(NativeHistoryObjectKind::Entity, number("victim_entity"));
                if (!entity) return std::nullopt;
                victim = apply("{a} of {a}", {*victim, *entity});
            }
        }
        if (!victim) return std::nullopt;
        std::string key = "{a} devoured {a}";
        std::vector<Pieces> fields{*eater, *victim};
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            const auto location = number("site") >= 0
                ? subject(NativeHistoryObjectKind::Site, number("site")) : region();
            if (!location) return std::nullopt;
            key += " in {p}";
            fields.push_back(*location);
        }
        const auto meal = apply(key, fields);
        if (!meal) return std::nullopt;
        join(result, *meal);
        break;
    }
    case 57: {
        // The native formatter reads only the first participant in each group
        // and does not print the event's site/region coordinates.
        const auto &first_ids = numbers("group_1");
        const auto &second_ids = numbers("group_2");
        if (first_ids.empty() || second_ids.empty()) return std::nullopt;
        const auto first = subject(NativeHistoryObjectKind::Figure, first_ids.front());
        const auto second = subject(NativeHistoryObjectKind::Figure, second_ids.front());
        if (!first || !second) return std::nullopt;
        const int32_t subtype = number("battle_subtype");
        std::optional<Pieces> action;
        if (subtype >= 1 && subtype <= 6) {
            static constexpr const char *verbs[] = {"attacked", "surprised", "ambushed",
                "happened upon", "cornered", "confronted"};
            action = apply("{a} " + std::string(verbs[subtype - 1]) + " {a}", {*first, *second});
        } else if (subtype == 0) action = apply("{a} fought with {a}", {*first, *second});
        else if (subtype == 7)
            action = apply("{a} managed to escape from {n}'s onslaught", {*second, *first});
        else if (subtype == 8)
            action = apply("{a} was forced to retreat from {a}", {*second, *first});
        else if (subtype == 9) {
            const auto prevailing = apply("eventually prevailed and", {});
            const auto escaping = apply("{a} was forced to make a hasty escape", {*second});
            if (!prevailing || !escaping) return std::nullopt;
            action = *first;
            join(*action, *prevailing);
            join(*action, *escaping);
        } else if (subtype == 10)
            action = apply("{a} fought with and subdued {a}", {*first, *second});
        else if (subtype == 11)
            action = apply("{a} got into a brawl with {a}", {*first, *second});
        else return std::nullopt;
        if (!action) return std::nullopt;
        join(result, *action);
        if (subtype == 0) {
            if (!sentence(apply("While defeated, the latter escaped unscathed", {})))
                return std::nullopt;
        } else if (subtype == 8) {
            const auto wounds = apply("despite the latter's wounds", {});
            if (!wounds) return std::nullopt;
            append_clause(result, *wounds);
        }
        break;
    }
    case 58: {
        auto entity = subject(NativeHistoryObjectKind::Entity,
            number("site_civ") >= 0 ? number("site_civ") : number("civ"));
        const auto completed = construction(number("construction"));
        if (!entity || !completed) return std::nullopt;
        if (number("site_civ") >= 0 && number("civ") >= 0) {
            const auto civilization = subject(NativeHistoryObjectKind::Entity, number("civ"));
            if (!civilization) return std::nullopt;
            entity = apply("{a} of {a}", {*entity, *civilization});
            if (!entity) return std::nullopt;
        }
        const auto building = apply("{a} finished the construction of {p}", {*entity, *completed});
        if (!building) return std::nullopt;
        join(result, *building);
        if (number("master_construction") >= 0) {
            const auto master = construction(number("master_construction"));
            if (!master) return std::nullopt;
            const auto part = apply("as a part of {p}", {*master});
            if (!part) return std::nullopt;
            append_clause(result, *part);
        }
        if (number("site_1") >= 0) {
            const auto first = subject(NativeHistoryObjectKind::Site, number("site_1"));
            if (!first) return std::nullopt;
            std::optional<Pieces> location;
            if (number("site_2") >= 0) {
                const auto second = subject(NativeHistoryObjectKind::Site, number("site_2"));
                if (!second) return std::nullopt;
                location = apply("connecting {p} and {p}", {*first, *second});
            } else location = apply("in {p}", {*first});
            if (!location) return std::nullopt;
            append_clause(result, *location);
        }
        break;
    }
    case 59: {
        const auto &missing = numbers("missing");
        const auto first = figures(missing, false);
        const auto second = figures(numbers("reunited_with"), false);
        if (!first || !second) return std::nullopt;
        std::string key = missing.size() == 1 ? "{a} was reunited with {a}" : "{a} were reunited with {a}";
        std::vector<Pieces> fields{*first, *second};
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            const auto location = place();
            if (!location) return std::nullopt;
            key += " in {p}";
            fields.push_back(*location);
        }
        const auto reunion = apply(key, fields);
        if (!reunion) return std::nullopt;
        join(result, *reunion);
        if (number("assistant") >= 0) {
            const auto assistant = subject(NativeHistoryObjectKind::Figure, number("assistant"));
            if (!assistant) return std::nullopt;
            const auto help = apply("through the efforts of {n}", {*assistant});
            if (!help) return std::nullopt;
            append_clause(result, *help);
        }
        break;
    }
    case 60: {
        const auto &ids = numbers("group");
        const auto group = figures(ids, true);
        const auto summit = peak(number("peak_x"), number("peak_y"));
        if (!group || !summit) return std::nullopt;
        const auto first = apply(ids.size() == 1 ? "{a} was the first to reach the summit of {p}"
            : "{a} were the first to reach the summit of {p}", {*group, *summit});
        if (!first) return std::nullopt;
        join(result, *first);
        if (number("region") >= 0 || number("layer") >= 0) {
            const auto area = region();
            if (!area) return std::nullopt;
            const auto location = apply(", which rises above {p}", {*area});
            if (!location) return std::nullopt;
            join(result, *location);
        }
        break;
    }
    case 61: {
        const auto group = figures(numbers("group"), true);
        const auto destination = number("site") >= 0
            ? subject(NativeHistoryObjectKind::Site, number("site"))
            : (number("layer") >= 0 || number("region") >= 0 ? region() : apply("unknown lands", {}));
        if (!group || !destination) return std::nullopt;
        const uint32_t flags = static_cast<uint32_t>(number("travel_flags"));
        const std::string_view key = flags & 2 ? "{a} escaped from {p}"
            : flags & 1 ? "{a} returned to {p}" : "{a} made a journey to {p}";
        const auto travel = apply(key, {*group, *destination});
        if (!travel) return std::nullopt;
        join(result, *travel);
        break;
    }
    case 62: {
        const auto group = figures(numbers("group"), true);
        const auto &pets = numbers("pets");
        if (!group || pets.empty()) return std::nullopt;
        std::optional<Pieces> animals;
        if (pets.size() > 2) animals = term("wild beasts");
        else {
            animals = creature(text("pet_species_0"));
            if (!animals) return std::nullopt;
            if (pets.size() == 2) {
                const auto second = creature(text("pet_species_1"));
                if (!second) return std::nullopt;
                animals = apply("{a} and {a}", {*animals, *second});
            }
        }
        const auto location = number("site") >= 0
            ? subject(NativeHistoryObjectKind::Site, number("site"))
            : (number("region") >= 0 || number("layer") >= 0 ? region() : term("unknown lands"));
        if (!animals || !location) return std::nullopt;
        const auto population = apply("{a} of {a}", {*animals, *location});
        if (!population) return std::nullopt;
        const auto taming = apply("{a} tamed the {s}", {*group, *population});
        if (!taming) return std::nullopt;
        join(result, *taming);
        break;
    }
    case 65: {
        const auto changee = subject(NativeHistoryObjectKind::Figure, number("changee"));
        const auto old_species = creature(text("old_species"));
        const auto new_species = creature(text("new_species"));
        if (!changee || !old_species || !new_species) return std::nullopt;
        std::optional<Pieces> change;
        if (number("changer_present")) {
            const auto changer = subject(NativeHistoryObjectKind::Figure, number("changer"));
            if (!changer) return std::nullopt;
            change = apply("{a} changed {a} from a {s} into a {s}",
                {*changer, *changee, *old_species, *new_species});
        } else change = apply("{a} changed from a {s} into a {s}",
            {*changee, *old_species, *new_species});
        if (!change) return std::nullopt;
        join(result, *change);
        break;
    }
    case 67: {
        const auto student = subject(NativeHistoryObjectKind::Figure, number("student"));
        const auto secret = term(text("secret"));
        if (!student || !secret) return std::nullopt;
        std::string key;
        std::vector<Pieces> fields;
        if (number("teacher_present")) {
            const auto teacher = subject(NativeHistoryObjectKind::Figure, number("teacher"));
            if (!teacher) return std::nullopt;
            key = "{a} taught {a} {s}";
            fields = {*teacher, *student, *secret};
        } else {
            key = "{a} learned {s}";
            fields = {*student, *secret};
        }
        if (number("artifact") >= 0) {
            const auto artifact = subject(NativeHistoryObjectKind::Artifact, number("artifact"));
            if (!artifact) return std::nullopt;
            key += " from {i}";
            fields.push_back(*artifact);
        }
        const auto learning = apply(key, fields);
        if (!learning) return std::nullopt;
        join(result, *learning);
        break;
    }
    case 68: {
        const int32_t state = number("body_state");
        if (state < 0 || state > 6) return std::nullopt;
        static constexpr const char *actions[] = {"arose from", "was buried in",
            "was discarded in", "was discarded in", "was discarded in",
            "was entombed in", "was discarded in"};
        const auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        auto location = number("site") >= 0 || number("region") >= 0 || number("layer") >= 0
            ? place() : term("the wilds");
        if (!actor || !location) return std::nullopt;
        if (number("site") >= 0 && number("structure") >= 0) {
            const auto building = structure(number("site"), number("structure"));
            if (!building) return std::nullopt;
            location = apply("{p} of {p}", {*building, *location});
            if (!location) return std::nullopt;
        }
        const auto change = apply("{a} " + std::string(actions[state]) + " {p}", {*actor, *location});
        if (!change) return std::nullopt;
        join(result, *change);
        break;
    }
    case 70: {
        const auto target = subject(NativeHistoryObjectKind::Figure, number("target"));
        const auto actor = number("doer_present")
            ? subject(NativeHistoryObjectKind::Figure, number("doer")) : apply("somebody", {});
        if (!actor || !target) return std::nullopt;
        // These RAW fields are the authored semantic template. The capture
        // adapter binds only the two reviewed procedural animal placeholders.
        std::string key = text("interaction_key").empty() ?
            trim("{a}" + text("interaction_before") + "{a}" + text("interaction_after")) :
            text("interaction_key");
        std::vector<Pieces> fields{*actor, *target};
        if (!text("interaction_key").empty()) {
            const auto form = creature(text("interaction_form"));
            if (!form) return std::nullopt;
            fields.push_back(*form);
        }
        if (number("site") >= 0 || number("region") >= 0 || number("layer") >= 0) {
            const auto location = number("site") >= 0
                ? subject(NativeHistoryObjectKind::Site, number("site")) : region();
            if (!location) return std::nullopt;
            key += " in {p}";
            fields.push_back(*location);
        }
        const auto interaction = apply(key, fields);
        if (!interaction) return std::nullopt;
        join(result, *interaction);
        break;
    }
    case 71: {
        if (number("situation") != 0) return std::nullopt;
        const auto target = subject(NativeHistoryObjectKind::Figure, number("target"));
        const auto location = number("site") >= 0 || number("region") >= 0 || number("layer") >= 0
            ? place() : apply("the wilds", {});
        if (!target || !location) return std::nullopt;
        const auto suspicion = apply("{a} aroused general suspicion in {p}", {*target, *location});
        if (!suspicion) return std::nullopt;
        join(result, *suspicion);
        for (int32_t reason : numbers("suspicion_reasons")) {
            if (reason != 0 && reason != 1) return std::nullopt;
            const auto cause = apply(reason == 0 ? "after appearing not to age" : "after a murder", {});
            if (!cause) return std::nullopt;
            append_clause(result, *cause);
        }
        break;
    }
    case 74: {
        const auto artifact = subject(NativeHistoryObjectKind::Artifact, number("artifact"));
        if (!artifact) return std::nullopt;
        std::optional<Pieces> location;
        if (number("structure") >= 0) {
            location = structure(number("site"), number("structure"));
            if (!location) return std::nullopt;
        }
        if (number("site") >= 0) {
            const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
            if (!site) return std::nullopt;
            location = location ? apply("{p} of {p}", {*location, *site}) : site;
            if (!location) return std::nullopt;
        }
        std::string key = "{p} was stored";
        std::vector<Pieces> fields{*artifact};
        if (location) { key += " in {p}"; fields.push_back(*location); }
        if (number("histfig") >= 0) {
            const auto person = subject(NativeHistoryObjectKind::Figure, number("histfig"));
            if (!person) return std::nullopt;
            key += " by {a}";
            fields.push_back(*person);
        }
        const auto storing = apply(key, fields);
        if (!storing) return std::nullopt;
        join(result, *storing);
        break;
    }
    case 86: {
        const auto describe = [&](int32_t id, bool has_item) -> std::optional<Pieces> {
            const auto artifact = subject(NativeHistoryObjectKind::Artifact, id);
            // Native title b8a720..b8a8bd lists artifact names, source names,
            // site, maker and date. Only the d0 paragraph appends c65450's
            // item descriptors, so a nested d8 title must not request them.
            if (!artifact || !has_item || native_title) return artifact;
            const auto description = artifact_item(id);
            return description ? apply("{p}, {s}", {*artifact, *description}) : std::nullopt;
        };
        const auto artifact = describe(number("artifact"), number("artifact_has_item") != 0);
        const auto creator = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        const auto &sources = numbers("source_artifacts");
        const auto &descriptions = numbers("source_artifacts_have_items");
        if (!artifact || !creator || sources.size() != descriptions.size()) return std::nullopt;
        std::optional<Pieces> ingredients;
        for (size_t index = 0; index < sources.size(); ++index) {
            const auto source = describe(sources[index], descriptions[index] != 0);
            if (!source) return std::nullopt;
            ingredients = ingredients ? apply(index + 1 == sources.size() ? "{a} and {a}" : "{a}, {a}",
                {*ingredients, *source}) : source;
            if (!ingredients) return std::nullopt;
        }
        std::string key = ingredients ? "{p} was made from {p} by {a}" : "{p} was made by {a}";
        std::vector<Pieces> fields{*artifact};
        if (ingredients) fields.push_back(*ingredients);
        fields.push_back(*creator);
        if (number("site") >= 0) {
            const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
            if (!site) return std::nullopt;
            key += " in {p}";
            fields.push_back(*site);
        }
        const auto making = apply(key, fields);
        if (!making) return std::nullopt;
        join(result, *making);
        break;
    }
    case 88: {
        if (number("relationship") != 40) return std::nullopt;
        const auto seeker = subject(NativeHistoryObjectKind::Figure, number("seeker"));
        const auto target = subject(NativeHistoryObjectKind::Figure, number("target"));
        const auto location = number("site") >= 0 || number("region") >= 0 || number("layer") >= 0
            ? place() : apply("the wilds", {});
        if (!seeker || !target || !location) return std::nullopt;
        const auto denial = apply("{a} was denied an apprenticeship under {n} in {p}",
            {*seeker, *target, *location});
        if (!denial) return std::nullopt;
        join(result, *denial);
        const int32_t reason = number("denial_reason");
        if (reason == 49 || reason == 50) {
            std::optional<Pieces> cause;
            if (reason == 49 && number("denial_reason_data") == number("target"))
                cause = apply("as the latter prefers to work alone", {});
            else {
                const auto person = subject(NativeHistoryObjectKind::Figure, number("denial_reason_data"));
                if (!person) return std::nullopt;
                cause = apply(reason == 49 ? "as {n} prefers to work alone" : "due to {n}'s jealousy", {*person});
            }
            if (!cause) return std::nullopt;
            append_clause(result, *cause);
        }
        // Other reason values have no suffix in this native formatter.
        break;
    }
    default: return std::nullopt;
    }
    translated = true;
    break;
}
case 47: // war_plundered_site
case 49: // war_site_tribute_forced
case 50: // war_site_taken_over
case 80: { // hf_attacked_site
    const auto attacker = event.native_type == 80
        ? subject(NativeHistoryObjectKind::Figure, number("attacker_hf"))
        : subject(NativeHistoryObjectKind::Entity, number("attacker_civ"));
    if (!attacker) return std::nullopt;
    const auto defending_entity = [&]() -> std::optional<Pieces> {
        auto defender = subject(NativeHistoryObjectKind::Entity, number("site_civ"));
        if (!defender) return std::nullopt;
        if (number("site_civ") != number("defender_civ")) {
            const auto civilization = subject(NativeHistoryObjectKind::Entity, number("defender_civ"));
            if (!civilization) return std::nullopt;
            defender = apply("{a} of {a}", {*defender, *civilization});
        }
        return defender;
    };
    if (event.native_type == 47) {
        // NO_DEFEAT_MENTION=1, ITEMS=4, LIVESTOCK=8, WAS_RAID=16.
        // DETECTED=2 is not emitted by this native sentence formatter.
        const uint32_t flags = static_cast<uint32_t>(number("plunder_flags"));
        const bool raid = (flags & 16) != 0;
        const bool mention_defeat = (flags & 1) == 0;
        const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        std::string_view predicate;
        switch (flags & 12) {
        case 12: predicate = raid ? "stole treasure and livestock from" :
            "looted treasure and seized livestock from"; break;
        case 4: predicate = raid ? "stole treasure from" : "looted treasure from"; break;
        case 8: predicate = raid ? "stole livestock from" : "seized livestock from"; break;
        default: predicate = raid ? "raided" : "pillaged"; break;
        }
        if (mention_defeat) {
            const auto defender = defending_entity();
            if (!defender) return std::nullopt;
            const auto defeat = apply("{a} defeated {a}", {*attacker, *defender});
            const auto plunder = apply("and " + std::string(predicate) + " {p}", {*site});
            if (!defeat || !plunder) return std::nullopt;
            join(result, *defeat);
            join(result, *plunder);
        } else {
            const auto plunder = apply("{a} " + std::string(predicate) + " {p}", {*attacker, *site});
            if (!plunder) return std::nullopt;
            join(result, *plunder);
        }
    } else if (event.native_type == 49) {
        const auto defender = defending_entity();
        if (!defender) return std::nullopt;
        const int32_t season = number("tribute_season");
        const bool bled_dry = (number("tribute_flags") & 1) != 0;
        const std::string_view predicate = season == -1
            ? (bled_dry ? "demanded treasure from" : "demanded and received treasure from")
            : (bled_dry ? "tried to secure tribute from" : "secured tribute from");
        const auto demand = apply("{a} " + std::string(predicate) + " {a}", {*attacker, *defender});
        if (!demand) return std::nullopt;
        join(result, *demand);
        if (bled_dry) {
            const auto shortage = apply("but they had nothing left to give", {});
            if (!shortage) return std::nullopt;
            append_clause(result, *shortage);
        } else {
            const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
            if (!site) return std::nullopt;
            std::optional<Pieces> delivery;
            if (season == -1) delivery = apply("in {p}", {*site});
            else {
                if (season < 0 || season > 3) return std::nullopt;
                static constexpr const char *seasons[] = {"Spring", "Summer", "Autumn", "Winter"};
                const auto season_name = exact_literal_translation(seasons[season]);
                if (!season_name) return std::nullopt;
                delivery = apply(", to be delivered from {p} every {s}",
                    {*site, Pieces{piece(*season_name, neutral)}});
            }
            if (!delivery) return std::nullopt;
            join(result, *delivery);
        }
    } else if (event.native_type == 50) {
        const auto defender = defending_entity();
        const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!defender || !site) return std::nullopt;
        const auto defeat = apply("{a} defeated {a}", {*attacker, *defender});
        const auto takeover = apply("and took over {p}", {*site});
        if (!defeat || !takeover) return std::nullopt;
        join(result, *defeat);
        join(result, *takeover);
        if (number("new_site_civ") >= 0) {
            const auto government = subject(NativeHistoryObjectKind::Entity, number("new_site_civ"));
            if (!government) return std::nullopt;
            const auto sentence = apply("The new government was called {p}", {*government});
            const auto stop = apply(".", {});
            if (!sentence || !stop) return std::nullopt;
            join(result, *stop);
            join(result, *sentence);
        }
    } else {
        const auto defender = defending_entity();
        const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!defender || !site) return std::nullopt;
        const auto attack = apply("{a} attacked {a} at {p}", {*attacker, *defender, *site});
        if (!attack) return std::nullopt;
        join(result, *attack);
    }
    translated = true;
    break;
}
case 72: { // entity_law; only bit 0 adds words in RVA b68d50.
    const bool enact = (number("add_flags") & 1) != 0;
    const bool repeal = (number("remove_flags") & 1) != 0;
    if (!enact && !repeal) return std::nullopt;
    const auto entity = subject(NativeHistoryObjectKind::Entity, number("entity"));
    if (!entity) return std::nullopt;
    std::optional<Pieces> actor;
    if (number("histfig") >= 0) {
        actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
        if (!actor) return std::nullopt;
    }
    bool first = true;
    for (bool adding : {true, false}) {
        if (adding ? !enact : !repeal) continue;
        const std::string_view predicate = actor
            ? (adding ? "{a} laid a series of oppressive edicts upon {p}" :
                        "{a} lifted numerous oppressive laws from {p}")
            : (adding ? "{a} enacted a series of oppressive laws" :
                        "{a} repealed numerous oppressive laws");
        const auto action = apply(predicate, actor
            ? std::vector<Pieces>{*actor, *entity} : std::vector<Pieces>{*entity});
        if (!action) return std::nullopt;
        if (first) join(result, *action);
        else append_clause(result, *action);
        first = false;
    }
    translated = true;
    break;
}
case 76: { // site_dispute; native switch at RVA b833ee.
    const int32_t type = number("dispute_type");
    if (type < 0 || type > 5) return std::nullopt;
    static constexpr const char *disputes[] = {"territory", "water rights", "grazing rights",
        "fishing rights", "rights-of-way", "livestock ownership"};
    const auto topic = apply(disputes[type], {});
    const auto party = [&](std::string_view entity_key, std::string_view site_key)
            -> std::optional<Pieces> {
        auto entity = subject(NativeHistoryObjectKind::Entity, number(entity_key));
        if (!entity) return std::nullopt;
        if (number(site_key) >= 0) {
            const auto site = subject(NativeHistoryObjectKind::Site, number(site_key));
            if (!site) return std::nullopt;
            entity = apply("{a} of {a}", {*entity, *site});
        }
        return entity;
    };
    const auto first = party("entity_1", "site_1");
    const auto second = party("entity_2", "site_2");
    if (!topic || !first || !second) return std::nullopt;
    const auto parties = apply("{a} and {a}", {*first, *second});
    if (!parties) return std::nullopt;
    const auto action = apply("{a} became embroiled in a dispute over {s}", {*parties, *topic});
    if (!action) return std::nullopt;
    join(result, *action);
    translated = true;
    break;
}
case 78: { // insurrection_started
    const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    if (!site) return std::nullopt;
    std::optional<Pieces> action;
    if (number("target_civ") >= 0) {
        const auto government = subject(NativeHistoryObjectKind::Entity, number("target_civ"));
        if (!government) return std::nullopt;
        action = apply("an insurrection against {p} began in {p}", {*government, *site});
    } else action = apply("an insurrection began in {p}", {*site});
    if (!action) return std::nullopt;
    join(result, *action);
    translated = true;
    break;
}
case 79: { // insurrection_ended: 0 overthrow, 1 population vanishes, 2 crushed.
    const int32_t outcome = number("outcome");
    if (outcome < 0 || outcome > 2) return std::nullopt;
    const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    const auto government = number("target_civ") >= 0
        ? subject(NativeHistoryObjectKind::Entity, number("target_civ"))
        : apply("the local government", {});
    if (!site || !government) return std::nullopt;
    if (outcome == 2) {
        const auto crushed = apply("{p} crushed the insurrection in {p}", {*government, *site});
        if (!crushed) return std::nullopt;
        join(result, *crushed);
    } else {
        const auto uprising = outcome == 0 ? apply("the insurrection in {p}", {*site}) :
            apply("the insurrection in {p} against {p}", {*site, *government});
        const auto ending = outcome == 0 ? apply("concluded with {p} overthrown", {*government}) :
            apply("ended with the disappearance of the rebelling population", {});
        if (!uprising || !ending) return std::nullopt;
        join(result, *uprising);
        join(result, *ending);
    }
    translated = true;
    break;
}
case 87: { // artifact_destroyed
    const auto artifact = subject(NativeHistoryObjectKind::Artifact, number("artifact"));
    if (!artifact) return std::nullopt;
    std::optional<Pieces> destroyer;
    if (number("destroyer_hf") >= 0) {
        destroyer = subject(NativeHistoryObjectKind::Figure, number("destroyer_hf"));
        if (!destroyer) return std::nullopt;
    }
    if (number("destroyer_civ") >= 0) {
        const auto entity = subject(NativeHistoryObjectKind::Entity, number("destroyer_civ"));
        if (!entity) return std::nullopt;
        destroyer = destroyer ? apply("{a} and {a}", {*destroyer, *entity}) : entity;
        if (!destroyer) return std::nullopt;
    }
    std::string key = "{p} was destroyed";
    std::vector<Pieces> fields{*artifact};
    if (destroyer) {
        key += " by {a}";
        fields.push_back(*destroyer);
    }
    if (number("site") >= 0) {
        const auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        key += " in {p}";
        fields.push_back(*site);
    }
    const auto action = apply(key, fields);
    if (!action) return std::nullopt;
    join(result, *action);
    translated = true;
    break;
}
