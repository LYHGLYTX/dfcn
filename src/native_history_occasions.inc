// The schedule and each feature are native discriminated records. The
// formatter d3bea0 consumes the same vectors for all four occasion events.
#include "native_history_schedule.inc"
static bool capture_native_history_occasion(NativeHistoryEventData &event,
        decltype(NativeHistoryEventData::fields) &fields,
        decltype(NativeHistoryEventData::references) &references) {
    const uintptr_t base = native_history_profile_base();
    const int32_t entity_id = fields.at("entity").front(), occasion_id = fields.at("occasion").front();
    const uintptr_t entity = native_history_find_subject(base, NativeHistoryObjectKind::Entity, entity_id);
    uintptr_t occasions = 0, occasion = 0, schedule = 0;
    if (entity && (!native_history_copy(entity + 0x1310, occasions) ||
            (occasions && !native_history_find_structure_id(occasions, 0, occasion_id, occasion)))) return false;
    fields["occasion_named"] = {0};
    fields["schedule_present"] = {0};
    fields["features"] = {};
    if (!occasion) return true;
    NativeHistorySubject name;
    name.kind = NativeHistoryObjectKind::Occasion;
    name.id = entity_id;
    name.subid = occasion_id;
    if (!capture_native_history_name(base, occasion + 0x10, name.name)) return false;
    fields["occasion_named"] = {name.name.has_name};
    if (name.name.has_name) event.subjects.push_back(std::move(name));
    const int32_t index = fields.at("schedule").front();
    NativeBorrowedVector<uintptr_t> schedules;
    if (!native_history_read_vector(occasion + 0xa0, schedules)) return false;
    if (index < 0 || static_cast<size_t>(index) >= schedules.size()) return true;
    schedule = native_history_vector_at(schedules, index);
    if (!schedule) return true;
    fields["schedule_present"] = {1};
    int32_t type = -1, value = -1, extra = -1;
    if (!native_history_copy(schedule, type) || !native_history_copy(schedule + 4, value) ||
            !native_history_copy(schedule + 8, extra)) return false;
    fields["schedule_type"] = {type};
    fields["schedule_value"] = {value};
    fields["schedule_extra"] = {extra};
    if (event.native_type == 81 && type == 3) {
        uintptr_t referenced = 0;
        if (!native_history_find_structure_id(native_history_global(0x24f9cb8), 0x20, value, referenced)) return false;
        if (!referenced) fields["schedule_value"] = {-1};
    }
    if ((event.native_type == 81 && type < 3 && type >= 0) ||
            (event.native_type == 82 && type >= 4 && type <= 6)) {
        const int form_type = event.native_type == 82 ? type - 4 : type;
        const auto kind = form_type == 0 ? NativeHistoryObjectKind::Dance :
            form_type == 1 ? NativeHistoryObjectKind::Music : NativeHistoryObjectKind::Poem;
        if (!native_history_form_reference(event, kind, value)) return false;
    }
    if (event.native_type == 82 && type == 9) {
        std::string species;
        if (!capture_native_history_creature_label(base, static_cast<int16_t>(value),
                static_cast<int16_t>(extra), false, species)) return false;
        event.texts["race_species"] = std::move(species);
    }
    if (event.native_type == 83) {
        const int site = fields.at("site").front();
        const bool has_site = native_history_find_subject(base, NativeHistoryObjectKind::Site, site) != 0;
        fields["route_present"] = {has_site};
        if (has_site) {
            if (value != -1 && !native_history_structure_reference(event, site, value)) return false;
            if (extra != -1 && !native_history_structure_reference(event, site, extra)) return false;
        }
    }
    return capture_native_history_schedule_features(schedule, event, fields, references);
}
