// Native adapter only. The recipe formatter at RVA 0x8c2ca0 appends product
// paragraphs through add_paragraph, but wraps each requirement inline.
static bool resolve_native_workshop_recipe_profile(NativeWorkshopRecipeProfile &profile) {
    profile = {};
#ifdef _WIN32
    const auto *base = reinterpret_cast<const unsigned char *>(GetModuleHandleW(nullptr));
    if (!base) return false;
    if (!native_pe_supported()) return false;

    struct Signature { uintptr_t rva; std::vector<unsigned char> bytes; };
    const Signature signatures[]{
        {0x8c2cd0, {0x4c,0x8b,0xea,0x48,0x89,0x55,0xa0}}, // destination RDX -> R13
        // format(requirement at rbp+170, source at rbp+18, count), then
        // normalize(source). R13 is the destination curses_text_boxst.
        {0x8c36c3, {0x44,0x0f,0xb7,0x46,0x10,0x48,0x8d,0x55,0x18,
            0x48,0x8d,0x8d,0x70,0x01,0x00,0x00,0xe8,0xd8,0x76,0x16,0x00,
            0x48,0x8d,0x4d,0x18,0xe8,0x6f,0x9f,0xc6,0xff}},
        // The source's 32-byte MSVC string fields are read before wrapping.
        {0x8c3722, {0x48,0x8d,0x55,0x18,0x48,0x83,0x7d,0x30,0x0f,
            0x48,0x0f,0x47,0x55,0x18,0x4c,0x8b,0x45,0x28}},
        {0x8c37d8, {0x4c,0x8b,0x75,0x08,0x49,0x83,0xfe,0x1d}},
        // The final row is added to the R13 destination before both paths
        // join the last-line destructor. Its RCX is rbp-8; the full source
        // at rbp+18 remains alive until its own destructor at RVA 0x8c3a36.
        {0x8c398c, {0x49,0x8b,0x55,0x08,0x49,0x3b,0x55,0x10,0x74,0x0a,
            0x48,0x89,0x32,0x49,0x83,0x45,0x08,0x08,0xeb,0x0d}},
        {0x8c39ad, {0x48,0x8d,0x4d,0xf8,0xe8,0x9a,0xbe,0x7a,0xff}},
        {0x52d650, {0x48,0x89,0x5c,0x24,0x18,0x48,0x89,0x6c,0x24,0x20,
            0x57,0x48,0x8b,0x69,0x10}},
    };
    NativePatchPages readable_pages;
    for (const auto &signature : signatures) {
        if (!collect_native_patch_pages(readable_pages,
                native_pe_address(reinterpret_cast<uintptr_t>(base), signature.rva), signature.bytes.size(),
                native_patch_page_size(), true, "Workshop requirement capture identity") ||
            !native_pe_match(reinterpret_cast<uintptr_t>(base), signature.rva,
                signature.bytes.data(), signature.bytes.size()))
            return false;
    }

    profile.base = reinterpret_cast<uintptr_t>(base);
    profile.begin_site = native_pe_rva(0x8c36dc);
    profile.begin_target = native_pe_rva(0x52d650);
    profile.end_site = native_pe_rva(0x8c39b1);
    profile.end_target = native_pe_rva(0x6f850);
    if (!profile.begin_site || !profile.begin_target ||
        !profile.end_site || !profile.end_target) return false;
    profile.paragraph_width = 29;
    profile.normalize = reinterpret_cast<NativeWorkshopRecipeStringFn>(base + profile.begin_target);
    profile.destroy = reinterpret_cast<NativeWorkshopRecipeStringFn>(base + profile.end_target);
    // Both original calls take only RCX, leave their return value unused, and
    // already reserve native shadow space. RDX/R8 are volatile at the calls.
    // Pass the live, nonvolatile R13 destination and the source's stack local
    // to the shared callbacks without changing native strings or stack state.
    profile.begin_arguments = {0x4c,0x89,0xea}; // mov rdx,r13
    profile.end_arguments = {0x4c,0x89,0xea,0x4c,0x8d,0x45,0x18}; // + lea r8,[rbp+18]
#else
    // No verified inline requirement-wrap boundary for the native ELF build.
    // Leave the binding empty; the shared complete-text path remains usable.
#endif
    return true;
}
