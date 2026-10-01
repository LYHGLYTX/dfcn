// Host ABI binding only. Capture, translation and layout remain shared.
static bool resolve_native_announcement_binding(NativeAnnouncementBinding &binding) {
#ifdef _WIN32
    NativeCaptionProfile profile;
    if (!resolve_native_caption_profile(profile)) return false;
    auto *base = reinterpret_cast<unsigned char *>(profile.base);
    // DF 53.16: announcement manager, const native string&, event parameters&.
    // The entry's first complete instruction is position independent. The
    // event type is an int16 at parameters+0, validated against 356 by DF.
    const unsigned char type_read[] = {0x41,0x0f,0xbf,0x08};
    if (!native_pe_match(profile.base, 0xe3c70, type_read, sizeof(type_read))) return false;
    binding.entry = base + native_pe_rva(0xe3c20);
    binding.prefix = {0x48,0x89,0x5c,0x24,0x20};
    if (!native_pe_bytes(0xe3c20, binding.prefix)) return false;
    // The LISP formatter mutates one NativeString& in RCX. Remember both
    // sides so repeated S/s never destroys words such as pass or possess.
    // Calls: 0x1a6d33, 0x1a700a and the NPC wrapper at 0x685380; ret 0x67bc4c.
    const unsigned char speech_prologue[] = {
        0x48,0x89,0x5c,0x24,0x10,0x48,0x89,0x74,0x24,0x18,
        0x48,0x89,0x7c,0x24,0x20,0x55,0x41,0x54};
    if (!native_pe_match(profile.base, 0x67b6c0, speech_prologue, sizeof(speech_prologue))) return false;
    binding.speech_entry = base + native_pe_rva(0x67b6c0);
    binding.speech_prefix = {0x48,0x89,0x5c,0x24,0x10};
    if (!native_pe_bytes(0x67b6c0, binding.speech_prefix)) return false;
#else
    ModuleBuildId module;
    dl_iterate_phdr(find_main_build_id, &module);
    if (!module.found || !native_validate_game()) {
        log_line("ERROR", "Unsupported native executable for announcement source capture");
        return false;
    }
    auto *base = reinterpret_cast<unsigned char *>(module.base);
    // DF 53.16 Steam ELF: (handler*, const string&, announcement_infost&).
    // 17ea0a5 reads int16 type from RDX; 17ea0b2 reads RSI string length;
    // 17ea25b..17ea26c copies the entire source to report::text at +8.
    // Keep ENDBR64 at the original indirect-call entry; relocate three PUSHes.
    const unsigned char type_read[] = {0x48,0x0f,0xbf,0x02,0x48,0x89,0xd5,0x66,0x3d,0x63,0x01};
    if (std::memcmp(base + native_reference_va(0x17ea0a5), type_read, sizeof(type_read)) != 0) return false;
    binding.entry = base + native_reference_va(0x17ea074);
    binding.prefix = {0x41,0x57,0x41,0x56,0x41,0x55};
    // 1031350 mutates the single string& in RDI. Its two native searches
    // (1031362/103145e) use "S"/"s" before inserting the lisp spelling.
    // PUSH R15; MOV R8D,1 are complete position-independent instructions.
    binding.speech_entry = base + native_reference_va(0x1031354);
    binding.speech_prefix = {0x41,0x57,0x41,0xb8,0x01,0x00,0x00,0x00};
#endif
    return true;
}
