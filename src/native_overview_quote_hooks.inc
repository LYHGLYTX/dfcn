// Overview retains its complete first-person source and wrapped rows in the
// character sheet. Bind the actual addst row loop even when the cached width
// never changes and the native paragraph wrapper is not called again.
static void clear_native_overview_quote_draw() {
    std::lock_guard<std::mutex> lock(g_native_overview_quote_mutex);
    if (!g_native_overview_quote_draw) return;
    g_native_overview_quote_draw.reset();
    g_native_overview_quote_revision.fetch_add(1, std::memory_order_release);
}

#ifdef _WIN32
struct NativeOverviewQuoteHook {
    NativeCallHook code;
    NativeCaptionDrawFn draw = nullptr;
    uintptr_t base = 0;
};
static NativeOverviewQuoteHook g_native_overview_quote_hook;

static void capture_native_overview_quote_row(graphicst *graphics,
        const NativeString *source, const void *sheet, const void *caller_frame) {
    NativeInputCallbackScope callback;
    const auto original = g_native_overview_quote_hook.draw;
    std::optional<NativeOverviewQuoteDraw> pending;
    try {
        const auto capture = [&] {
            const uintptr_t object = reinterpret_cast<uintptr_t>(sheet);
            const uintptr_t frame = reinterpret_cast<uintptr_t>(caller_frame);
            if (!object || object > UINTPTR_MAX - 0x1cfc || !frame ||
                    frame > UINTPTR_MAX - 0xb268 || !graphics || !graphics->screen ||
                    !g_overlay.translation_enabled() || graphics->dimx <= 0 ||
                    graphics->dimx > 1000 || graphics->dimy <= 0 || graphics->dimy > 1000)
                return;
            int32_t object_type = -1, page = -1;
            if (!native_history_copy(object + 8, object_type) || object_type != 0 ||
                    !native_history_copy(object + 0xc0, page) || page != 0) return;

            int32_t left = 0, right = 0, summary_top = 0, pane_bottom = 0;
            int32_t writer_x = 0, next_y = 0, bottom = 0, width = 0, cached_width = 0;
            uintptr_t live_sheet = 0;
            if (!native_history_copy(frame + 0x88, left) ||
                    !native_history_copy(frame + 0xb0, right) ||
                    !native_history_copy(frame + 0x104, summary_top) ||
                    !native_history_copy(frame + 0x108, pane_bottom) ||
                    !native_history_copy(frame + 0xb4, writer_x) ||
                    !native_history_copy(frame + 0x84, next_y) ||
                    !native_history_copy(frame + 0x7a4, bottom) ||
                    !native_history_copy(frame + 0x1068, width) ||
                    !native_history_copy(frame + 0xb260, live_sheet) || live_sheet != object ||
                    !native_history_copy(object + 0x1cf8, cached_width)) return;
            // 168a45 sets B-1; adventure's bottom button subtracts three
            // more rows at 168a62. The live caller slot is the actual limit.
            if (left < 0 || right <= left + 7 || right >= graphics->dimx ||
                    summary_top < 0 || summary_top > graphics->dimy - 29 ||
                    pane_bottom <= summary_top + 28 || pane_bottom >= graphics->dimy ||
                    (bottom != pane_bottom - 1 && bottom != pane_bottom - 4) ||
                    writer_x != left + 1 || graphics->screenx != writer_x ||
                    next_y != graphics->screeny + 1 || width != right - left - 7 ||
                    cached_width != width) return;
            const int top = summary_top + 28;
            // Preserve the original row-zero coordinate. A clipped prefix
            // cannot shift every wrapped row while retaining their indices.
            if (graphics->clipx[0] > writer_x || graphics->clipy[0] > top) return;
            right = static_cast<int>(std::min<int64_t>(right,
                std::min<int64_t>(graphics->dimx, int64_t(graphics->clipx[1]) + 1)));
            bottom = static_cast<int>(std::min<int64_t>(bottom,
                std::min<int64_t>(graphics->dimy, int64_t(graphics->clipy[1]) + 1)));
            if (right <= writer_x || bottom <= top || graphics->screeny < top ||
                    graphics->screeny >= bottom) return;

            NativeBorrowedVector<uintptr_t> rows;
            if (!native_history_read_vector(object + 0x1ce0, rows) ||
                    rows.size() == 0 || rows.size() > 4096) return;
            NativeOverviewQuoteDraw captured;
            captured.owner = object;
            captured.grid = graphics->screen;
            captured.dimx = graphics->dimx;
            captured.dimy = graphics->dimy;
            captured.left = writer_x;
            captured.right = right;
            captured.top = top;
            captured.bottom = bottom;
            if (!native_history_copy_string(object + 0x1cc0, captured.source) ||
                    captured.source.empty()) return;
            captured.wrapped_lines.reserve(rows.size());
            size_t current = SIZE_MAX;
            for (size_t index = 0; index < rows.size(); ++index) {
                const uintptr_t row = native_history_vector_at(rows, index);
                if (!row) return;
                if (row == reinterpret_cast<uintptr_t>(source)) {
                    if (current != SIZE_MAX) return;
                    current = index;
                }
                std::string line;
                if (!native_history_copy_string(row, line) ||
                        line.find_first_of("\r\n") != std::string::npos) return;
                captured.wrapped_lines.push_back(std::move(line));
            }
            if (current == SIZE_MAX || int64_t(top) + int64_t(current) != graphics->screeny)
                return;
            const size_t visible_rows = std::min(captured.wrapped_lines.size(),
                static_cast<size_t>(bottom - top));
            if (!visible_rows || current != visible_rows - 1) return;
            pending = std::move(captured);
        };
        capture();
    } catch (...) {
        // Capture owns copies only; a missing record cannot interrupt DF.
    }
    // Keep the actual addst entry and its existing caption capture. This
    // caller originally supplies zero for both justification and width.
    if (original) {
        callback.call_native([&] { original(graphics, source, 0, 0); });
        // The source vector was complete before this call, but screen cells
        // were not. Publish only after the final visible row's actual write.
        try {
            if (pending) {
                prepare_native_overview_thoughts_cache(sheet);
                std::lock_guard<std::mutex> lock(g_native_overview_quote_mutex);
                const auto &previous = g_native_overview_quote_draw;
                const bool changed = !previous || previous->owner != pending->owner ||
                    previous->dimx != pending->dimx ||
                    previous->dimy != pending->dimy || previous->left != pending->left ||
                    previous->right != pending->right || previous->top != pending->top ||
                    previous->bottom != pending->bottom || previous->source != pending->source ||
                    previous->wrapped_lines != pending->wrapped_lines;
                // Keep the latest writer address as draw metadata, but a
                // normal native buffer rotation is not a new source owner.
                g_native_overview_quote_draw = std::move(pending);
                if (changed) {
                    g_native_overview_quote_revision.fetch_add(1, std::memory_order_release);
                }
            }
        } catch (...) { /* The native row already completed. */ }
    }
}

