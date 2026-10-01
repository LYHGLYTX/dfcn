static std::atomic_uint g_active_native_input_callbacks{0};

struct NativeInputCallbackScope {
    using Clock = std::chrono::steady_clock;
    bool tracing = false;
    std::source_location location;
    Clock::time_point started{}, native_finished{};
    double before_native_ms = 0;
    double native_ms = 0;
    unsigned native_calls = 0;

    explicit NativeInputCallbackScope(
            const std::source_location caller = std::source_location::current())
        : location(caller) {
        g_active_native_input_callbacks.fetch_add(1, std::memory_order_acq_rel);
        tracing = dfcn::translation_state_trace_enabled.load(std::memory_order_relaxed);
        if (tracing) started = Clock::now();
    }

    template<typename Call>
    decltype(auto) call_native(Call &&call) {
        if (!tracing) return call();
        const auto begin = Clock::now();
        if (!native_calls)
            before_native_ms = std::chrono::duration<double, std::milli>(
                begin - started).count();
        ++native_calls;
        struct EndNativeCall {
            NativeInputCallbackScope &scope;
            Clock::time_point begin;
            ~EndNativeCall() {
                scope.native_finished = Clock::now();
                scope.native_ms += std::chrono::duration<double, std::milli>(
                    scope.native_finished - begin).count();
            }
        } finish{*this, begin};
        return call();
    }

    ~NativeInputCallbackScope() noexcept {
        if (tracing) {
            const auto finished = Clock::now();
            const double total_ms = std::chrono::duration<double, std::milli>(
                finished - started).count();
            // Most callbacks run for every candidate or widget. Only slow
            // calls format or write a diagnostic; no glyph/input spam.
            if (total_ms >= 100.0) {
                try {
                    std::ostringstream out;
                    out << std::fixed << std::setprecision(3)
                        << "Slow native input callback: thread="
                        << dfcn::translation_state_thread_id()
                        << "; callback=" << location.function_name()
                        << "; location=" << location.file_name() << ':' << location.line()
                        << "; total_ms=" << total_ms
                        << "; before_native_ms=" << (native_calls ? before_native_ms : total_ms)
                        << "; native_ms=" << native_ms
                        << "; after_native_ms=" << (native_calls
                            ? std::chrono::duration<double, std::milli>(
                                finished - native_finished).count() : 0.0)
                        << "; native_calls=" << native_calls;
                    log_line("INFO", out.str());
                } catch (...) {
                    // Diagnostics must never unwind through a native ABI.
                }
            }
        }
        // Keep the core/trampoline alive until optional logging also returns.
        g_active_native_input_callbacks.fetch_sub(1, std::memory_order_acq_rel);
    }
    NativeInputCallbackScope(const NativeInputCallbackScope &) = delete;
    NativeInputCallbackScope &operator=(const NativeInputCallbackScope &) = delete;
};

static bool native_callbacks_idle() {
    return g_active_native_input_callbacks.load(std::memory_order_acquire) == 0;
}

using GetMouseStateFn = Uint32 (*)(int *, int *);
static GetMouseStateFn g_real_get_mouse_state = nullptr;

static Uint32 dfcn_get_mouse_state(int *x, int *y) {
    NativeInputCallbackScope callback;
    const Uint32 buttons = g_real_get_mouse_state
        ? callback.call_native([&] { return g_real_get_mouse_state(x, y); }) : 0;
    const bool has_x = g_real_get_mouse_state && x;
    const bool has_y = g_real_get_mouse_state && y;
    const int original_x = has_x ? *x : 0;
    const int original_y = has_y ? *y : 0;
    g_overlay.remap_legends_mouse(x, y);
    InputDeliveryTiming::note_mouse_state(buttons, original_x, original_y,
        has_x ? *x : 0, has_y ? *y : 0, has_x, has_y);
    return buttons;
}
