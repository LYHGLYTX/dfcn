// DF 53.16 fortress toolbar: snapshot before its inline background clear,
// then collect only the paragraph/key calls belonging to this native card.
// A partial border or an item picture over the card is not its identity.
static NativeCallHook g_native_legacy_tooltip_hook;
static uintptr_t g_native_legacy_tooltip_base = 0;
struct NativeLegacyTooltipState {
    std::shared_ptr<NativeTooltipPage> page;
    std::optional<NativeTooltipWidgetFrame> frame;
    uint64_t epoch = 0;
};
static NativeLegacyTooltipState &native_legacy_tooltip_state() {
    // Owning TLS registers thread-exit destructors even when shutdown merely
    // resets an empty capture. Those callbacks retain the DLL on Windows and
    // prevent the resident loader from acquiring the core again.
    return reloadable_thread_state<NativeLegacyTooltipState, struct LegacyTooltipTag>();
}

#ifdef _WIN32
// The floating toolbar counts its selected paragraph immediately before
// clearing [left,left+27] x [bottom-rows-1-(keys?2:0),bottom]. The argument
// already resolves custom RAW descriptions; capture that actual document.
static size_t capture_native_legacy_tooltip_rows(const void *paragraph) {
    NativeInputCallbackScope callback;
    const auto original = reinterpret_cast<NativeAnnouncementRowsFn>(
        native_pe_address(g_native_legacy_tooltip_base, 0x6ee50));
    const size_t count = callback.call_native([&] { return original(paragraph); });
    try {
        auto &state = native_legacy_tooltip_state();
        state.frame.reset();
        state.page.reset();
        auto *gps = native_graphics();
        const auto base = g_native_legacy_tooltip_base;
        const bool keys = *reinterpret_cast<const int32_t *>(native_pe_address(base, 0x18a93a8)) != 0;
        const int left = *reinterpret_cast<const int32_t *>(native_pe_address(base, 0x18a93bc));
        const int bottom = *reinterpret_cast<const int32_t *>(native_pe_address(base, 0x18a93c0));
        if (paragraph && gps && gps->screen && gps->dimx > 0 && gps->dimx <= 1000 &&
                gps->dimy > 0 && gps->dimy <= 1000 &&
                count <= static_cast<size_t>(gps->dimy)) {
            const int height = static_cast<int>(count) + (keys ? 4 : 2);
            const int top = bottom - height + 1;
            if (height >= 3 && left >= 0 && left <= gps->dimx - 28 &&
                    top >= 0 && bottom < gps->dimy &&
                    left >= gps->clipx[0] && left + 27 <= gps->clipx[1] &&
                    top >= gps->clipy[0] && bottom <= gps->clipy[1]) {
                NativeTooltipWidgetFrame frame;
                frame.bounds = {left, top, 28, height};
                frame.dimx = gps->dimx;
                frame.dimy = gps->dimy;
                frame.epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
                frame.page = std::make_shared<NativeTooltipPage>(*gps);
                frame.page->bounds = frame.bounds;
                frame.rows.assign(height, std::string(28, ' '));
                for (size_t row = 0; row < count; ++row) {
                    std::string_view source;
                    if (!native_string_view(native_paragraph_row(paragraph, row), &source, 4096)) {
                        frame.body_source.clear();
                        break;
                    }
                    if (!frame.body_source.empty()) frame.body_source += ' ';
                    frame.body_source.append(source);
                }
                state.epoch = frame.epoch;
                state.frame = std::move(frame);
            }
        }
    } catch (...) {}
    return count;
}
#else
// The custom-building entry (0x183) redirects to the RAW's wrapped description.
// These offsets belong to the same build-ID-gated ELF profile as the call sites
// below: workshop type 13/subtype 23, furnace type 5/subtype 7.
static const void *native_legacy_tooltip_paragraph(uintptr_t base, int index) {
    if (index < 0 || index >= 512) return nullptr;
    const auto *fallback = reinterpret_cast<const void *>(base + 0x26fe370 + size_t(index) * 24);
    if (index != 0x183) return fallback;
    const int type = *reinterpret_cast<const int32_t *>(base + 0x26fe344);
    const int subtype = *reinterpret_cast<const int32_t *>(base + 0x26fe348);
    const int custom = *reinterpret_cast<const int32_t *>(base + 0x26fe34c);
    const uintptr_t raw_vector = type == 13 && subtype == 23 ? 0x2828f30
        : type == 5 && subtype == 7 ? 0x2828f48 : 0;
    if (!raw_vector) return fallback;
    const auto raws = NativeBorrowedVector<const unsigned char *>::read(
        reinterpret_cast<const void *>(base + raw_vector));
    if (!raws.valid(262144)) return nullptr;
    for (size_t i = 0; i < raws.size(); ++i) {
        const auto *raw = raws.begin[i];
        if (raw && *reinterpret_cast<const int32_t *>(raw + 0x28) == custom)
            return raw + 0xbca8;
    }
    return fallback;
}

static uint64_t capture_native_legacy_tooltip_clock() {
    NativeInputCallbackScope callback;
    const auto original = reinterpret_cast<uint64_t (*)()>(g_native_legacy_tooltip_base + 0x4248a0);
    const auto tick = callback.call_native([&] { return original(); });
    try {
        auto &state = native_legacy_tooltip_state();
        state.frame.reset();
        state.page.reset();
        auto *gps = native_graphics();
        if (gps && gps->screen && gps->dimx > 0 && gps->dimx <= 1000 &&
            gps->dimy > 0 && gps->dimy <= 1000) {
            state.epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
            state.page = std::make_shared<NativeTooltipPage>(*gps);
        }
    } catch (...) {}
    return tick;
}

