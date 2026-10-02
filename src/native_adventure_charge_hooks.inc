// Capture each unit-name append before the movement constructor concatenates
// same-tile charge targets. The native caption and its original control flow
// remain unchanged; only its exact owned field boundaries reach the overlay.
#ifdef _WIN32
using NativeAdventureChargeCaptionFn = void (*)(void *, NativeString *);
using NativeAdventureChargeUnitFn = void (*)(void *, NativeString *, int32_t, bool, bool);
using NativeAdventureChargeAppendFn = NativeString *(*)(NativeString *, const char *, size_t);

struct NativeAdventureChargeCall {
    NativeString *caption = nullptr;
    NativeAdventureChargeCall *parent = nullptr;
    NativeString *pending_output = nullptr;
    uintptr_t pending_unit = 0;
    std::string pending_source;
    std::optional<std::string> pending_target;
    std::vector<NativeAdventureChargePart> parts;
    bool failed = false, pending = false;
};

// A trivial pointer permits DLL unload without a thread-local destructor.
static thread_local NativeAdventureChargeCall *g_native_adventure_charge_call = nullptr;

struct NativeAdventureChargeScope {
    NativeAdventureChargeCall &call;
    explicit NativeAdventureChargeScope(NativeAdventureChargeCall &value) : call(value) {
        call.parent = g_native_adventure_charge_call;
        g_native_adventure_charge_call = &call;
    }
    ~NativeAdventureChargeScope() { g_native_adventure_charge_call = call.parent; }
};

struct NativeAdventureChargeHooks {
    NativeEntryHook caption;
    NativeCallHook fields;
    NativeAdventureChargeUnitFn unit = nullptr;
    NativeAdventureChargeAppendFn append = nullptr;
};
static NativeAdventureChargeHooks g_native_adventure_charge_hooks;

static void capture_native_adventure_charge_unit(void *unit, NativeString *output,
        int32_t mode, bool capitalized, bool include_name) {
    NativeInputCallbackScope callback;
    callback.call_native([&] {
        g_native_adventure_charge_hooks.unit(unit, output, mode, capitalized, include_name);
    });
    auto *call = g_native_adventure_charge_call;
    if (!call) return;
    try {
        std::string_view source;
        if (call->pending || !native_string_view(output, &source, 65536)) {
            call->failed = true;
            return;
        }
        call->pending_output = output;
        call->pending_unit = reinterpret_cast<uintptr_t>(unit);
        call->pending_source.assign(source);
        call->pending_target = native_unit_identity_source_target(source,
            reinterpret_cast<uintptr_t>(output));
        call->pending = true;
    } catch (...) { call->failed = true; }
}

static NativeString *capture_native_adventure_charge_append(NativeString *output,
        const char *source, size_t length) {
    NativeInputCallbackScope callback;
    auto *call = g_native_adventure_charge_call;
    size_t offset = 0;
    bool captured = false;
    if (call) {
        try {
            std::string_view prefix, field;
            if (output != call->caption || !call->pending || !call->pending_output ||
                    !native_string_view(output, &prefix, 65536) ||
                    !native_string_view(call->pending_output, &field, 65536) ||
                    length != field.size() || field.data() != source ||
                    field != call->pending_source || call->parts.size() >= 8192) {
                call->failed = true;
            } else {
                // This offset is measured at the actual append boundary. No
                // substring search or name-shaped split determines a unit.
                offset = prefix.size();
                captured = true;
            }
        } catch (...) { call->failed = true; }
    }
    NativeString *result = nullptr;
    callback.call_native([&] {
        result = g_native_adventure_charge_hooks.append(output, source, length);
    });
    if (call) {
        try {
            if (captured) {
                std::string_view caption;
                if (!native_string_view(output, &caption, 65536) ||
                        caption.size() != offset + length ||
                        caption.substr(offset, length) != call->pending_source) {
                    call->failed = true;
                } else {
                    // Native selection sets its found-unit flag before the
                    // formatter, so even an empty name suppresses the terrain
                    // fallback. Retain that zero-length field and its unit.
                    call->parts.push_back({offset, length,
                        std::move(call->pending_source), call->pending_unit,
                        std::move(call->pending_target)});
                }
            }
            call->pending = false;
            call->pending_output = nullptr;
            call->pending_unit = 0;
            call->pending_source.clear();
            call->pending_target.reset();
        } catch (...) { call->failed = true; }
    }
    return result;
}

