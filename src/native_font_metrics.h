#pragma once

#include "native_runtime.h"

#include <cstdint>
#include <cstring>
#include <fstream>
#include <string_view>
#include <utility>

namespace dfcn {
namespace native_font_metrics_detail {

struct EnglishInkRows {
    int cell_height = 0;
    std::array<std::vector<unsigned char>, 6> glyph_rows;
};

constexpr std::string_view ink_capitals = "AHIMNX";

#ifdef _WIN32
// renderer_2d_base's texture descriptors (53.16 PE 0x8dce4e and
// 0x8dcffe) select BASIC_TEXT first, otherwise the current fullscreen font.
// The normal table is also the source of the TOP/BOTTOM textures: their
// generator (0xc37270) moves each half within an unchanged-size surface.
struct NativeFontGlyph {
    int32_t texture = 0;
    SDL_Surface *surface = nullptr;
    void *pixels = nullptr;
    SDL_PixelFormat *format = nullptr;
    Uint32 pixel_format = 0;
    Uint32 surface_flags = 0;
    Uint32 red_mask = 0, green_mask = 0, blue_mask = 0, alpha_mask = 0;
    int width = 0, height = 0, pitch = 0;
    bool operator==(const NativeFontGlyph &) const = default;
};

struct NativeFontSource {
    uintptr_t table = 0;
    std::array<NativeFontGlyph, ink_capitals.size()> glyphs{};
    bool operator==(const NativeFontSource &) const = default;
};

inline bool copy_native_font_memory(uintptr_t address, void *destination, size_t size) {
    if (!address || size > UINTPTR_MAX - address) return false;
    SIZE_T copied = 0;
    return ReadProcessMemory(GetCurrentProcess(), reinterpret_cast<const void *>(address),
        destination, size, &copied) && copied == size;
}

template<typename T>
inline bool copy_native_font_value(uintptr_t address, T &value) {
    return copy_native_font_memory(address, &value, sizeof(value));
}

inline std::optional<NativeFontSource> current_native_font_source() {
    static const auto executable = reinterpret_cast<uintptr_t>(GetModuleHandleW(nullptr));
    const uintptr_t enabler = native_pe_address(executable, 0x02390290);
    const uintptr_t settings = native_pe_address(executable, 0x023cd770);
    if (!enabler || !settings) return std::nullopt;

    uint8_t fullscreen = 0;
    uint32_t flags = 0;
    struct RawSurfaces { uintptr_t begin = 0, end = 0, capacity = 0; } raws;
    if (!copy_native_font_value(enabler + 0x8, fullscreen) ||
            !copy_native_font_value(enabler + 0x338, flags) ||
            !copy_native_font_value(enabler + 0x348, raws) ||
            !raws.begin || raws.end < raws.begin || raws.capacity < raws.end ||
            (raws.end - raws.begin) % sizeof(SDL_Surface *) ||
            (raws.end - raws.begin) / sizeof(SDL_Surface *) > (1u << 24))
        return std::nullopt;

    NativeFontSource result;
    result.table = settings + ((flags & 0x4) ? 0xd8 : (fullscreen & 0x1) ? 0x8d8 : 0x4d8);
    std::array<int32_t, 256> textures{};
    if (!copy_native_font_memory(result.table, textures.data(), sizeof(textures)))
        return std::nullopt;
    const size_t count = (raws.end - raws.begin) / sizeof(SDL_Surface *);
    for (size_t index = 0; index < ink_capitals.size(); ++index) {
        auto &glyph = result.glyphs[index];
        glyph.texture = textures[static_cast<unsigned char>(ink_capitals[index])];
        SDL_Surface surface{};
        SDL_PixelFormat format{};
        if (glyph.texture <= 0 || static_cast<size_t>(glyph.texture) >= count ||
                !copy_native_font_value(raws.begin + glyph.texture * sizeof(SDL_Surface *), glyph.surface) ||
                !copy_native_font_value(reinterpret_cast<uintptr_t>(glyph.surface), surface) ||
                !copy_native_font_value(reinterpret_cast<uintptr_t>(surface.format), format) ||
                !surface.pixels || surface.w <= 0 || surface.h <= 0 ||
                surface.w > 4096 || surface.h > 4096 || format.BytesPerPixel != 4 ||
                format.BitsPerPixel != 32 || format.palette || !format.Amask ||
                surface.pitch < surface.w * 4 || surface.pitch > 65536 ||
                (surface.flags & SDL_RLEACCEL) ||
                static_cast<size_t>(surface.pitch) * surface.h > 64u * 1024u * 1024u)
            return std::nullopt;
        glyph.pixels = surface.pixels;
        glyph.format = surface.format;
        glyph.pixel_format = format.format;
        glyph.surface_flags = surface.flags;
        glyph.red_mask = format.Rmask;
        glyph.green_mask = format.Gmask;
        glyph.blue_mask = format.Bmask;
        glyph.alpha_mask = format.Amask;
        glyph.width = surface.w;
        glyph.height = surface.h;
        glyph.pitch = surface.pitch;
    }
    return result;
}

inline EnglishInkRows load_native_english_ink_rows(const NativeFontSource &source) {
    EnglishInkRows result;
    bool any_ink = false;
    for (size_t index = 0; index < source.glyphs.size(); ++index) {
        const auto &glyph = source.glyphs[index];
        if (!result.cell_height) result.cell_height = glyph.height;
        if (result.cell_height != glyph.height) return {};

        // Native load_page (PE 0x131d3d0) first converts the atlas with
        // 0x131d230: its magenta color key becomes RGBA alpha. It then
        // creates each font glyph with that same 32-bit alpha format at
        // 0x131d610..0x131d689. Copy those actual bytes safely and decode
        // their copied alpha mask; never pass a borrowed surface, format,
        // palette or private blit map to SDL while resources may change.
        std::vector<unsigned char> pixels(static_cast<size_t>(glyph.pitch) * glyph.height);
        if (!copy_native_font_memory(reinterpret_cast<uintptr_t>(glyph.pixels),
                pixels.data(), pixels.size())) return {};
        auto &rows = result.glyph_rows[index];
        rows.assign(result.cell_height, 0);
        for (int y = 0; y < glyph.height; ++y) {
            const auto *row = pixels.data() + static_cast<size_t>(y) * glyph.pitch;
            for (int x = 0; x < glyph.width; ++x) {
                Uint32 pixel = 0;
                std::memcpy(&pixel, row + x * 4, sizeof(pixel));
                if (!(pixel & glyph.alpha_mask)) continue;
                rows[y] = 1;
                any_ink = true;
                break;
            }
        }
    }
    return any_ink ? result : EnglishInkRows{};
}
#endif

struct EnglishInkCache {
    bool refreshed = false;
    uint64_t revision = 0;
    EnglishInkRows rows;
#ifdef _WIN32
    std::optional<NativeFontSource> source;
#endif
};

inline EnglishInkCache &english_ink_cache() {
    thread_local EnglishInkCache cache;
    return cache;
}

inline std::filesystem::path executable_directory() {
#ifdef _WIN32
    std::wstring filename(32768, L'\0');
    const DWORD length = GetModuleFileNameW(nullptr, filename.data(),
        static_cast<DWORD>(filename.size()));
    if (!length || length >= filename.size()) return {};
    filename.resize(length);
    return std::filesystem::path(filename).parent_path();
#else
    std::error_code error;
    const auto filename = std::filesystem::read_symlink("/proc/self/exe", error);
    return error ? std::filesystem::path{} : filename.parent_path();
#endif
}

inline void read_basic_font(const std::filesystem::path &filename, std::string &font) {
    std::ifstream input(filename);
    std::string line;
    constexpr std::string_view token = "[BASIC_FONT:";
    while (std::getline(input, line)) {
        const auto start = line.find_first_not_of(" \t\r\n");
        if (start == std::string::npos || line.compare(start, token.size(), token) != 0)
            continue;
        const auto value_start = start + token.size();
        const auto end = line.find(']', value_start);
        if (end == std::string::npos) continue;
        const auto value = line.substr(value_start, end - value_start);
        if (!value.empty()) font = value;
    }
}

inline EnglishInkRows load_english_ink_rows() {
    EnglishInkRows result;
    const auto directory = executable_directory();
    if (directory.empty()) return result;

    // Retain the existing file fallback on hosts where a supported native
    // texture ABI is unavailable. Windows uses the live renderer below.
    std::string filename;
    read_basic_font(directory / "data" / "init" / "init_default.txt", filename);
    read_basic_font(directory / "prefs" / "init.txt", filename);
    if (filename.empty()) return result;

    using ImageLoadFn = SDL_Surface *(SDLCALL *)(const char *);
#ifdef _WIN32
    const auto image_library = GetModuleHandleW(L"SDL2_image.dll");
    const auto image_load = image_library
        ? reinterpret_cast<ImageLoadFn>(GetProcAddress(image_library, "IMG_Load"))
        : nullptr;
#else
    const auto image_load = reinterpret_cast<ImageLoadFn>(dlsym(RTLD_DEFAULT, "IMG_Load"));
#endif
    if (!image_load) return result;

    const auto path = directory / "data" / "art" / std::filesystem::u8path(filename);
    const auto utf8_path = path.u8string();
    SDL_Surface *source = image_load(reinterpret_cast<const char *>(utf8_path.c_str()));
    if (!source) return result;
    Uint32 color_key = 0;
    Uint8 key_r = 0, key_g = 0, key_b = 0, key_a = 0;
    const bool has_color_key = SDL_GetColorKey(source, &color_key) == 0;
    if (has_color_key)
        SDL_GetRGBA(color_key, source->format, &key_r, &key_g, &key_b, &key_a);
    SDL_Surface *surface = SDL_ConvertSurfaceFormat(source, SDL_PIXELFORMAT_RGBA32, 0);
    SDL_FreeSurface(source);
    if (!surface) return result;
    if (surface->w < 16 || surface->h < 16 || surface->w % 16 || surface->h % 16 ||
            SDL_LockSurface(surface) != 0) {
        SDL_FreeSurface(surface);
        return result;
    }

    const int cell_width = surface->w / 16;
    result.cell_height = surface->h / 16;
    constexpr std::string_view capitals = "AHIMNX";
    bool any_ink = false;
    for (size_t at = 0; at < capitals.size(); ++at) {
        const unsigned char character = capitals[at];
        const int left = (character % 16) * cell_width;
        const int top = (character / 16) * result.cell_height;
        auto &rows = result.glyph_rows[at];
        rows.assign(result.cell_height, 0);
        for (int y = 0; y < result.cell_height; ++y) {
            const auto *pixels = static_cast<const Uint8 *>(surface->pixels) +
                static_cast<size_t>(top + y) * surface->pitch + left * 4;
            for (int x = 0; x < cell_width; ++x) {
                const auto *pixel = pixels + x * 4;
                if (!pixel[3] || (pixel[0] == 255 && pixel[1] == 0 && pixel[2] == 255) ||
                        (has_color_key && pixel[0] == key_r && pixel[1] == key_g &&
                            pixel[2] == key_b)) continue;
                rows[y] = 1;
                any_ink = true;
                break;
            }
        }
    }
    SDL_UnlockSurface(surface);
    SDL_FreeSurface(surface);
    if (!any_ink) return {};
    return result;
}

} // namespace native_font_metrics_detail

// Called at native text-layout/render entry, not for every glyph. Re-read the
// live selection and resource identities each pass; only pixel decoding is
// cached. This also retries fonts that were not loaded at the first call.
inline void refresh_native_font_metrics() {
    using namespace native_font_metrics_detail;
    auto &cache = english_ink_cache();
#ifdef _WIN32
    const auto source = current_native_font_source();
    if (!cache.refreshed || cache.source != source ||
            (source && cache.rows.cell_height <= 0)) {
        auto rows = source ? load_native_english_ink_rows(*source) : EnglishInkRows{};
        // Header/pixel reads are individually safe. Also reject a resource
        // selection that changed during the multi-glyph snapshot instead of
        // publishing a mixture of two font lifetimes.
        if (source && current_native_font_source() != source) rows = {};
        cache.source = source;
        cache.rows = std::move(rows);
        ++cache.revision;
    }
#else
    if (!cache.refreshed) {
        cache.rows = load_english_ink_rows();
        ++cache.revision;
    }
#endif
    cache.refreshed = true;
}

struct NativeEnglishInkBounds {
    int top = 0, bottom = 0; // exclusive bottom, relative to the native row
};

inline std::optional<NativeEnglishInkBounds> native_english_ink_bounds(int row_height) {
    if (row_height <= 0) return std::nullopt;
    auto &cache = native_font_metrics_detail::english_ink_cache();
    if (!cache.refreshed) refresh_native_font_metrics();
    const auto &source = cache.rows;
    if (source.cell_height <= 0) return std::nullopt;
    thread_local int previous_row_height = 0;
    thread_local uint64_t previous_revision = 0;
    thread_local std::optional<NativeEnglishInkBounds> previous_bounds;
    if (previous_row_height == row_height && previous_revision == cache.revision)
        return previous_bounds;

    NativeEnglishInkBounds bounds{row_height, 0};
    for (const auto &rows : source.glyph_rows) {
        int top = row_height, bottom = -1;
        // Sample pixel centres just as nearest-neighbour atlas scaling does.
        // Counting the resulting bounds handles integer scale rounding without
        // substituting a fixed fraction of the native cell for visible ink.
        for (int y = 0; y < row_height; ++y) {
            const int source_y = static_cast<int>(
                ((static_cast<int64_t>(y) * 2 + 1) * source.cell_height) /
                (static_cast<int64_t>(row_height) * 2));
            if (!rows[source_y]) continue;
            top = std::min(top, y);
            bottom = y;
        }
        if (bottom >= top) {
            bounds.top = std::min(bounds.top, top);
            bounds.bottom = std::max(bounds.bottom, bottom + 1);
        }
    }
    previous_row_height = row_height;
    previous_revision = cache.revision;
    previous_bounds = bounds.bottom > bounds.top
        ? std::optional<NativeEnglishInkBounds>(bounds) : std::nullopt;
    return previous_bounds;
}

inline std::optional<int> native_english_ink_height(int row_height) {
    if (row_height <= 0) return std::nullopt;
    // Source image decoding and file access happen once per core lifetime.
    static const auto source = native_font_metrics_detail::load_english_ink_rows();
    if (source.cell_height <= 0) return std::nullopt;
    thread_local int previous_row_height = 0;
    thread_local std::optional<int> previous_ink_height;
    if (previous_row_height == row_height) return previous_ink_height;

    int height = 0;
    for (const auto &rows : source.glyph_rows) {
        int top = row_height, bottom = -1;
        // Sample pixel centres just as nearest-neighbour atlas scaling does.
        // Counting the resulting bounds handles integer scale rounding without
        // substituting a fixed fraction of the native cell for visible ink.
        for (int y = 0; y < row_height; ++y) {
            const int source_y = static_cast<int>(
                ((static_cast<int64_t>(y) * 2 + 1) * source.cell_height) /
                (static_cast<int64_t>(row_height) * 2));
            if (!rows[source_y]) continue;
            top = std::min(top, y);
            bottom = y;
        }
        if (bottom >= top) height = std::max(height, bottom - top + 1);
    }
    previous_row_height = row_height;
    previous_ink_height = height > 0 ? std::optional<int>(height) : std::nullopt;
    return previous_ink_height;
}

} // namespace dfcn
