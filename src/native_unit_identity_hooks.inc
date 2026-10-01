// Capture identities at the native unit formatters, before clipping or drawing.
// The game retains its original strings; the overlay receives owned field data
// and a translation bound to the exact string owner and original bytes.
#ifdef _WIN32
#include "native_unit_identity_capture.inc"

using NativeUnitIdentityFormatFn = void (*)(void *, NativeString *, bool);
using NativeUnitIdentityNameOnlyFn = void (*)(void *, NativeString *);
using NativeUnitIdentityNameFn = void (*)(const void *, NativeString *);
using NativeUnitIdentityEnglishNameFn = void (*)(const void *, NativeString *, bool, bool);

struct NativeUnitIdentityCall {
    uintptr_t unit = 0;
    NativeUnitIdentityCall *parent = nullptr;
    NativeHistoryName name;
    std::string native_name, native_role;
    std::array<std::string, 7> native_name_words;
    bool native_name_words_valid = false;
    bool name_seen = false, name_failed = false, role_seen = false, name_quoted = false;
    bool publish = true;
};

// Only a trivial pointer is thread-local: no DLL-retaining TLS destructor.
static thread_local NativeUnitIdentityCall *g_native_unit_identity_call = nullptr;

struct NativeUnitIdentityActiveScope {
    NativeUnitIdentityCall &call;
    explicit NativeUnitIdentityActiveScope(NativeUnitIdentityCall &value) : call(value) {
        call.parent = g_native_unit_identity_call;
        if (call.parent) call.publish = call.publish && call.parent->publish;
        g_native_unit_identity_call = &call;
    }
    ~NativeUnitIdentityActiveScope() { g_native_unit_identity_call = call.parent; }
};

struct NativeUnitIdentityHooks {
    // Role, fallback name, name only, role/status, complete identity.
    std::array<NativeEntryHook, 5> entries;
    NativeCallHook names;
    NativeUnitIdentityNameFn name = nullptr;
    NativeUnitIdentityEnglishNameFn english_name = nullptr;
    uintptr_t base = 0;
};
static NativeUnitIdentityHooks g_native_unit_identity_hooks;

static void capture_native_unit_identity_name_fields(const void *name,
        const NativeString *output) noexcept {
    auto *call = g_native_unit_identity_call;
    if (!call) return;
    call->name_seen = true;
    try {
        std::string_view source;
        NativeHistoryName snapshot;
        std::array<int32_t, 7> indices;
        if (!native_string_view(output, &source, 262144) ||
            !capture_native_history_name(g_native_unit_identity_hooks.base,
                reinterpret_cast<uintptr_t>(name), snapshot, &indices)) {
            call->name_failed = true;
            return;
        }
        call->native_name_words_valid = capture_native_unit_identity_name_words(
            reinterpret_cast<uintptr_t>(name), snapshot, call->native_name_words, &indices);
        call->name = std::move(snapshot);
        call->native_name.assign(source);
    } catch (...) { call->name_failed = true; }
}

static void capture_native_unit_identity_name(const void *name, NativeString *output) {
    NativeInputCallbackScope callback;
    callback.call_native([&] { g_native_unit_identity_hooks.name(name, output); });
    capture_native_unit_identity_name_fields(name, output);
}

static void capture_native_unit_identity_quoted_name(const void *name,
        NativeString *output, bool quoted) {
    NativeInputCallbackScope callback;
    callback.call_native([&] { g_native_unit_identity_hooks.name(name, output); });
    capture_native_unit_identity_name_fields(name, output);
    if (g_native_unit_identity_call) g_native_unit_identity_call->name_quoted = quoted;
}

static void capture_native_unit_identity_english_name(const void *name,
        NativeString *output, bool first, bool second) {
    NativeInputCallbackScope callback;
    callback.call_native([&] {
        g_native_unit_identity_hooks.english_name(name, output, first, second);
    });
    capture_native_unit_identity_name_fields(name, output);
}

