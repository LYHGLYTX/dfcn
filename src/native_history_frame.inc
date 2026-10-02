// Freeze Legends page identity and its token draws at the same native render
// boundary. The simulation can select another tab before SDL presents this
// grid; consumers must not reinterpret it using that newer selection.
static std::mutex g_native_history_frame_mutex;
static std::shared_ptr<const NativeHistoryRenderedFrame> g_native_history_rendered_frame;
struct NativeHistoryRenderHook {
    NativeEntryHook entry;
    NativeImportHook table;

    bool active() const { return entry.active() || table.active(); }
    void *original() const { return entry.original ? entry.original : table.original; }

    bool install(const NativeHistoryProfile &profile, void *callback, const char *label) {
        if (profile.legends_render_entry) {
            if (!entry.prepare(profile.legends_render_entry, profile.legends_render_prefix,
                    callback, {}, label)) return false;
            return entry.install(label);
        }
        table = {profile.legends_render_slot, nullptr, callback};
        return table.install(label);
    }

    bool uninstall(const char *label) {
        if (!entry.uninstall(label) || !table.uninstall(label)) return false;
        table = {};
        return true;
    }
};
static NativeHistoryRenderHook g_native_history_render_hook;
using NativeHistoryRenderFn = void (*)(void *, uint32_t);

NativeHistoryFrameScope::NativeHistoryFrameScope(const graphicst *graphics) {
    if (previous_ || !graphics) return;
    {
        std::lock_guard<std::mutex> lock(g_native_history_frame_mutex);
        frame_ = g_native_history_rendered_frame;
    }
    // Do not carry a Legends snapshot into another screen or resized buffer.
    // Only screen identity is live here; selection and richbox contents are
    // deliberately NOT read from the potentially advanced simulation state.
    if (frame_ && frame_->grid == graphics->screen &&
            frame_->dimx == graphics->dimx && frame_->dimy == graphics->dimy &&
            frame_->screen_object == native_history_legends_screen())
        g_native_history_frame = frame_.get();
}

static void clear_native_history_rendered_frame() {
    std::lock_guard<std::mutex> lock(g_native_history_frame_mutex);
    g_native_history_rendered_frame.reset();
}

static void capture_native_history_render(void *screen, uint32_t tick) {
    NativeHistoryCallbackScope callback;
    struct DrawPass {
        bool previous = g_native_history_legends_rendering;
        DrawPass() {
            begin_native_history_draw_pass();
            g_native_history_legends_rendering = true;
        }
        ~DrawPass() { g_native_history_legends_rendering = previous; }
    } pass;
    const auto original = reinterpret_cast<NativeHistoryRenderFn>(g_native_history_render_hook.original());
    original(screen, tick);
    try {
        const auto *graphics = native_graphics();
        if (!graphics || !graphics->screen ||
                native_history_legends_screen() != reinterpret_cast<uintptr_t>(screen)) {
            clear_native_history_rendered_frame();
            return;
        }
        auto frame = std::make_shared<NativeHistoryRenderedFrame>();
        frame->screen_object = reinterpret_cast<uintptr_t>(screen);
        frame->grid = graphics->screen;
        frame->dimx = graphics->dimx;
        frame->dimy = graphics->dimy;
        frame->owner = native_history_legends_owner();
        frame->caption = native_history_legends_caption();
        frame->ready = native_history_legends_ready();
        frame->ownership = native_history_legends_ownership_confirmed();
        frame->observed = native_history_legends_draw_observed();
        frame->draws = captured_native_history_draws();
        frame->unbound = captured_native_history_unbound_draws();
        // A non-history tab still publishes an explicit owner=0 frame. An
        // inactive detail tab must not turn its catalog into event prose.
        const auto tab = native_history_legends_tab(false);
        frame->context = 1469598103934665603ULL;
        for (uint64_t value : {uint64_t(tab.tab), uint64_t(tab.type), uint64_t(tab.index),
                native_history_registry_revision(), uint64_t(frame->ready),
                uint64_t(frame->ownership), uint64_t(frame->observed)}) {
            frame->context ^= value;
            frame->context *= 1099511628211ULL;
        }
        std::lock_guard<std::mutex> lock(g_native_history_frame_mutex);
        g_native_history_rendered_frame = std::move(frame);
    } catch (...) {
        clear_native_history_rendered_frame();
        log_line("WARN", "Could not capture the completed native Legends render");
    }
}
