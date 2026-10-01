// Native discovery returns an import or an entry relocation. Callback state,
// installation, ownership checks and teardown are shared across both hosts.
struct NativeParagraphBinding {
    void **import_slot = nullptr;
    void *original = nullptr;
    unsigned char *entry = nullptr;
    std::vector<unsigned char> prefix;
    std::vector<NativeRelativeFixup> fixups;
};
#include "native_paragraph_profile.inc"

static NativeImportHook g_native_paragraph_import;
static NativeEntryHook g_native_paragraph_entry;
static bool native_paragraph_hooks_active() {
    return g_native_paragraph_import.active() || g_native_paragraph_entry.active();
}
static void uninstall_native_paragraph_hook() {
    if (!g_native_paragraph_import.uninstall("Native paragraph import") ||
        !g_native_paragraph_entry.uninstall("Native paragraph entry")) return;
    g_native_paragraph_import = {};
    g_real_native_paragraph = nullptr;
    clear_native_paragraphs();
}
static bool install_native_paragraph_hook() {
    if (g_native_paragraph_import.installed || g_native_paragraph_entry.installed) return true;
    if (native_paragraph_hooks_active()) {
        uninstall_native_paragraph_hook();
        if (native_paragraph_hooks_active()) return false;
    }
    NativeParagraphBinding binding;
    if (!resolve_native_paragraph_binding(binding)) return false;
    if (binding.import_slot) {
        if (!binding.original) return false;
        g_real_native_paragraph = reinterpret_cast<NativeParagraphFn>(binding.original);
        g_native_paragraph_import = {binding.import_slot, nullptr,
            reinterpret_cast<void *>(&dfcn_capture_native_paragraph)};
        if (!g_native_paragraph_import.install("Native paragraph import")) {
            uninstall_native_paragraph_hook();
            return false;
        }
    } else {
        if (!g_native_paragraph_entry.prepare(binding.entry, binding.prefix,
                reinterpret_cast<const void *>(&dfcn_capture_native_paragraph), binding.fixups,
                "Native paragraph entry")) return false;
        g_real_native_paragraph = reinterpret_cast<NativeParagraphFn>(g_native_paragraph_entry.original);
        if (!g_native_paragraph_entry.install("Native paragraph entry")) {
            uninstall_native_paragraph_hook();
            return false;
        }
    }
    log_line("INFO", "Enabled complete native paragraph capture");
    return true;
}
