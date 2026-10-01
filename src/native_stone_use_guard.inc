// 53.16's economic-use formatter trusts inorganic_raw::economic_uses even
// when an index no longer belongs to world.raws.reactions.reactions. The
// 2026-09-23 crash read index 3421 from a vector with only 3299 live entries;
// its spare capacity contained a stale pointer to reused text storage.
// Guard the lookup itself, without editing RAWs, saves or either vector.
struct NativeStoneUseGuard {
    std::vector<NativeCodePatch> patches;
    void *relay = nullptr;
    size_t relay_size = 0;
    bool installed = false;
    bool active() const { return installed || relay != nullptr; }

    bool uninstall() {
        constexpr const char *label = "Stone economic-use bounds guard";
        if (installed && !write_native_code_patches(patches, false, label, &installed)) return false;
        if (!flush_native_code_patches(patches, label)) return false;
        if (!release_native_relay(relay, relay_size, label)) return false;
        patches.clear();
        return true;
    }
};
static NativeStoneUseGuard g_native_stone_use_guard;

static bool install_native_stone_use_guard() {
#ifdef _WIN32
    constexpr const char *label = "Stone economic-use bounds guard";
    auto &hook = g_native_stone_use_guard;
    if (hook.installed) return flush_native_code_patches(hook.patches, label);
    if (!hook.uninstall() || !native_validate_game()) return false;
    auto *base = reinterpret_cast<unsigned char *>(GetModuleHandleW(nullptr));
    // Complete index-load, vector-load, dereference and first flag comparison.
    // No branch enters the interior of the seven-byte vector-load instruction.
    static constexpr unsigned char lookup[]{
        0x49,0x8b,0x85,0xe0,0x00,0x00,0x00, // mov rax,[r13+e0]
        0x4a,0x63,0x0c,0xb0,                // movsxd rcx,[rax+r14*4]
        0x48,0x8b,0x05,0xf6,0xf6,0x75,0x01, // mov rax,[reactions.begin]
        0x48,0x8b,0x14,0xc8,                // mov rdx,[rax+rcx*8]
        0x83,0x7a,0x48,0x00};               // cmp dword [rdx+48],0
    static constexpr unsigned char next_use[]{
        0x49,0x83,0xee,0x01,                // sub r14,1
        0x0f,0x89,0xf6,0xfe,0xff,0xff};     // jns d97b60
    NativePatchPages pages;
    const auto identity = [&](uintptr_t rva, const auto &bytes) {
        return collect_native_patch_pages(pages, native_pe_address(reinterpret_cast<uintptr_t>(base), rva),
                sizeof(bytes), native_patch_page_size(), true, label) &&
            native_pe_match(reinterpret_cast<uintptr_t>(base), rva, bytes, sizeof(bytes));
    };
    if (!identity(0xd97b60, lookup) || !identity(0xd97c60, next_use)) {
        report_native_patch_error("ERROR", label, "native economic-use lookup identity mismatch");
        return false;
    }
    auto *site = base + native_pe_rva(0xd97b6b);
    NativeRelayRange range;
    range.include(reinterpret_cast<uintptr_t>(site));
    range.include(native_pe_address(reinterpret_cast<uintptr_t>(base), 0xd97c60));
    // This is a leaf instruction relay, not a C++ call: it uses no stack or
    // additional registers. RDX is overwritten by the original next MOV;
    // flags are overwritten by its CMP or by the skipped iteration's SUB.
    unsigned char body[]{
        0x48,0xb8,0,0,0,0,0,0,0,0, // mov rax,reactions vector address
        0x48,0x8b,0x50,0x08,        // mov rdx,[rax+8] (end)
        0x48,0x8b,0x00,             // mov rax,[rax] (begin)
        0x48,0x29,0xc2,             // sub rdx,rax
        0x48,0xc1,0xea,0x03,        // shr rdx,3 (live size, not capacity)
        0x48,0x39,0xd1,             // cmp rcx,rdx
        0x73,0x05};                // jae skip (also rejects negative indices)
    const uintptr_t reactions = native_pe_address(reinterpret_cast<uintptr_t>(base), 0x24f7268);
    std::memcpy(body + 2, &reactions, sizeof(reactions));
    hook.relay = allocate_native_relay(range, sizeof(body) + 10, &hook.relay_size, label);
    if (!hook.relay) return false;
    NativeRelayGuard guard{hook.relay, hook.relay_size, hook.installed, label};
    auto *relay = static_cast<unsigned char *>(hook.relay);
    std::memcpy(relay, body, sizeof(body));
    // The per-pass temporary string was initialized before the loop and is
    // destroyed after it. Skipping an invalid use goes through the same next
    // iteration as a native flag-filtered use, without bypassing cleanup.
    if (!native_relative_branch(relay + sizeof(body), 0xe9, base + native_pe_rva(0xd97b72)) ||
        !native_relative_branch(relay + sizeof(body) + 5, 0xe9, base + native_pe_rva(0xd97c60))) return false;
    std::vector<unsigned char> original{lookup + 11, lookup + 18};
    if (!native_pe_bytes(0xd97b6b, original)) return false;
    NativeCodePatch patch{site, std::move(original), std::vector<unsigned char>(7, 0x90)};
    // Compute rel32 at its installed address, not at the vector's storage.
    const intptr_t distance = reinterpret_cast<intptr_t>(relay) -
        reinterpret_cast<intptr_t>(site + 5);
    if (distance < INT32_MIN || distance > INT32_MAX) return false;
    patch.replacement[0] = 0xe9;
    const int32_t relative = static_cast<int32_t>(distance);
    std::memcpy(patch.replacement.data() + 1, &relative, sizeof(relative));
    hook.patches.push_back(std::move(patch));
    if (!seal_native_relay(hook.relay, hook.relay_size, label) ||
        !write_native_code_patches(hook.patches, true, label, &hook.installed)) return false;
    guard.committed = true;
    log_line("INFO", "Enabled bounds protection for native stone economic-use descriptions");
#endif
    return true;
}
