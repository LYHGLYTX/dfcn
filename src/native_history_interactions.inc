// Interaction RAW fields are semantic input, independent of formatted prose.
static uintptr_t native_history_interaction(uintptr_t base, int32_t id) {
    if (!base || id < 0) return 0;
    NativeBorrowedVector<uintptr_t> interactions;
    if (!native_history_read_vector(native_history_global(0x24f74c8), interactions)) return 0;
    return native_history_vector_at(interactions, static_cast<size_t>(id));
}

static bool capture_native_history_secret(uintptr_t base, int32_t id, std::string &out) {
    // b93c60 scans source.secret_name in order, without using the event's
    // interaction_source index. Its explicit empty/missing fallback is a term.
    const uintptr_t interaction = native_history_interaction(base, id);
    if (interaction) {
        NativeBorrowedVector<uintptr_t> sources;
        if (interaction > UINTPTR_MAX - 0x50 ||
            !native_history_read_vector(interaction + 0x50, sources)) return false;
        for (size_t index = 0; index < sources.size(); ++index) {
            const uintptr_t source = native_history_vector_at(sources, index);
            if (!source || source > UINTPTR_MAX - 0x10 ||
                !native_history_copy_string(source + 0x10, out)) return false;
            if (!out.empty()) return true;
        }
    }
    out = "an unknown secret";
    return true;
}

static bool capture_native_history_interaction_action(uintptr_t base, int32_t id,
        int32_t source_id, std::string &before, std::string &after) {
    // b78769..b788ac selects an interaction source by its stored index and
    // prints IS_HIST_STRING_1, target HF, then IS_HIST_STRING_2.
    const uintptr_t interaction = native_history_interaction(base, id);
    if (!interaction || source_id < 0 || interaction > UINTPTR_MAX - 0x50) return false;
    NativeBorrowedVector<uintptr_t> sources;
    if (!native_history_read_vector(interaction + 0x50, sources)) return false;
    const uintptr_t source = native_history_vector_at(sources, static_cast<size_t>(source_id));
    return source && source <= UINTPTR_MAX - 0x50 &&
        native_history_copy_string(source + 0x30, before) &&
        native_history_copy_string(source + 0x50, after);
}

static bool capture_native_history_revival_form(uintptr_t base, int32_t interaction_id,
        int32_t effect_id, std::string &out) {
    out.clear();
    if (interaction_id < 0 || effect_id < 0) return true;
    const uintptr_t interaction = native_history_interaction(base, interaction_id);
    NativeBorrowedVector<uintptr_t> effects;
    if (!interaction || interaction > UINTPTR_MAX - 0x80 ||
        !native_history_read_vector(interaction + 0x80, effects)) return false;
    if (static_cast<size_t>(effect_id) >= effects.size()) return true;
    const uintptr_t effect = native_history_vector_at(effects, effect_id);
    if (!effect) return false;
    if (!native_history_object_is(effect, "interaction_effect_raise_ghostst") &&
            !native_history_object_is(effect, "interaction_effect_resurrectst")) return true;
    NativeBorrowedVector<uintptr_t> syndromes;
    if (effect > UINTPTR_MAX - 0x90 ||
        !native_history_read_vector(native_history_object_field(effect, {}, 0x90), syndromes)) return false;
    for (size_t index = 0; index < syndromes.size(); ++index) {
        const uintptr_t syndrome = native_history_vector_at(syndromes, index);
        NativeBorrowedVector<uintptr_t> changes;
        if (!syndrome || syndrome > UINTPTR_MAX - 0x20 ||
            !native_history_read_vector(syndrome + 0x20, changes)) return false;
        for (size_t n = 0; n < changes.size(); ++n) {
            const uintptr_t change = native_history_vector_at(changes, n);
            if (!change) return false;
            if (!native_history_object_is(change, "creature_interaction_effect_display_namest")) continue;
            std::string name;
            if (change > UINTPTR_MAX - 0x98 ||
                !native_history_copy_string(native_history_object_field(change, {}, 0x98), name)) return false;
            if (!name.empty()) {
                // First nonempty display name per syndrome; later syndromes
                // replace it, matching the two loops in b70653..b7074c.
                out = std::move(name);
                break;
            }
        }
    }
    return true;
}
static bool capture_native_history_animated_effect(uintptr_t base, int32_t interaction_id,
        int32_t effect_id, bool &animated) {
    // b6d047 / b6d389 test only IE_ANIMATE's type, not formatted text.
    animated = false;
    if (interaction_id < 0) return true;
    const uintptr_t interaction = native_history_interaction(base, interaction_id);
    NativeBorrowedVector<uintptr_t> effects;
    if (!interaction || effect_id < 0 || interaction > UINTPTR_MAX - 0x80 ||
        !native_history_read_vector(interaction + 0x80, effects)) return false;
    const uintptr_t effect = native_history_vector_at(effects, static_cast<size_t>(effect_id));
    if (!effect) return false;
    animated = native_history_object_is(effect, "interaction_effect_animatest");
    return true;
}
