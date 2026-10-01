// Included inside the PackedRelationship kind branch after the shared date.
// All 16 arms come from the native b62374 table, selected by the compact
// relationship row's int16 type; no displayed sentence is matched or parsed.
const int32_t relationship = number("relationship.type");
if (relationship >= 0 && relationship <= 15) {
    auto first = subject(NativeHistoryObjectKind::Figure, number("relationship.first"));
    auto second = subject(NativeHistoryObjectKind::Figure, number("relationship.second"));
    if (!first || !second) return std::nullopt;
    static constexpr const char *keys[] = {
        "{n} and {n} became childhood friends",
        "{n} and {n} cemented a bond of friendship amidst the horror of combat",
        "{a} became infatuated with {n}",
        "{a} formed a grudge against {n}",
        "{n} and {n} became lovers",
        "{n} and {n} broke up",
        "{n} and {n} became friends",
        "{n} and {n} became friends",
        "{n} and {n} become friends over a shared love of athletics",
        "{n} and {n} developed an athletic rivalry",
        "{n} and {n} developed a business rivalry",
        "{a} held a deep hatred of {n}",
        "{a} formed a grudge against {n}",
        "{a} held a deep hatred of {n}",
        "{a} was bent toward supernatural vengeance upon {n}",
        "{a} recognized {a} as a capable and connected lieutenant with more autonomy to act on plots in the web of intrigue",
    };
    auto action = apply(keys[relationship], {*first, *second});
    if (!action) return std::nullopt;
    join(result, *action);
    const char *qualification = nullptr;
    switch (relationship) {
    case 3: qualification = "over the latter's romantic relationship"; break;
    case 11: qualification = "due to religious persecution"; break;
    case 13: qualification = "due to persecution"; break;
    case 6:
    case 7:
        if (number("relationship.support")) {
            const auto clauses = event_clauses();
            if (!clauses) return std::nullopt;
            append_clause(result, clauses->first);
            append_clause(result, clauses->second);
        } else {
            qualification = relationship == 6 ? "due to a shared scholarly interest" :
                "due to a shared artistic interest";
        }
        break;
    default: break;
    }
    if (qualification) {
        const auto detail = apply(qualification, {});
        if (!detail) return std::nullopt;
        append_clause(result, *detail);
    }
}
// Out-of-range types take b62336 directly: the native paragraph contains
// only its date and final punctuation, with no names or guessed predicate.
