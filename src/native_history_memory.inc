// One bounded field resolver for all native snapshots. Coordinates in the
// reviewed recipes name schema fields; only generated ABI bindings turn them
// into addresses. Never adjust a whole event by a guessed padding delta.
#include "native_history_layouts.inc"

static uintptr_t native_history_bound_field(uintptr_t object,
        const native_history_layout::Field *fields, size_t count,
        size_t coordinate, size_t width = 1) {
    if (!object || !width) return 0;
    for (size_t i = 0; i < count; ++i) {
        const auto &field = fields[i];
        if (coordinate < field.legacy || coordinate - field.legacy >= field.size) continue;
        const size_t delta = coordinate - field.legacy;
        if (width > field.size - delta || field.native > UINTPTR_MAX - object ||
                delta > UINTPTR_MAX - object - field.native) return 0;
        const uintptr_t address = object + field.native + delta;
        return width <= UINTPTR_MAX - address ? address : 0;
    }
    return 0;
}

static uintptr_t native_history_event_field(const void *event, int32_t type,
        size_t coordinate, size_t width = 1) {
    if (type < 0 || static_cast<size_t>(type) >= std::size(native_history_layout::events)) return 0;
    const auto &layout = native_history_layout::events[type];
    return native_history_bound_field(reinterpret_cast<uintptr_t>(event),
        layout.fields, layout.count, coordinate, width);
}

static const native_history_layout::Object *native_history_object_layout(std::string_view name) {
    const auto &objects = native_history_layout::objects;
    const auto found = std::lower_bound(std::begin(objects), std::end(objects), name,
        [](const auto &object, std::string_view key) { return std::string_view(object.name) < key; });
    return found != std::end(objects) && name == found->name ? found : nullptr;
}

static const native_history_layout::Object *native_history_dynamic_layout(uintptr_t object) {
    const uintptr_t base = native_history_profile_base();
    uintptr_t table = 0;
    if (!base || !native_history_copy(object, table) || table < base) return nullptr;
    for (const auto &layout : native_history_layout::objects)
        if (layout.table && table == native_reference_address(base, layout.table)) return &layout;
    return nullptr;
}

static uintptr_t native_history_object_field(uintptr_t object, std::string_view type,
        size_t coordinate, size_t width = 1) {
    const auto *layout = type.empty() ? native_history_dynamic_layout(object) :
        native_history_object_layout(type);
    return layout ? native_history_bound_field(object, layout->fields, layout->count, coordinate, width) : 0;
}

static bool native_history_object_is(uintptr_t object, std::string_view type) {
    const auto *layout = native_history_dynamic_layout(object);
    return layout && type == layout->name;
}

static size_t native_history_virtual_slot(uintptr_t object, size_t coordinate) {
    const auto *layout = native_history_dynamic_layout(object);
    if (!layout || coordinate % sizeof(uintptr_t) || coordinate / sizeof(uintptr_t) >= layout->slot_count)
        return SIZE_MAX;
    return layout->slots[coordinate / sizeof(uintptr_t)];
}

static uintptr_t native_history_global(uintptr_t coordinate) {
    const uintptr_t base = native_history_profile_base();
    if (!base) return 0;
    if (coordinate == 0x189c298) return native_reference_address(base, native_history_layout::gamemode_rva);
    if (coordinate == 0x239367c)
        return native_history_object_field(native_reference_address(base, native_history_layout::plotinfo_rva),
            "plotinfost", 0x244c, 2);
    if (coordinate < 0x23d14f0) return 0;
    return native_history_bound_field(native_reference_address(base, native_history_layout::world_rva),
        native_history_layout::world_fields, std::size(native_history_layout::world_fields),
        coordinate - 0x23d14f0);
}
