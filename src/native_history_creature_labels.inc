// Standalone RAW creature/caste labels used by native history event fields.
static bool capture_native_history_creature_label(uintptr_t base, int32_t race,
        int16_t caste_id, bool plural, std::string &out, bool unknown_fallback = true,
        int8_t *sex = nullptr) {
    if (!base) return false;
    if (sex) *sex = -1;
    NativeBorrowedVector<uintptr_t> creatures;
    const uintptr_t address = native_history_page_address(NativeHistoryPageSymbol::Creatures);
    if (!native_history_read_vector(address, creatures)) return false;
    if (race < 0 || static_cast<size_t>(race) >= creatures.size()) {
        // b94ed0's explicit missing-race branch. The devouring formatter
        // uses its own inline RAW lookup and does not supply this fallback.
        if (!unknown_fallback) return false;
        out = plural ? "creatures" : "creature";
        return true;
    }
    const uintptr_t creature = native_history_vector_at(creatures, race);
    if (!creature || creature > UINTPTR_MAX - 0x178) return false;
    std::string label;
    const size_t offset = plural ? 0x40 : 0x20;
    if (caste_id >= 0) {
        NativeBorrowedVector<uintptr_t> castes;
        if (!native_history_read_vector(native_history_object_field(
                creature, "creature_raw", 0x178, sizeof(castes)), castes)) return false;
        if (static_cast<size_t>(caste_id) < castes.size()) {
            const uintptr_t caste = native_history_vector_at(castes, caste_id);
            if (!caste || caste > UINTPTR_MAX - offset ||
                !native_history_copy_string(native_history_object_field(
                    caste, "caste_raw", offset, sizeof(NativeString)), label)) return false;
            if (sex && !native_history_copy(native_history_object_field(
                    caste, "caste_raw", 0x15b8), *sex)) return false;
        }
    }
    if (label.empty() && !native_history_copy_string(native_history_object_field(
            creature, "creature_raw", offset, sizeof(NativeString)), label)) return false;
    if (label.empty()) return false;
    out = std::move(label);
    return true;
}