static void capture_native_unit_header_english_name(const void *name,
        NativeString *output, bool first, void *unit) {
    NativeInputCallbackScope callback;
    callback.call_native([&] {
        g_native_unit_identity_hooks.english_name(name, output, first, false);
    });
    try {
        if (!g_overlay.translation_enabled()) return;
        std::string_view source;
        if (!native_string_view(output, &source, 262144) || source.empty()) return;
        const std::string original(source);
        std::optional<std::string> translated;
        NativeUnitIdentity snapshot;
        // The sheet selects the visible language_name itself and bypasses the
        // unit formatters. Capture that exact field without entering or altering
        // a unit TLS scope. Its separate addchar calls own the outer quotes.
        if (capture_native_history_name(g_native_unit_identity_hooks.base,
                reinterpret_cast<uintptr_t>(name), snapshot.name)) {
            snapshot.native_name = original;
            snapshot.form = NativeUnitIdentityForm::NameOnly;
            snapshot.english_name = true;
            translated = g_overlay.translate_native_unit_identity(snapshot);
        }
        if (translated && translated->empty()) translated.reset();
        remember_native_unit_identity(reinterpret_cast<uintptr_t>(output), original,
            translated ? *translated : native_text_to_utf8(original),
            reinterpret_cast<uintptr_t>(unit), true, true);
    } catch (...) {
        // Never unwind across the sheet's native formatter call.
    }
}

template<size_t Index>
static std::optional<std::string> finish_native_unit_identity_call(NativeUnitIdentityCall &call,
        NativeString *output, bool option) noexcept {
    const bool english_name = Index == 1 && option;
    // A separately drawn profession belongs to the unit but is not its name.
    // Only captured names participate in native/English header pairing.
    const uintptr_t name_unit = call.name_seen && !call.native_name.empty() ? call.unit : 0;
    try {
        std::string_view source;
        if (!native_string_view(output, &source, 262144)) return std::nullopt;
        if constexpr (Index == 0) {
            // The parent already owns the unit pointer. Capture the actual
            // nested role result; never run another formatter to infer it.
            call.native_role.assign(source);
            call.role_seen = true;
            if (call.parent && call.parent->unit == call.unit) {
                call.parent->native_role = call.native_role;
                call.parent->role_seen = true;
            }
        }
        if (source.empty() || !g_overlay.translation_enabled()) return std::nullopt;
        const std::string original(source);
        std::optional<std::string> translated;
        NativeUnitIdentity snapshot;
        if (!call.name_failed) {
            // Native visibility/identity selection takes priority over the
            // unit's stored name, which may be deliberately hidden or replaced.
            snapshot.name = call.name_seen ? std::move(call.name) : NativeHistoryName{};
            snapshot.native_name = std::move(call.native_name);
            snapshot.native_name_words = std::move(call.native_name_words);
            snapshot.native_name_words_valid = call.native_name_words_valid;
            snapshot.native_role = std::move(call.native_role);
            snapshot.name_quoted = call.name_quoted;
            snapshot.form = Index == 1 ? NativeUnitIdentityForm::Name :
                Index == 2 ? NativeUnitIdentityForm::NameOnly :
                Index == 4 ? NativeUnitIdentityForm::Full : NativeUnitIdentityForm::Role;
            snapshot.use_custom = Index == 0 ? option : true;
            snapshot.name_fallback = Index == 1;
            snapshot.english_name = english_name;
            snapshot.show_gender = (Index == 3 || Index == 4) && option;
            snapshot.include_status = Index == 3 || Index == 4;
            // A missing nested role is not permission to parse a displayed
            // caption. Preserve the native result on unsupported branches.
            const bool needs_role = Index == 0 || Index == 3 || Index == 4 ||
                (Index == 1 && snapshot.native_name.empty());
            if ((!needs_role || call.role_seen) &&
                    capture_native_unit_identity(call.unit, snapshot))
                translated = g_overlay.translate_native_unit_identity(snapshot);
        }
        // Unsupported native branches can leave the semantic name/role
        // fields empty even though the formatter produced a visible string.
        // Treat that as a capture failure, including disposable references.
        if (translated && translated->empty()) translated.reset();
        if (call.publish)
            remember_native_unit_identity(reinterpret_cast<uintptr_t>(output),
                original, translated ? *translated : native_text_to_utf8(original),
                name_unit, english_name);
        return translated;
    } catch (...) {
        // Capture failure never modifies a unit, its strings, or game control flow.
    }
    return std::nullopt;
}

