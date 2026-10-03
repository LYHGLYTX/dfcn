// The Labor captions are owned by live widgets and work_detail records.
// In 53.16 text::render (0x1419660) passes &str at +0x150 directly to
// addst_flag. The left select_list copies work_detail.name into its Text;
// its selection callback retains the original work_detail pointer. The
// right labor selector creates one Text from each unit_labor enum value.
static std::optional<NativeFortressLaborCaption> capture_native_fortress_labor_caption(
        uintptr_t source_address) {
#ifdef _WIN32
    const uintptr_t base = reinterpret_cast<uintptr_t>(GetModuleHandleW(nullptr));
    if (!base || !native_pe_supported() || source_address < 0x150) return std::nullopt;
    const auto address = [&](uintptr_t reference) {
        // Keep literal coordinates at the binding API: the normal build's
        // coordinate collector deliberately does not infer lambda arguments.
        switch (reference) {
        case 0x1618aa0: return native_pe_address(base, 0x1618aa0);
        case 0x162dc10: return native_pe_address(base, 0x162dc10);
        case 0x15eb4a8: return native_pe_address(base, 0x15eb4a8);
        case 0x15f6df0: return native_pe_address(base, 0x15f6df0);
        case 0x15f6fc0: return native_pe_address(base, 0x15f6fc0);
        case 0x15eef08: return native_pe_address(base, 0x15eef08);
        case 0x15f6f68: return native_pe_address(base, 0x15f6f68);
        case 0x163bf00: return native_pe_address(base, 0x163bf00);
        case 0x163be90: return native_pe_address(base, 0x163be90);
        case 0x163c1c0: return native_pe_address(base, 0x163c1c0);
        case 0x1785b28: return native_pe_address(base, 0x1785b28);
        case 0x163c900: return native_pe_address(base, 0x163c900);
        case 0x2399980: return native_pe_address(base, 0x2399980);
        default: return uintptr_t{0};
        }
    };
    const auto read = [&](uintptr_t pointer, void *destination, size_t size) {
        if (!native_info_title_memory_readable(reinterpret_cast<const void *>(pointer), size))
            return false;
        std::memcpy(destination, reinterpret_cast<const void *>(pointer), size);
        return true;
    };
    const auto pointer_at = [&](uintptr_t pointer, uintptr_t &result) {
        return read(pointer, &result, sizeof(result));
    };
    const auto string_at = [&](uintptr_t pointer, std::string &result, size_t maximum = 4096) {
        NativeString snapshot{};
        if (!read(pointer, &snapshot, sizeof(snapshot)) || snapshot.size > snapshot.capacity ||
                snapshot.size > maximum) return false;
        const char *data = snapshot.capacity <= 15 ? snapshot.storage.small : snapshot.storage.heap;
        if (snapshot.size && (!data || (snapshot.capacity > 15 &&
                !native_info_title_memory_readable(data, snapshot.size)))) return false;
        result.assign(data ? data : "", snapshot.size);
        return result.find('\0') == std::string::npos;
    };
    struct Widget {
        uintptr_t pointer = 0, vtable = 0, parent = 0;
        std::array<int32_t, 4> rect{};
    };
    const auto widget_at = [&](uintptr_t pointer, Widget &result) {
        std::array<unsigned char, 0xa1> bytes{};
        if (!read(pointer, bytes.data(), bytes.size()) || (bytes[0xa0] & 3) != 3)
            return false;
        result.pointer = pointer;
        std::memcpy(&result.vtable, bytes.data(), sizeof(result.vtable));
        std::memcpy(&result.parent, bytes.data() + 8, sizeof(result.parent));
        std::memcpy(result.rect.data(), bytes.data() + 0x10, sizeof(result.rect));
        return result.rect[2] >= result.rect[0] && result.rect[3] >= result.rect[1] &&
            result.rect[0] >= -1000 && result.rect[1] >= -1000 &&
            result.rect[2] <= 2000 && result.rect[3] <= 2000;
    };
    const auto is = [&](const Widget &widget, uintptr_t reference) {
        const uintptr_t expected = address(reference);
        return expected && widget.vtable == expected;
    };
    const auto children = [&](uintptr_t pointer, std::array<uintptr_t, 3> &vector,
            size_t maximum = 8192) {
        if (!read(pointer + 0x160, vector.data(), sizeof(vector)) || !vector[0] ||
                vector[0] > vector[1] || vector[1] > vector[2] ||
                (vector[1] - vector[0]) % 16 || (vector[2] - vector[0]) % 16 ||
                (vector[1] - vector[0]) / 16 > maximum) return false;
        return vector[0] == vector[1] || native_info_title_memory_readable(
            reinterpret_cast<const void *>(vector[0]), vector[1] - vector[0]);
    };
    const auto child_index = [&](const Widget &parent, const Widget &child) -> std::optional<size_t> {
        if (child.parent != parent.pointer) return std::nullopt;
        std::array<uintptr_t, 3> vector{};
        if (!children(parent.pointer, vector)) return std::nullopt;
        for (uintptr_t at = vector[0]; at < vector[1]; at += 16) {
            uintptr_t member = 0;
            std::memcpy(&member, reinterpret_cast<const void *>(at), sizeof(member));
            if (member == child.pointer) return (at - vector[0]) / 16;
        }
        return std::nullopt;
    };
    const auto caption_box = [&](const Widget &entry, const Widget &text,
            SDL_Rect &result, int32_t native_inset = -1) {
        // Text measures the English caption, while its entry owns the full
        // allocated row. Keep the native category/labor inset and reserve
        // the live right-hand controls instead of centering by glyph width.
        std::array<uintptr_t, 3> vector{};
        if (!children(entry.pointer, vector)) return false;
        const int32_t left = native_inset >= 0 ? entry.rect[0] + native_inset : text.rect[0];
        int32_t right = entry.rect[2] + 1;
        for (uintptr_t at = vector[0]; at < vector[1]; at += 16) {
            uintptr_t member = 0;
            std::memcpy(&member, reinterpret_cast<const void *>(at), sizeof(member));
            if (member == text.pointer) continue;
            Widget sibling;
            if (!widget_at(member, sibling) || sibling.parent != entry.pointer) continue;
            if (sibling.rect[0] > left && sibling.rect[0] < right)
                right = sibling.rect[0];
        }
        if (right <= left) return false;
        result = {left, text.rect[1], right - left, text.rect[3] - text.rect[1] + 1};
        return true;
    };
    const auto complete_text = [&](const Widget &text, std::string &result) {
        // text_truncated retains the original before arrange abbreviates str.
        return string_at(text.pointer + (is(text, 0x162dc10) ? 0x180 : 0x150), result);
    };
    const auto belongs_to_labor = [&](Widget current) {
        // The selected-detail pane is placed in a widget_stack. This layer
        // is part of the native parent chain, even though it renders through
        // container::render. Every edge must still be a real child slot.
        for (size_t depth = 0; depth < 12; ++depth) {
            Widget ancestor;
            if (!widget_at(current.parent, ancestor)) return false;
            if (!is(ancestor, 0x15eb4a8) && !is(ancestor, 0x15f6df0) &&
                    !is(ancestor, 0x15f6fc0) && !is(ancestor, 0x15eef08) &&
                    !is(ancestor, 0x15f6f68) && !is(ancestor, 0x163bf00)) return false;
            if (!child_index(ancestor, current)) return false;
            if (is(ancestor, 0x163bf00)) return true;
            current = ancestor;
        }
        return false;
    };
    Widget text, entry, parent;
    if (!widget_at(source_address - 0x150, text) ||
            (!is(text, 0x1618aa0) && !is(text, 0x162dc10)) ||
            !widget_at(text.parent, entry) || !is(entry, 0x15eb4a8) ||
            !child_index(entry, text) || !widget_at(entry.parent, parent)) return std::nullopt;

    // The Reset action is a Text inside a container button, with a native
    // activated callback unique to restoring the selected work detail.
    // Its complete caption must not fall back to separate Reset/default runs.
    std::array<uintptr_t, 3> actions{};
    if (read(entry.pointer + 0x68, actions.data(), sizeof(actions)) && actions[0] &&
            actions[0] <= actions[1] && actions[1] <= actions[2] &&
            (actions[1] - actions[0]) % 0x40 == 0 &&
            actions[1] - actions[0] <= 64 * 0x40) {
        for (uintptr_t at = actions[0]; at < actions[1]; at += 0x40) {
            uintptr_t callback = 0, table = 0;
            if (!pointer_at(at + 0x38, callback) || !pointer_at(callback, table) ||
                    table != address(0x163be90)) continue;
            if (!belongs_to_labor(entry)) return std::nullopt;
            NativeFortressLaborCaption result;
            result.kind = NativeFortressLaborKind::Control;
            result.owner = text.pointer;
            // The button owns both borders. Its inner frame, rather than
            // the measured English Text, supplies the translated centre.
            const int32_t width = entry.rect[2] - entry.rect[0] - 1;
            const int32_t height = entry.rect[3] - entry.rect[1] - 1;
            if (width <= 0 || height <= 0) return std::nullopt;
            result.box = {entry.rect[0] + 1, entry.rect[1] + 1, width, height};
            if (!complete_text(text, result.source) || result.source.empty()) return std::nullopt;
            return result;
        }
    }

    // The dedicated labor selector inherits scroll_rows. Its enum vector
    // and child vector have the same order, including negative categories.
    // Unit rosters, name editors and action buttons have other native owners.
    if (is(parent, 0x163c1c0) && child_index(parent, entry)) {
        std::array<uintptr_t, 3> labors{};
        const auto index = child_index(parent, entry);
        if (!index || !read(parent.pointer + 0x1b8, labors.data(), sizeof(labors)) ||
                !labors[0] || labors[0] > labors[1] || labors[1] > labors[2] ||
                (labors[1] - labors[0]) % 4 || (labors[2] - labors[0]) % 4 ||
                labors[1] - labors[0] > 128 * 4 ||
                *index >= (labors[1] - labors[0]) / 4) return std::nullopt;
        int32_t labor = 0;
        if (!read(labors[0] + *index * 4, &labor, sizeof(labor)) ||
                labor < -13 || labor > 82) return std::nullopt;
        if (!belongs_to_labor(parent)) return std::nullopt;
        NativeFortressLaborCaption result;
        result.kind = NativeFortressLaborKind::Label;
        result.owner = text.pointer;
        if (!caption_box(entry, text, result.box, labor < 0 ? 2 : 3)) return std::nullopt;
        if (!complete_text(text, result.source) || result.source.empty()) return std::nullopt;
        return result;
    }

    // Left entries belong to the embedded scroll_rows of select_list.
    // select_list::add_entry stores callbacks in a map keyed by entry index;
    // this work-detail callback captures the interface and record pointers.
    Widget list, labor_root;
    const auto index = child_index(parent, entry);
    if (!is(parent, 0x15eef08) || !index || !widget_at(parent.parent, list) ||
            !is(list, 0x1785b28) || parent.pointer != list.pointer + 0x160 ||
            !widget_at(list.parent, labor_root) || !is(labor_root, 0x163bf00) ||
            !child_index(labor_root, list)) return std::nullopt;
    std::string list_name;
    if (!string_at(list.pointer + 0x80, list_name, 64) || list_name != "Details")
        return std::nullopt;
    uintptr_t head = 0, node = 0;
    if (!pointer_at(list.pointer + 0x310, head) || !pointer_at(head + 8, node))
        return std::nullopt;
    uintptr_t callback = 0;
    for (size_t depth = 0; depth < 64; ++depth) {
        std::array<unsigned char, 0x68> bytes{};
        if (!read(node, bytes.data(), bytes.size()) || bytes[0x19]) break;
        size_t key = 0;
        std::memcpy(&key, bytes.data() + 0x20, sizeof(key));
        if (key == *index) {
            std::memcpy(&callback, bytes.data() + 0x60, sizeof(callback));
            break;
        }
        std::memcpy(&node, bytes.data() + (*index < key ? 0 : 0x10), sizeof(node));
    }
    std::array<uintptr_t, 3> closure{};
    if (!read(callback, closure.data(), sizeof(closure)) ||
            closure[0] != address(0x163c900) || closure[1] != labor_root.pointer)
        return std::nullopt;
    const uintptr_t detail = closure[2];
    std::array<uintptr_t, 3> details{};
    if (!read(address(0x2399980), details.data(), sizeof(details)) || !details[0] ||
            details[0] > details[1] || details[1] > details[2] ||
            (details[1] - details[0]) % sizeof(uintptr_t) ||
            details[1] - details[0] > 8192 * sizeof(uintptr_t) ||
            !native_info_title_memory_readable(reinterpret_cast<const void *>(details[0]),
                details[1] - details[0])) return std::nullopt;
    bool live_detail = false;
    for (uintptr_t at = details[0]; at < details[1]; at += sizeof(uintptr_t)) {
        uintptr_t member = 0;
        std::memcpy(&member, reinterpret_cast<const void *>(at), sizeof(member));
        if (member == detail) { live_detail = true; break; }
    }
    uint32_t flags = 0;
    if (!live_detail || !read(detail + 0x20, &flags, sizeof(flags))) return std::nullopt;
    NativeFortressLaborCaption result;
    result.kind = NativeFortressLaborKind::DetailName;
    result.owner = detail;
    result.authored = (flags & 1) == 0;
    // select_list::add_entry uses left inset 2; the Labor builder adds 4
    // for its work-detail icon. Its English Text rect can be measured tighter.
    if (!caption_box(entry, text, result.box, 6)) return std::nullopt;
    if (!string_at(detail, result.source) || result.source.empty()) return std::nullopt;
    return result;
#else
    (void)source_address;
    return std::nullopt;
#endif
}
