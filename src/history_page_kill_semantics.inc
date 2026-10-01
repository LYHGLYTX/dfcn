case NativeHistoryPageKind::KillSummary: {
    const int32_t kind = number("kill_kind");
    if (kind == 0) {
        const int32_t category = number("category"), count = number("count");
        const char *key = category == 1 ? "{c} Notable Kills" :
            category == 2 ? "{c} Other Kills" : "{c} Kills";
        return apply(key, {Pieces{piece(std::to_string(count), neutral)}});
    }
    if (kind == 1 || kind == 2 || kind == 4) {
        auto victim = event.actor_id >= 0
            ? subject(NativeHistoryObjectKind::Figure, event.actor_id)
            : term("Unknown creature");
        if (!victim) return std::nullopt;
        if (kind == 2) {
            auto when = date_phrase(event.year, event.seconds);
            if (!when) return std::nullopt;
            when->push_back(piece("，", neutral));
            join(*when, *victim);
            return when;
        }
        for (const auto &[field, key] : {std::pair{"born", "b. {d}"}, std::pair{"died", "d. {d}"}}) {
            const int32_t year = number(field);
            if (year < 1) continue;
            auto date = apply(key, {Pieces{piece(std::to_string(year), neutral)}});
            if (!date) return std::nullopt;
            victim->push_back(piece("，", neutral));
            join(*victim, *date);
        }
        if (kind == 4) {
            const int32_t count = number("count");
            const auto kills = apply(count == 1 ? "{c} kill" : "{c} kills",
                {Pieces{piece(std::to_string(count), neutral)}});
            if (!kills) return std::nullopt;
            victim->push_back(piece("，", neutral));
            join(*victim, *kills);
        }
        return victim;
    }
    if (kind != 3) return std::nullopt;
    auto species = translate_creature_descriptor(text("species"));
    if (!species) return std::nullopt;
    const int32_t sex = number("sex");
    if (sex == 0 || sex == 1) *species += sex == 0 ? "（♀）" : "（♂）";
    std::optional<Pieces> location;
    if (event.site_id >= 0) location = subject(NativeHistoryObjectKind::Site, event.site_id, false);
    else if (number("region") >= 0) location = subject(NativeHistoryObjectKind::Region, number("region"), false);
    else if (number("layer") >= 0) location = subject(NativeHistoryObjectKind::Underground, number("layer"), false);
    else location = term("the wilds");
    if (!location) return std::nullopt;
    return apply("{c} {s} in {p}", {Pieces{piece(std::to_string(number("count")), neutral)},
        Pieces{piece(*species, neutral)}, *location});
}