static void capture_native_legacy_tooltip_corner(graphicst *gps, long texture) {
    NativeInputCallbackScope callback;
    try {
        auto &state = native_legacy_tooltip_state();
        state.frame.reset();
        const auto base = g_native_legacy_tooltip_base;
        const int index = *reinterpret_cast<const int32_t *>(base + 0x26fe340);
        const auto *paragraph = native_legacy_tooltip_paragraph(base, index);
        const size_t count = native_paragraph_row_count(paragraph);
        const bool keys = *reinterpret_cast<const int64_t *>(base + 0x26fe350) != 0;
        const int height = count < 1000 ? static_cast<int>(count) + (keys ? 4 : 2) : 0;
        if (gps && state.page && height >= 3 &&
            state.epoch == g_embark_item_capture_epoch.load(std::memory_order_acquire) &&
            gps->screenx >= 0 && gps->screenx + 28 <= gps->dimx &&
            gps->screeny >= 0 && gps->screeny + height <= gps->dimy &&
            state.page->screen.size() == size_t(gps->dimx) * gps->dimy * 8) {
            NativeTooltipWidgetFrame frame;
            frame.bounds = {gps->screenx, gps->screeny, 28, height};
            frame.dimx = gps->dimx;
            frame.dimy = gps->dimy;
            frame.epoch = state.epoch;
            frame.page = state.page;
            frame.page->bounds = frame.bounds;
            frame.rows.assign(height, std::string(28, ' '));
            for (size_t row = 0; row < count; ++row) {
                std::string_view source;
                if (!native_string_view(native_paragraph_row(paragraph, row), &source, 4096)) {
                    frame.body_source.clear();
                    break;
                }
                if (!frame.body_source.empty()) frame.body_source += ' ';
                frame.body_source.append(source);
            }
            state.frame = std::move(frame);
        }
    } catch (...) {}
    const auto original = reinterpret_cast<void (*)(graphicst *, long)>(g_native_legacy_tooltip_base + 0x423d30);
    callback.call_native([&] { original(gps, texture); });
}
#endif

template<typename Draw>
static void capture_native_legacy_tooltip_text(graphicst *gps, Draw &&draw) {
    auto *previous = g_native_tooltip_write;
    NativeTooltipWidgetFrame *frame = nullptr;
    try {
        auto &pending = native_legacy_tooltip_state().frame;
        if (pending && gps && pending->dimx == gps->dimx && pending->dimy == gps->dimy &&
            pending->epoch == g_embark_item_capture_epoch.load(std::memory_order_acquire))
            frame = &*pending;
    } catch (...) {}
    if (frame) g_native_tooltip_write = frame;
    struct Restore {
        NativeTooltipWidgetFrame *previous;
        ~Restore() { g_native_tooltip_write = previous; }
    } restore{previous};
    draw();
    try {
        if (!frame) return;
        frame->document = std::make_shared<NativeTooltipPage>(*gps);
        frame->document->bounds = frame->bounds;
        std::lock_guard<std::mutex> lock(g_native_drawn_text_mutex);
        g_native_tooltip_widget_frame = *frame;
    } catch (...) {}
}

static void capture_native_legacy_tooltip_row(graphicst *gps, const NativeString *source,
        NativeJustification just, int width) {
    NativeInputCallbackScope callback;
    const auto original = reinterpret_cast<NativeCaptionDrawFn>(g_native_legacy_tooltip_base +
#ifdef _WIN32
        native_pe_rva(0xad9960));
#else
        0x425170);
#endif
    capture_native_legacy_tooltip_text(gps, [&] {
        callback.call_native([&] { original(gps, source, just, width); });
    });
}

static void capture_native_legacy_tooltip_key(void *view, long token, NativeJustification just) {
    NativeInputCallbackScope callback;
    const auto original = reinterpret_cast<void (*)(void *, long, NativeJustification)>(
        g_native_legacy_tooltip_base +
#ifdef _WIN32
        native_pe_rva(0xc394b0));
#else
        0x424620);
#endif
    capture_native_legacy_tooltip_text(native_graphics(), [&] {
        callback.call_native([&] { original(view, token, just); });
    });
}

static bool install_native_legacy_tooltip(uintptr_t base) {
    g_native_legacy_tooltip_base = base;
    std::vector<NativeCall> calls{
#ifdef _WIN32
        {0x3fb149, 0x6ee50, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_rows)},
        {0x3fb318, 0xad9960, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_row)},
        {0x3fb3c6, 0xad9960, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_row)},
        {0x3fb401, 0xc394b0, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_key)}
#else
        {0x168524c, 0x4248a0, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_clock)},
        {0x1690fef, 0x423d30, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_corner)},
        {0x16919e9, 0x425170, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_row)},
        {0x1687e4a, 0x425170, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_row)},
        {0x1687e83, 0x424620, reinterpret_cast<const void *>(&capture_native_legacy_tooltip_key)}
#endif
    };
#ifdef _WIN32
    if (!native_reference_calls(calls, 0)) return false;
#endif
    return g_native_legacy_tooltip_hook.install(base, calls, "Native legacy toolbar tooltip capture");
}