// Cached UI strings can outlive the frame and NativeString that first
// formatted them. Resolve their explicit unit/name reference through the same
// native selection and field renderer, without guessing from the cached text.
static std::optional<std::string> translate_native_unit_identity_reference(
        uintptr_t unit, uintptr_t name, std::string_view expected) {
    const auto &hooks = g_native_unit_identity_hooks;
    if (!hooks.base || !hooks.name || expected.empty()) return std::nullopt;
    NativeInputCallbackScope callback;
    NativeSearchString output(reinterpret_cast<NativeSearchDestroyFn>(
        native_pe_address(hooks.base, 0x6f850)));
    if (unit) {
        if (!hooks.entries[4].installed || !hooks.entries[4].original) return std::nullopt;
        NativeUnitIdentityCall call;
        call.unit = unit;
        call.publish = false;
        {
            NativeUnitIdentityActiveScope scope(call);
            const auto original = reinterpret_cast<NativeUnitIdentityFormatFn>(hooks.entries[4].original);
            callback.call_native([&] { original(reinterpret_cast<void *>(unit), &output.value, false); });
        }
        std::string_view source;
        if (!native_string_view(&output.value, &source, 65536) || source != expected)
            return std::nullopt;
        // Do not register the disposable string as a future draw owner.
        return finish_native_unit_identity_call<4>(call, &output.value, false);
    }
    if (!name) return std::nullopt;
    callback.call_native([&] { hooks.name(reinterpret_cast<const void *>(name), &output.value); });
    std::string_view source;
    NativeUnitIdentity snapshot;
    if (!native_string_view(&output.value, &source, 65536) || source != expected ||
            !capture_native_history_name(hooks.base, name, snapshot.name)) return std::nullopt;
    snapshot.native_name_words_valid = capture_native_unit_identity_name_words(
        name, snapshot.name, snapshot.native_name_words);
    snapshot.native_name.assign(source);
    snapshot.form = NativeUnitIdentityForm::NameOnly;
    auto target = g_overlay.translate_native_unit_identity(snapshot);
    if (target && target->empty()) target.reset();
    return target;
}

template<size_t Index>
static void capture_native_unit_identity_format(void *unit, NativeString *output, bool option) {
    NativeInputCallbackScope callback;
    NativeUnitIdentityCall call;
    call.unit = reinterpret_cast<uintptr_t>(unit);
    {
        NativeUnitIdentityActiveScope scope(call);
        const auto original = reinterpret_cast<NativeUnitIdentityFormatFn>(
            g_native_unit_identity_hooks.entries[Index].original);
        callback.call_native([&] { original(unit, output, option); });
    }
    finish_native_unit_identity_call<Index>(call, output, option);
}

static void capture_native_unit_identity_name_only(void *unit, NativeString *output) {
    NativeInputCallbackScope callback;
    NativeUnitIdentityCall call;
    call.unit = reinterpret_cast<uintptr_t>(unit);
    {
        NativeUnitIdentityActiveScope scope(call);
        const auto original = reinterpret_cast<NativeUnitIdentityNameOnlyFn>(
            g_native_unit_identity_hooks.entries[2].original);
        callback.call_native([&] { original(unit, output); });
    }
    finish_native_unit_identity_call<2>(call, output, false);
}

static bool native_unit_identity_hooks_active() {
    return g_native_unit_identity_hooks.names.active() ||
        std::any_of(g_native_unit_identity_hooks.entries.begin(),
            g_native_unit_identity_hooks.entries.end(),
            [](const auto &entry) { return entry.active(); });
}

static void uninstall_native_unit_identity_hooks() {
    if (!native_callbacks_idle()) return;
    auto &hooks = g_native_unit_identity_hooks;
    for (auto it = hooks.entries.rbegin(); it != hooks.entries.rend(); ++it)
        if (!it->uninstall("Native unit identity formatter restore")) return;
    if (!hooks.names.uninstall("Native unit identity name source restore")) return;
    hooks.name = nullptr;
    hooks.english_name = nullptr;
    hooks.base = 0;
}

