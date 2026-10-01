// Observe the complete source at submission, before native wrapping, clipping
// or differently colored drawing can divide it into unrelated dictionary hits.
using NativeAnnouncementFn = void (*)(void *, const NativeString *, const void *);
struct NativeAnnouncementBinding {
    unsigned char *entry = nullptr;
    std::vector<unsigned char> prefix;
    unsigned char *speech_entry = nullptr;
    std::vector<unsigned char> speech_prefix;
};
#include "native_announcement_profile.inc"
static NativeEntryHook g_native_announcement_entry;
static NativeAnnouncementFn g_real_native_announcement = nullptr;
using NativeSpeechTransformFn = void (*)(NativeString *);
static NativeEntryHook g_native_speech_transform_entry;
static NativeSpeechTransformFn g_real_native_speech_transform = nullptr;
static std::atomic_uint g_active_native_announcement_callbacks{0};

static void capture_native_speech_transform(NativeString *source) {
    struct Scope {
        Scope() { g_active_native_announcement_callbacks.fetch_add(1, std::memory_order_acq_rel); }
        ~Scope() { g_active_native_announcement_callbacks.fetch_sub(1, std::memory_order_acq_rel); }
    } scope;
    std::string original;
    try {
        std::string_view text;
        if (native_string_view(source, &text, SIZE_MAX)) original.assign(text);
    } catch (...) {}
    if (g_real_native_speech_transform) g_real_native_speech_transform(source);
    try {
        std::string_view rendered;
        if (!original.empty() && native_string_view(source, &rendered, SIZE_MAX))
            remember_native_speech_source(original, rendered);
    } catch (...) {}
}

static void capture_native_announcement(void *manager, const NativeString *source,
        const void *parameters) {
    struct Scope {
        Scope() { g_active_native_announcement_callbacks.fetch_add(1, std::memory_order_acq_rel); }
        ~Scope() { g_active_native_announcement_callbacks.fetch_sub(1, std::memory_order_acq_rel); }
    } scope;
    int16_t submitted_type = -1;
    std::string submitted_source;
    try {
        std::string_view text;
        // This argument is the game's live submitted string, with its native
        // size/capacity validated by the ABI adapter. Long reading records
        // must not disappear from capture at an arbitrary prose byte limit.
        if (parameters && native_string_view(source, &text, SIZE_MAX)) {
            int16_t type = -1;
            std::memcpy(&type, parameters, sizeof(type));
            if (type >= 0 && type < 356) {
                submitted_source.assign(text);
                submitted_type = type;
                remember_native_announcement(type, text);
            }
        }
    } catch (...) {}
    if (g_real_native_announcement) g_real_native_announcement(manager, source, parameters);
    // The native submitter may coalesce a repeat without allocating a new
    // report. Queue its owned complete key AFTER the native update, including
    // when a draw already observed the pre-submit recent-source snapshot.
    try { finish_native_announcement_submission(submitted_type, submitted_source); }
    catch (...) {
        std::lock_guard<std::mutex> lock(g_native_announcement_mutex);
        g_native_announcement_history_full_refresh = true;
    }
}

static bool native_announcement_hook_active() {
    return g_native_announcement_entry.active() || g_native_speech_transform_entry.active() ||
        g_active_native_announcement_callbacks.load(std::memory_order_acquire) != 0;
}
static void uninstall_native_announcement_hook() {
    if (g_active_native_announcement_callbacks.load(std::memory_order_acquire) != 0) return;
    const bool speech = g_native_speech_transform_entry.uninstall("Native speech source capture");
    const bool announcement = g_native_announcement_entry.uninstall("Native announcement capture");
    if (speech) g_real_native_speech_transform = nullptr;
    if (announcement) g_real_native_announcement = nullptr;
    if (speech && announcement) clear_native_announcement_sources();
}
static bool install_native_announcement_hook() {
    if (g_native_announcement_entry.installed && g_native_speech_transform_entry.installed) return true;
    if (native_announcement_hook_active()) {
        uninstall_native_announcement_hook();
        if (native_announcement_hook_active()) return false;
    }
    NativeAnnouncementBinding binding;
    if (!resolve_native_announcement_binding(binding)) return false;
    if (!binding.entry || !binding.speech_entry) return false;
    if (!g_native_announcement_entry.prepare(binding.entry, binding.prefix,
            reinterpret_cast<const void *>(&capture_native_announcement), {},
            "Native announcement capture")) return false;
    g_real_native_announcement = reinterpret_cast<NativeAnnouncementFn>(
        g_native_announcement_entry.original);
    if (!g_native_announcement_entry.install("Native announcement capture")) {
        uninstall_native_announcement_hook();
        return false;
    }
    if (!g_native_speech_transform_entry.prepare(binding.speech_entry, binding.speech_prefix,
            reinterpret_cast<const void *>(&capture_native_speech_transform), {},
            "Native speech source capture")) {
        uninstall_native_announcement_hook();
        return false;
    }
    g_real_native_speech_transform = reinterpret_cast<NativeSpeechTransformFn>(
        g_native_speech_transform_entry.original);
    if (!g_native_speech_transform_entry.install("Native speech source capture")) {
        uninstall_native_announcement_hook();
        return false;
    }
    log_line("INFO", "Enabled complete native announcement source capture");
    return true;
}
