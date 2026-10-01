case 115: { // add_hf_entity_honor; all native requirement combinations.
    auto actor = subject(NativeHistoryObjectKind::Figure, number("histfig"));
    auto entity = subject(NativeHistoryObjectKind::Entity, number("entity"));
    auto title = term(text("honor.title"));
    if (!actor || !entity || !title) return std::nullopt;
    std::string key = "received the title of {s} in {p}";
    std::vector<Pieces> arguments{*title, *entity};
    std::vector<std::string> conditions;
    const auto count = [&](int32_t value) { return Pieces{piece(std::to_string(value), neutral)}; };
    if ((number("honor.flags") & 1) != 0) key += " given to all new members";
    else {
        if (number("honor.rating") > 0) {
            const int32_t mask = number("honor.skill_mask");
            const char *skill = nullptr;
            if ((mask & 3) == 3) skill = "a weapon or technique";
            else if (mask & 1) skill = "a melee weapon or technique";
            else if (mask & 2) skill = "a ranged weapon";
            else {
                switch (number("honor.skill")) {
                case 37: skill = "the axe"; break;
                case 38: skill = "the sword"; break;
                case 40: skill = "the mace"; break;
                case 41: skill = "the hammer"; break;
                case 42: skill = "the spear"; break;
                case 43: skill = "the crossbow"; break;
                case 44: skill = "the shield"; break;
                case 49: skill = "the pike"; break;
                case 50: skill = "the whip"; break;
                case 51: skill = "the bow"; break;
                case 52: skill = "the blowgun"; break;
                case 99: skill = "grappling"; break;
                case 100: skill = "the tooth"; break;
                case 101: skill = "strikes"; break;
                case 102: skill = "kicks"; break;
                case 103: skill = "dodging"; break;
                default: break;
                }
            }
            if (!skill) return std::nullopt;
            auto label = term(skill);
            if (!label) return std::nullopt;
            conditions.emplace_back("attaining sufficient skill with {s}");
            arguments.push_back(*label);
        }
        const int32_t battles = number("honor.battles"), kills = number("honor.kills"), years = number("honor.years");
        if (battles > 0) {
            conditions.emplace_back(battles == 1 ? "serving in combat" : "participating in {d} battles");
            if (battles != 1) arguments.push_back(count(battles));
        }
        // The supported native PE intentionally tests battles at +3c for
        // these singular arms, while its numerical forms read +38/+40.
        if (kills > 0) {
            conditions.emplace_back(battles == 1 ? "slaying an enemy" : "slaying {d} enemies");
            if (battles != 1) arguments.push_back(count(kills));
        }
        if (years > 0) {
            conditions.emplace_back(battles == 1 ? "being a member for a year" : "{d} years of membership");
            if (battles != 1) arguments.push_back(count(years));
        }
        if (!conditions.empty()) {
            key += " after ";
            for (size_t index = 0; index < conditions.size(); ++index) {
                if (index) key += index + 1 == conditions.size() ?
                    (conditions.size() >= 3 ? ", and " : " and ") : ", ";
                key += conditions[index];
            }
        }
    }
    std::optional<Pieces> action;
    if (key == "received the title of {s} in {p}") {
        action = apply("received the title of {s}", {*title});
        auto affiliation = apply("in {p}", {*entity});
        if (!action || !affiliation) return std::nullopt;
        append_clause(*action, *affiliation);
    } else action = apply(key, arguments);
    if (!action) return std::nullopt;
    join(result, *actor);
    join(result, *action);
    translated = true;
    break;
}
