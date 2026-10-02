#pragma once

#ifdef _WIN32
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <limits>
#include <unordered_set>
#include <vector>

namespace dfcn::dfhack {

// This adapter reads DFHack's native MSVC objects, but never creates, destroys,
// or passes STL objects across the DLL boundary. The offsets were recovered
// from the installed x64 DFHack 53.16-r2 library and its VTableInterpose source.
// Call snapshot/dismiss only on the simulation thread while DFHack's core is
// suspended. In particular, finish the snapshot before removing any hooks:
// remove() frees registry nodes and changes every neighbouring link.
class InterposeRegistry {
public:
    using ApplyFn = bool (*)(void *, bool);
    using RemoveFn = void (*)(void *);
    using AppliedFn = bool (*)(void *);

    bool bind(HMODULE module) noexcept {
        clear();
        if (!module || sizeof(void *) != 8) return false;
        auto *slot = exported_prefix(module,
            "?interpose_list_map@virtual_identity@DFHack@@");
        const auto apply = reinterpret_cast<ApplyFn>(GetProcAddress(module,
            "?apply@VMethodInterposeLinkBase@DFHack@@QEAA_N_N@Z"));
        const auto remove = reinterpret_cast<RemoveFn>(GetProcAddress(module,
            "?remove@VMethodInterposeLinkBase@DFHack@@QEAAXXZ"));
        const auto is_applied = reinterpret_cast<AppliedFn>(GetProcAddress(module,
            "?is_applied@VMethodInterposeLinkBase@DFHack@@QEAA_NXZ"));
        const auto current = reinterpret_cast<CurrentScreenFn>(GetProcAddress(module,
            "?getCurViewscreen@Gui@DFHack@@YAPEAUviewscreen@df@@_N@Z"));
        const auto is_screen = reinterpret_cast<IsScreenFn>(GetProcAddress(module,
            "?is_instance@dfhack_viewscreen@DFHack@@SA_NPEAUviewscreen@df@@@Z"));
        const auto dismiss = reinterpret_cast<DismissFn>(GetProcAddress(module,
            "?dismiss@Screen@DFHack@@YAXPEAUviewscreen@df@@_N@Z"));
        if (!slot || !readable(slot, sizeof(void *)) ||
            !executable(reinterpret_cast<const void *>(apply)) ||
            !executable(reinterpret_cast<const void *>(remove)) ||
            !executable(reinterpret_cast<const void *>(is_applied)) ||
            !executable(reinterpret_cast<const void *>(current)) ||
            !executable(reinterpret_cast<const void *>(is_screen)) ||
            !executable(reinterpret_cast<const void *>(dismiss))) return false;

        // Refuse an incompatible native link layout. The exported accessor is
        // movzx eax, byte ptr [rcx+0x30]; ret in this supported MSVC layout.
        static constexpr unsigned char accessor[] = {0x0f, 0xb6, 0x41, 0x30, 0xc3};
        if (!readable(reinterpret_cast<const void *>(is_applied), sizeof(accessor)) ||
            std::memcmp(reinterpret_cast<const void *>(is_applied), accessor,
                sizeof(accessor)) != 0) return false;
        registry_slot_ = slot;
        apply_ = apply;
        remove_ = remove;
        applied_ = is_applied;
        current_screen_ = current;
        is_screen_ = is_screen;
        dismiss_ = dismiss;
        return true;
    }

    bool bound() const noexcept { return registry_slot_ != nullptr; }
    ApplyFn apply_function() const noexcept { return apply_; }
    RemoveFn remove_function() const noexcept { return remove_; }

    bool applied(void *link) const noexcept {
        return applied_ && readable(link, link_prefix_size) && applied_(link);
    }

    // Preserve each native link once. Walking both directions also includes
    // lower-priority hooks hidden underneath the registry's topmost entries.
    // The output belongs to our runtime; DFHack sees only individual pointers.
    bool snapshot(std::vector<void *> &out) const noexcept {
        out.clear();
        if (!bound()) return false;
        try {
            void *registry = nullptr;
            if (!read(registry_slot_, 0, registry)) return false;
            if (!registry) return true;
            std::vector<void *> roots;
            std::vector<void *> result;
            std::size_t entries = 0;
            if (!walk_map(registry, max_registry_nodes, [&](void *outer) {
                    // Outer list value: pair<const identity *, inner map>.
                    auto *inner = offset(outer, 0x18);
                    return inner && walk_map(inner, max_registry_nodes, [&](void *node) {
                        if (++entries > max_registry_nodes) return false;
                        void *link = nullptr;
                        if (!read(node, 0x18, link) || !link) return false;
                        roots.push_back(link);
                        return true;
                    });
                })) return false;

            std::unordered_set<void *> seen;
            std::vector<void *> pending;
            for (auto *root : roots) {
                pending.push_back(root);
                while (!pending.empty()) {
                    void *link = pending.back();
                    pending.pop_back();
                    if (!link || seen.find(link) != seen.end()) continue;
                    if (seen.size() >= max_registry_nodes ||
                        !readable(link, link_prefix_size)) return false;
                    seen.insert(link);
                    void *prev = nullptr, *next = nullptr, *host = nullptr, *method = nullptr;
                    std::int32_t index = -1;
                    unsigned char active = 0;
                    if (!read(link, 0, host) || !read(link, 0x08, index) ||
                        !read(link, 0x10, method) || !read(link, 0x30, active) ||
                        !read(link, 0x40, next) || !read(link, 0x48, prev) ||
                        !host || !method || index < 0 || index > 4096 || active > 1)
                        return false;
                    if (active) result.push_back(link);
                    // Stack order visits the top-to-previous chain first.
                    // Reapplying the snapshot in reverse preserves equal
                    // priority hooks within each host's original order.
                    if (next) pending.push_back(next);
                    if (prev) pending.push_back(prev);
                }
            }
            out.swap(result);
            return true;
        } catch (...) {
            out.clear();
            return false;
        }
    }

