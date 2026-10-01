#include "native_patch_platform.h"

static void report_native_patch_error(const char *level, const char *label,
        const char *operation, unsigned long error = 0) noexcept {
    try {
        std::string message = std::string(label) + ": " + operation;
        if (error) message += " (native error " + std::to_string(error) + ")";
        log_line(level, message);
    } catch (...) {}
}

static void report_native_branch_error(const char *label, uintptr_t instruction,
        uintptr_t target) noexcept {
    try {
        log_line("ERROR", std::string(label) + ": rel32 branch out of range; instruction=" +
            std::to_string(instruction) + "; target=" + std::to_string(target));
    } catch (...) {}
}

struct NativePatchPage {
    NativePatchProtection protection = 0;
    bool writable = false;
};
using NativePatchPages = std::map<uintptr_t, NativePatchPage>;

static bool collect_native_patch_pages(NativePatchPages &pages, uintptr_t address,
        size_t size, size_t page_size, bool executable, const char *label) {
    if (!address || !size || !page_size || size > UINTPTR_MAX - address) {
        report_native_patch_error("ERROR", label, "invalid patch extent");
        return false;
    }
    const uintptr_t first = address & ~(page_size - 1);
    const uintptr_t last = (address + size - 1) & ~(page_size - 1);
    for (uintptr_t page = first;; page += page_size) {
        if (!pages.contains(page)) {
            NativePatchProtection protection = 0;
            unsigned long error = 0;
            if (!native_patch_page_protection(page, page_size, protection, error) ||
                !native_patch_readable(protection) || (executable && !native_patch_executable(protection))) {
                report_native_patch_error("ERROR", label, "inaccessible patch page", error);
                return false;
            }
            pages.emplace(page, NativePatchPage{protection});
        }
        if (page == last) break;
    }
    return true;
}

static void restore_native_patch_pages(const NativePatchPages &pages,
        size_t page_size, const char *label) noexcept {
    for (const auto &[address, page] : pages) {
        if (!page.writable) continue;
        unsigned long error = 0;
        if (!native_patch_protect(reinterpret_cast<void *>(address), page_size, page.protection, error))
            report_native_patch_error("WARN", label, "page protection restore failed", error);
    }
}

static bool make_native_patch_pages_writable(NativePatchPages &pages,
        size_t page_size, const char *label) noexcept {
    for (auto &[address, page] : pages) {
        unsigned long error = 0;
        if (!native_patch_protect(reinterpret_cast<void *>(address), page_size,
                                  native_patch_writable(page.protection), error)) {
            restore_native_patch_pages(pages, page_size, label);
            report_native_patch_error("ERROR", label, "page write protection failed", error);
            return false;
        }
        page.writable = true;
    }
    return true;
}

struct NativeCodePatch {
    unsigned char *address = nullptr;
    std::vector<unsigned char> original, replacement;
    mutable bool cache_pending = false;
};

static bool native_code_patches_pending(const std::vector<NativeCodePatch> &patches) {
    return std::any_of(patches.begin(), patches.end(), [](const auto &patch) { return patch.cache_pending; });
}

static bool flush_native_code_patches(const std::vector<NativeCodePatch> &patches,
        const char *label) noexcept {
    bool flushed = true;
    for (const auto &patch : patches) {
        if (!patch.cache_pending) continue;
        unsigned long error = 0;
        if (native_patch_flush(patch.address, patch.original.size(), error)) {
            patch.cache_pending = false;
        } else {
            report_native_patch_error("ERROR", label, "instruction cache flush failed", error);
            flushed = false;
        }
    }
    return flushed;
}

