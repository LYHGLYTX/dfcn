case 121: {
    std::optional<Pieces> actor;
    if (number("persecutor") != -1) {
        actor = subject(NativeHistoryObjectKind::Figure, number("persecutor"));
        if (!actor) return std::nullopt;
    }
    if (number("persecutor_entity") != -1 || number("persecutor") != -1) {
        auto entity = subject(NativeHistoryObjectKind::Entity, number("persecutor_entity"));
        if (!entity) return std::nullopt;
        actor = actor ? apply("{n} of {p}", {*actor, *entity}) : entity;
        if (!actor) return std::nullopt;
    }
    auto target = subject(NativeHistoryObjectKind::Entity, number("target_entity"));
    auto site = subject(NativeHistoryObjectKind::Site, number("site"));
    auto action = target ? apply("persecuted {a}", {*target}) : std::nullopt;
    auto where = site ? apply("in {p}", {*site}) : std::nullopt;
    if (!action || !where) return std::nullopt;
    if (actor) join(result, *actor);
    join(result, *where);
    join(result, *action);
    result.push_back(piece("。", neutral));
    const auto &expelled = numbers("expelled"), &counts = numbers("expelled_counts");
    const auto &confiscated = numbers("confiscated"), &destroyed = numbers("destroyed");
    const int focus = context_number("histfig_id");
    const auto contains = [&](const std::vector<int32_t> &ids) {
        size_t begin = 0, count = ids.size();
        while (count > 64) {
            const size_t half = count / 2, middle = begin + half;
            if (focus >= ids[middle]) begin = middle;
            count -= half;
        }
        return focus != -1 && std::find(ids.begin() + begin, ids.begin() + begin + count, focus) !=
            ids.begin() + begin + count;
    };
    Pieces aftermath;
    if (!expelled.empty() || !counts.empty() || !confiscated.empty()) {
        uint32_t bits = static_cast<uint32_t>(expelled.size());
        for (int count : counts) bits += static_cast<uint32_t>(count);
        int32_t count = 0;
        std::memcpy(&count, &bits, sizeof(count));
        std::optional<Pieces> consequence;
        if (count > 0) {
            if (contains(expelled)) {
                auto who = subject(NativeHistoryObjectKind::Figure, focus);
                const char *key = count >= 1000 ? "was expelled with a thousand or more others" :
                    count >= 500 ? "was expelled with five hundred or more others" :
                    count >= 100 ? "was expelled with a hundred or more others" :
                    count >= 24 ? "was expelled with dozens of others" :
                    count >= 6 ? "was expelled with many others" :
                    count >= 3 ? "was expelled with some others" : "was expelled";
                auto expulsion = apply(key, {});
                if (!who || !expulsion) return std::nullopt;
                consequence = *who;
                join(*consequence, *expulsion);
            } else if (count >= 6) {
                consequence = apply(count >= 1000 ? "A thousand or more people were expelled" :
                    count >= 500 ? "Five hundred or more people were expelled" :
                    count >= 100 ? "A hundred or more people were expelled" :
                    count >= 24 ? "Dozens of people were expelled" : "Several people were expelled", {});
            } else if (expelled.size() >= 2) {
                auto first = subject(NativeHistoryObjectKind::Figure, expelled[0]);
                auto second = subject(NativeHistoryObjectKind::Figure, expelled[1]);
                auto people = first && second ? apply("{a} and {a}", {*first, *second}) : std::nullopt;
                if (!people) return std::nullopt;
                if (count >= 4) consequence = apply("{a} and some others were expelled", {*people});
                else {
                    auto expulsion = apply("were expelled", {});
                    if (!expulsion) return std::nullopt;
                    consequence = *people;
                    join(*consequence, *expulsion);
                }
            } else if (expelled.size() == 1) {
                auto who = subject(NativeHistoryObjectKind::Figure, expelled.front());
                if (!who) return std::nullopt;
                if (count >= 3) consequence = apply("{a} and others were expelled", {*who});
                else {
                    auto expulsion = apply("was expelled", {});
                    if (!expulsion) return std::nullopt;
                    consequence = *who;
                    join(*consequence, *expulsion);
                }
            } else consequence = apply(count >= 2 ? "A few people were expelled" : "Somebody was expelled", {});
        } else if (contains(confiscated)) {
            auto who = subject(NativeHistoryObjectKind::Figure, focus);
            consequence = who ? apply("{n}'s property was confiscated", {*who}) : std::nullopt;
        } else consequence = apply("Most property was confiscated", {});
        if (!consequence) return std::nullopt;
        join(aftermath, *consequence);
    }
    if (!destroyed.empty()) {
        std::optional<Pieces> destruction;
        if (destroyed.size() >= 3) destruction = apply("Several major structures were destroyed", {});
        else {
            auto buildings = structure(number("site"), destroyed.front());
            if (!buildings) return std::nullopt;
            if (destroyed.size() == 2) {
                auto second = structure(number("site"), destroyed[1]);
                buildings = second ? apply("{a} and {a}", {*buildings, *second}) : std::nullopt;
            }
            destruction = buildings ? apply(destroyed.size() == 2 ? "{a} were destroyed" :
                "{p} was destroyed", {*buildings}) : std::nullopt;
        }
        if (!destruction) return std::nullopt;
        if (aftermath.empty()) join(aftermath, *destruction);
        else append_clause(aftermath, *destruction);
    }
    if (number("shrines") > 0) {
        const bool many = number("shrines") >= 25;
        auto desecration = apply(destroyed.empty() ? many ? "Several sacred sites were desecrated" :
            "Some sacred sites were desecrated" : many ? "along with several smaller sacred sites" :
            "along with smaller sacred sites", {});
        if (!desecration) return std::nullopt;
        if (aftermath.empty()) join(aftermath, *desecration);
        else append_clause(aftermath, *desecration);
    }
    join(result, aftermath);
    translated = true;
    break;
}
case 130:
case 131: {
    // Enum order comes from both native jump tables b7d6f0 / b7e5e8.
    static constexpr const char *crimes[] = {
        "production order violation", "export prohibition violation", "job order violation",
        "conspiracy to slow labor", "murder", "disorderly conduct", "building destruction",
        "vandalism", "theft", "robbery", "blood-drinking", "embezzlement", "attempted murder",
        "kidnapping", "attempted kidnapping", "attempted theft", "treason", "espionage", "bribery"
    };
    const int crime_id = number("crime");
    const bool known_crime = crime_id >= 0 && crime_id < static_cast<int>(std::size(crimes));
    auto crime = known_crime ? term(crimes[crime_id]) : std::optional<Pieces>(Pieces{});
    if (!crime) return std::nullopt;
    const auto person = [&](std::string_view key) {
        return subject(NativeHistoryObjectKind::Figure, number(key));
    };
    if (event.native_type == 131) {
        auto framer = person("framer"), target = person("target"), fooled = person("fooled");
        if (!framer || !target || !fooled) return std::nullopt;
        auto action = known_crime ? apply("attempted to frame {a} for {s}", {*target, *crime}) :
            apply("attempted to frame {n}", {*target});
        if (!action) return std::nullopt;
        join(result, *framer);
        join(result, *action);
        if (number("behest") != -1 && number("behest") != number("framer")) {
            auto instigator = person("behest");
            auto clause = instigator ? apply("at the behest of {a}", {*instigator}) : std::nullopt;
            if (!clause) return std::nullopt;
            append_clause(result, *clause);
        }
        if (number("convicter") != -1) {
            auto entity = subject(NativeHistoryObjectKind::Entity, number("convicter"));
            if (!entity) return std::nullopt;
            fooled = apply("{a} and {a}", {*fooled, *entity});
        }
        auto deception = fooled ? apply("by fooling {a}", {*fooled}) : std::nullopt;
        auto outcome = apply("with fabricated evidence, but nothing came of it", {});
        if (!deception || !outcome) return std::nullopt;
        append_clause(result, *deception);
        append_clause(result, *outcome);
    } else {
        const int flags = number("plot_flags"), punishment = number("punishment_flags");
        if (number("recognized_by") != -1) {
            std::string key = "after being recognized and arrested";
            std::vector<Pieces> fields;
            if (number("recognized_by") != number("convicter")) {
                auto authority = subject(NativeHistoryObjectKind::Entity, number("recognized_by"));
                if (!authority) return std::nullopt;
                key += " by {a}";
                fields.push_back(*authority);
            }
            auto introduction = apply(key, fields);
            if (!introduction) return std::nullopt;
            join(result, *introduction);
            result.push_back(piece("，", neutral));
        } else if (flags & 0x1e) {
            std::optional<Pieces> surveillance;
            if (flags & 2) surveillance = apply("due to ongoing surveillance as the plot unfolded", {});
            else {
                Pieces watched;
                for (const auto &[bit, role, key] : {
                        std::tuple{8, "contact", "the contact {a}"},
                        std::tuple{4, "coconspirator", "a coconspirator, {a}"},
                        std::tuple{16, "target", "the target {a}"}}) {
                    if (!(flags & bit)) continue;
                    auto who = person(role);
                    auto label = who ? apply(key, {*who}) : std::nullopt;
                    if (!label) return std::nullopt;
                    if (watched.empty()) watched = *label;
                    else {
                        auto combined = apply("{a} and {a}", {watched, *label});
                        if (!combined) return std::nullopt;
                        watched = *combined;
                    }
                }
                surveillance = apply("due to ongoing surveillance on {a} as the plot unfolded", {watched});
            }
            if (!surveillance) return std::nullopt;
            join(result, *surveillance);
            result.push_back(piece("，", neutral));
        }
        auto convicted = person("convicted");
        if (!convicted) return std::nullopt;
        std::optional<Pieces> authorities;
        if (number("convicter") != -1) {
            authorities = subject(NativeHistoryObjectKind::Entity, number("convicter"));
            if (!authorities) return std::nullopt;
        }
        if (number("corrupt") != -1) {
            auto who = person("corrupt");
            auto corrupt = who ? apply("the corrupt {a}", {*who}) : std::nullopt;
            if (!corrupt) return std::nullopt;
            authorities = authorities ? apply("{a} and {a}", {*authorities, *corrupt}) : corrupt;
            if (!authorities) return std::nullopt;
        }
        std::string key = number("recognized_by") != -1 ? "confessed and was " : "was ";
        if (flags & 1) key += "wrongfully ";
        key += "convicted";
        std::vector<Pieces> fields;
        if (known_crime) {
            key += (flags & 32) ? " as a go-between in a conspiracy to commit {s}" : " of {s}";
            fields.push_back(*crime);
        }
        if (authorities) {
            key += " by {a}";
            fields.push_back(*authorities);
        }
        auto conviction = apply(key, fields);
        if (!conviction) return std::nullopt;
        join(result, *convicted);
        join(result, *conviction);
        if (number("fooled") != -1 && number("framer") != -1) {
            auto framer = person("framer"), fooled = person("fooled");
            auto evidence = framer && fooled ?
                apply("after {a} fooled {a} with fabricated evidence", {*framer, *fooled}) : std::nullopt;
            if (!evidence) return std::nullopt;
            append_clause(result, *evidence);
        }
        if (number("behest") != -1 && number("behest") != number("framer") &&
                number("behest") != number("corrupt")) {
            auto instigator = person("behest");
            auto scheme = instigator ? apply(number("framer") == -1 ?
                "through the machinations of {a}" : "at the behest of {a}", {*instigator}) : std::nullopt;
            if (!scheme) return std::nullopt;
            append_clause(result, *scheme);
        }
        const auto punish = [&](std::string_view source, int count = -1) {
            auto clause = apply(source, count < 0 ? std::vector<Pieces>{} :
                std::vector<Pieces>{Pieces{piece(std::to_string(count), neutral)}});
            if (!clause) return false;
            append_clause(result, *clause);
            return true;
        };
        if (punishment & 4) {
            if (!punish("and sentenced to death")) return std::nullopt;
        } else {
            const int strokes = number("hammerstrokes"), months = number("prison_months");
            if (strokes > 0) {
                if (!punish(strokes == 1 ? "sentenced to one hammerstroke" :
                    "sentenced to {c} hammerstrokes", strokes == 1 ? -1 : strokes)) return std::nullopt;
            } else if ((punishment & 1) && !punish("beaten")) return std::nullopt;
            if (punishment & 2) {
                if (!punish("and exiled")) return std::nullopt;
            } else if (punishment & 8) {
                if (!punish("and would have been imprisoned but for lack of accommodations"))
                    return std::nullopt;
            } else if (months > 0) {
                if (months == 1 || months == 12) {
                    if (!punish(months == 1 ? "and imprisoned for a term of one month" :
                            "and imprisoned for a term of one year")) return std::nullopt;
                } else if (months < 24) {
                    if (!punish("and imprisoned for a term of {c} months", months)) return std::nullopt;
                } else if (!punish(months % 12 ? "and imprisoned for a term of more than {c} years" :
                        "and imprisoned for a term of {c} years", months / 12)) return std::nullopt;
            }
        }
        const auto &ids = numbers("implicated");
        if (!ids.empty()) {
            const int focus = context_number("histfig_id");
            size_t begin = 0, count = ids.size();
            while (count > 64) {
                const size_t half = count / 2, middle = begin + half;
                if (focus >= ids[middle]) begin = middle;
                count -= half;
            }
            std::vector<int32_t> ordered;
            if (focus != -1 && std::find(ids.begin() + begin, ids.begin() + begin + count, focus) !=
                    ids.begin() + begin + count) ordered.push_back(focus);
            for (int32_t id : ids) if (id != focus) ordered.push_back(id);
            if (ordered.empty()) return std::nullopt;
            auto implicated = subject(NativeHistoryObjectKind::Figure, ordered.front());
            for (size_t index = 1; implicated && index < ordered.size(); ++index) {
                auto who = subject(NativeHistoryObjectKind::Figure, ordered[index]);
                implicated = who ? apply(index + 1 == ordered.size() ? "{a} and {a}" : "{a}, {a}",
                    {*implicated, *who}) : std::nullopt;
            }
            auto admission = implicated ? apply("implicated {a}", {*implicated}) : std::nullopt;
            auto interrogation = apply("during interrogation", {});
            if (!admission || !interrogation) return std::nullopt;
            result.push_back(piece("。", neutral));
            join(result, *convicted);
            join(result, *interrogation);
            join(result, *admission);
            if (flags & 64) {
                auto withheld = apply("but did not reveal everything", {});
                if (!withheld) return std::nullopt;
                append_clause(result, *withheld);
            }
        } else if (flags & 64) {
            auto silence = apply("revealed nothing during interrogation", {});
            if (!silence) return std::nullopt;
            result.push_back(piece("。", neutral));
            join(result, *convicted);
            join(result, *silence);
        }
    }
    translated = true;
    break;
}