static bool install_native_unit_identity_hooks() {
    auto &hooks = g_native_unit_identity_hooks;
    if (hooks.names.installed && std::all_of(hooks.entries.begin(), hooks.entries.end(),
            [](const auto &entry) { return entry.installed; })) return true;
    if (native_unit_identity_hooks_active()) {
        uninstall_native_unit_identity_hooks();
        if (native_unit_identity_hooks_active()) return false;
    }
    hooks.base = native_history_profile_base();
    if (!hooks.base) return false;
    hooks.name = reinterpret_cast<NativeUnitIdentityNameFn>(native_pe_address(hooks.base, 0xa94030));
    hooks.english_name = reinterpret_cast<NativeUnitIdentityEnglishNameFn>(
        native_pe_address(hooks.base, 0xa946e0));
    struct InstallGuard {
        bool committed = false;
        ~InstallGuard() { if (!committed) uninstall_native_unit_identity_hooks(); }
    } guard;
    struct Entry {
        uintptr_t rva;
        std::vector<unsigned char> prefix;
        const void *wrapper;
    };
    // Reference PE 53.16 AMD64. Every prefix ends at a complete instruction
    // before the first relative operand. All argument registers are untouched.
    const Entry entries[]{
        {0x132f980, {0x48,0x89,0x5c,0x24,0x18},
            reinterpret_cast<const void *>(&capture_native_unit_identity_format<0>)},
        {0x1330260, {0x40,0x53,0x56,0x41,0x55,0x48,0x83,0xec,0x40},
            reinterpret_cast<const void *>(&capture_native_unit_identity_format<1>)},
        {0x1330500, {0x48,0x89,0x5c,0x24,0x18},
            reinterpret_cast<const void *>(&capture_native_unit_identity_name_only)},
        {0x1330880, {0x48,0x89,0x5c,0x24,0x18},
            reinterpret_cast<const void *>(&capture_native_unit_identity_format<3>)},
        {0x1330c30, {0x48,0x89,0x5c,0x24,0x18},
            reinterpret_cast<const void *>(&capture_native_unit_identity_format<4>)},
    };
    for (size_t i = 0; i < std::size(entries); ++i) {
        const auto &entry = entries[i];
        auto prefix = entry.prefix;
        if (!native_pe_bytes(entry.rva, prefix) ||
                !hooks.entries[i].prepare(reinterpret_cast<unsigned char *>(
                    native_pe_address(hooks.base, entry.rva)),
                    prefix, entry.wrapper, {}, "Native unit identity formatter")) return false;
    }
    // These are the actual language_name calls within the unit-name formatters
    // and sheet header. Call sites leave other consumers' entry signatures
    // intact and preserve disguised/linked identity selection by the game.
    std::vector<NativeCall> names{
        // Sheet header: output [rsp+0x3da0] goes unchanged to addst at
        // 0x15c1f8. The quotes at 0x15c1de/0x15c209 are separate glyphs.
        // Caller [rsp+0xa8] is its unit. CALL places the return address
        // on the stack, so the relay reads [rsp+0xb0] into R9. The original
        // fourth argument is fixed false at 0x15c176 and restored by wrapper.
        {0x15c18c, 0xa946e0,
            reinterpret_cast<const void *>(&capture_native_unit_header_english_name),
            {0x4c,0x8b,0x8c,0x24,0xb0,0x00,0x00,0x00}},
        {0x1330475, 0xa946e0,
            reinterpret_cast<const void *>(&capture_native_unit_identity_english_name)},
        {0x133047c, 0xa94030,
            reinterpret_cast<const void *>(&capture_native_unit_identity_name)},
        {0x1330707, 0xa94030,
            reinterpret_cast<const void *>(&capture_native_unit_identity_name)},
        {0x1330720, 0xa94030,
            reinterpret_cast<const void *>(&capture_native_unit_identity_name)},
        {0x13307a3, 0xa94030,
            // R12B is the game's chosen identity-quote flag; pass it as the
            // wrapper's third argument without changing the native name ABI.
            reinterpret_cast<const void *>(&capture_native_unit_identity_quoted_name),
            {0x45,0x88,0xe0}},
        {0x1330e52, 0xa94030,
            reinterpret_cast<const void *>(&capture_native_unit_identity_name)},
        {0x1330f86, 0xa94030,
            reinterpret_cast<const void *>(&capture_native_unit_identity_quoted_name),
            {0x45,0x88,0xe0}},
    };
    if (!native_reference_calls(names, 0) ||
            !hooks.names.install(hooks.base, names, "Native unit identity name source")) return false;
    for (auto &entry : hooks.entries)
        if (!entry.install("Native unit identity formatter")) return false;
    guard.committed = true;
    return true;
}
#else
static bool native_unit_identity_hooks_active() { return false; }
static bool install_native_unit_identity_hooks() { return true; }
static void uninstall_native_unit_identity_hooks() {}
#endif
