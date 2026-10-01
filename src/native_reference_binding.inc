// Edition relocation is native binding data, not a second feature pipeline.
// Reviewed profiles retain reference-image coordinates; all callers receive
// the selected image's real addresses and still validate the expected bytes.
struct NativeImageRange { uintptr_t begin, end, native; };
struct NativeImageByte { uintptr_t address; unsigned char reference, native; };
#ifndef _WIN32
#include "native_elf_build_bindings.inc"
#endif

static bool native_reference_relocated() {
#ifdef _WIN32
    return native_pe_classic();
#else
    static const bool relocated = [] {
        ModuleBuildId image;
        dl_iterate_phdr(find_main_build_id, &image);
        return image.found && image.value == "84ba59a59a6bbe4487f933a8c85360a45902749e";
    }();
    return relocated;
#endif
}

static uintptr_t native_reference_va(uintptr_t address) {
#ifdef _WIN32
    return native_pe_rva(address);
#else
    if (!native_reference_relocated()) return address;
    const auto &ranges = native_elf_edition_ranges;
    auto found = std::upper_bound(std::begin(ranges), std::end(ranges), address,
        [](uintptr_t value, const auto &range) { return value < range.begin; });
    if (found != std::begin(ranges)) {
        --found;
        if (address < found->end) return found->native + address - found->begin;
    }
    return 0; // Unreviewed addresses never fall back to another image's code.
#endif
}

static uintptr_t native_reference_rva(uintptr_t offset) {
#ifdef _WIN32
    return native_pe_rva(offset);
#else
    if (!native_reference_relocated()) return offset;
    if (offset > UINTPTR_MAX - 0x400000) return 0;
    const uintptr_t address = native_reference_va(offset + 0x400000);
    return address >= 0x400000 ? address - 0x400000 : 0;
#endif
}

static uintptr_t native_reference_address(uintptr_t base, uintptr_t offset) {
    if (!base) return 0;
    const uintptr_t relocated = native_reference_rva(offset);
    return relocated && relocated <= UINTPTR_MAX - base ? base + relocated : 0;
}

static bool native_reference_bytes(uintptr_t reference_va, std::vector<unsigned char> &expected) {
    if (!native_reference_relocated() || expected.empty()) return true;
#ifndef _WIN32
    if (!native_reference_va(reference_va) || expected.size() > UINTPTR_MAX - reference_va)
        return false;
    const auto &bytes = native_elf_edition_bytes;
    auto found = std::lower_bound(std::begin(bytes), std::end(bytes), reference_va,
        [](const auto &byte, uintptr_t value) { return byte.address < value; });
    for (; found != std::end(bytes) && found->address < reference_va + expected.size(); ++found) {
        auto &value = expected[found->address - reference_va];
        if (value != found->reference) return false;
        value = found->native;
    }
    return true;
#else
    return native_pe_bytes(reference_va, expected);
#endif
}

static bool native_reference_calls(std::vector<NativeCall> &calls, uintptr_t origin) {
    if (!native_reference_relocated()) return true;
    for (auto &call : calls) {
        if (call.va > UINTPTR_MAX - origin || call.target > UINTPTR_MAX - origin ||
            !native_reference_bytes(origin + call.va, call.inline_original)) return false;
        const uintptr_t site = native_reference_va(origin + call.va);
        const uintptr_t target = call.target ? native_reference_va(origin + call.target) : 0;
        if (!site || site < origin || (call.target && (!target || target < origin))) return false;
        call.va = site - origin;
        if (call.target) call.target = target - origin;
    }
    return true;
}
