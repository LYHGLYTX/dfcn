// Shared native intrigue_corruption paragraph, RVA 2a81f0..2a9c5b.
const auto intrigue = [&](const std::string &prefix) -> std::optional<Pieces> {
    if (!number(prefix + "present")) return Pieces{};
    const auto value = [&](const char *key) { return number(prefix + key); };
    auto corruptor = subject(NativeHistoryObjectKind::Figure, value("corruptor"));
    auto target = subject(NativeHistoryObjectKind::Figure, value("target"));
    if (!corruptor || !target) return std::nullopt;
    Pieces paragraph;
    const auto add = [&](Pieces &destination, std::string_view key,
                         const std::vector<Pieces> &arguments = {}) {
        if (key.empty()) return true; // The original enum default emits nothing.
        auto parts = apply(key, arguments);
        if (!parts) return false;
        join(destination, *parts);
        return true;
    };
    const bool lured = value("lurer") != -1;
    const bool success = (value("flags") & 1) != 0;
    const bool misread = !success && (value("flags") & 2) != 0;
    if (lured) {
        auto lurer = subject(NativeHistoryObjectKind::Figure, value("lurer"));
        if (!lurer) return std::nullopt;
        join(paragraph, *lurer);
        if (!add(paragraph, "lured {a} to a meeting with {a}", {*target, *corruptor}) ||
            !add(paragraph, ", where the latter")) return std::nullopt;
    } else {
        join(paragraph, *corruptor);
        if (!add(paragraph, "met with {a}", {*target})) return std::nullopt;
    }
    if (!add(paragraph, misread ? (lured ? ", while completely misreading the situation," :
            "and, while completely misreading the situation,") : (lured ? "" : "and")))
        return std::nullopt;

    const int32_t method = value("method");
    static constexpr const char *methods[] = {
        "made a threat", "made flattering remarks", "pulled rank",
        "made a blackmail threat, due to embezzlement", "offered a bribe",
        "played for sympathy", "", "offered immortality",
    };
    if (method >= 0 && method < 8 && !add(paragraph, methods[method])) return std::nullopt;
    if ((method == 2 || method == 3) && value("position_present")) {
        const std::string &native_title = text(prefix + "position_title");
        auto title = native_title.empty() ? std::optional<Pieces>{Pieces{piece("", neutral)}} : office(native_title);
        auto entity = subject(NativeHistoryObjectKind::Entity, value("position_entity"));
        if (!title || !entity || !add(paragraph, method == 2 ? "as {a} of {p}" :
                "using the position {a} of {p}", {*title, *entity})) return std::nullopt;
    }
    if (method == 5 && value("offered_relationship") == 16) {
        auto deity = subject(NativeHistoryObjectKind::Figure, value("offered"));
        if (!deity || !add(paragraph, "by appealing to a shared worship of {a}", {*deity}))
            return std::nullopt;
    } else if (method == 6) {
        auto revenge = subject(NativeHistoryObjectKind::Figure, value("offered"));
        if (!revenge) return std::nullopt;
        const char *relationship = "";
        switch (value("offered_relationship")) {
        case 3: relationship = "a jealous grudge, {a}"; break;
        case 10: relationship = "a business rival, {a}"; break;
        case 11: relationship = "the persecutor {a}"; break;
        case 12: relationship = "a grudge, {a}"; break;
        case 13: relationship = "the tormentor {a}"; break;
        case 14: relationship = "the sacrilegious {a}"; break;
        default: break;
        }
        if (*relationship) revenge = apply(relationship, {*revenge});
        if (!revenge || !add(paragraph, "offered revenge upon {a}", {*revenge})) return std::nullopt;
    }
    if (!add(paragraph, ".")) return std::nullopt;

    const int32_t facet = value("facet"), facet_roll = value("facet_roll"),
        value_kind = value("value"), value_roll = value("value_roll"),
        emotion = value("emotion"), emotion_roll = value("emotion_roll");
    // Exact jump-table projections at 2a9cd8 (positive main response) and
    // 2a9d18/58/98/d8 + 2a9e18 (the other five facet branches).
    static constexpr unsigned char positive_facets[] = {
        0,10,10,10,1,10,1,2,10,10,10,10,10,10,10,10,3,4,
        5,6,10,10,10,7,8,10,10,4,10,10,10,10,10,10,10,9,
    };
    static constexpr unsigned char grouped_facets[] = {
        0,6,6,6,0,6,0,1,6,6,6,6,6,6,6,6,2,0,
        3,0,6,6,6,4,0,6,6,0,6,6,6,6,6,6,6,5,
    };
    const int positive_facet = facet >= 2 && facet <= 37 ? positive_facets[facet - 2] : 10;
    const int grouped_facet = facet >= 2 && facet <= 37 ? grouped_facets[facet - 2] : 6;
    const auto facet_key = [&](bool positive, bool concession) -> const char * {
        if (positive && !concession) {
            switch (positive_facet) {
            case 0: return method == 7 ? "was too envious of others to face death and agreed" : "";
            case 1: return method == 7 ? "was too unsettled by death to face it and agreed" : "";
            case 2: return "was overcome by greed";
            case 3: return method == 7 ? "gave in to fear of death" : "was too afraid not to comply";
            case 4: return method == 7 ? "could not accept the uncertainty following death and agreed" : "";
            case 5: return method == 7 ? "was too vain to accept death and agreed" : "succumbed to vanity";
            case 6: return method == 7 ? "was too ambitious to accept death and agreed" : "";
            case 7: return "desired vengeance and willingly complied";
            case 8: return method == 7 ? "was too proud to accept death and agreed" : "";
            case 9: return "was swayed by the emotional appeal";
            default: return "";
            }
        }
        if (positive) {
            switch (grouped_facet) {
            case 0: return method == 7 ? "an unwillingness to accept death" : "";
            case 1: return "feelings of greed";
            case 2: return method == 7 ? "fearing of death" : "being afraid";
            case 3: return method == 7 ? "an unwillingness to accept death" : "feelings of vanity";
            case 4: return "a desire for vengeance";
            case 5: return "being swayed by the emotional appeal";
            default: return "";
            }
        }
        switch (grouped_facet) {
        case 0: return method == 7 ? (concession ? "being willing to accept death" :
            "was willing to accept eventual death and refused") : "";
        case 1: return concession ? "feeling no avarice" : "felt no avarice and refused";
        case 2:
            if (emotion == 3 && (concession || emotion_roll > 0))
                return concession ? "being unafraid in the moment" : "was unafraid in the moment";
            if (method == 7) return concession ? "being unafraid of death" : "did not fear death and refused";
            return concession ? "being unafraid" : "was not afraid and refused";
        case 3:
            if (method == 7) return concession ? "being willing to accept death" : "was willing to accept eventual death and refused";
            if (method == 1) return concession ? "being unaffected by the comments" : "was unaffected by the comments and refused";
            return "";
        case 4: return concession ? "a lack of desire for vengeance" : "lacked a desire for vengeance and refused";
        case 5: return concession ? "being unswayed by the emotional appeal" : "was unswayed by the emotional appeal and refused";
        default: return "";
        }
    };
    const auto value_key = [&](bool positive, bool concession) -> const char * {
        if (value_kind == 0) return positive ? (concession ? "disdaining the law" :
            "spurned the law and agreed willingly") : (concession ? "valuing the law" : "valued the law and refused");
        if (value_kind == 4) return positive ? (concession ? "admiration of power" :
            "accepted in admiration of power") : (concession ? "loathing the powerful" : "loathed abuses of power and refused");
        return "";
    };
    const auto emotion_key = [&](bool positive, bool concession) -> const char * {
        static constexpr const char *positive_response[] = {
            "trusted {a} and agreed", "accepted out of loyalty to {a}", "agreed for love of {a}",
            "complied out of fear of {a}", "respected {a} and agreed",
        };
        static constexpr const char *negative_response[] = {
            "distrusted {a} and refused", "felt no loyalty to {a} and refused", "hated {a} and refused",
            "was unafraid of {a} and refused", "had no respect for {a} and refused",
        };
        static constexpr const char *positive_concession[] = {
            "trust of {a}", "loyalty toward {a}", "love of {a}", "fear of {a}", "respect of {a}",
        };
        static constexpr const char *negative_concession[] = {
            "distrust of {a}", "lack of loyalty toward {a}", "hatred of {a}",
            "lack of fear toward {a}", "lack of respect of {a}",
        };
        if (emotion < 0 || emotion > 4) return "";
        return concession ? (positive ? positive_concession[emotion] : negative_concession[emotion]) :
            (positive ? positive_response[emotion] : negative_response[emotion]);
    };
    // Tie priority is facet, then value, then relationship, for both signs.
    const int main = success ? (facet_roll > 0 && facet_roll >= emotion_roll && facet_roll >= value_roll ? 0 :
        value_roll > 0 && value_roll >= emotion_roll ? 1 : emotion_roll > 0 ? 2 : 3) :
        (facet_roll < 0 && facet_roll <= emotion_roll && facet_roll <= value_roll ? 0 :
        value_roll < 0 && value_roll <= emotion_roll ? 1 : emotion_roll < 0 ? 2 : 3);
    if (main == 3) {
        if (success && value("corruptor_ally_roll") > 0) {
            if (!add(paragraph, "Effective pressure to comply came from co-conspirators surrounding {a}.", {*target}))
                return std::nullopt;
        } else if (!success && value("target_ally_roll") > 0) {
            if (!add(paragraph, "Allies surrounding {a} raised their suspicions and the plan was foiled.", {*target}))
                return std::nullopt;
        } else if (!add(paragraph, success ? "The plan worked." : "The plan failed.")) return std::nullopt;
        return paragraph;
    }
    Pieces response, concessions;
    const char *response_key = main == 0 ? facet_key(success, false) :
        main == 1 ? value_key(success, false) : emotion_key(success, false);
    if (!add(response, response_key, main == 2 && *response_key ? std::vector<Pieces>{*corruptor} :
            std::vector<Pieces>{})) return std::nullopt;
    const auto concede = [&](std::string_view key, const std::vector<Pieces> &arguments = {}) {
        if (key.empty()) return true;
        Pieces reason;
        if (!add(reason, key, arguments)) return false;
        if (!concessions.empty()) concessions.push_back(piece("、", neutral));
        join(concessions, reason);
        return true;
    };
    const auto opposes = [&](int32_t roll) { return success ? roll < 0 : roll > 0; };
    // Every non-dominant opposing factor is kept, in the original order.
    if (main != 0 && opposes(facet_roll) && !concede(facet_key(!success, true))) return std::nullopt;
    if (main != 1 && opposes(value_roll) && !concede(value_key(!success, true))) return std::nullopt;
    if (main != 2 && opposes(emotion_roll)) {
        const char *key = emotion_key(!success, true);
        if (!concede(key, *key ? std::vector<Pieces>{*corruptor} : std::vector<Pieces>{})) return std::nullopt;
    }
    // Native NEG/CMOVS computes abs(int32), including the INT_MIN bit pattern.
    const auto native_abs = [](int32_t input) -> int32_t {
        const int32_t negated = static_cast<int32_t>(0u - static_cast<uint32_t>(input));
        return negated < 0 ? input : negated;
    };
    const int32_t resistance = native_abs(value("target_ally_roll")), assistance = native_abs(value("corruptor_ally_roll"));
    if ((success ? resistance > assistance : resistance < assistance) &&
        !concede(success ? "the efforts of surrounding allies to stop the plot" :
            "the efforts of co-conspirators to further the plot")) return std::nullopt;
    join(paragraph, *target);
    if (!concessions.empty() && !response.empty()) {
        if (!add(paragraph, "Native history intrigue concession {a} response {a}", {concessions, response}))
            return std::nullopt;
    } else {
        join(paragraph, response);
        if (!concessions.empty()) {
            if (!add(paragraph, ", despite")) return std::nullopt;
            join(paragraph, concessions);
        }
    }
    if (!add(paragraph, ".")) return std::nullopt;
    return paragraph;
};
(void)intrigue;