static void capture_native_adventure_charge_caption(void *action, NativeString *output) {
    NativeInputCallbackScope callback;
    NativeAdventureChargeCall call;
    call.caption = output;
    {
        NativeAdventureChargeScope scope(call);
        const auto original = reinterpret_cast<NativeAdventureChargeCaptionFn>(
            g_native_adventure_charge_hooks.caption.original);
        callback.call_native([&] { original(action, output); });
    }
    if (call.parts.empty() || !g_overlay.translation_enabled()) return;
    try {
        std::string_view source;
        if (!native_string_view(output, &source, 65536) || source.empty()) return;
        const std::string original(source);
        std::optional<std::string> translated;
        if (!call.failed && !call.pending)
            translated = g_overlay.translate_native_adventure_charge(original, call.parts);
        if (translated && translated->empty()) translated.reset();
        // Keep the constructor's owner association through clipped draw calls.
        // An unsupported field capture preserves its actual native caption.
        remember_native_unit_identity(reinterpret_cast<uintptr_t>(output), original,
            translated ? *translated : native_text_to_utf8(original));
    } catch (...) {
        // Owned overlay data must never unwind across the native constructor.
    }
}

static bool native_adventure_charge_hooks_active() {
    return g_native_adventure_charge_hooks.caption.active() ||
        g_native_adventure_charge_hooks.fields.active();
}

static void uninstall_native_adventure_charge_hooks() {
    if (!native_callbacks_idle()) return;
    auto &hooks = g_native_adventure_charge_hooks;
    if (!hooks.caption.uninstall("Native adventure charge caption restore")) return;
    if (!hooks.fields.uninstall("Native adventure charge field restore")) return;
    hooks.unit = nullptr;
    hooks.append = nullptr;
}

static bool install_native_adventure_charge_hooks() {
    auto &hooks = g_native_adventure_charge_hooks;
    if (hooks.caption.installed && hooks.fields.installed) return true;
    if (native_adventure_charge_hooks_active()) {
        uninstall_native_adventure_charge_hooks();
        if (native_adventure_charge_hooks_active()) return false;
    }
    const uintptr_t base = native_history_profile_base();
    if (!base) return false;
    hooks.unit = reinterpret_cast<NativeAdventureChargeUnitFn>(
        native_pe_address(base, 0x132e430));
    hooks.append = reinterpret_cast<NativeAdventureChargeAppendFn>(
        native_pe_address(base, 0x6fa10));
    struct InstallGuard {
        bool committed = false;
        ~InstallGuard() { if (!committed) uninstall_native_adventure_charge_hooks(); }
    } guard;
    // Native ctor 841440 uses flags+24 bit0 to select Charge. Every matching
    // target unit calls 132e430(r8d=1,r9b=0,arg5=true), then appends that exact
    // temporary string at 841609. It inserts no comma, space or conjunction.
    std::vector<NativeCall> fields{
        {0x8415ef, 0x132e430,
            reinterpret_cast<const void *>(&capture_native_adventure_charge_unit)},
        {0x841609, 0x6fa10,
            reinterpret_cast<const void *>(&capture_native_adventure_charge_append)},
    };
    std::vector<unsigned char> prefix{0x48,0x89,0x5c,0x24,0x18};
    if (!native_pe_bytes(0x841440, prefix) ||
            !hooks.caption.prepare(reinterpret_cast<unsigned char *>(
                native_pe_address(base, 0x841440)), prefix,
                reinterpret_cast<const void *>(&capture_native_adventure_charge_caption),
                {}, "Native adventure charge caption") ||
            !native_reference_calls(fields, 0) ||
            !hooks.fields.install(base, fields, "Native adventure charge field")) return false;
    if (!hooks.caption.install("Native adventure charge caption")) return false;
    guard.committed = true;
    return true;
}
#else
static bool native_adventure_charge_hooks_active() { return false; }
static bool install_native_adventure_charge_hooks() { return true; }
static void uninstall_native_adventure_charge_hooks() {}
#endif