static bool write_native_code_patches(const std::vector<NativeCodePatch> &patches,
        bool install, const char *label, bool *installed_state = nullptr) {
    const size_t page_size = native_patch_page_size();
    NativePatchPages pages;
    std::map<uintptr_t, uintptr_t> ranges;
    for (const auto &patch : patches) {
        const auto &expected = install ? patch.original : patch.replacement;
        const uintptr_t address = reinterpret_cast<uintptr_t>(patch.address);
        if (patch.original.size() != patch.replacement.size() ||
            !collect_native_patch_pages(pages, address, expected.size(), page_size, true, label)) return false;
        const uintptr_t end = address + expected.size();
        const auto next = ranges.lower_bound(address);
        if ((next != ranges.end() && next->first < end) ||
            (next != ranges.begin() && std::prev(next)->second > address)) {
            report_native_patch_error("ERROR", label, "overlapping code patches");
            return false;
        }
        ranges.emplace(address, end);
        if (std::memcmp(patch.address, expected.data(), expected.size()) != 0) {
            report_native_patch_error("ERROR", label, "code ownership/signature mismatch");
            return false;
        }
    }
    if (patches.empty() || !make_native_patch_pages_writable(pages, page_size, label)) return false;
    // Every allocation, range/signature check and page change precedes the
    // first write. Track ownership before flushing or restoring protection.
    for (const auto &patch : patches) {
        const auto &bytes = install ? patch.replacement : patch.original;
        std::memcpy(patch.address, bytes.data(), bytes.size());
        patch.cache_pending = true;
    }
    if (installed_state) *installed_state = install;
    const bool flushed = flush_native_code_patches(patches, label);
    restore_native_patch_pages(pages, page_size, label);
    return flushed;
}

// Every branch must reach its own stub. Being close to the midpoint of a
// group does not guarantee reachability from its first and last call sites.
// Constrain the entire allocation to their common interval, with room for
// instruction lengths and relocated operands at either end.
struct NativeRelayRange {
    uintptr_t minimum = 0, maximum = UINTPTR_MAX;
    void include(uintptr_t address) noexcept {
        constexpr uintptr_t reach = 0x7ffe0000;
        minimum = std::max(minimum, address > reach ? address - reach : 0);
        maximum = std::min(maximum, address <= UINTPTR_MAX - reach ? address + reach : UINTPTR_MAX);
    }
};

static void *allocate_native_relay(const NativeRelayRange &range, size_t requested_size,
        size_t *allocated_size, const char *label) noexcept {
    const size_t page_size = native_patch_page_size();
    if (!allocated_size || !page_size || !requested_size || requested_size > SIZE_MAX - page_size + 1) {
        report_native_patch_error("ERROR", label, "invalid relay allocation size");
        return nullptr;
    }
    *allocated_size = (requested_size + page_size - 1) & ~(page_size - 1);
    if (range.minimum >= range.maximum || *allocated_size > range.maximum - range.minimum) {
        *allocated_size = 0;
        report_native_patch_error("ERROR", label, "no relay interval reachable from every branch");
        return nullptr;
    }
    unsigned long error = 0;
    void *memory = native_patch_allocate_between(range.minimum, range.maximum, *allocated_size, error);
    if (!memory) {
        *allocated_size = 0;
        report_native_patch_error("ERROR", label, "allocation inside the common branch interval failed", error);
    }
    return memory;
}

static bool seal_native_relay(void *relay, size_t size, const char *label) noexcept {
    unsigned long error = 0;
    if (!native_patch_protect(relay, size, native_patch_relay_protection(), error)) {
        report_native_patch_error("ERROR", label, "relay protection failed", error);
        return false;
    }
    if (!native_patch_flush(relay, size, error)) {
        report_native_patch_error("ERROR", label, "relay cache flush failed", error);
        return false;
    }
    return true;
}

static bool release_native_relay(void *&relay, size_t &size, const char *label) noexcept {
    if (!relay) return true;
    unsigned long error = 0;
    if (!native_patch_release(relay, size, error)) {
        report_native_patch_error("ERROR", label, "relay release failed", error);
        return false;
    }
    relay = nullptr;
    size = 0;
    return true;
}

struct NativeRelayGuard {
    void *&relay;
    size_t &size;
    const bool &installed;
    const char *label;
    bool committed = false;
    ~NativeRelayGuard() {
        if (!committed && !installed) release_native_relay(relay, size, label);
    }
};

// Both supported native ABIs use this register-preserving x86-64 jump.
static void emit_native_absolute_jump(unsigned char *destination, const void *target) {
    destination[0] = 0xff;
    destination[1] = 0x25;
    std::memset(destination + 2, 0, 4);
    const uintptr_t address = reinterpret_cast<uintptr_t>(target);
    std::memcpy(destination + 6, &address, sizeof(address));
}