    bool dismiss_screens() const noexcept {
        if (!current_screen_ || !is_screen_ || !dismiss_) return false;
        try {
            std::vector<void *> screens;
            auto *screen = current_screen_(false);
            while (screen) {
                if (screens.size() >= max_screens ||
                    std::find(screens.begin(), screens.end(), screen) != screens.end() ||
                    !readable(screen, 0x20)) return false;
                screens.push_back(screen);
                void *parent = nullptr;
                if (!read(screen, 0x10, parent)) return false;
                screen = parent;
            }
            // Snapshot the parent chain before onDismiss Lua callbacks run.
            // false marks just this DFHack screen for normal game teardown.
            for (auto *item : screens) {
                if (!readable(item, 0x20)) return false;
                if (is_screen_(item)) dismiss_(item, false);
            }
            return true;
        } catch (...) {
            return false;
        }
    }

private:
    using CurrentScreenFn = void *(*)(bool);
    using IsScreenFn = bool (*)(void *);
    using DismissFn = void (*)(void *, bool);
    static constexpr std::size_t max_registry_nodes = 65536;
    static constexpr std::size_t max_screens = 256;
    static constexpr std::size_t link_prefix_size = 0x50;

    void *registry_slot_ = nullptr;
    ApplyFn apply_ = nullptr;
    RemoveFn remove_ = nullptr;
    AppliedFn applied_ = nullptr;
    CurrentScreenFn current_screen_ = nullptr;
    IsScreenFn is_screen_ = nullptr;
    DismissFn dismiss_ = nullptr;

    void clear() noexcept {
        registry_slot_ = nullptr;
        apply_ = nullptr;
        remove_ = nullptr;
        applied_ = nullptr;
        current_screen_ = nullptr;
        is_screen_ = nullptr;
        dismiss_ = nullptr;
    }

    static void *offset(const void *ptr, std::size_t amount) noexcept {
        const auto value = reinterpret_cast<std::uintptr_t>(ptr);
        if (!ptr || amount > std::numeric_limits<std::uintptr_t>::max() - value)
            return nullptr;
        return reinterpret_cast<void *>(value + amount);
    }

    static bool readable(const void *ptr, std::size_t size) noexcept {
        auto cursor = reinterpret_cast<std::uintptr_t>(ptr);
        if (!ptr || size > std::numeric_limits<std::uintptr_t>::max() - cursor)
            return false;
        const auto end = cursor + size;
        while (cursor < end) {
            MEMORY_BASIC_INFORMATION region{};
            if (!VirtualQuery(reinterpret_cast<const void *>(cursor), &region,
                    sizeof(region)) || region.State != MEM_COMMIT ||
                (region.Protect & (PAGE_GUARD | PAGE_NOACCESS))) return false;
            const auto access = region.Protect & 0xff;
            if (access != PAGE_READONLY && access != PAGE_READWRITE &&
                access != PAGE_WRITECOPY && access != PAGE_EXECUTE_READ &&
                access != PAGE_EXECUTE_READWRITE && access != PAGE_EXECUTE_WRITECOPY)
                return false;
            const auto begin = reinterpret_cast<std::uintptr_t>(region.BaseAddress);
            if (cursor < begin || region.RegionSize >
                    std::numeric_limits<std::uintptr_t>::max() - begin) return false;
            const auto limit = begin + region.RegionSize;
            if (limit <= cursor) return false;
            cursor = std::min(end, limit);
        }
        return true;
    }

    static bool executable(const void *ptr) noexcept {
        MEMORY_BASIC_INFORMATION region{};
        if (!ptr || !VirtualQuery(ptr, &region, sizeof(region)) ||
            region.State != MEM_COMMIT ||
            (region.Protect & (PAGE_GUARD | PAGE_NOACCESS))) return false;
        const auto access = region.Protect & 0xff;
        return access == PAGE_EXECUTE || access == PAGE_EXECUTE_READ ||
            access == PAGE_EXECUTE_READWRITE || access == PAGE_EXECUTE_WRITECOPY;
    }

