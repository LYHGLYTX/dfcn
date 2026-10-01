// Native binding only: the shared callback captures the page before the
// character editor overwrites it with an attribute or skill hover document.
static bool resolve_native_adventure_hover_profile(NativeAdventureHoverProfile &profile) {
    profile = {};
#ifdef _WIN32
    const auto *base = reinterpret_cast<const unsigned char *>(GetModuleHandleW(nullptr));
    if (!base) return false;
    if (!native_pe_supported()) return false;

    constexpr uintptr_t count_target = 0x6ee50;
    static constexpr unsigned char count_signature[]{
        0x48,0x8b,0x41,0x08,0x48,0x2b,0x01,0x48,0xc1,0xf8,0x03,0xc3,
    };
    NativePatchPages readable_pages;
    if (!collect_native_patch_pages(readable_pages,
            native_pe_address(reinterpret_cast<uintptr_t>(base), count_target), sizeof(count_signature),
            native_patch_page_size(), true, "Character hover capture identity") ||
        !native_pe_match(reinterpret_cast<uintptr_t>(base), count_target,
            count_signature, sizeof(count_signature)))
        return false;

    profile.base = reinterpret_cast<uintptr_t>(base);
    // All three documents (physical attributes, mental attributes and skills)
    // join this single vector-size call before their first border-cell write.
    // It also runs when the game's cached document did not need rebuilding.
    profile.site = native_pe_rva(0x62b42b);
    profile.target = native_pe_rva(count_target);
    if (!profile.site || !profile.target) return false;
    profile.count = reinterpret_cast<NativeAdventureHoverCountFn>(base + profile.target);
#else
    // No verified pre-overwrite call site is available for this native ABI.
    // An empty binding leaves the shared current-layer recovery in use.
#endif
    return true;
}
