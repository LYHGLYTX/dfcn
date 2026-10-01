// Item description c75000: class-independent state, quantity, workmanship,
// fit, food ingredients and wear. Getter decoding copies fields; no virtual
// description or English sentence is inspected to select a production.
static bool capture_native_history_item_base(uintptr_t object, NativeHistoryEventData &data) {
    const uintptr_t base = native_history_profile_base();
    int32_t type = -1, subtype = -1, material = -1, index = -1;
    int32_t stack = 0, quality = 0, race = -1, maker = -1, wear = 0;
    uint32_t flags = 0;
    if (!native_history_item_scalar(object, 0, type, 2) ||
        !native_history_item_scalar(object, 8, subtype, 2) ||
        !native_history_item_scalar(object, 0x10, material, 2) ||
        !native_history_item_scalar(object, 0x18, index) ||
        !native_history_item_scalar(object, 0x478, stack) ||
        !native_history_item_scalar(object, 0x508, quality, 2) ||
        !native_history_item_scalar(object, 0x590, race, 2) ||
        !native_history_item_scalar(object, 0x1e8, maker) ||
        !native_history_item_scalar(object, 0x1d8, wear, 2) ||
        !native_history_copy(native_history_object_field(object, "", 0x10), flags) || type < 0 || type > 92) return false;
    data.fields["item.type"] = {type};
    data.fields["item.tuple"] = {type, subtype, material, index};
    data.fields["item.stack"] = {stack};
    data.fields["item.flags"] = {static_cast<int32_t>(flags)};
    data.fields["item.quality"] = {quality};
    if (maker >= 0 && !native_history_find_subject(base, NativeHistoryObjectKind::Figure, maker)) maker = -1;
    data.fields["item.maker"] = {maker};
    data.fields["item.wear"] = {wear};
    if (maker >= 0) data.references.emplace_back(NativeHistoryObjectKind::Figure, maker);
    uintptr_t raw_material = 0;
    if (material >= 0 && !native_history_material_object(base, material, index, raw_material)) return false;
    const auto material_flag = [&](int bit, bool &value) {
        value = false;
        return !raw_material || native_history_page_flag(raw_material, 0x290, 0x298, bit, value);
    };
    bool plural = false;
    switch (type) {
    case 5: plural = !(flags & 0x20); break;
    case 3: case 1: case 2: case 63: case 92: case 67: case 64:
    case 47: case 53: plural = true; break;
    case 4: plural = material != 0 || index == -1; break;
    case 0: plural = material != 7; break;
    case 57: {
        bool silk = false, yarn = false;
        if (!material_flag(30, silk) || !material_flag(47, yarn)) return false;
        plural = !silk && !(flags & 0x200) && yarn;
        break;
    }
    default: break;
    }
    data.fields["item.plural"] = {plural};
    bool bundle = false;
    if (type == 54 && index >= 0) {
        NativeBorrowedVector<uintptr_t> plants;
        if (!native_history_read_vector(native_history_global(0x24ec8f8), plants)) return false;
        if (static_cast<size_t>(index) < plants.size()) {
            const auto plant = native_history_vector_at(plants, index);
            if (!plant || !native_history_page_flag(plant, 0x40, 0x48, 4, bundle)) return false;
        }
    }
    data.fields["item.bundle"] = {bundle};
    if (flags & 0x08000000) {
        std::string craft = "craftsman";
        if (race >= 0) {
            NativeBorrowedVector<uintptr_t> creatures;
            if (!native_history_read_vector(native_history_global(0x24eca68), creatures)) return false;
            if (static_cast<size_t>(race) < creatures.size()) {
                std::string override;
                const auto creature = native_history_vector_at(creatures, race);
                if (!creature || !native_history_copy_string(creature + 0x220 + 25 * 0x20, override)) return false;
                if (!override.empty()) craft = std::move(override);
            }
        }
        // c75609..c756a6 selects the maker race's singular CRAFTSMAN RAW
        // profession. Keep that field separate from the sentence production.
        data.texts["item.craft_profession"] = std::move(craft);
    }
    int32_t game_type = -1;
    int16_t player_race = -1;
    if (!native_history_copy(native_history_global(0x189c298), game_type)) return false;
    if (game_type == 0) {
        if (!native_history_copy(native_history_global(0x239367c), player_race)) return false;
    } else if (game_type == 1) {
        uintptr_t player = 0;
        NativeBorrowedVector<uintptr_t> active_units;
        if (!native_history_read_vector(native_history_global(0x23e50c8), active_units) ||
            !native_history_copy(native_history_global(0x23e5110), player)) return false;
        if (active_units.size() && player && !native_history_copy(player + 0xa4, player_race)) return false;
    }
    data.fields["item.fit"] = {0};
    if ((type == 25 || type == 26 || type == 28 || type == 29 || type == 60) &&
        race >= 0 && race != player_race) {
        std::string species;
        if (!capture_native_history_creature_label(base, race, -1, true, species)) return false;
        data.texts["item.fit_species"] = std::move(species);
        data.fields["item.fit"] = {1};
    }
    data.fields["item.ingredients"] = {};
    if (type == 72) {
        NativeBorrowedVector<uintptr_t> ingredients;
        if (!native_history_read_vector(native_history_object_field(object, "", 0xe0), ingredients) || ingredients.size() > 4096) return false;
        // The native cook describes the last ingredient first.
        for (size_t i = ingredients.size(); i-- > 0;) {
            const uintptr_t ingredient = native_history_vector_at(ingredients, i);
            int16_t preparation = -1, kind = -1, sub = -1, mat = -1, grade = -1;
            int32_t mat_index = -1;
            if (!ingredient || !native_history_copy(ingredient, preparation) ||
                !native_history_copy(ingredient + 2, kind) || !native_history_copy(ingredient + 4, sub) ||
                !native_history_copy(ingredient + 6, mat) || !native_history_copy(ingredient + 8, mat_index) ||
                !native_history_copy(ingredient + 0x10, grade)) return false;
            const std::string role = "ingredient." + std::to_string(i);
            if (!capture_native_history_page_item({kind, sub, mat, mat_index}, data, role, 1, -1)) return false;
            data.fields[role + ".preparation"] = {preparation};
            data.fields[role + ".quality"] = {grade};
            data.fields["item.ingredients"].push_back(static_cast<int32_t>(i));
        }
    }
    bool soft = false;
    if (wear > 0) {
        // Whether wear can use textile/leather material flags is an item
        // category rule, not a compiler jump-table address. Keep it shared.
        static constexpr int non_material_wear[] = {23, 46, 47, 49, 50, 51, 52, 72, 88};
        if (std::find(std::begin(non_material_wear), std::end(non_material_wear), type) ==
                std::end(non_material_wear)) {
            for (int bit : {24, 30, 62}) {
                bool flag = false;
                if (!material_flag(bit, flag)) return false;
                soft = soft || flag;
            }
        }
    }
    data.fields["item.soft_wear"] = {soft};
    return true;
}
