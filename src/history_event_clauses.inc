// Shared history-event semantics, included inside namespace dfcn.
// DF 53.16-r1: history_event_reason and unit_thought_type from the matching
// structures, checked against getSentence's reason/circumstance dispatcher at
// Windows RVA b5a6c0. These keys select existing reviewed translation rules;
// no English event text is parsed to recover an enum or its referenced object.
struct HistoryEventClause {
    int code;
    const char *source;
    // 0: no field; n: figure; p: entity; s: site; i: artifact; e: HEC;
    // r: sphere; v: value; t: scholarly/artistic topic.
    char field;
};

// Reason 4 with data == -1 instead uses "due to their cosmic similarity".
// Reason 70 names a family with the figure's complete name, but suppresses
// the species label. Its native sixth argument is a species-display mode,
// not a request to strip first names, nicknames or any compound WORD slots.
// Reason 80's value field is "nuances of <value>", as assembled by the native
// formatter; it is not the value label alone.
static constexpr std::array<HistoryEventClause, 94> history_event_reason_clauses{{
    {0, "for an insurrection", 0},
    {1, "to adventure", 0},
    {2, "as a guide", 0},
    {3, "in order to be rescued", 0},
    {4, "after pondering the ineffable subtleties of {r}", 'r'},
    {5, "in order to maintain balance in the universe", 0},
    {6, "to create a monument to the boundaries between realities", 0},
    {7, "to sow the seeds of chaos therein", 0},
    {8, "to provide opportunities for courage to rise", 0},
    {9, "that more might die", 0},
    {10, "that all should gaze upon a truly gruesome visage", 0},
    {11, "because it was destined", 0},
    {12, "that great fortresses might be raised and tested in siege", 0},
    {13, "on a whim", 0},
    {14, "that it might bathe in misery forever", 0},
    {15, "that more might be murdered", 0},
    {16, "in order to make nightmares reality", 0},
    {17, "in order to make thralls of everyone", 0},
    {18, "in order that acts of torture be perpetrated", 0},
    {19, "to provide opportunities for acts of valor to be performed", 0},
    {20, "that war might rage forever", 0},
    {21, "in order to find a relative", 0},
    {22, "to offer condolences", 0},
    {23, "in order to be brought to safety", 0},
    {24, "to help with a rescue", 0},
    {25, "due to insufficient work", 0},
    {26, "to request work", 0},
    {27, "that weapons be made", 0},
    {28, "to vent at somebody in charge", 0},
    {29, "to cry on somebody in charge", 0},
    {30, "as the goal was not reached", 0},
    {31, "as insufficient progress was made toward the goal", 0},
    {32, "after going the wrong direction", 0},
    {33, "after arriving at the location", 0},
    {34, "as the relevant government was no longer in control", 0},
    {35, "after leaving the site", 0},
    {36, "after being reunited with a loved one", 0},
    {37, "after a violent disagreement", 0},
    {38, "after adoption", 0},
    {39, "after invocation of the true name", 0},
    {40, "after finding {n}", 'n'},
    {41, "in order to eradicate beasts", 0},
    {42, "in order to entertain people", 0},
    {43, "in order to make a living as a warrior", 0},
    {44, "in order to study", 0},
    {45, "in order to flee", 0},
    {46, "in order to pursue scholarship", 0},
    {47, "in order to be with the master", 0},
    {48, "in order to become a citizen", 0},
    {49, "in order to continue working alone", 0},
    {50, "due to jealousy", 0},
    {51, "in order to glorify {a}", 'n'},
    {52, "due to a lack of performances", 0},
    {53, "after being prevented from leaving", 0},
    {54, "out of curiosity", 0},
    {55, "to fill a role as a mercenary", 0},
    {56, "to fill a role as a performer", 0},
    {57, "to fill a role as a scholar", 0},
    {58, "in order to drink", 0},
    {59, "in order to admire architecture", 0},
    {60, "in order to pray", 0},
    {61, "in order to relax", 0},
    {62, "to experience danger", 0},
    {63, "after being unable to find an artifact", 0},
    {64, "after failing to create an artifact", 0},
    {65, "due to lack of sleep", 0},
    {66, "after being trapped in a cage", 0},
    {67, "after a great deal of stress", 0},
    {68, "after being unable to leave a location", 0},
    {69, "in order to sanctify {n}", 'n'},
    {70, "as an heirloom of the {n} family", 'n'},
    {71, "in order to cement the bonds of friendship", 0},
    {72, "as a symbol of everlasting peace", 0},
    {73, "on a pilgrimage", 0},
    {74, "to gather information", 0},
    {75, "in order to find sanctuary", 0},
    {76, "as part of a trade negotiation", 0},
    {77, "as a symbol of authority within {p}", 'p'},
    {78, "due to fear of persecution", 0},
    {79, "to smooth the operation of {p}", 'p'},
    {80, "due to a belief in {s}", 'v'},
    {81, "due to a shared interest in {s}", 't'},
    {82, "due to envy of those that live on", 0},
    {83, "due to panic about what happens after death", 0},
    {84, "due to fear of death", 0},
    {85, "unable to face any possible judgment and the afterlife", 0},
    {86, "being too proud to give in to death", 0},
    {87, "being too vain to give in to death", 0},
    {88, "having ambitions for which death was only a small obstacle", 0},
    {89, "due to a lack of funds", 0},
    {90, "after taking heavy losses in battle", 0},
    {91, "after being exiled following a criminal conviction", 0},
    {92, "to vent at a priest", 0},
    {93, "to cry on a priest", 0},
}};

