#pragma once

#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <new>
#include <string>
#include <vector>

// The Windows build uses GDI's native TrueType rasterizer.  This compatibility
// layer implements the small FreeType subset used by DFCN, so the installed
// Chinese system font can be used without shipping another font engine DLL.
using FT_Error = int;
using FT_UInt = unsigned int;

struct FT_Vector {
    long x = 0;
    long y = 0;
};

struct FT_Bitmap {
    unsigned int rows = 0;
    unsigned int width = 0;
    int pitch = 0;
    unsigned char *buffer = nullptr;
};

struct FT_GlyphSlotRec_ {
    FT_Vector advance{};
    int bitmap_left = 0;
    int bitmap_top = 0;
    FT_Bitmap bitmap{};
    std::uint32_t codepoint = 0;
    void *owner = nullptr;
};
using FT_GlyphSlot = FT_GlyphSlotRec_ *;

struct FT_FaceRec_ {
    HDC dc = nullptr;
    HFONT font = nullptr;
    HGDIOBJ previous_font = nullptr;
    int pixel_size = 0;
    std::wstring private_font_path;
    std::vector<unsigned char> bitmap_storage;
    FT_GlyphSlotRec_ glyph_storage{};
    FT_GlyphSlot glyph = &glyph_storage;
};
using FT_Face = FT_FaceRec_ *;

struct FT_LibraryRec_ {};
using FT_Library = FT_LibraryRec_ *;

inline constexpr int FT_LOAD_DEFAULT = 0;
inline constexpr int FT_RENDER_MODE_NORMAL = 0;
inline constexpr int FT_KERNING_DEFAULT = 0;
#define FT_HAS_KERNING(face) 0

inline std::wstring dfcn_utf8_to_wide(const char *text) {
    if (!text || !*text) return {};
    const int needed = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, text, -1,
                                            nullptr, 0);
    if (needed <= 1) return {};
    std::wstring out(static_cast<std::size_t>(needed), L'\0');
    MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, text, -1, out.data(), needed);
    out.pop_back();
    return out;
}

inline MAT2 dfcn_identity_matrix() {
    MAT2 matrix{};
    matrix.eM11.value = 1;
    matrix.eM22.value = 1;
    return matrix;
}

inline FT_Error FT_Init_FreeType(FT_Library *library) {
    if (!library) return 1;
    *library = new (std::nothrow) FT_LibraryRec_();
    return *library ? 0 : 1;
}

inline FT_Error FT_Done_FreeType(FT_Library library) {
    delete library;
    return 0;
}

inline FT_Error FT_New_Face(FT_Library, const char *path, long, FT_Face *result) {
    if (!result) return 1;
    auto *face = new (std::nothrow) FT_FaceRec_();
    if (!face) return 1;
    face->dc = CreateCompatibleDC(nullptr);
    if (!face->dc) {
        delete face;
        return 1;
    }
    SetBkMode(face->dc, TRANSPARENT);
    SetTextColor(face->dc, RGB(255, 255, 255));
    face->glyph_storage.owner = face;
    face->private_font_path = dfcn_utf8_to_wide(path);
    if (!face->private_font_path.empty() &&
        GetFileAttributesW(face->private_font_path.c_str()) != INVALID_FILE_ATTRIBUTES) {
        AddFontResourceExW(face->private_font_path.c_str(), FR_PRIVATE, nullptr);
    }
    *result = face;
    return 0;
}

inline FT_Error FT_Done_Face(FT_Face face) {
    if (!face) return 0;
    if (face->previous_font) SelectObject(face->dc, face->previous_font);
    if (face->font) DeleteObject(face->font);
    if (face->dc) DeleteDC(face->dc);
    if (!face->private_font_path.empty()) {
        RemoveFontResourceExW(face->private_font_path.c_str(), FR_PRIVATE, nullptr);
    }
    delete face;
    return 0;
}

inline FT_Error FT_Set_Pixel_Sizes(FT_Face face, FT_UInt, FT_UInt height) {
    if (!face || !face->dc || height == 0) return 1;
    if (face->font && face->pixel_size == static_cast<int>(height)) return 0;
    if (face->previous_font) {
        SelectObject(face->dc, face->previous_font);
        face->previous_font = nullptr;
    }
    if (face->font) {
        DeleteObject(face->font);
        face->font = nullptr;
    }
    face->font = CreateFontW(-static_cast<int>(height), 0, 0, 0, FW_MEDIUM, FALSE,
                             FALSE, FALSE, DEFAULT_CHARSET, OUT_TT_PRECIS,
                             CLIP_DEFAULT_PRECIS, ANTIALIASED_QUALITY,
                             DEFAULT_PITCH | FF_DONTCARE, L"Noto Sans SC");
    if (!face->font) {
        face->font = CreateFontW(-static_cast<int>(height), 0, 0, 0, FW_MEDIUM, FALSE,
                                 FALSE, FALSE, DEFAULT_CHARSET, OUT_TT_PRECIS,
                                 CLIP_DEFAULT_PRECIS, ANTIALIASED_QUALITY,
                                 DEFAULT_PITCH | FF_DONTCARE, L"Microsoft YaHei");
    }
    if (!face->font) return 1;
    face->previous_font = SelectObject(face->dc, face->font);
    face->pixel_size = static_cast<int>(height);
    return 0;
}

