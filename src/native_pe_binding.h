#pragma once

// Both Windows distributions use the same object ABI. Only executable
// coordinates and the relocatable operands in hook signatures differ.
#ifdef _WIN32
namespace dfcn {
struct NativePeRange { uintptr_t begin, end, native; };
struct NativePeByte { uintptr_t address; unsigned char reference, native; };
#include "native_pe_build_bindings.inc"

inline unsigned native_pe_edition() {
    static const unsigned edition = [] {
        const auto *base = reinterpret_cast<const unsigned char *>(GetModuleHandleW(nullptr));
        if (!base) return 0u;
        const auto *dos = reinterpret_cast<const IMAGE_DOS_HEADER *>(base);
        if (dos->e_magic != IMAGE_DOS_SIGNATURE || dos->e_lfanew <= 0 || dos->e_lfanew > 4096) return 0u;
        const auto *nt = reinterpret_cast<const IMAGE_NT_HEADERS64 *>(base + dos->e_lfanew);
        if (nt->Signature != IMAGE_NT_SIGNATURE || nt->FileHeader.Machine != IMAGE_FILE_MACHINE_AMD64 ||
            nt->OptionalHeader.Magic != IMAGE_NT_OPTIONAL_HDR64_MAGIC) return 0u;
        if (nt->FileHeader.TimeDateStamp == 0x6a70a6d9 && nt->OptionalHeader.SizeOfImage == 0x02711000) return 1u;
        if (nt->FileHeader.TimeDateStamp == 0x6a70b91c && nt->OptionalHeader.SizeOfImage == 0x0270a000) return 2u;
        return 0u;
    }();
    return edition;
}
inline bool native_pe_supported() { return native_pe_edition() != 0; }
inline bool native_pe_classic() { return native_pe_edition() == 2; }
inline uintptr_t native_pe_rva(uintptr_t address) {
    if (!native_pe_supported()) return 0;
    if (!native_pe_classic()) return address;
    auto found = std::upper_bound(std::begin(native_pe_edition_ranges), std::end(native_pe_edition_ranges), address,
        [](uintptr_t value, const auto &range) { return value < range.begin; });
    if (found != std::begin(native_pe_edition_ranges)) {
        --found;
        if (address < found->end) return found->native + address - found->begin;
    }
    return 0;
}
inline uintptr_t native_pe_address(uintptr_t base, uintptr_t reference) {
    const uintptr_t offset = native_pe_rva(reference);
    return base && offset && offset <= UINTPTR_MAX - base ? base + offset : 0;
}
inline bool native_pe_bytes(uintptr_t reference, std::vector<unsigned char> &expected) {
    if (!native_pe_supported()) return false;
    if (!native_pe_classic() || expected.empty()) return true;
    const uintptr_t first = native_pe_rva(reference);
    if (!first || expected.size() > UINTPTR_MAX - reference ||
        native_pe_rva(reference + expected.size() - 1) != first + expected.size() - 1) return false;
    auto found = std::lower_bound(std::begin(native_pe_edition_bytes), std::end(native_pe_edition_bytes), reference,
        [](const auto &byte, uintptr_t value) { return byte.address < value; });
    for (; found != std::end(native_pe_edition_bytes) && found->address < reference + expected.size(); ++found) {
        auto &value = expected[found->address - reference];
        if (value != found->reference) return false;
        value = found->native;
    }
    return true;
}
inline bool native_pe_match(uintptr_t base, uintptr_t reference, const unsigned char *bytes, size_t count) {
    std::vector<unsigned char> expected(bytes, bytes + count);
    const uintptr_t address = native_pe_address(base, reference);
    return address && native_pe_bytes(reference, expected) &&
        std::memcmp(reinterpret_cast<const void *>(address), expected.data(), expected.size()) == 0;
}
} // namespace dfcn
#endif