    template<class T>
    static bool read(const void *ptr, std::size_t amount, T &value) noexcept {
        const auto *address = offset(ptr, amount);
        if (!address || !readable(address, sizeof(T))) return false;
        std::memcpy(&value, address, sizeof(T));
        return true;
    }

    // Release MSVC unordered_map: float max_load at 0; list sentinel at 8;
    // list size at 16. Nodes have next/prev at 0/8 and pair value at 16.
    template<class Visitor>
    static bool walk_map(void *map, std::size_t maximum, Visitor visitor) {
        if (!readable(map, 0x40)) return false;
        void *sentinel = nullptr;
        std::size_t count = 0;
        if (!read(map, 0x08, sentinel) || !read(map, 0x10, count) ||
            !sentinel || count > maximum || !readable(sentinel, 0x10)) return false;
        void *node = nullptr;
        if (!read(sentinel, 0, node)) return false;
        void *previous = sentinel;
        for (std::size_t index = 0; index < count; ++index) {
            void *next = nullptr, *back = nullptr;
            if (!node || node == sentinel || !readable(node, 0x20) ||
                !read(node, 0, next) || !read(node, 0x08, back) ||
                back != previous || !visitor(node)) return false;
            previous = node;
            node = next;
        }
        void *last = nullptr;
        return node == sentinel && read(sentinel, 0x08, last) && last == previous;
    }

    // Find a decorated data export without depending on the very long MSVC
    // spelling of nested unordered_map template arguments. Only this known
    // loaded module's PE export tables are read; forwarders are rejected.
    static void *exported_prefix(HMODULE module, const char *prefix) noexcept {
        IMAGE_DOS_HEADER dos{};
        if (!read(module, 0, dos) || dos.e_magic != IMAGE_DOS_SIGNATURE ||
            dos.e_lfanew <= 0 || dos.e_lfanew > 0x100000) return nullptr;
        IMAGE_NT_HEADERS64 nt{};
        if (!read(module, static_cast<std::size_t>(dos.e_lfanew), nt) ||
            nt.Signature != IMAGE_NT_SIGNATURE ||
            nt.FileHeader.Machine != IMAGE_FILE_MACHINE_AMD64 ||
            nt.OptionalHeader.Magic != IMAGE_NT_OPTIONAL_HDR64_MAGIC ||
            nt.OptionalHeader.NumberOfRvaAndSizes <= IMAGE_DIRECTORY_ENTRY_EXPORT)
            return nullptr;
        const auto image_size = static_cast<std::size_t>(nt.OptionalHeader.SizeOfImage);
        const auto within = [&](DWORD rva, std::size_t size) {
            auto *address = offset(module, rva);
            return rva < image_size && size <= image_size - rva &&
                address && readable(address, size);
        };
        const auto &directory = nt.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT];
        IMAGE_EXPORT_DIRECTORY exports{};
        if (!within(directory.VirtualAddress, sizeof(exports)) ||
            !read(module, directory.VirtualAddress, exports) ||
            !exports.NumberOfNames || exports.NumberOfNames > 1048576 ||
            !exports.NumberOfFunctions || exports.NumberOfFunctions > 1048576 ||
            !within(exports.AddressOfNames, std::size_t(exports.NumberOfNames) * sizeof(DWORD)) ||
            !within(exports.AddressOfNameOrdinals, std::size_t(exports.NumberOfNames) * sizeof(WORD)) ||
            !within(exports.AddressOfFunctions, std::size_t(exports.NumberOfFunctions) * sizeof(DWORD)))
            return nullptr;
        const auto prefix_size = std::strlen(prefix);
        void *found = nullptr;
        for (DWORD index = 0; index < exports.NumberOfNames; ++index) {
            DWORD name = 0;
            if (!read(module, std::size_t(exports.AddressOfNames) + index * sizeof(DWORD), name) ||
                !within(name, prefix_size)) return nullptr;
            const auto *symbol = static_cast<const char *>(offset(module, name));
            if (std::memcmp(symbol, prefix, prefix_size) != 0) continue;
            WORD ordinal = 0;
            DWORD function = 0;
            if (!read(module, std::size_t(exports.AddressOfNameOrdinals) + index * sizeof(WORD), ordinal) ||
                ordinal >= exports.NumberOfFunctions ||
                !read(module, std::size_t(exports.AddressOfFunctions) + ordinal * sizeof(DWORD), function) ||
                !within(function, 1) ||
                (function >= directory.VirtualAddress &&
                    function - directory.VirtualAddress < directory.Size) || found)
                return nullptr;
            found = offset(module, function);
        }
        return found;
    }
};

} // namespace dfcn::dfhack
#endif