static bool native_relative_branch(unsigned char *instruction, unsigned char opcode,
        const void *target) {
    const intptr_t distance = reinterpret_cast<intptr_t>(target) - reinterpret_cast<intptr_t>(instruction + 5);
    if (distance < INT32_MIN || distance > INT32_MAX) return false;
    instruction[0] = opcode;
    const int32_t relative = static_cast<int32_t>(distance);
    std::memcpy(instruction + 1, &relative, sizeof(relative));
    return true;
}

struct NativeCall {
    uintptr_t va, target;
    const void *wrapper;
    std::vector<unsigned char> prefix{};
    // A verified, complete inline operation may be replaced by an ABI call.
    // Empty retains the ordinary rel32 call/target identity check. Adapters
    // must establish instruction boundaries, no interior branch targets,
    // caller stack space and the absence of live volatile registers/flags.
    std::vector<unsigned char> inline_original{};
    // Verified ABI result adaptation immediately after the replacement CALL.
    // Relative operands are relative to that original instruction address;
    // this permits an inlined expression to retain its native continuations.
    std::vector<unsigned char> suffix{};
};

struct NativeCallHook {
    std::vector<NativeCodePatch> patches;
    void *relay = nullptr;
    size_t relay_size = 0;
    bool installed = false;
    bool active() const { return installed || relay != nullptr; }

    bool install(uintptr_t base, const std::vector<NativeCall> &calls, const char *label) {
        if (installed) return flush_native_code_patches(patches, label);
        if (!flush_native_code_patches(patches, label)) return false;
        if (!release_native_relay(relay, relay_size, label)) return false;
        patches.clear();
        constexpr size_t relay_stride = 64;
        constexpr size_t jump_bytes = 14;
        if (calls.empty() || calls.size() > SIZE_MAX / relay_stride) return false;
        NativeRelayRange range;
        const size_t page_size = native_patch_page_size();
        NativePatchPages readable_pages;
        for (const auto &call : calls) {
            const size_t extent = call.inline_original.empty() ? 5 : call.inline_original.size();
            if (call.va > UINTPTR_MAX - base || call.target > UINTPTR_MAX - base || !call.wrapper ||
                call.prefix.size() > relay_stride - jump_bytes || extent < 5 || extent > 4096 ||
                call.suffix.size() > extent - 5 ||
                !collect_native_patch_pages(readable_pages,
                    base + call.va, extent, page_size, true, label)) return false;
            const auto *address = reinterpret_cast<const unsigned char *>(base + call.va);
            if (!call.inline_original.empty()) {
                if (std::memcmp(address, call.inline_original.data(), extent) != 0) {
                    report_native_patch_error("ERROR", label, "native inline operation identity mismatch");
                    return false;
                }
            } else {
                int32_t relative = 0;
                std::memcpy(&relative, address + 1, sizeof(relative));
                if (address[0] != 0xe8 || reinterpret_cast<uintptr_t>(address + 5 + relative) != base + call.target) {
                    report_native_patch_error("ERROR", label, "native call identity mismatch");
                    return false;
                }
            }
            if (extent > UINTPTR_MAX - (base + call.va)) {
                report_native_patch_error("ERROR", label, "native call extent overflow");
                return false;
            }
            range.include(base + call.va);
        }
        relay = allocate_native_relay(range, calls.size() * relay_stride, &relay_size, label);
        if (!relay) return false;
        NativeRelayGuard guard{relay, relay_size, installed, label};
        auto *memory = static_cast<unsigned char *>(relay);
        patches.reserve(calls.size());
        for (size_t i = 0; i < calls.size(); ++i) {
            const auto &call = calls[i];
            auto *stub = memory + i * relay_stride;
            std::copy(call.prefix.begin(), call.prefix.end(), stub);
            emit_native_absolute_jump(stub + call.prefix.size(), call.wrapper);
            auto *address = reinterpret_cast<unsigned char *>(base + call.va);
            const intptr_t distance = reinterpret_cast<intptr_t>(stub) - reinterpret_cast<intptr_t>(address + 5);
            if (distance < INT32_MIN || distance > INT32_MAX) {
                report_native_branch_error(label, reinterpret_cast<uintptr_t>(address),
                    reinterpret_cast<uintptr_t>(stub));
                return false;
            }
            const size_t extent = call.inline_original.empty() ? 5 : call.inline_original.size();
            NativeCodePatch patch{address, {}, std::vector<unsigned char>(extent, 0x90)};
            patch.original.assign(address, address + extent);
            patch.replacement[0] = 0xe8;
            const int32_t relative = static_cast<int32_t>(distance);
            std::memcpy(patch.replacement.data() + 1, &relative, sizeof(relative));
            std::copy(call.suffix.begin(), call.suffix.end(), patch.replacement.begin() + 5);
            patches.push_back(std::move(patch));
        }
        if (!seal_native_relay(relay, relay_size, label)) return false;
        if (!write_native_code_patches(patches, true, label, &installed)) return false;
        guard.committed = true;
        return true;
    }

