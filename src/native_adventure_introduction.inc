// The Windows adventure initializer's missing-start-square branch calls
// MessageBoxW directly, outside SDL's paragraph renderer. Keep these two
// UTF-16 literals inside their original spans and restore them with the
// shared patch lifecycle; no executable file or native call is replaced.
#ifdef _WIN32
static std::vector<NativeCodePatch> g_native_adventure_introduction_patches;
static bool g_native_adventure_introduction_installed = false;

static bool native_adventure_introduction_hooks_active() {
    return g_native_adventure_introduction_installed ||
        native_code_patches_pending(g_native_adventure_introduction_patches);
}

static void uninstall_native_adventure_introduction_hooks() {
    constexpr const char *label = "Native adventure introduction error text";
    if (g_native_adventure_introduction_installed &&
            !write_native_code_patches(g_native_adventure_introduction_patches,
                false, label, &g_native_adventure_introduction_installed, false)) return;
    if (!flush_native_code_patches(g_native_adventure_introduction_patches, label)) return;
    g_native_adventure_introduction_patches.clear();
}

static bool install_native_adventure_introduction_hooks() {
    constexpr const char *label = "Native adventure introduction error text";
    if (g_native_adventure_introduction_installed)
        return flush_native_code_patches(g_native_adventure_introduction_patches, label);
    uninstall_native_adventure_introduction_hooks();
    if (native_adventure_introduction_hooks_active() || !native_validate_game()) return false;
    auto *base = reinterpret_cast<unsigned char *>(GetModuleHandleW(nullptr));
    const auto append = [&](uintptr_t reference_rva, uintptr_t classic_rva,
                            const auto &source, const auto &target) {
        if (sizeof(target) > sizeof(source)) return false;
        NativeCodePatch patch{
            base + (native_pe_classic() ? classic_rva : reference_rva),
            std::vector<unsigned char>(sizeof(source)),
            std::vector<unsigned char>(sizeof(source), 0)};
        // Include each original terminator in the expected signature and
        // preserve the complete original byte extent for ownership/restoration.
        std::memcpy(patch.original.data(), source, sizeof(source));
        std::memcpy(patch.replacement.data(), target, sizeof(target));
        g_native_adventure_introduction_patches.push_back(std::move(patch));
        return true;
    };
    // Reference 0x7ea1de/0x7ea1e5 and classic 0x7e7a5e/0x7e7a65
    // load these caption/text addresses before the native MessageBoxW call.
    if (!append(0x16aba48, 0x16a60b8, L"FATAL ERROR", L"致命错误") ||
            !append(0x16ad410, 0x16a8600,
                L"Could not locate adventure start square", L"无法找到冒险起始方格")) return false;
    return write_native_code_patches(g_native_adventure_introduction_patches,
        true, label, &g_native_adventure_introduction_installed, false);
}
#else
static bool native_adventure_introduction_hooks_active() { return false; }
static bool install_native_adventure_introduction_hooks() { return true; }
static void uninstall_native_adventure_introduction_hooks() {}
#endif
