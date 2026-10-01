// Direct selection of the reviewed negotiation templates by native fields.
// This intentionally never enters the announcement grammar recognizer.
const auto negotiation = [&](const std::string &prefix) -> std::optional<Pieces> {
    if (!number(prefix + "present")) return Pieces{};
    const auto value = [&](const char *key) { return number(prefix + key); };
    const auto render = [&](const char *scope, std::string_view key,
                            const std::vector<Pieces> &arguments = {}) {
        return scoped_apply(scope, key, arguments);
    };
    auto speaker = subject(NativeHistoryObjectKind::Figure, value("speaker"));
    auto recipient = subject(NativeHistoryObjectKind::Figure, value("recipient"));
    if (!speaker || !recipient) return std::nullopt;
    auto speaker_name = *speaker;
    auto recipient_name = *recipient;
    if (value("speaker_entity") != -1) {
        auto entity = subject(NativeHistoryObjectKind::Entity, value("speaker_entity"));
        if (!entity) return std::nullopt;
        speaker = render("negotiation-speaker", "{s} of {s}", {*speaker, *entity});
        if (!speaker) return std::nullopt;
    }
    if (value("recipient_entity") != -1) {
        auto affiliation = subject(NativeHistoryObjectKind::Entity, value("recipient_entity"));
        if (!affiliation) return std::nullopt;
        if (!text(prefix + "position_title").empty()) {
            auto title = office(text(prefix + "position_title"));
            auto owner = subject(NativeHistoryObjectKind::Entity, value("position_entity"));
            if (!title || !owner) return std::nullopt;
            recipient = value("position_entity") == value("recipient_entity") ?
                render("negotiation-recipient", "{s}, {s} of {s},", {*recipient, *title, *owner}) :
                render("negotiation-recipient", "{s}, {s} of {s}, representing {s},",
                    {*recipient, *title, *owner, *affiliation});
        } else recipient = render("negotiation-speaker", "{s} of {s}", {*recipient, *affiliation});
        if (!recipient) return std::nullopt;
    }
    const char *purpose_key = nullptr;
    switch (value("topic")) {
    case 1: purpose_key = "make peace"; break;
    case 10: purpose_key = "demand unconditional surrender"; break;
    case 14: purpose_key = "seek an alliance"; break;
    case 15: purpose_key = "make contact and open trade"; break;
    case 16: purpose_key = "improve trade relations"; break;
    default: break;
    }
    std::optional<Pieces> meeting;
    if (purpose_key) {
        auto purpose = render("negotiation-purpose", purpose_key);
        if (!purpose) return std::nullopt;
        meeting = render("negotiation-sentence", "{s} met with {s} to {s}.", {*speaker, *recipient, *purpose});
    } else meeting = render("negotiation-sentence", "{s} met with {s}.", {*speaker, *recipient});
    if (!meeting) return std::nullopt;
    Pieces paragraph = std::move(*meeting);
    const auto sentence = [&](std::string_view key, const std::vector<Pieces> &arguments = {}) {
        auto translated = render("negotiation-sentence", key, arguments);
        if (!translated) return false;
        join(paragraph, *translated);
        return true;
    };
    const int32_t outcome = value("result");
    if (outcome == 2) {
        auto site = subject(NativeHistoryObjectKind::Site, value("siege_site"));
        if (!site || !sentence("The negotiation was doomed to failure while the morale of the invaders sieging {s} held firm.", {*site}))
            return std::nullopt;
    }
    const auto &kinds = numbers(prefix + "condition_kind");
    const auto &values = numbers(prefix + "condition_value");
    if (kinds.size() != values.size()) return std::nullopt;
    for (size_t index = 0; index < kinds.size(); ++index) {
        const int32_t kind = kinds[index], amount = values[index];
        std::string key;
        if (kind == 0 && amount < 0) {
            key = "The ";
            key += amount <= -150 ? "sheer number of lost invaders" :
                amount <= -75 ? "great number of lost invaders" :
                amount <= -25 ? "high number of lost invaders" : "enemy losses during invasions";
            key += " made the task seem more possible.";
        } else if ((kind == 1 && amount > 0) || (kind == 2 && amount < 0)) {
            key = "The task was made ";
            key += kind == 1 ? (amount >= 75 ? "much more difficult" :
                amount >= 50 ? "more difficult" : "somewhat more difficult") :
                (amount <= -100 ? "much easier" : amount <= -80 ? "easier" : "somewhat easier");
            key += " by the relative populations of the civilizations.";
        }
        if (!key.empty() && !sentence(key)) return std::nullopt;
    }
    // Win64's signed comparisons follow the 32-bit rating arithmetic.
    const auto twice = [](int32_t rating) { return static_cast<int32_t>(static_cast<uint32_t>(rating) * 2u); };
    struct Strategy { int32_t primary, auxiliary; };
    const auto strategy = [&](const char *side) {
        const std::string stem = prefix + side;
        const int32_t n = number(stem + "_negotiation"), p = number(stem + "_persuasion"),
            skill = number(stem + "_other"), rating = number(stem + "_rating");
        if (n >= p && n >= rating) {
            int32_t auxiliary = twice(p) >= n ? 70 : -1;
            if (twice(rating) >= n && rating > p) auxiliary = skill;
            return Strategy{71, auxiliary};
        }
        return Strategy{p >= rating ? 70 : skill, -1};
    };
    const Strategy opening = strategy("speaker"), response = strategy("recipient");
    std::string key;
    if (opening.primary == 71) {
        switch (opening.auxiliary) {
        case 70: key = "negotiate persuasively"; break;
        case 72: key = "negotiate with discernment"; break;
        case 76: key = "negotiate deceptively"; break;
        case 77: key = "negotiate forcefully"; break;
        case 78: key = "negotiate amidst light conversation"; break;
        case 79: key = "negotiate, keeping a sense of humor"; break;
        case 80: key = "negotiate, mixing in a dose of flattery"; break;
        case 81: key = "negotiate with empathy for their counterpart"; break;
        case 82: key = "negotiate calmly"; break;
        case 92: key = "negotiate eloquently"; break;
        default: key = "negotiate"; break;
        }
    } else {
        switch (opening.primary) {
        case 70: key = "argue persuasively"; break;
        case 72: key = outcome == 0 ? "feel out intentions and argue with subtlety" : "feel out intentions and argue carefully"; break;
        case 76: key = "brazenly lie"; break;
        case 77: key = "intimidate their adversary"; break;
        case 78: key = "make conversation to set a mood"; break;
        case 79: key = "use humor to disarm their opponent"; break;
        case 80: key = "flatter their counterpart"; break;
        case 81: key = "appeal to shared history and show empathy"; break;
        case 82: key = "calm any misgivings about the proposal"; break;
        case 92: key = "make a rousing speech"; break;
        default: break;
        }
    }
    if (!key.empty()) {
        auto action = render("negotiation-opening", key);
        if (!action || !sentence(outcome == 1 ? "{s} attempted to {s}." : "{s} began to {s}.", {speaker_name, *action}))
            return std::nullopt;
    }
    key.clear();
    const bool matched = opening.primary == response.primary, success = outcome == 0;
    if (response.primary == 71) {
        switch (response.auxiliary) {
        case 70: key = "negotiated persuasively"; break;
        case 72: key = "negotiated with discernment"; break;
        case 76: key = "negotiated deceptively"; break;
        case 77: key = "negotiated forcefully"; break;
        case 78: key = "negotiated lightly"; break;
        case 79: key = "negotiated with humor"; break;
        case 80: key = "negotiated with flattery"; break;
        case 81: key = "negotiated with empathy"; break;
        case 82: key = "negotiated calmly"; break;
        case 92: key = "negotiated eloquently"; break;
        default: key = "negotiated"; break;
        }
        if (matched) key += " in turn";
        key += success ? " but was outmaneuvered" : " and had the mastery";
    } else {
        switch (response.primary) {
        case 70:
            key = "made a persuasive argument";
            if (matched) key += " of their own";
            if (success) key += " but was ultimately swayed";
            break;
        case 72:
            key = success ? "attempted to read their opposite's underlying motivations" : "read their opposite's underlying motivations";
            if (matched) key += " as well";
            if (success) key += " but was swept along";
            break;
        case 76:
            key = "spun a web of deceit";
            if (matched) key += " of their own";
            if (success) key += " but became tied in their own knots";
            break;
        case 77:
            key = "intimidated their opposite";
            if (matched) key += " with matching fury";
            if (success) key += " but grew meeker throughout the proceedings";
            break;
        case 78:
            key = matched ? "joined the conversation" : "made light conversation";
            key += success ? " and over time came around on the matter" : " and skillfully shut down the proceedings";
            break;
        case 79:
            key = "made several jokes";
            if (matched) key += " of their own";
            key += success ? " but came to see the seriousness of the issue at hand" : " and dismissed the matter";
            break;
        case 80:
            key = matched ? "flattered their opposite in turn" : "made a great show of flattery";
            key += success ? " and ultimately agreed" : " but left the matter unaddressed";
            break;
        case 81:
            key = matched ? "joined in the discussion of history and past griefs" : "showed empathy with their opposite";
            key += success ? " and agreed on the issue" : " but did not agree";
            break;
        case 82:
            key = "attempted to put their opposite at ease";
            if (matched) key += " as well";
            key += success ? " and ultimately agreed" : " but did not ultimately agree";
            break;
        case 92:
            key = matched ? "replied with a grand oration of their own" : "replied with a fiery speech";
            if (success) key += " but ultimately the matter was agreed";
            break;
        default: break;
        }
    }
    if (!key.empty()) {
        auto action = render("negotiation-response", key);
        if (!action || !sentence("{s} {s}.", {recipient_name, *action})) return std::nullopt;
    }
    key.clear();
    const int32_t level = value("outcome");
    if (outcome == 1) key = level == -5 ? "The proposal was a spectacular failure." :
        level == -4 ? "The proposal was a resounding failure." :
        level == -3 ? "The proposal was an embarrassing failure." :
        level == -2 ? "The proposal was a failure." : "The proposal was not successful.";
    else if (outcome == 0) key = level == 5 ? "The proposal was wildly successful beyond any expectations." :
        level == 4 ? "The proposal was a truly grand success." :
        level == 3 ? "The proposal was a great success." :
        level == 2 ? "The proposal was highly successful." : "The proposal succeeded.";
    // Result 2 already supplies the doomed-negotiation sentence above; the
    // native final "The proposal ." has no additional semantic predicate.
    if (!key.empty() && !sentence(key)) return std::nullopt;
    return paragraph;
};
const auto diplomacy = [&]() -> std::optional<Pieces> {
    auto meeting = negotiation("negotiation.");
    auto plot = intrigue("intrigue.");
    if (!meeting || !plot) return std::nullopt;
    join(*meeting, *plot);
    return meeting;
};
(void)diplomacy;
