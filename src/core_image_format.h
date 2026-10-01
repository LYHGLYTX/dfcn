// Validate the published image descriptor without executing its code.

struct CorePeView {
    const std::vector<unsigned char> &bytes;
    IMAGE_NT_HEADERS64 nt{};
    std::vector<IMAGE_SECTION_HEADER> sections;

    template <typename T>
    bool read(std::size_t offset, T &value) const {
        if (offset > bytes.size() || sizeof(T) > bytes.size() - offset) return false;
        std::memcpy(&value, bytes.data() + offset, sizeof(T));
        return true;
    }

    const unsigned char *rva(DWORD address, std::size_t count) const {
        if (address < nt.OptionalHeader.SizeOfHeaders &&
            address <= bytes.size() && count <= bytes.size() - address &&
            count <= nt.OptionalHeader.SizeOfHeaders - address)
            return bytes.data() + address;
        for (const auto &section : sections) {
            if (address < section.VirtualAddress) continue;
            const std::size_t delta = address - section.VirtualAddress;
            if (delta > section.SizeOfRawData || count > section.SizeOfRawData - delta)
                continue;
            const std::uint64_t offset = std::uint64_t(section.PointerToRawData) + delta;
            if (offset <= bytes.size() && count <= bytes.size() - offset)
                return bytes.data() + static_cast<std::size_t>(offset);
        }
        return nullptr;
    }

    template <typename T>
    bool read_rva(DWORD address, T &value) const {
        const auto *data = rva(address, sizeof(T));
        if (!data) return false;
        std::memcpy(&value, data, sizeof(T));
        return true;
    }

    bool compatible() {
        IMAGE_DOS_HEADER dos{};
        if (!read(0, dos) || dos.e_magic != IMAGE_DOS_SIGNATURE || dos.e_lfanew < 0 ||
            !read(static_cast<std::size_t>(dos.e_lfanew), nt) ||
            nt.Signature != IMAGE_NT_SIGNATURE || nt.FileHeader.Machine != IMAGE_FILE_MACHINE_AMD64 ||
            !(nt.FileHeader.Characteristics & IMAGE_FILE_DLL) ||
            nt.OptionalHeader.Magic != IMAGE_NT_OPTIONAL_HDR64_MAGIC ||
            nt.FileHeader.SizeOfOptionalHeader < sizeof(IMAGE_OPTIONAL_HEADER64) ||
            nt.OptionalHeader.NumberOfRvaAndSizes <= IMAGE_DIRECTORY_ENTRY_EXPORT ||
            !nt.FileHeader.NumberOfSections || nt.FileHeader.NumberOfSections > 96)
            return false;
        const std::size_t section_offset = static_cast<std::size_t>(dos.e_lfanew) +
            sizeof(DWORD) + sizeof(IMAGE_FILE_HEADER) + nt.FileHeader.SizeOfOptionalHeader;
        for (unsigned i = 0; i < nt.FileHeader.NumberOfSections; ++i) {
            IMAGE_SECTION_HEADER section{};
            if (!read(section_offset + i * sizeof(section), section) ||
                section.PointerToRawData > bytes.size() ||
                section.SizeOfRawData > bytes.size() - section.PointerToRawData)
                return false;
            sections.push_back(section);
        }
        const auto &directory = nt.OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT];
        IMAGE_EXPORT_DIRECTORY exports{};
        if (!directory.VirtualAddress || directory.Size < sizeof(exports) ||
            !read_rva(directory.VirtualAddress, exports) || !exports.NumberOfNames ||
            exports.NumberOfNames > 65536 || !exports.NumberOfFunctions ||
            exports.NumberOfFunctions > 65536)
            return false;
        const auto *names = rva(exports.AddressOfNames, exports.NumberOfNames * sizeof(DWORD));
        const auto *ordinals = rva(exports.AddressOfNameOrdinals, exports.NumberOfNames * sizeof(WORD));
        const auto *functions = rva(exports.AddressOfFunctions, exports.NumberOfFunctions * sizeof(DWORD));
        if (!names || !ordinals || !functions) return false;
        bool found_api = false, found_descriptor = false;
        for (DWORD i = 0; i < exports.NumberOfNames; ++i) {
            DWORD name_address{};
            WORD ordinal{};
            std::memcpy(&name_address, names + i * sizeof(DWORD), sizeof(DWORD));
            std::memcpy(&ordinal, ordinals + i * sizeof(WORD), sizeof(WORD));
            if (ordinal >= exports.NumberOfFunctions) return false;
            DWORD address{};
            std::memcpy(&address, functions + ordinal * sizeof(DWORD), sizeof(DWORD));
            // Both our exports must belong to this module, never be forwarders.
            if (!address || (address >= directory.VirtualAddress &&
                std::uint64_t(address) < std::uint64_t(directory.VirtualAddress) + directory.Size))
                continue;
            constexpr char api_name[] = "dfcn_get_core_api";
            constexpr char descriptor_name[] = "dfcn_core_descriptor";
            const auto *api_text = rva(name_address, sizeof(api_name));
            const auto *descriptor_text = rva(name_address, sizeof(descriptor_name));
            if (api_text && std::memcmp(api_text, api_name, sizeof(api_name)) == 0) {
                for (const auto &section : sections) {
                    if (address >= section.VirtualAddress &&
                        address - section.VirtualAddress < section.SizeOfRawData &&
                        (section.Characteristics & IMAGE_SCN_MEM_EXECUTE))
                        found_api = true;
                }
            } else if (descriptor_text &&
                       std::memcmp(descriptor_text, descriptor_name, sizeof(descriptor_name)) == 0) {
                DfcnCoreDescriptor descriptor{};
                if (!read_rva(address, descriptor) || descriptor.abi != DFCN_CORE_ABI ||
                    descriptor.api_size != sizeof(DfcnCoreApi)) return false;
                found_descriptor = true;
            }
        }
        return found_api && found_descriptor;
    }
};

