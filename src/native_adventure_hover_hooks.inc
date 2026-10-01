// Preserve the current page once, before the native hover frame overwrites
// its source cells. Binding discovery and shared hook ownership stay separate.
using NativeAdventureHoverCountFn = size_t (*)(const void *);
struct NativeAdventureHoverProfile {
    uintptr_t base = 0, site = 0, target = 0;
    NativeAdventureHoverCountFn count = nullptr;
};
#include "native_adventure_hover_profile.inc"

struct NativeAdventureHoverHook {
    NativeCallHook code;
    NativeAdventureHoverCountFn count = nullptr;
};
static NativeAdventureHoverHook g_native_adventure_hover_hook;

static size_t capture_native_adventure_hover(const void *document) {
    const auto original = g_native_adventure_hover_hook.count;
    try {
        g_overlay.capture_adventure_background(native_graphics());
    } catch (...) {
        // Capture allocation failure must not interrupt native rendering.
    }
    return original(document);
}

static bool native_adventure_hover_hook_active() {
    return g_native_adventure_hover_hook.code.active();
}

static bool uninstall_native_adventure_hover_hook() {
    // A remaining relay must keep its native target, including after a
    // partially completed install or a failed restore/release operation.
    if (!g_native_adventure_hover_hook.code.uninstall("Character hover capture restore"))
        return false;
    g_native_adventure_hover_hook.count = nullptr;
    return true;
}

static bool install_native_adventure_hover_hook() {
    auto &hook = g_native_adventure_hover_hook;
    if (hook.code.installed) return true;
    if (native_adventure_hover_hook_active() && !uninstall_native_adventure_hover_hook())
        return false;
    struct InstallGuard {
        bool committed = false;
        ~InstallGuard() {
            if (!committed) {
                try { uninstall_native_adventure_hover_hook(); } catch (...) {}
            }
        }
    } guard;
    NativeAdventureHoverProfile profile;
    if (!resolve_native_adventure_hover_profile(profile)) {
        log_line("ERROR", "Cannot resolve the native character hover capture profile");
        return false;
    }
    if (!profile.count) {
        guard.committed = true;
        return true;
    }
    hook.count = profile.count;
    if (!hook.code.install(profile.base,
            {{profile.site, profile.target,
              reinterpret_cast<const void *>(&capture_native_adventure_hover)}},
            "Character hover capture")) return false;
    guard.committed = true;
    log_line("INFO", "Enabled native character hover background capture");
    return true;
}