    bool uninstall(const char *label) {
        if (installed && !write_native_code_patches(patches, false, label, &installed)) return false;
        if (!flush_native_code_patches(patches, label)) return false;
        if (!release_native_relay(relay, relay_size, label)) return false;
        patches.clear();
        return true;
    }
};

// Profiles describe only verified instruction bytes and their relative
// operands. Trampoline construction and the two-phase publish are shared.
struct NativeRelativeFixup {
    size_t displacement_offset, instruction_end;
    uintptr_t target;
};

struct NativeEntryHook {
    std::vector<NativeCodePatch> patches;
    void *relay = nullptr;
    size_t relay_size = 0;
    void *original = nullptr;
    bool installed = false;
    bool active() const { return installed || relay != nullptr; }

    bool prepare(unsigned char *address, const std::vector<unsigned char> &prefix,
            const void *wrapper, const std::vector<NativeRelativeFixup> &fixups,
            const char *label) {
        if (installed) return false;
        if (!flush_native_code_patches(patches, label)) return false;
        if (!release_native_relay(relay, relay_size, label)) return false;
        original = nullptr;
        patches.clear();
        if (!wrapper || prefix.size() < 5 || prefix.size() > 4096) return false;
        NativePatchPages readable_pages;
        if (!collect_native_patch_pages(readable_pages, reinterpret_cast<uintptr_t>(address),
                prefix.size(), native_patch_page_size(), true, label) ||
            std::memcmp(address, prefix.data(), prefix.size()) != 0) {
            report_native_patch_error("ERROR", label, "entry signature mismatch");
            return false;
        }
        NativeRelayRange range;
        range.include(reinterpret_cast<uintptr_t>(address));
        range.include(reinterpret_cast<uintptr_t>(address + prefix.size()));
        std::map<size_t, size_t> operands;
        for (const auto &fixup : fixups) {
            if (fixup.instruction_end > prefix.size() || fixup.displacement_offset > fixup.instruction_end ||
                fixup.instruction_end - fixup.displacement_offset < sizeof(int32_t)) return false;
            int32_t original_relative = 0;
            std::memcpy(&original_relative, prefix.data() + fixup.displacement_offset, sizeof(original_relative));
            if (reinterpret_cast<uintptr_t>(address + fixup.instruction_end + original_relative) != fixup.target) {
                report_native_patch_error("ERROR", label, "relative operand identity mismatch");
                return false;
            }
            const auto next = operands.lower_bound(fixup.displacement_offset);
            if ((next != operands.end() && next->first < fixup.displacement_offset + 4) ||
                (next != operands.begin() && std::prev(next)->second > fixup.displacement_offset)) return false;
            operands.emplace(fixup.displacement_offset, fixup.displacement_offset + 4);
            range.include(fixup.target);
        }
        relay = allocate_native_relay(range, prefix.size() + 64, &relay_size, label);
        if (!relay) return false;
        NativeRelayGuard guard{relay, relay_size, installed, label};
        auto *memory = static_cast<unsigned char *>(relay);
        emit_native_absolute_jump(memory, wrapper);
        auto *trampoline = memory + 32;
        static constexpr std::array<unsigned char, 4> endbr{{0xf3, 0x0f, 0x1e, 0xfa}};
        std::copy(endbr.begin(), endbr.end(), trampoline);
        std::copy(prefix.begin(), prefix.end(), trampoline + endbr.size());
        for (const auto &fixup : fixups) {
            const intptr_t distance = static_cast<intptr_t>(fixup.target) -
                reinterpret_cast<intptr_t>(trampoline + endbr.size() + fixup.instruction_end);
            if (distance < INT32_MIN || distance > INT32_MAX) {
                report_native_branch_error(label,
                    reinterpret_cast<uintptr_t>(trampoline + endbr.size() + fixup.displacement_offset), fixup.target);
                return false;
            }
            const int32_t relative = static_cast<int32_t>(distance);
            std::memcpy(trampoline + endbr.size() + fixup.displacement_offset, &relative, sizeof(relative));
        }
        if (!native_relative_branch(trampoline + endbr.size() + prefix.size(), 0xe9, address + prefix.size())) {
            report_native_branch_error(label,
                reinterpret_cast<uintptr_t>(trampoline + endbr.size() + prefix.size()),
                reinterpret_cast<uintptr_t>(address + prefix.size()));
            return false;
        }
        const intptr_t distance = reinterpret_cast<intptr_t>(memory) - reinterpret_cast<intptr_t>(address + 5);
        if (distance < INT32_MIN || distance > INT32_MAX) {
            report_native_branch_error(label, reinterpret_cast<uintptr_t>(address),
                reinterpret_cast<uintptr_t>(memory));
            return false;
        }
        NativeCodePatch patch{address, prefix, std::vector<unsigned char>(prefix.size(), 0x90)};
        patch.replacement[0] = 0xe9;
        const int32_t relative = static_cast<int32_t>(distance);
        std::memcpy(patch.replacement.data() + 1, &relative, sizeof(relative));
        patches.push_back(std::move(patch));
        if (!seal_native_relay(relay, relay_size, label)) return false;
        original = trampoline;
        guard.committed = true;
        return true;
    }

