// Native IDs and enum values select these templates; no displayed text is read.
case 89: { // regionpop_incorporated_into_entity
    const auto species = translate_creature_descriptor(text("race"));
    auto entity = subject(NativeHistoryObjectKind::Entity, number("entity"));
    if (!species || !entity) return std::nullopt;
    const int32_t population = number("population");
    const char *key = population >= 1000 ? "a multitude of {s}" :
        population >= 200 ? "hundreds {s}" : population >= 100 ? "some hundred {s}" :
        population >= 24 ? "dozens of {s}" : population >= 10 ? "several {s}" : "a few {s}";
    auto people = apply(key, {Pieces{piece(*species, neutral)}});
    if (!people) return std::nullopt;
    if (number("region") != -1 || number("layer") != -1) {
        auto origin = number("region") != -1 ? subject(NativeHistoryObjectKind::Region, number("region")) :
            subject(NativeHistoryObjectKind::Underground, number("layer"));
        if (!origin) return std::nullopt;
        people = apply("{a} from {p}", {*people, *origin});
        if (!people) return std::nullopt;
    }
    auto action = apply("joined with {p}", {*entity});
    if (!action) return std::nullopt;
    join(result, *people);
    if (number("site") != -1) {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        auto place = apply("at {p}", {*site});
        if (!place) return std::nullopt;
        join(result, *place);
    }
    join(result, *action);
    translated = true;
    break;
}
case 90: // poetic_form_created
case 91: // musical_form_created
case 92: // dance_form_created
case 93: { // written_content_composed
    const NativeHistoryObjectKind kind = event.native_type == 90 ? NativeHistoryObjectKind::Poem :
        event.native_type == 91 ? NativeHistoryObjectKind::Music :
        event.native_type == 92 ? NativeHistoryObjectKind::Dance : NativeHistoryObjectKind::WrittenContent;
    auto form = subject(kind, number("form"));
    auto author = subject(NativeHistoryObjectKind::Figure, number("creator"));
    const auto context = event_clauses();
    if (!form || !author || !context) return std::nullopt;
    // These four formatters prefer site, then surface region, then layer;
    // with no location they omit the entire location clause.
    const int32_t site_id = number("site"), region_id = number("region"), layer_id = number("layer");
    if (site_id != -1 || region_id != -1 || layer_id != -1) {
        auto location = site_id != -1 ? subject(NativeHistoryObjectKind::Site, site_id) :
            region_id != -1 ? subject(NativeHistoryObjectKind::Region, region_id) :
            subject(NativeHistoryObjectKind::Underground, layer_id);
        if (!location) return std::nullopt;
        auto place = apply("in {p}", {*location});
        if (!place) return std::nullopt;
        join(result, *place);
    }
    std::string key = "{p} was created by {n}";
    if (event.native_type == 93) {
        const auto entry = std::find_if(event.subjects.begin(), event.subjects.end(),
            [&](const auto &value) { return value.kind == kind && value.id == number("form"); });
        if (entry == event.subjects.end()) return std::nullopt;
        key = entry->label_key == "a work" ? "a work was authored by {n}" : "{b} was authored by {n}";
    }
    auto creation = key == "a work was authored by {n}" ? apply(key, {*author}) :
        apply(key, {*form, *author});
    if (!creation) return std::nullopt;
    join(result, *creation);
    append_clause(result, context->first);
    append_clause(result, context->second);
    translated = true;
    break;
}
case 94: { // change_hf_mood
    auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
    if (!actor) return std::nullopt;
    std::string key;
    switch (number("mood")) {
    case 0: key = "was taken by a fey mood"; break;
    case 1: key = "withdrew from society"; break;
    case 2: key = "was possessed"; break;
    case 3: key = "began to skulk and brood"; break;
    case 4: key = "was taken by a fell mood"; break;
    case 5: key = "was striken by melancholy"; break;
    case 6: key = "became crazed"; break;
    case 7: key = "went berserk"; break;
    case 9: key = "stopped responding to the outside world"; break;
    // Native value 8 and values outside the jump table omit the predicate.
    default: break;
    }
    if (!key.empty()) key += ' ';
    std::vector<Pieces> fields;
    const int32_t site_id = number("site"), region_id = number("region"), layer_id = number("layer");
    if (site_id == -1 && region_id == -1 && layer_id == -1) {
        key += "in the wilds";
    } else {
        auto location = site_id != -1 ? subject(NativeHistoryObjectKind::Site, site_id) :
            layer_id != -1 ? subject(NativeHistoryObjectKind::Underground, layer_id) :
            subject(NativeHistoryObjectKind::Region, region_id);
        if (!location) return std::nullopt;
        fields.push_back(*location);
        key += "in {p}";
    }
    auto action = apply(key, fields);
    const auto context = event_clauses();
    if (!action || !context) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    append_clause(result, context->first);
    append_clause(result, context->second);
    translated = true;
    break;
}
case 95: { // artifact_claim_formed
    auto artifact = subject(NativeHistoryObjectKind::Artifact, number("artifact"));
    if (!artifact) return std::nullopt;
    std::vector<Pieces> values{*artifact};
    std::string key;
    switch (number("claim")) {
    case 0:
        if (number("assignment") == -1) key = "{p} was made an official symbol";
        else if (!number("title_present")) key = "{p} was made a symbol";
        else {
            key = number("title_count") == 1 ? "{p} was made a symbol of the {s}" : "{p} was made a symbol of a {s}";
            auto title = text("position_title").empty() ? std::optional<Pieces>{Pieces{piece("", neutral)}} : office(text("position_title"));
            if (!title) return std::nullopt;
            values.push_back(*title);
            if (number("title_site") != -1) {
                auto site = subject(NativeHistoryObjectKind::Site, number("title_site"));
                if (!site) return std::nullopt;
                key += " of {p}";
                values.push_back(*site);
            }
        }
        break;
    case 1: key = "{p} was made a family heirloom"; break;
    case 2: key = "{p} was claimed"; break;
    case 3: key = "{p} was sanctified"; break;
    default: return std::nullopt;
    }
    if (number("histfig") != -1 || number("entity") != -1) {
        auto actor = number("histfig") != -1 ? subject(NativeHistoryObjectKind::Figure, number("histfig")) :
            subject(NativeHistoryObjectKind::Entity, number("entity"));
        if (!actor) return std::nullopt;
        key += " by {a}";
        values.push_back(*actor);
    }
    auto action = apply(key, values);
    auto clauses = event_clauses();
    if (!action || !clauses) return std::nullopt;
    join(result, *action);
    append_clause(result, clauses->first);
    append_clause(result, clauses->second);
    translated = true;
    break;
}
case 96: { // artifact_given
    auto artifact = subject(NativeHistoryObjectKind::Artifact, number("artifact"));
    if (!artifact) return std::nullopt;
    const auto party = [&](int32_t histfig, int32_t entity) -> std::optional<Pieces> {
        std::optional<Pieces> result;
        if (histfig != -1) {
            result = subject(NativeHistoryObjectKind::Figure, histfig);
            if (!result) return std::nullopt;
            if (entity != -1) {
                auto organization = subject(NativeHistoryObjectKind::Entity, entity);
                if (!organization) return std::nullopt;
                result = apply("{n} of {p}", {*result, *organization});
            }
        } else if (entity != -1) {
            result = subject(NativeHistoryObjectKind::Entity, entity);
        }
        return result;
    };
    const int32_t giver_hf = number("giver_histfig"), giver_entity = number("giver_entity");
    const int32_t receiver_hf = number("receiver_histfig"), receiver_entity = number("receiver_entity");
    const bool inherited = (number("transfer_flags") & 1) != 0;
    std::string key = inherited ? "{p} was inherited" : "{p} was offered";
    std::vector<Pieces> fields{*artifact};
    if (receiver_hf != -1 || receiver_entity != -1) {
        auto receiver = party(receiver_hf, receiver_entity);
        if (!receiver) return std::nullopt;
        key += inherited ? " by {n}" : " to {a}";
        fields.push_back(*receiver);
    }
    if (giver_hf != -1 || giver_entity != -1) {
        auto giver = party(giver_hf, giver_entity);
        if (!giver) return std::nullopt;
        key += inherited ? " from {a}" : " by {n}";
        fields.push_back(*giver);
    }
    auto action = apply(key, fields);
    const auto context = event_clauses();
    if (!action || !context) return std::nullopt;
    join(result, *action);
    append_clause(result, context->first);
    append_clause(result, context->second);
    translated = true;
    break;
}
case 97: { // hf_act_on_artifact
    auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
    auto artifact = subject(NativeHistoryObjectKind::Artifact, number("artifact"));
    auto location = subject(NativeHistoryObjectKind::Site, number("site"));
    if (!actor || !artifact || !location) return std::nullopt;
    if (number("structure") != -1) {
        auto building = structure(number("site"), number("structure"));
        if (!building) return std::nullopt;
        location = apply("{p} of {p}", {*building, *location});
        if (!location) return std::nullopt;
    }
    auto place = apply("in {p}", {*location});
    if (!place) return std::nullopt;
    std::optional<Pieces> action;
    switch (number("action")) {
    case 0: action = apply("viewed {p}", {*artifact}); break;
    case 1: action = apply("asked about {p}", {*artifact}); break;
    default: action = *artifact; break; // Native omits only the verb.
    }
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *place);
    join(result, *action);
    translated = true;
    break;
}
case 98: { // hf_recruited_unit_type_for_entity
    auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
    auto entity = subject(NativeHistoryObjectKind::Entity, number("entity"));
    if (!actor || !entity) return std::nullopt;
    std::optional<Pieces> action;
    if (text("profession").empty()) action = apply("recruited from {p}", {*entity});
    else {
        auto profession = term(text("profession"));
        if (!profession) {
            const auto exact = exact_literal_translation(text("profession"));
            if (exact) profession = Pieces{piece(*exact, neutral)};
        }
        if (!profession) return std::nullopt;
        auto recruits = apply("{a} from {p}", {*profession, *entity});
        if (!recruits) return std::nullopt;
        action = apply("recruited {a}", {*recruits});
    }
    if (!action) return std::nullopt;
    const int32_t site_id = number("site"), region_id = number("region"), layer_id = number("layer");
    std::optional<Pieces> location;
    if (site_id != -1) {
        location = subject(NativeHistoryObjectKind::Site, site_id);
        if (!location) return std::nullopt;
    }
    // Unlike the mood formatter, this native branch independently appends
    // the regional location even when it already emitted a site name.
    if (layer_id != -1 || region_id != -1) {
        auto area = layer_id != -1 ? subject(NativeHistoryObjectKind::Underground, layer_id) :
            subject(NativeHistoryObjectKind::Region, region_id);
        if (!area) return std::nullopt;
        if (location) join(*location, *area);
        else location = *area;
    }
    std::optional<Pieces> place = location ? apply("in {p}", {*location}) : apply("in the wilds", {});
    if (!place) return std::nullopt;
    join(result, *actor);
    join(result, *place);
    join(result, *action);
    translated = true;
    break;
}
case 99: { // hfs_formed_reputation_relationship
    const auto participant = [&](const char *person_key, const char *identity_key) -> std::optional<Pieces> {
        auto person = subject(NativeHistoryObjectKind::Figure, number(person_key));
        if (!person) return std::nullopt;
        if (number(identity_key) != -1) {
            auto alias = identity(number(identity_key), identity_key);
            auto named = alias ? apply(", as {a}", {*alias}) : std::nullopt;
            if (!named) return std::nullopt;
            join(*person, *named);
        }
        return person;
    };
    auto first = participant("corruptor", "corruptor_identity");
    auto second = participant("target", "target_identity");
    if (!first || !second) return std::nullopt;
    const int32_t first_kind = number("first_relationship"), second_kind = number("second_relationship");
    if (first_kind != second_kind && first_kind == 27) {
        auto action = apply("formed a false friendship with {n}", {*second});
        auto purpose = apply("in order to extract information", {});
        if (!action || !purpose) return std::nullopt;
        join(result, *first);
        join(result, *action);
        append_clause(result, *purpose);
    } else {
        auto both = apply("{a} and {a}", {*first, *second});
        auto action = apply(first_kind == second_kind && first_kind == 27 ?
            "formed a false friendship where each used the other for information" : "formed a friendship", {});
        if (!both || !action) return std::nullopt;
        join(result, *both);
        join(result, *action);
    }
    Pieces place;
    if (number("site") != -1) {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        join(place, *site);
    }
    if (number("layer") != -1 || number("region") != -1) {
        auto location = number("layer") != -1 ? subject(NativeHistoryObjectKind::Underground, number("layer")) :
            subject(NativeHistoryObjectKind::Region, number("region"));
        if (!location) return std::nullopt;
        join(place, *location);
    }
    if (number("site") == -1 && number("layer") == -1 && number("region") == -1) {
        auto wilds = term("the wilds");
        if (!wilds) return std::nullopt;
        place = std::move(*wilds);
    }
    auto location = apply("at {p}", {place});
    if (!location) return std::nullopt;
    append_clause(result, *location);
    translated = true;
    break;
}
case 100: { // artifact_copied
    auto actor = subject(NativeHistoryObjectKind::Entity, number("destination_entity"));
    auto artifact = subject(NativeHistoryObjectKind::Artifact, number("artifact"));
    auto source_entity = subject(NativeHistoryObjectKind::Entity, number("source_entity"));
    auto source_site = subject(NativeHistoryObjectKind::Site, number("source_site"));
    auto destination_site = subject(NativeHistoryObjectKind::Site, number("destination_site"));
    auto source_building = structure(number("source_site"), number("source_structure"));
    auto destination_building = structure(number("destination_site"), number("destination_structure"));
    if (!actor || !artifact || !source_entity || !source_site || !destination_site ||
        !source_building || !destination_building) return std::nullopt;
    auto source = apply("{p} of {p}", {*source_site, *source_entity});
    if (!source) return std::nullopt;
    source = apply("{p} of {p}", {*source_building, *source});
    auto destination = apply("{p} of {p}", {*destination_building, *destination_site});
    if (!source || !destination) return std::nullopt;
    auto action = apply((number("copy_flags") & 1) ? "made a copy of the original {p}" :
        "acquired a copy of {p}", {*artifact});
    auto origin = apply("from {p}", {*source});
    auto keeping = apply(", keeping it within {p}", {*destination});
    if (!action || !origin || !keeping) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    append_clause(result, *origin);
    append_clause(result, *keeping);
    translated = true;
    break;
}
case 101: { // sneak_into_site
    auto attacker = subject(NativeHistoryObjectKind::Entity, number("attacker_civ"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    if (!attacker || !site) return std::nullopt;
    auto action = apply("slipped into {p}", {*site});
    if (!action) return std::nullopt;
    join(result, *attacker);
    join(result, *action);
    const int32_t site_civ_id = number("site_civ");
    if (site_civ_id != -1) {
        auto defender = subject(NativeHistoryObjectKind::Entity, site_civ_id);
        if (!defender) return std::nullopt;
        if (site_civ_id != number("defender_civ")) {
            auto civ = subject(NativeHistoryObjectKind::Entity, number("defender_civ"));
            if (!civ) return std::nullopt;
            defender = apply("{p} of {p}", {*defender, *civ});
            if (!defender) return std::nullopt;
        }
        auto detection = apply(", undetected by {a}", {*defender});
        if (!detection) return std::nullopt;
        append_clause(result, *detection);
    }
    translated = true;
    break;
}
case 102: { // spotted_leaving_site
    auto spotter = subject(NativeHistoryObjectKind::Figure, number("spotter"));
    auto owner = subject(NativeHistoryObjectKind::Entity, number("site_civ"));
    auto leaver = subject(NativeHistoryObjectKind::Entity, number("leaver_civ"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    if (!spotter || !owner || !leaver || !site) return std::nullopt;
    // The native formatter always qualifies this figure by the site entity.
    auto actor = apply("{n} of {p}", {*spotter, *owner});
    auto action = apply("spotted the forces of {p} slipping out of {p}", {*leaver, *site});
    if (!actor || !action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 105: { // hfs_act_on_site
    const auto &ids = numbers("histfigs");
    if (ids.empty()) return std::nullopt; // Native emits no event for an empty group.
    const int32_t focus = context_number("histfig_id");
    std::vector<int32_t> ordered;
    const bool has_focus = focus != -1 && std::find(ids.begin(), ids.end(), focus) != ids.end();
    if (has_focus) {
        ordered.push_back(focus);
        if (ids.size() == 2) ordered.push_back(ids.front() == focus ? ids.back() : ids.front());
    } else ordered = ids;
    Pieces people;
    for (size_t index = 0; index < ordered.size(); ++index) {
        auto person = subject(NativeHistoryObjectKind::Figure, ordered[index]);
        if (!person) return std::nullopt;
        if (people.empty()) people = *person;
        else {
            auto combined = apply(index + 1 == ordered.size() ? "{a} and {a}" : "{a}, {a}", {people, *person});
            if (!combined) return std::nullopt;
            people = std::move(*combined);
        }
    }
    if (has_focus && ids.size() > 2) {
        auto others = apply("{a} and others", {people});
        if (!others) return std::nullopt;
        people = std::move(*others);
    }
    std::optional<Pieces> action;
    const int32_t kind = number("action");
    if (kind == 0) action = apply("caroused", {});
    else if (kind >= 1 && kind <= 5) {
        static constexpr const char *quality[] = {"", "well-crafted", "finely-crafted", "superior quality", "exceptional", "masterwork"};
        auto label = term(quality[kind]);
        if (label) action = apply("purchased {s} equipment", {*label});
    } else if (kind == 6) action = apply("performed horrible experiments", {});
    else if (kind == 7 || kind == 8) {
        if (number("entity") == -1) action = apply("could not meet with their diplomatic target", {});
        else {
            auto target = subject(NativeHistoryObjectKind::Entity, number("entity"));
            if (target) action = apply("could not meet with {a}", {*target});
        }
    } else action = Pieces{};
    if (!action) return std::nullopt;
    join(result, people);
    join(result, *action);
    if (number("site") != -1 || number("region") != -1 || number("layer") != -1) {
        std::optional<Pieces> location;
        if (number("site") != -1) {
            location = subject(NativeHistoryObjectKind::Site, number("site"));
            if (location && number("structure") != -1) {
                auto building = structure(number("site"), number("structure"));
                location = building ? apply("{p} in {p}", {*building, *location}) : std::nullopt;
            }
        } else location = number("layer") != -1 ? subject(NativeHistoryObjectKind::Underground, number("layer")) :
            subject(NativeHistoryObjectKind::Region, number("region"));
        if (!location) return std::nullopt;
        if (kind == 7) {
            auto reason = apply("as the target was no longer in {p}", {*location});
            if (!reason) return std::nullopt;
            append_clause(result, *reason);
        } else {
            if (kind == 8) {
                auto reason = apply("as there were no suitable representatives", {});
                if (!reason) return std::nullopt;
                append_clause(result, *reason);
            }
            auto place = apply("in {p}", {*location});
            if (!place) return std::nullopt;
            append_clause(result, *place);
        }
    }
    translated = true;
    break;
}
case 103: // entity_searched_site
case 106: // entity_rampaged_in_site
case 107: { // entity_fled_site
    auto entity = subject(NativeHistoryObjectKind::Entity, number("entity"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    if (!entity || !site) return std::nullopt;
    auto actor = event.native_type == 107 ? entity : apply("the forces of {p}", {*entity});
    const char *key = event.native_type == 103 ? "searched {p}" :
        event.native_type == 106 ? "rampaged throughout {p}" : "fled {p}";
    auto action = apply(key, {*site});
    if (!actor || !action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    if (event.native_type == 103 && number("result") == 0) {
        // All other result values have no trailing clause in getSentence.
        auto outcome = apply("and found nothing", {});
        if (!outcome) return std::nullopt;
        append_clause(result, *outcome);
    }
    translated = true;
    break;
}
case 104: { // hf_freed
    std::optional<Pieces> actor;
    if (number("freeing_histfig") != -1) {
        actor = subject(NativeHistoryObjectKind::Figure, number("freeing_histfig"));
        if (!actor) return std::nullopt;
    }
    if (number("freeing_civ") != -1) {
        auto entity = subject(NativeHistoryObjectKind::Entity, number("freeing_civ"));
        if (!entity) return std::nullopt;
        auto forces = apply("the forces of {p}", {*entity});
        if (!forces) return std::nullopt;
        actor = actor ? apply("{a} and {a}", {*actor, *forces}) : forces;
        if (!actor) return std::nullopt;
    }
    const auto &rescued = numbers("rescued");
    std::optional<Pieces> captives;
    if (rescued.empty()) captives = apply("somebody", {});
    else {
        captives = subject(NativeHistoryObjectKind::Figure, rescued.front());
        if (!captives) return std::nullopt;
        if (rescued.size() >= 3) captives = apply("{a} and others", {*captives});
        else if (rescued.size() == 2) {
            auto other = subject(NativeHistoryObjectKind::Figure, rescued[1]);
            if (!other) return std::nullopt;
            captives = apply("{a} and {a}", {*captives, *other});
        }
    }
    if (!captives) return std::nullopt;
    std::string key = "freed {a}";
    std::vector<Pieces> fields{*captives};
    if (number("site") != -1) {
        auto captor = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!captor) return std::nullopt;
        if (number("site_civ") != -1) {
            auto entity = subject(NativeHistoryObjectKind::Entity, number("site_civ"));
            if (!entity) return std::nullopt;
            if (number("holding_civ") != -1) {
                auto owner = subject(NativeHistoryObjectKind::Entity, number("holding_civ"));
                if (!owner) return std::nullopt;
                entity = apply("{p} of {p}", {*entity, *owner});
                if (!entity) return std::nullopt;
            }
            captor = apply("{a} and {a}", {*captor, *entity});
            if (!captor) return std::nullopt;
        }
        key += " from {p}";
        fields.push_back(*captor);
    }
    auto action = apply(key, fields);
    if (!action) return std::nullopt;
    if (actor) join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 109: { // squad_vs_squad
    const auto group = [&](const std::string &prefix, bool first) -> std::optional<Pieces> {
        const auto &histfigs = numbers(prefix + "histfigs");
        if (number(prefix + "squad") != -1 && histfigs.size() >= 2) {
            if (!number(prefix + "squad_present")) return Pieces{piece("", neutral)};
            auto named = subject(NativeHistoryObjectKind::Squad, number(prefix + "squad"));
            if (!named) return std::nullopt;
            if (number(prefix + "leader") != -1) {
                auto leader = subject(NativeHistoryObjectKind::Figure, number(prefix + "leader"));
                const int32_t skill = number(prefix + "leadership");
                const char *key = skill >= 200 ? "brilliantly led by {a}" :
                    skill >= 150 ? "inspiringly led by {a}" : skill >= 100 ? "ably led by {a}" :
                    skill >= 50 ? "led by {a}" : "poorly led by {a}";
                auto leadership = leader ? apply(key, {*leader}) : std::nullopt;
                if (!leadership) return std::nullopt;
                append_clause(*named, *leadership);
                named->push_back(piece("，", neutral));
            }
            return named;
        }
        if (!histfigs.empty()) return subject(NativeHistoryObjectKind::Figure, histfigs.front());
        const std::string raw = text(prefix + "race");
        auto translated_race = exact_literal_translation(raw);
        if (!translated_race) translated_race = translate_creature_descriptor(raw);
        if (!translated_race) return std::nullopt;
        std::optional<Pieces> race = Pieces{piece(*translated_race, neutral)};
        if (number(prefix + "animated")) race = apply("animated {s}", {*race});
        if (!race) return std::nullopt;
        const int32_t count = number(prefix + "count");
        return count == 1 ? apply(first ? "a lone {s}" : "a single {s}", {*race}) :
            apply("{c} {s}", {Pieces{piece(std::to_string(count), neutral)}, *race});
    };
    auto first = group("first_", true), second = group("second_", false);
    auto clash = second ? apply("clashed with {a}", {*second}) : std::nullopt;
    if (!first || !clash) return std::nullopt;
    join(result, *first);
    join(result, *clash);
    std::optional<Pieces> place;
    if (number("site") != -1) {
        place = subject(NativeHistoryObjectKind::Site, number("site"));
        if (place && number("structure") != -1) {
            auto building = structure(number("site"), number("structure"));
            place = building ? apply("{p} of {p}", {*building, *place}) : std::nullopt;
        }
    } else if (number("layer") != -1)
        place = subject(NativeHistoryObjectKind::Underground, number("layer"));
    else if (number("region") != -1)
        place = subject(NativeHistoryObjectKind::Region, number("region"));
    else place = term("unknown lands");
    auto location = place ? apply("in {p}", {*place}) : std::nullopt;
    if (!location) return std::nullopt;
    append_clause(result, *location);
    const int32_t first_deaths = number("first_deaths"), second_deaths = number("second_deaths");
    if (second_deaths > 0) {
        auto slain = second_deaths == number("second_count") ? apply("slaying them", {}) :
            apply("slaying {c}", {Pieces{piece(std::to_string(second_deaths), neutral)}});
        if (!slain) return std::nullopt;
        append_clause(result, *slain);
    }
    if (first_deaths > 0) {
        const int32_t count = number("first_count");
        auto losses = first_deaths == count ? apply(count == 1 ? "dying" : "losing everyone", {}) :
            apply("losing {c}", {Pieces{piece(std::to_string(first_deaths), neutral)}});
        if (!losses) return std::nullopt;
        append_clause(result, *losses);
    }
    translated = true;
    break;
}
case 110: { // site_surrendered
    const int32_t site_civ_id = number("site_civ");
    auto actor = subject(NativeHistoryObjectKind::Entity, site_civ_id);
    auto attacker = subject(NativeHistoryObjectKind::Entity, number("attacker_civ"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    if (!actor || !attacker || !site) return std::nullopt;
    if (site_civ_id != number("defender_civ")) {
        auto civ = subject(NativeHistoryObjectKind::Entity, number("defender_civ"));
        if (!civ) return std::nullopt;
        actor = apply("{p} of {p}", {*actor, *civ});
        if (!actor) return std::nullopt;
    }
    auto action = apply("surrendered {p} to {p}", {*site, *attacker});
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 108: { // tactical_situation
    const int32_t attacker_id = number("attacker_tactician"), defender_id = number("defender_tactician");
    const int32_t attacker_roll = number("attacker_roll"), defender_roll = number("defender_roll");
    const bool planning = (number("tactics_flags") & 1) != 0;
    const auto twice = [](int32_t value) {
        const uint32_t bits = static_cast<uint32_t>(value) * 2u;
        int32_t result = 0;
        std::memcpy(&result, &bits, sizeof(result));
        return result;
    };
    if (attacker_id != -1 && defender_id != -1) {
        const bool attacker_dominates = attacker_roll >= twice(defender_roll);
        const bool defender_dominates = !attacker_dominates && defender_roll >= twice(attacker_roll);
        const bool attacker_wins = attacker_dominates || (!defender_dominates && attacker_roll >= defender_roll);
        auto winner = subject(NativeHistoryObjectKind::Figure, attacker_wins ? attacker_id : defender_id);
        auto other = subject(NativeHistoryObjectKind::Figure, attacker_wins ? defender_id : attacker_id);
        if (!winner || !other) return std::nullopt;
        if (planning && !attacker_dominates && !defender_dominates) {
            auto comparison = apply("{n}'s tactical planning was superior to {n}'s", {*winner, *other});
            if (!comparison) return std::nullopt;
            join(result, *comparison);
        } else {
            const char *key = planning ? "outmatched {a} with a cunning plan" :
                attacker_dominates || defender_dominates ? "entirely outwitted {a}" : "outmanuevered {a}";
            auto comparison = apply(key, {*other});
            if (!comparison) return std::nullopt;
            join(result, *winner);
            join(result, *comparison);
        }
    } else if (attacker_id != -1 || defender_id != -1) {
        const bool attacker = attacker_id != -1;
        auto actor = subject(NativeHistoryObjectKind::Figure, attacker ? attacker_id : defender_id);
        if (!actor) return std::nullopt;
        const int32_t own = attacker ? attacker_roll : defender_roll;
        const int32_t other = attacker ? defender_roll : attacker_roll;
        const bool poor = attacker ? other > own : other >= own;
        const char *key;
        if (other >= twice(own)) key = planning ? "made an outright foolish plan" : "blundered terribly";
        else if (own >= twice(other) && own >= 100)
            key = planning ? "unrolled a brilliant tactical plan" : "hatched a stunning strategy";
        else key = planning ? (poor ? "made a poor plan" : "put forth a sound plan") :
            (poor ? "used poor tactics" : "used good tactics");
        auto assessment = apply(key, {});
        if (!assessment) return std::nullopt;
        join(result, *actor);
        join(result, *assessment);
    } else {
        auto forces = apply(planning ? "the forces were arrayed, and" : "the forces shifted, and", {});
        if (!forces) return std::nullopt;
        join(result, *forces);
    }
    const int32_t situation = number("situation");
    if (attacker_id != -1 || defender_id != -1) {
        result.push_back(piece("，", neutral));
        if (situation >= 0 && situation <= 6) {
            const bool agrees = situation < 3 ? attacker_roll >= defender_roll :
                situation < 6 ? attacker_roll < defender_roll : false;
            auto connection = apply(agrees ? "and" : "but", {});
            if (!connection) return std::nullopt;
            join(result, *connection);
        }
    }
    const int32_t site_id = number("site"), layer_id = number("layer"), region_id = number("region");
    std::optional<Pieces> location;
    if (site_id != -1) {
        location = subject(NativeHistoryObjectKind::Site, site_id);
        if (!location) return std::nullopt;
        if (number("structure") != -1) {
            auto building = structure(site_id, number("structure"));
            if (!building) return std::nullopt;
            location = apply("{p} of {p}", {*building, *location});
        }
    } else if (layer_id != -1) location = subject(NativeHistoryObjectKind::Underground, layer_id);
    else if (region_id != -1) location = subject(NativeHistoryObjectKind::Region, region_id);
    else location = term("unknown lands");
    if (!location) return std::nullopt;
    auto place = apply("in {p}", {*location});
    if (!place) return std::nullopt;
    join(result, *place);
    static constexpr const char *positions[] = {
        "the attackers had a strong positional advantage", "the attackers had a positional advantage",
        "the attackers had a slight positional advantage", "the defenders had a strong positional advantage",
        "the defenders had a positional advantage", "the defenders had a slight positional advantage",
        "neither side had a positional advantage",
    };
    if (situation >= 0 && situation < 7) {
        auto position = apply(positions[situation], {});
        if (!position) return std::nullopt;
        join(result, *position);
    }
    translated = true;
    break;
}
case 111: { // entity_expels_hf
    auto actor = subject(NativeHistoryObjectKind::Entity, number("entity"));
    auto expelled = subject(NativeHistoryObjectKind::Figure, number("expelled"));
    if (!actor || !expelled) return std::nullopt;
    std::optional<Pieces> action;
    if (number("site") == -1) {
        action = apply("expelled {a}", {*expelled});
    } else {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        action = apply("expelled {a} from {p}", {*expelled, *site});
    }
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 112: { // hf_trade: RVA b85190
    auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
    if (actor && number("entity") != -1) {
        auto entity = subject(NativeHistoryObjectKind::Entity, number("entity"));
        actor = entity ? apply("{n} of {p}", {*actor, *entity}) : std::nullopt;
    }
    auto goods = commodity("commodity.");
    auto source = subject(NativeHistoryObjectKind::Site, number("source"));
    auto destination = subject(NativeHistoryObjectKind::Site, number("destination"));
    if (!actor || !goods || !source || !destination) return std::nullopt;
    const int32_t shift = number("account_shift");
    const char *key = shift >= 5000 ? "made a fortune trading {s} from {p} to {p}" :
        shift >= 1000 ? "did well trading {s} from {p} to {p}" :
        shift <= -5000 ? "lost a fortune trading {s} from {p} to {p}" :
        shift <= -1000 ? "did poorly trading {s} from {p} to {p}" :
        "broke even trading {s} from {p} to {p}";
    auto action = apply(key, {*goods, *source, *destination});
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 113: { // add_entity_site_profile_flag
    auto actor = subject(NativeHistoryObjectKind::Entity, number("entity"));
    if (!actor) return std::nullopt;
    join(result, *actor);
    // Native compares the entire uint32 value, rather than testing a bit.
    // Every other value emits only the date, entity and final punctuation.
    if (number("added_flags") == 0x10000) {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        auto action = apply("declared {p} to be a holy city", {*site});
        if (!action) return std::nullopt;
        join(result, *action);
    }
    translated = true;
    break;
}
case 114: { // hf_gamble
    auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
    if (!actor) return std::nullopt;
    // The original subtracts 32-bit accounts before its signed comparisons.
    const uint32_t difference_bits = static_cast<uint32_t>(number("account_after")) -
        static_cast<uint32_t>(number("account_before"));
    int32_t difference = 0;
    std::memcpy(&difference, &difference_bits, sizeof(difference));
    const char *key = difference >= 5000 ? "made a fortune gambling" :
        difference >= 1000 ? "did well gambling" :
        difference <= -5000 ? "lost a fortune gambling" :
        difference <= -1000 ? "did poorly gambling" : "broke even gambling";
    auto action = apply(key, {});
    if (!action) return std::nullopt;
    join(result, *actor);
    if (number("site") != -1) {
        auto location = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!location) return std::nullopt;
        if (number("structure") != -1) {
            auto building = structure(number("site"), number("structure"));
            if (!building) return std::nullopt;
            location = apply("{p} of {p}", {*building, *location});
            if (!location) return std::nullopt;
        }
        auto place = apply("in {p}", {*location});
        if (!place) return std::nullopt;
        join(result, *place);
    }
    join(result, *action);
    if (number("account_after") < 0) {
        auto debt = apply(number("account_before") < 0 ?
            "and went further into debt" : "and went into debt", {});
        if (!debt) return std::nullopt;
        append_clause(result, *debt);
    }
    translated = true;
    break;
}
case 116: { // entity_dissolved
    auto actor = subject(NativeHistoryObjectKind::Entity, number("entity"));
    auto action = apply("dissolved", {});
    const auto context = event_clauses();
    if (!actor || !action || !context) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    append_clause(result, context->first);
    append_clause(result, context->second);
    translated = true;
    break;
}
case 117: { // entity_equipment_purchase
    auto actor = subject(NativeHistoryObjectKind::Entity, number("entity"));
    if (!actor) return std::nullopt;
    static constexpr const char *quality_keys[] = {
        "standard", "well-crafted", "finely-crafted", "superior quality",
        "exceptional", "masterwork", "artifact"
    };
    const int32_t quality = number("quality");
    std::optional<Pieces> action;
    if (quality >= 0 && quality <= 6) {
        auto descriptor = apply(quality_keys[quality], {});
        if (!descriptor) return std::nullopt;
        action = apply("purchased {s} equipment", {*descriptor});
    } else {
        // getSentence emits no quality phrase for values outside 0..6.
        action = apply("purchased equipment", {});
    }
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    const int32_t context_histfig = context_number("histfig_id");
    const auto &recipients = numbers("recipients");
    if (context_histfig != -1 &&
            std::find(recipients.begin(), recipients.end(), context_histfig) != recipients.end()) {
        auto recipient = subject(NativeHistoryObjectKind::Figure, context_histfig);
        if (!recipient) return std::nullopt;
        auto receipt = apply(", which {a} received", {*recipient});
        if (!receipt) return std::nullopt;
        append_clause(result, *receipt);
    }
    translated = true;
    break;
}
case 118: { // modified_building
    auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    auto building = structure(number("site"), number("structure"));
    if (!actor || !site || !building) return std::nullopt;
    auto location = apply("{p} of {p}", {*building, *site});
    if (!location) return std::nullopt;
    const char *key = nullptr;
    if (number("modification_type") == 12) {
        switch (number("modification")) {
        case 1: key = "had a dungeon constructed within {p}"; break;
        case 2: key = "had the fortifications improved of {p}"; break;
        case 4: key = "had a gated courtyard added to {p}"; break;
        case 8: key = "had a feast hall added to {p}"; break;
        default: break;
        }
    }
    auto action = key ? apply(key, {*location}) : location;
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 119: { // building_profile_acquired
    const int32_t histfig = number("histfig"), entity = number("entity");
    auto actor = histfig != -1 ? subject(NativeHistoryObjectKind::Figure, histfig) :
        subject(NativeHistoryObjectKind::Entity, entity);
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    auto building = text("property").empty() ?
        structure(number("site"), number("resolved_structure")) : term(text("property"));
    if (!actor || !site || !building) return std::nullopt;
    auto location = apply("{p} of {p}", {*building, *site});
    if (!location) return std::nullopt;
    std::optional<Pieces> action;
    switch (number("acquisition")) {
    case 0: action = apply("purchased {p}", {*location}); break;
    case 1: action = apply("inherited {p}", {*location}); break;
    case 2: action = apply("rebuilt {p}", {*location}); break;
    default: action = location; break;
    }
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    std::optional<Pieces> previous;
    if (number("former_histfig") != -1 && number("former_histfig") != histfig)
        previous = subject(NativeHistoryObjectKind::Figure, number("former_histfig"));
    else if (number("former_entity") != -1 && number("former_entity") != entity)
        previous = subject(NativeHistoryObjectKind::Entity, number("former_entity"));
    else { translated = true; break; }
    if (!previous) return std::nullopt;
    auto ownership = apply("formerly owned by {n}", {*previous});
    if (!ownership) return std::nullopt;
    append_clause(result, *ownership);
    translated = true;
    break;
}
case 120: { // hf_preach
    auto actor = subject(NativeHistoryObjectKind::Figure, number("speaker"));
    if (!actor) return std::nullopt;
    join(result, *actor);
    if (number("site") != -1) {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        auto location = apply("at {p}", {*site});
        if (!location) return std::nullopt;
        join(result, *location);
    }
    const int32_t topic = number("topic");
    if (topic == 11 || topic == 12) {
        auto audience = subject(NativeHistoryObjectKind::Entity, number("audience"));
        auto target = subject(NativeHistoryObjectKind::Entity, number("target"));
        if (!audience || !target) return std::nullopt;
        auto sermon = apply("preached to {a}", {*audience});
        auto message = apply(topic == 11 ? ", inveighing against {p}" :
            ", urging love be shown to {p}", {*target});
        if (!sermon || !message) return std::nullopt;
        join(result, *sermon);
        append_clause(result, *message);
    }
    // Other native meeting topics print no predicate or entity references.
    translated = true;
    break;
}
case 122: { // entity_breach_feature_layer
    auto actor = subject(NativeHistoryObjectKind::Entity, number("site_civ"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    auto layer = subject(NativeHistoryObjectKind::Underground, number("layer"));
    if (!actor || !site || !layer) return std::nullopt;
    // This formatter tests only the sentinel; equal IDs still show ownership.
    if (number("civ") != -1) {
        auto civ = subject(NativeHistoryObjectKind::Entity, number("civ"));
        if (!civ) return std::nullopt;
        actor = apply("{p} of {p}", {*actor, *civ});
        if (!actor) return std::nullopt;
    }
    auto action = apply("breached {p} at {p}", {*layer, *site});
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 123: { // entity_alliance_formed
    const auto &ids = numbers("joining_entities");
    Pieces allies;
    if (ids.size() >= 3) {
        auto groups = term("several groups");
        if (!groups) return std::nullopt;
        allies = std::move(*groups);
        const int32_t focus = context_number("entity_id");
        if (focus != -1 && std::find(ids.begin(), ids.end(), focus) != ids.end()) {
            auto entity = subject(NativeHistoryObjectKind::Entity, focus);
            auto included = entity ? apply(", including {a}", {*entity}) : std::nullopt;
            if (!included) return std::nullopt;
            join(allies, *included);
        }
    } else if (!ids.empty()) {
        auto first = subject(NativeHistoryObjectKind::Entity, ids.front());
        if (!first) return std::nullopt;
        allies = std::move(*first);
        if (ids.size() == 2) {
            auto second = subject(NativeHistoryObjectKind::Entity, ids.back());
            auto both = second ? apply("{p} and {p}", {allies, *second}) : std::nullopt;
            if (!both) return std::nullopt;
            allies = std::move(*both);
        }
    }
    auto entity = subject(NativeHistoryObjectKind::Entity, number("entity"));
    auto pledge = entity ? apply("swore to support {p}", {*entity}) : std::nullopt;
    auto condition = apply("in war if the latter did likewise", {});
    auto details = diplomacy();
    auto stop = apply(".", {});
    if (!pledge || !condition || !details || !stop) return std::nullopt;
    join(result, allies);
    join(result, *pledge);
    append_clause(result, *condition);
    if (!details->empty()) { join(result, *stop); join(result, *details); }
    translated = true;
    break;
}
case 124: { // hf_ransomed
    auto actor = subject(NativeHistoryObjectKind::Figure, number("ransomer"));
    auto captive = subject(NativeHistoryObjectKind::Figure, number("ransomed"));
    if (!actor || !captive) return std::nullopt;
    const int32_t payer_histfig = number("payer_histfig"), payer_entity = number("payer_entity");
    std::optional<Pieces> action;
    if (payer_histfig == -1 && payer_entity == -1) {
        action = apply("Native ransom: released {n} for ransom", {*captive});
    } else {
        std::optional<Pieces> payer;
        if (payer_histfig != -1) {
            payer = subject(NativeHistoryObjectKind::Figure, payer_histfig);
            if (!payer) return std::nullopt;
            if (payer_entity != -1) {
                auto owner = subject(NativeHistoryObjectKind::Entity, payer_entity);
                if (!owner) return std::nullopt;
                payer = apply("{n} of {p}", {*payer, *owner});
            }
        } else {
            payer = subject(NativeHistoryObjectKind::Entity, payer_entity);
        }
        if (!payer) return std::nullopt;
        action = apply("ransomed {n} to {a}", {*captive, *payer});
    }
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    if (number("site") != -1) {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        auto move = apply("was sent to {p}", {*site});
        auto stop = apply(".", {});
        if (!move || !stop) return std::nullopt;
        join(result, *stop);
        join(result, *captive);
        join(result, *move);
    }
    translated = true;
    break;
}
case 125: { // hf_enslaved
    auto actor = subject(NativeHistoryObjectKind::Figure, number("seller"));
    auto captive = subject(NativeHistoryObjectKind::Figure, number("enslaved"));
    auto payer = subject(NativeHistoryObjectKind::Entity, number("payer_entity"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    if (!actor || !captive || !payer || !site) return std::nullopt;
    auto action = apply("sold {n} to {p} in {p}", {*captive, *payer, *site});
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 126: { // sabotage
    auto actor = subject(NativeHistoryObjectKind::Figure, number("saboteur"));
    if (!actor) return std::nullopt;
    std::string key;
    std::vector<Pieces> fields;
    const int32_t target_histfig = number("target_histfig"), target_entity = number("target_entity");
    if (target_histfig == -1 && target_entity == -1) {
        // The native formatter leaves its target blank for this combination.
        key = "sabotaged activities";
    } else {
        auto target = target_histfig != -1 ? subject(NativeHistoryObjectKind::Figure, target_histfig) :
            subject(NativeHistoryObjectKind::Entity, target_entity);
        if (!target) return std::nullopt;
        key = "sabotaged the activities of {p}";
        fields.push_back(*target);
    }
    if (number("site") != -1) {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        key += " at {p}";
        fields.push_back(*site);
    }
    auto action = apply(key, fields);
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
case 127: { // entity_overthrown
    const int32_t instigator_id = number("instigator");
    auto actor = subject(NativeHistoryObjectKind::Figure, instigator_id);
    auto target = subject(NativeHistoryObjectKind::Entity, number("entity"));
    if (!actor || !target) return std::nullopt;
    if (number("overthrown") != -1) {
        auto former = subject(NativeHistoryObjectKind::Figure, number("overthrown"));
        if (!former) return std::nullopt;
        target = apply("{n} of {p}", {*former, *target});
        if (!target) return std::nullopt;
    }
    auto action = apply("toppled the government of {a}", {*target});
    if (!action) return std::nullopt;
    std::string key;
    std::vector<Pieces> fields;
    if (number("successor") == instigator_id) {
        key = "and assumed control";
    } else {
        auto successor = subject(NativeHistoryObjectKind::Figure, number("successor"));
        if (!successor) return std::nullopt;
        key = "and placed {a} in power";
        fields.push_back(*successor);
    }
    if (number("site") != -1) {
        auto site = subject(NativeHistoryObjectKind::Site, number("site"));
        if (!site) return std::nullopt;
        key += " in {p}";
        fields.push_back(*site);
    }
    auto control = apply(key, fields);
    if (!control) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    join(result, *control);
    const auto &conspirators = numbers("conspirators");
    if (!conspirators.empty()) {
        std::optional<Pieces> supporters;
        for (size_t index = 0; index < conspirators.size(); ++index) {
            auto conspirator = subject(NativeHistoryObjectKind::Figure, conspirators[index]);
            if (!conspirator) return std::nullopt;
            if (!supporters) supporters = std::move(conspirator);
            else supporters = apply(index + 1 == conspirators.size() ?
                "{a} and {a}" : "{a}, {a}", {*supporters, *conspirator});
            if (!supporters) return std::nullopt;
        }
        auto support = apply("The support of {a} was crucial to the coup", {*supporters});
        auto stop = apply(".", {});
        if (!support || !stop) return std::nullopt;
        join(result, *stop);
        join(result, *support);
    }
    translated = true;
    break;
}
case 128: // hfs_formed_intrigue_relationship
case 129: { // failed_intrigue_corruption
    const bool supported = number("support.present") != 0;
    const bool has_intrigue = number("intrigue.present") != 0;
    const auto participant = [&](const char *person_key, const char *identity_key) -> std::optional<Pieces> {
        auto person = subject(NativeHistoryObjectKind::Figure, number(person_key));
        if (!person) return std::nullopt;
        if (number(identity_key) != -1) {
            auto alias = identity(number(identity_key), identity_key);
            auto named = alias ? apply(", as {a}", {*alias}) : std::nullopt;
            if (!named) return std::nullopt;
            join(*person, *named);
        }
        return person;
    };
    auto corruptor = participant("corruptor", "corruptor_identity");
    auto target = participant("target", "target_identity");
    if (!corruptor || !target) return std::nullopt;
    if (has_intrigue) {
        const char *key = "";
        switch (number("intrigue.target_relationship")) {
        case 0: key = "childhood friend {n}"; break;
        case 1: key = "comrade-in-arms {n}"; break;
        case 4: key = "lover {n}"; break;
        case 6: key = "fellow scholar {n}"; break;
        case 7: key = "fellow artist {n}"; break;
        case 8: key = "fellow athlete {n}"; break;
        case 17: key = "spouse {n}"; break;
        case 18: key = "mother {n}"; break;
        case 19: key = "father {n}"; break;
        case 20: key = "master {n}"; break;
        case 21: key = "apprentice {n}"; break;
        case 22: key = "companion {n}"; break;
        case 23: key = "ex-spouse {n}"; break;
        case 24: key = "neighbor {n}"; break;
        case 25:
            switch (number("intrigue.target_entity_type")) {
            case 5: key = "fellow believer {n}"; break;
            case 6: key = "fellow order member {n}"; break;
            case 8: key = "troupemate {n}"; break;
            case 9: key = "fellow company member {n}"; break;
            case 10: key = "guildmate {n}"; break;
            default: break;
            }
            break;
        default: break;
        }
        if (*key) target = apply(key, {*target});
        if (!target) return std::nullopt;
    }
    const bool failed = event.native_type == 129 || (has_intrigue && !(number("intrigue.flags") & 1));
    const char *predicate = failed ? "attempted to corrupt {a}" :
        supported && number("support.circumstance") == 257 ? "subordinated {a}" : "corrupted {a}";
    auto action = apply(predicate, {*target});
    if (!action) return std::nullopt;
    join(result, *corruptor);
    join(result, *action);
    const char *motive_key = "";
    bool show_place = false;
    if (!supported) {
        motive_key = "in order to have an agent in {p}";
        show_place = true;
    } else if (has_intrigue && number("intrigue.action") != -1) {
        switch (number("intrigue.action")) {
        case 0: motive_key = "in order to have law enforcement look the other way in {p}"; break;
        case 1: motive_key = "in order to have someone to act on plots and schemes in {p}"; break;
        case 2: motive_key = "in order to have an agent in {p}"; break;
        case 3: motive_key = "in order to secure embezzled funds in {p}"; break;
        default: break;
        }
        show_place = true;
    } else if (number("support.circumstance") == 257) {
        auto entity = subject(NativeHistoryObjectKind::Entity, number("support.circumstance_data"));
        auto membership = entity ? apply("as a member of {p}", {*entity}) : std::nullopt;
        if (!membership) return std::nullopt;
        append_clause(result, *membership);
        motive_key = "toward the fulfillment of plots and schemes in {p}";
        show_place = true;
    }
    if (show_place) {
        Pieces place;
        if (number("site") != -1) {
            auto site = subject(NativeHistoryObjectKind::Site, number("site"));
            if (!site) return std::nullopt;
            join(place, *site);
        }
        if (number("layer") != -1 || number("region") != -1) {
            auto location = number("layer") != -1 ? subject(NativeHistoryObjectKind::Underground, number("layer")) :
                subject(NativeHistoryObjectKind::Region, number("region"));
            if (!location) return std::nullopt;
            join(place, *location);
        }
        if (number("site") == -1 && number("layer") == -1 && number("region") == -1) {
            auto wilds = term("the wilds");
            if (!wilds) return std::nullopt;
            place = std::move(*wilds);
        }
        if (*motive_key) {
            auto motive = apply(motive_key, {place});
            if (!motive) return std::nullopt;
            append_clause(result, *motive);
        } else join(result, place);
    }
    auto details = diplomacy();
    auto stop = apply(".", {});
    if (!details || !stop) return std::nullopt;
    if (!details->empty()) { join(result, *stop); join(result, *details); }
    translated = true;
    break;
}
case 132: { // hf_interrogated
    auto target = subject(NativeHistoryObjectKind::Figure, number("target"));
    if (!target) return std::nullopt;
    const int32_t flags = number("interrogation_flags");
    std::string arrest_key = (flags & 1) ? "was recognized and arrested" : "was arrested";
    std::vector<Pieces> arrest_fields;
    if (number("arresting_entity") != -1) {
        auto entity = subject(NativeHistoryObjectKind::Entity, number("arresting_entity"));
        if (!entity) return std::nullopt;
        arrest_key += " by {a}";
        arrest_fields.push_back(*entity);
    }
    auto arrest = apply(arrest_key, arrest_fields);
    if (!arrest) return std::nullopt;
    join(result, *target);
    join(result, *arrest);
    result.push_back(piece("。", neutral));
    const auto &ids = numbers("implicated");
    std::string key;
    if (!ids.empty()) key = "After being interrogated";
    else key = (flags & 2) ? "Despite the interrogation" : "After enduring an interrogation";
    std::vector<Pieces> fields;
    if (number("interrogator") != -1) {
        auto interrogator = subject(NativeHistoryObjectKind::Figure, number("interrogator"));
        if (!interrogator) return std::nullopt;
        key += " by {a}";
        fields.push_back(*interrogator);
    }
    key += ", {a}";
    fields.push_back(*target);
    if (!ids.empty()) {
        const int32_t focus = context_number("histfig_id");
        std::vector<int32_t> ordered;
        // babe0 narrows to 64 entries before scanning; it is not a full
        // binary search, including when a short native vector is unsorted.
        size_t begin = 0, count = ids.size();
        while (count > 64) {
            const size_t half = count / 2, middle = begin + half;
            if (focus >= ids[middle]) begin = middle;
            count -= half;
        }
        bool contains_focus = false;
        for (size_t index = begin; index < begin + count; ++index)
            if (ids[index] == focus) { contains_focus = true; break; }
        if (focus != -1 && contains_focus) ordered.push_back(focus);
        for (int32_t id : ids) if (id != focus) ordered.push_back(id);
        if (ordered.empty()) return std::nullopt;
        auto people = subject(NativeHistoryObjectKind::Figure, ordered.front());
        if (!people) return std::nullopt;
        for (size_t index = 1; index < ordered.size(); ++index) {
            auto person = subject(NativeHistoryObjectKind::Figure, ordered[index]);
            if (!person) return std::nullopt;
            people = apply(index + 1 == ordered.size() ? "{a} and {a}" : "{a}, {a}", {*people, *person});
            if (!people) return std::nullopt;
        }
        key += " implicated {a}";
        fields.push_back(*people);
    } else key += (flags & 2) ? " refused to reveal anything and was released" : " was released";
    auto outcome = apply(key, fields);
    if (!outcome) return std::nullopt;
    join(result, *outcome);
    if (!ids.empty() && (flags & 2)) {
        auto withheld = apply("but did not reveal everything", {});
        if (!withheld) return std::nullopt;
        append_clause(result, *withheld);
    }
    translated = true;
    break;
}
