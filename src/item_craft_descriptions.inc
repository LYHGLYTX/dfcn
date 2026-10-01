// PE 53.16 c75609..c756a6 reads the item's maker race (virtual +590),
// then 1bb2e0/1bb330 selects that creature RAW's singular CRAFTSMAN
// profession (25). The native suffix is "ship", appended to the whole
// profession, not to a hard-coded dwarf/man noun. This resolver is used only
// by that complete sentence's typed profession slot and its native compositor.
std::optional<std::string> Overlay::translate_item_craftsmanship(
        std::string_view raw_profession) const {
    const std::string profession = normalize_utterance(raw_profession);
    if (profession.empty()) return std::nullopt;
    const std::string folded = lower(native_text_to_utf8(profession));
    std::optional<std::string> role;
    std::vector<size_t> origins;
    // The shared RAW profession glossary preserves both the occupation and
    // its race qualifier, e.g. craftsdwarf -> 矮人工匠. Try its original RAW
    // spelling and standard title spelling before other occupation sources.
    role = RULESETS.translate_with_origins(folded, "::professions", origins);
    if (!item_description_translation_complete(role)) {
        std::string title = folded;
        bool initial = true;
        for (char &ch : title) {
            if (initial && ch >= 'a' && ch <= 'z') ch -= 'a' - 'A';
            initial = ch == ' ' || ch == '-';
        }
        role = RULESETS.translate_with_origins(title, "::professions", origins);
    }
    if (!item_description_translation_complete(role))
        role = translate_unit_profession(profession, true);
    if (!item_description_translation_complete(role)) {
        // RAW authors can substitute another known species in the standard
        // craft/crafts occupation. Only a complete species parser may prove
        // this construction; unknown English is never discarded or guessed.
        for (const std::string_view stem : {"crafts", "craft"}) {
            if (!folded.starts_with(stem) || folded.size() == stem.size()) continue;
            const auto species = translate_creature_descriptor(
                std::string_view(folded).substr(stem.size()), true);
            if (!item_description_translation_complete(species)) continue;
            const auto craftsman = RULESETS.translate_with_origins(
                "Craftsman", "::professions", origins);
            if (!item_description_translation_complete(craftsman)) continue;
            role = *species + *craftsman;
            break;
        }
    }
    if (!item_description_translation_complete(role)) return std::nullopt;
    // The agent noun becomes its workmanship noun while the full race or
    // custom occupation qualifier remains. Other authored profession names
    // retain their complete translated meaning before the workmanship suffix.
    constexpr std::string_view craftsman = "工匠";
    if (role->ends_with(craftsman)) role->resize(role->size() - craftsman.size());
    return *role + "工艺";
}