    bool install(const char *label) {
        if (installed) return flush_native_code_patches(patches, label);
        if (!relay || !original || patches.empty()) return false;
        return write_native_code_patches(patches, true, label, &installed);
    }

    bool uninstall(const char *label) {
        if (installed && !write_native_code_patches(patches, false, label, &installed)) return false;
        if (!flush_native_code_patches(patches, label)) return false;
        if (!release_native_relay(relay, relay_size, label)) return false;
        original = nullptr;
        patches.clear();
        return true;
    }
};

static bool write_native_import_slot(void **slot, void *expected, void *desired,
        const char *label, bool *installed_state = nullptr, bool install = true) {
    if (!slot || reinterpret_cast<uintptr_t>(slot) % std::atomic_ref<void *>::required_alignment != 0) return false;
    const size_t page_size = native_patch_page_size();
    NativePatchPages pages;
    if (!collect_native_patch_pages(pages, reinterpret_cast<uintptr_t>(slot), sizeof(*slot),
                                     page_size, false, label)) return false;
    std::atomic_ref<void *> cell(*slot);
    if (cell.load(std::memory_order_acquire) != expected) {
        report_native_patch_error("ERROR", label, "import ownership mismatch");
        return false;
    }
    if (!make_native_patch_pages_writable(pages, page_size, label)) return false;
    const bool exchanged = cell.compare_exchange_strong(expected, desired, std::memory_order_acq_rel);
    if (exchanged && installed_state) *installed_state = install;
    restore_native_patch_pages(pages, page_size, label);
    if (!exchanged) report_native_patch_error("ERROR", label, "import changed during replacement");
    return exchanged;
}

struct NativeImportHook {
    void **slot = nullptr;
    void *original = nullptr;
    void *replacement = nullptr;
    bool installed = false;
    bool active() const { return installed; }

    bool install(const char *label) {
        if (installed) return true;
        if (!slot || !replacement || reinterpret_cast<uintptr_t>(slot) %
                std::atomic_ref<void *>::required_alignment != 0) return false;
        if (!original) original = std::atomic_ref<void *>(*slot).load(std::memory_order_acquire);
        if (original == replacement) {
            report_native_patch_error("ERROR", label, "untracked callback already owns the import");
            return false;
        }
        return write_native_import_slot(slot, original, replacement, label, &installed, true);
    }

    bool uninstall(const char *label) {
        if (!installed) return true;
        if (!slot) return false;
        if (std::atomic_ref<void *>(*slot).load(std::memory_order_acquire) == original) {
            installed = false;
            return true;
        }
        return write_native_import_slot(slot, replacement, original, label, &installed, false);
    }
};