static bool native_overview_quote_hooks_active() {
    return g_native_overview_quote_hook.code.active();
}

static bool uninstall_native_overview_quote_hooks() {
    if (!native_callbacks_idle()) return false;
    auto &hook = g_native_overview_quote_hook;
    if (!hook.code.uninstall("Native overview quote capture restore")) return false;
    hook.draw = nullptr;
    hook.base = 0;
    clear_native_overview_quote_draw();
    return true;
}

static bool install_native_overview_quote_hooks() {
    auto &hook = g_native_overview_quote_hook;
    if (hook.code.installed) return true;
    if (native_overview_quote_hooks_active() && !uninstall_native_overview_quote_hooks())
        return false;
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    const NativeCaptionSignature signatures[] = {
        // Incoming this is saved before push rdi / sub rsp,b250.
        {0x14ef90, {0x44,0x89,0x4c,0x24,0x20,0x44,0x89,0x44,0x24,0x18,
            0x89,0x54,0x24,0x10,0x48,0x89,0x4c,0x24,0x08,0x57,
            0xb8,0x50,0xb2,0x00,0x00}},
        {0x168c91, {0x48,0x8b,0x84,0x24,0x60,0xb2,0x00,0x00,
            0x48,0x05,0xc0,0x1c,0x00,0x00}},
        {0x168d6c, {0x48,0x05,0xe0,0x1c,0x00,0x00}},
        {0x168e43, {0x44,0x8b,0x84,0x24,0xb4,0x00,0x00,0x00,
            0x8b,0x94,0x24,0x84,0x00,0x00,0x00}},
        {0x168e5e, {0x8b,0x84,0x24,0x84,0x00,0x00,0x00,0xff,0xc0,
            0x89,0x84,0x24,0x84,0x00,0x00,0x00}},
        {0x168e7b, {0x48,0x8b,0x00,0x45,0x33,0xc9,0x45,0x33,0xc0,
            0x48,0x8b,0xd0}},
    };
    NativePatchPages readable;
    for (const auto &signature : signatures) {
        if (!collect_native_patch_pages(readable, native_pe_address(base, signature.address),
                signature.bytes.size(), native_patch_page_size(), true,
                "Native overview quote identity") ||
                !native_pe_match(base, signature.address, signature.bytes.data(),
                    signature.bytes.size())) return false;
    }
    struct InstallGuard {
        bool committed = false;
        ~InstallGuard() { if (!committed) uninstall_native_overview_quote_hooks(); }
    } guard;
    clear_native_overview_quote_draw();
    hook.base = base;
    hook.draw = reinterpret_cast<NativeCaptionDrawFn>(native_pe_address(base, 0xad9960));
    // The native CALL pushed eight bytes. Preserve GPS/source in RCX/RDX,
    // pass this from caller rsp+b260 and that exact caller frame in R8/R9.
    std::vector<NativeCall> calls{{0x168e8e, 0xad9960,
        reinterpret_cast<const void *>(&capture_native_overview_quote_row),
        {0x4c,0x8b,0x84,0x24,0x68,0xb2,0x00,0x00,
         0x4c,0x8d,0x4c,0x24,0x08}}};
    if (!native_reference_calls(calls, 0) ||
            !hook.code.install(base, calls, "Native overview quote capture")) return false;
    guard.committed = true;
    return true;
}
#else
static bool native_overview_quote_hooks_active() { return false; }
static bool install_native_overview_quote_hooks() { return true; }
static bool uninstall_native_overview_quote_hooks() {
    clear_native_overview_quote_draw();
    return true;
}
#endif
