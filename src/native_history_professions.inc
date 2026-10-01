// Direct profession vocabulary from the supported native race/caste objects.
// Defaults are finite semantic dictionary keys, so grammatical plurality does
// not create a second Chinese profession glossary. RAW aliases remain exact.
#include "history_profession_keys.inc"
static bool capture_native_history_profession(uintptr_t base, int32_t profession,
        int16_t race, int16_t caste_id, bool plural, std::string &out,
        bool own_race_caption = false) {
    if (!base || profession < 0 || profession >= static_cast<int32_t>(history_profession_keys.size()))
        return false;
    uintptr_t creature = 0, caste = 0;
    if (race >= 0) {
        // 30cea0/30cf70: creature_handler.creature at RVA 24eca68;
        // creature_raw.caste at +178, with independent caste index bounds.
        NativeBorrowedVector<uintptr_t> creatures;
        if (!native_history_read_vector(native_history_global(0x24eca68), creatures)) return false;
        if (static_cast<size_t>(race) < creatures.size()) {
            creature = native_history_vector_at(creatures, race);
            if (!creature) return false;
            if (caste_id >= 0) {
                NativeBorrowedVector<uintptr_t> castes;
                if (!native_history_read_vector(creature + 0x178, castes)) return false;
                if (static_cast<size_t>(caste_id) < castes.size()) {
                    caste = native_history_vector_at(castes, caste_id);
                    if (!caste) return false;
                }
            }
        }
    }
    const auto read = [&](uintptr_t object, size_t offset, std::string &value) {
        return object && offset <= UINTPTR_MAX - object &&
            native_history_copy_string(object + offset, value);
    };
    if (creature) {
        const size_t index = static_cast<size_t>(profession) * 0x20;
        std::string single;
        // Availability is decided by the singular override even when the
        // caller requests plural. 30cf70 falls through to the species plural
        // when the caste's selected plural is empty.
        if (caste) {
            if (!read(caste, 0x1820 + index, single)) return false;
            if (!single.empty()) {
                if (!plural) { out = std::move(single); return true; }
                if (!read(caste, 0x2900 + index, out)) return false;
                if (!out.empty()) return true;
                return read(creature, 0x1300 + index, out) && !out.empty();
            }
        }
        if (!read(creature, 0x220 + index, single)) return false;
        if (!single.empty()) {
            if (!plural) { out = std::move(single); return true; }
            return read(creature, 0x1300 + index, out) && !out.empty();
        }
        if (profession == 103 || profession == 104) {
            // 132cc10 uses CHILD/BABY names after PROFESSION_NAME overrides.
            const size_t caste_offset = profession == 103 ? 0x100 : 0xc0;
            const size_t creature_offset = profession == 103 ? 0xc0 : 0x80;
            if (caste) {
                if (!read(caste, caste_offset, single)) return false;
                if (!single.empty()) {
                    if (!plural) { out = std::move(single); return true; }
                    return read(caste, caste_offset + 0x20, out) && !out.empty();
                }
            }
            if (!read(creature, creature_offset, single)) return false;
            if (!single.empty()) {
                if (!plural) { out = std::move(single); return true; }
                return read(creature, creature_offset + 0x20, out) && !out.empty();
            }
        }
    }
    // 132cc10 leaves PEASANT empty, and puts HUNTING/WAR into its prefix.
    // The career caller uses 132e0c0 with reference race == figure race:
    // that wrapper appends peasant(s) when the main caption is empty.
    if (profession == 102 && !own_race_caption) return false;
    if ((profession == 98 || profession == 99) && !own_race_caption)
        out = profession == 98 ? "hunting" : "war";
    else out = history_profession_keys[profession];
    return !out.empty();
}
