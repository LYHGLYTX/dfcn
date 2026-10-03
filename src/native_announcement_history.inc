// Borrowed native fields only. Layouts come from the same generated ABI
// declarations as historical records; no per-host announcement algorithm.
static bool native_announcement_display_tail(std::vector<uintptr_t> &records) {
    NativeBorrowedVector<uintptr_t> native;
    if (!native_history_read_vector(native_history_global(0x23d14f0 + 0x112378), native))
        return false;
    const size_t count = std::min(native.size(), size_t{10});
    records.resize(count);
    return !count || native_history_copy_bytes(reinterpret_cast<uintptr_t>(native.begin) +
        (native.size() - count) * sizeof(uintptr_t), records.data(), count * sizeof(uintptr_t));
}

static bool native_announcement_history_index(std::vector<uintptr_t> &records,
        int32_t &next_id, uintptr_t &world) {
    NativeBorrowedVector<uintptr_t> native;
    if (!native_history_read_vector(native_history_global(0x24e3850), native) ||
        !native_history_copy(native_history_global(0x23d14f0 + 0x1123ec), next_id) ||
        !native_history_copy(native_history_global(0x24ebb58), world)) return false;
    records.resize(native.size());
    return records.empty() || native_history_copy_bytes(
        reinterpret_cast<uintptr_t>(native.begin), records.data(), records.size() * sizeof(uintptr_t));
}

static bool native_announcement_history_row(uintptr_t address, NativeAnnouncementHistoryRow &row) {
    // This is the generated report layout, including its real ID at PE +0x50
    // and compiler-owned ELF offsets. A single header read replaces separate
    // guarded reads for type, flags, repeats, identity and the string header.
    constexpr auto &fields = native_history_layout::f_report_fields;
    constexpr size_t snapshot_size = [] {
        size_t result = 0;
        for (const auto &field : native_history_layout::f_report_fields)
            result = std::max(result, field.native + field.size);
        return result;
    }();
    std::array<unsigned char, snapshot_size> snapshot{};
    if (!native_history_copy_bytes(address, snapshot.data(), snapshot.size())) return false;
    int16_t type = -1;
    uint8_t flags = 0;
    std::memcpy(&type, snapshot.data() + fields[0].native, sizeof(type));
    std::memcpy(&flags, snapshot.data() + fields[5].native, sizeof(flags));
    std::memcpy(&row.repeats, snapshot.data() + fields[6].native, sizeof(row.repeats));
    std::memcpy(&row.id, snapshot.data() + fields[15].native, sizeof(row.id));
    for (size_t index = 0; index < row.identity.size(); ++index)
        std::memcpy(&row.identity[index], snapshot.data() + fields[16 + index].native, sizeof(int32_t));
    std::memcpy(&row.pool, snapshot.data() + fields[21].native, sizeof(row.pool));
    if (type < 0 || type >= 356 || !native_history_copy_string_snapshot(
            address + fields[1].native, snapshot.data() + fields[1].native, row.source)) return false;
    row.type = type;
    row.continued = (flags & 1) != 0;
    return true;
}

// ELF 53.16: 1160332..1160365 wraps report::text at 95 columns;
// 11602fb/1160543 retain the parent report in EVERY adv_announcementst.
// 11b36dc..11b3722 and 11b3980 select row::str, or parent::text when
// str is empty. 11b3a48..11b3b18 centers non-speech, non-continuations.
// Follow that ownership for every report type, independently of the history
// cache, submission time, line length, translation success or scroll position.
static std::vector<NativeAnnouncementParagraph> native_adventure_announcement_paragraphs() {
    std::vector<NativeAnnouncementParagraph> result;
    uint32_t flags = 0;
    NativeBorrowedVector<uintptr_t> native;
    if (!native_history_copy(native_history_global(0x23d14f0 + 0x116720), flags) ||
        !(flags & 0x10) ||
        !native_history_read_vector(native_history_global(0x23d14f0 + 0x116730), native))
        return result;
    for (size_t index = 0; index < native.size(); ++index) {
        const uintptr_t address = native_history_vector_at(native, index);
        uintptr_t parent = 0;
        NativeAnnouncementDisplayRow row;
        row.address = native_history_object_field(address, "adv_announcementst", 0, 32);
        if (!native_history_copy(native_history_object_field(address,
                "adv_announcementst", 0x20, sizeof(uintptr_t)), parent) || !parent ||
            !native_history_copy_string(row.address, row.source)) return {};
        if (result.empty() || result.back().parent != parent) {
            NativeAnnouncementParagraph paragraph;
            paragraph.parent = parent;
            uint8_t report_flags = 0;
            int32_t speaker = -1;
            if (!native_history_copy_string(native_history_object_field(parent,
                    "report", 8, 32), paragraph.source) ||
                !native_history_copy(native_history_object_field(parent,
                    "report", 0x30), report_flags) ||
                !native_history_copy(native_history_object_field(parent,
                    "report", 0x64, 4), speaker)) return {};
            paragraph.centered = !(report_flags & 1) && speaker == -1;
            result.push_back(std::move(paragraph));
        }
        if (row.source.empty()) {
            row.address = native_history_object_field(parent, "report", 8, 32);
            row.source = result.back().source;
        }
        result.back().rows.push_back(std::move(row));
    }
    return result;
}