inline FT_UInt FT_Get_Char_Index(FT_Face, unsigned long codepoint) {
    return codepoint <= 0xffff ? static_cast<FT_UInt>(codepoint) : 0;
}

inline FT_Error FT_Load_Glyph(FT_Face face, FT_UInt glyph_index, int) {
    if (!face || !face->dc || !face->font || glyph_index == 0) return 1;
    GLYPHMETRICS metrics{};
    const MAT2 matrix = dfcn_identity_matrix();
    const DWORD size = GetGlyphOutlineW(face->dc, glyph_index, GGO_GRAY8_BITMAP,
                                        &metrics, 0, nullptr, &matrix);
    if (size == GDI_ERROR) return 1;
    face->glyph_storage.codepoint = glyph_index;
    face->glyph_storage.advance.x = static_cast<long>(metrics.gmCellIncX) << 6;
    face->glyph_storage.advance.y = static_cast<long>(metrics.gmCellIncY) << 6;
    face->glyph_storage.bitmap_left = metrics.gmptGlyphOrigin.x;
    face->glyph_storage.bitmap_top = metrics.gmptGlyphOrigin.y;
    face->glyph_storage.bitmap.width = metrics.gmBlackBoxX;
    face->glyph_storage.bitmap.rows = metrics.gmBlackBoxY;
    face->glyph_storage.bitmap.pitch = static_cast<int>(metrics.gmBlackBoxX);
    face->glyph_storage.bitmap.buffer = nullptr;
    face->bitmap_storage.clear();
    return 0;
}

inline FT_Error FT_Render_Glyph(FT_GlyphSlot slot, int) {
    if (!slot || slot->codepoint == 0) return 1;
    auto *face = static_cast<FT_FaceRec_ *>(slot->owner);
    if (!face) return 1;
    GLYPHMETRICS metrics{};
    const MAT2 matrix = dfcn_identity_matrix();
    const DWORD needed = GetGlyphOutlineW(face->dc, slot->codepoint, GGO_GRAY8_BITMAP,
                                          &metrics, 0, nullptr, &matrix);
    if (needed == GDI_ERROR) return 1;
    slot->bitmap_left = metrics.gmptGlyphOrigin.x;
    slot->bitmap_top = metrics.gmptGlyphOrigin.y;
    slot->bitmap.width = metrics.gmBlackBoxX;
    slot->bitmap.rows = metrics.gmBlackBoxY;
    slot->bitmap.pitch = static_cast<int>(metrics.gmBlackBoxX);
    if (needed == 0 || metrics.gmBlackBoxX == 0 || metrics.gmBlackBoxY == 0) {
        face->bitmap_storage.clear();
        // GDI reports a 1x1 black box for several whitespace characters even
        // though it returns no bitmap bytes. FreeType represents these glyphs
        // with an empty bitmap while retaining their advance.
        slot->bitmap.width = 0;
        slot->bitmap.rows = 0;
        slot->bitmap.pitch = 0;
        slot->bitmap.buffer = nullptr;
        return 0;
    }
    std::vector<unsigned char> gdi_bitmap(needed);
    if (GetGlyphOutlineW(face->dc, slot->codepoint, GGO_GRAY8_BITMAP, &metrics,
                         needed, gdi_bitmap.data(), &matrix) == GDI_ERROR) {
        return 1;
    }
    const std::size_t source_pitch = (static_cast<std::size_t>(metrics.gmBlackBoxX) + 3u) & ~3u;
    const std::size_t target_pitch = metrics.gmBlackBoxX;
    face->bitmap_storage.assign(target_pitch * metrics.gmBlackBoxY, 0);
    for (std::size_t y = 0; y < metrics.gmBlackBoxY; ++y) {
        for (std::size_t x = 0; x < metrics.gmBlackBoxX; ++x) {
            const unsigned int coverage = gdi_bitmap[y * source_pitch + x];
            face->bitmap_storage[y * target_pitch + x] =
                static_cast<unsigned char>(std::min(255u, coverage * 4u));
        }
    }
    slot->bitmap.buffer = face->bitmap_storage.data();
    return 0;
}

inline FT_Error FT_Get_Kerning(FT_Face, FT_UInt, FT_UInt, int, FT_Vector *delta) {
    if (delta) *delta = {};
    return 0;
}