// Only these circumstances add words. The remaining supported enum values
// dispatch to an empty append (or directly return) in the original formatter.
// Reference fields remain explicit even if their renderer is not available;
// consumers must decline that complete event instead of dropping the clause.
static constexpr std::array<HistoryEventClause, 26> history_event_circumstance_clauses{{
    {4, "after the death of {n}", 'n'},
    {181, "after praying to {n}", 'n'},
    {209, "after dreaming of {n}", 'n'},
    {210, "after a dream", 0},
    {211, "after a nightmare", 0},
    {229, "after defeating {a}", 'n'},
    {230, "as the item was a favorite possession", 0},
    {231, "by preserving a part of the body", 0},
    {232, "after murdering {n}", 'n'},
    {233, "during {e}", 'e'},
    {236, "after acquiring {p}", 'i'},
    {239, "after {p} was given away", 'i'},
    {243, "after preying on the blood of civilized creatures", 0},
    {244, "being unnaturally ageless", 0},
    {245, "after a scholarly lecture in {p}", 's'},
    {246, "after a performance in {p}", 's'},
    {247, "after accepting bribes in exchange for leniency", 0},
    {248, "after embezzling funds", 0},
    {249, "after receiving a cut of corruptly-obtained funds", 0},
    {250, "after abducting {n}", 'n'},
    {251, "from afar", 0},
    {263, "during an infiltration mission", 0},
    {276, "after performing the rites of {n} in a dedicated temple", 'p'},
    {277, "after incompletely performing the rites of {n} in an improperly dedicated temple", 'p'},
    {278, "after incompletely performing the rites of {n} in an undedicated temple", 'p'},
    {279, "after praying to {n} in a dedicated temple", 'n'},
}};

static std::optional<HistoryEventClause> history_event_reason_clause(int code) {
    if (code == -1) return HistoryEventClause{code, "", 0};
    if (code < 0 || static_cast<size_t>(code) >= history_event_reason_clauses.size())
        return std::nullopt;
    return history_event_reason_clauses[static_cast<size_t>(code)];
}

static std::optional<HistoryEventClause> history_event_circumstance_clause(int code) {
    if (code < -1 || code > 280) return std::nullopt;
    for (const auto &clause : history_event_circumstance_clauses)
        if (clause.code == code) return clause;
    return HistoryEventClause{code, "", 0};
}

// sphere_type in df.g_src.graphics.xml (53.16-r1), in its original enum order.
// Native RVA 756690 accepts 0..129. Keys select the shared TSV sphere namespace;
// the optional English article added by RVA 756500 carries no Chinese meaning.
static constexpr std::array<std::string_view, 130> history_event_sphere_keys{{
    "agriculture", "animals", "art", "balance", "beauty",
    "birth", "blight", "boundaries", "caverns", "chaos",
    "charity", "children", "coasts", "consolation", "courage",
    "crafts", "creation", "dance", "darkness", "dawn",
    "day", "death", "deformity", "depravity", "discipline",
    "disease", "dreams", "dusk", "duty", "earth",
    "family", "fame", "fate", "fertility", "festivals",
    "fire", "fish", "fishing", "food", "forgiveness",
    "fortresses", "freedom", "gambling", "games", "generosity",
    "happiness", "healing", "hospitality", "hunting", "inspiration",
    "jealousy", "jewels", "justice", "labor", "lakes",
    "laws", "lies", "light", "lightning", "longevity",
    "love", "loyalty", "luck", "lust", "marriage",
    "mercy", "metals", "minerals", "misery", "mist",
    "moon", "mountains", "muck", "murder", "music",
    "nature", "night", "nightmares", "oaths", "oceans",
    "order", "painting", "peace", "persuasion", "plants",
    "poetry", "pregnancy", "rain", "rainbows", "rebirth",
    "revelry", "revenge", "rivers", "rulership", "rumors",
    "sacrifice", "salt", "scholarship", "seasons", "silence",
    "sky", "song", "speech", "stars", "storms",
    "strength", "suicide", "sun", "theft", "thralldom",
    "thunder", "torture", "trade", "travelers", "treachery",
    "trees", "trickery", "truth", "twilight", "valor",
    "victory", "volcanos", "war", "water", "wealth",
    "weather", "wind", "wisdom", "writing", "youth",
}};

static std::optional<std::string_view> history_event_sphere_key(int code) {
    if (code < 0 || static_cast<size_t>(code) >= history_event_sphere_keys.size())
        return std::nullopt;
    return history_event_sphere_keys[static_cast<size_t>(code)];
}
