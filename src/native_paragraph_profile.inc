// Paragraph entry descriptors. Capture and installation are shared.
#ifdef _WIN32
// PE entry/ABI discovery only. Relocation and lifecycle use NativeEntryHook.
static bool resolve_native_paragraph_binding(NativeParagraphBinding &binding) {
    auto *base = reinterpret_cast<unsigned char *>(GetModuleHandleW(nullptr));
    if (!base || !native_pe_supported()) return false;
    constexpr uintptr_t entry_rva = 0x008e7310;
    std::vector<unsigned char> prefix{0x45, 0x85, 0xc0, 0x0f, 0x8e, 0x17, 0x01, 0x00, 0x00};
    const std::array<unsigned char, 9> string_fields{{0x4c, 0x8b, 0x43, 0x10, 0x48, 0x83, 0x7b, 0x18, 0x0f}};
    const std::array<unsigned char, 18> append_fields{{
        0x49, 0x8b, 0x57, 0x08, 0x49, 0x3b, 0x57, 0x10, 0x74, 0x0a,
        0x48, 0x89, 0x1a, 0x49, 0x83, 0x47, 0x08, 0x08}};
    if (!native_pe_bytes(entry_rva, prefix) ||
        std::memcmp(base + native_pe_rva(entry_rva), prefix.data(), prefix.size()) != 0 ||
        !native_pe_match(reinterpret_cast<uintptr_t>(base), 0x8e736d,
            string_fields.data(), string_fields.size()) ||
        !native_pe_match(reinterpret_cast<uintptr_t>(base), 0x8e75f7,
            append_fields.data(), append_fields.size())) {
        log_line("ERROR", "Native paragraph entry/row ABI validation failed");
        return false;
    }
    binding.entry = base + native_pe_rva(entry_rva);
    binding.prefix = prefix;
    // test r8d,r8d; jle 0x8e7430. Preserve the complete conditional branch.
    binding.fixups = {{5, 9, native_pe_address(reinterpret_cast<uintptr_t>(base), 0x8e7430)}};
    return true;
}
#else
// ELF import discovery only. Binding and lifecycle use NativeImportHook.
static bool resolve_native_paragraph_binding(NativeParagraphBinding &binding) {
    static constexpr const char *symbol =
        "_ZN17curses_text_boxst13add_paragraphERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEi";
    PatchSearch search{symbol};
    dl_iterate_phdr(find_main_import_slot, &search);
    binding.import_slot = search.slot;
    binding.original = dlsym(RTLD_DEFAULT, symbol);
    if (!binding.import_slot || !binding.original) {
        log_line("ERROR", "Cannot resolve native paragraph import");
        return false;
    }
    return true;
}
#endif
