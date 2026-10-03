#pragma once

#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>
#include <dwrite.h>

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <new>
#include <string>
#include <vector>

// Adapt GDI's native TrueType rasterizer to the FreeType subset used by DFCN.
// The shared rendering pipeline can use installed Chinese fonts through this
// interface without an additional font-engine library.
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
    std::wstring family;
    std::wstring private_font_path;
    LOGFONTW font_description{};
    bool private_font_registered = false;
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

inline bool dfcn_font_file_description(const std::wstring &path, long face_index,
        LOGFONTW &description) {
    if (face_index < 0) return false;
    // DirectWrite supplies the selected collection face's GDI family and
    // style. Registering a file alone does not make CreateFont select it.
    HMODULE module = LoadLibraryExW(L"dwrite.dll", nullptr,
        LOAD_LIBRARY_SEARCH_SYSTEM32);
    if (!module) return false;
    using CreateFactory = HRESULT (WINAPI *)(DWRITE_FACTORY_TYPE, REFIID, IUnknown **);
    const auto create_factory = reinterpret_cast<CreateFactory>(
        GetProcAddress(module, "DWriteCreateFactory"));
    IDWriteFactory *factory = nullptr;
    IDWriteFontFile *file = nullptr;
    IDWriteFontFace *face = nullptr;
    IDWriteGdiInterop *interop = nullptr;
    HRESULT status = E_FAIL;
    if (create_factory) {
        // Keep the GUID local: neither DirectWrite nor its import library is
        // required by the existing native link configuration.
        const IID factory_iid = {0xb859ee5a, 0xd838, 0x4b5b,
            {0xa2, 0xe8, 0x1a, 0xdc, 0x7d, 0x93, 0xdb, 0x48}};
        status = create_factory(DWRITE_FACTORY_TYPE_ISOLATED, factory_iid,
            reinterpret_cast<IUnknown **>(&factory));
    }
    if (SUCCEEDED(status))
        status = factory->CreateFontFileReference(path.c_str(), nullptr, &file);
    BOOL supported = FALSE;
    DWRITE_FONT_FILE_TYPE file_type = DWRITE_FONT_FILE_TYPE_UNKNOWN;
    DWRITE_FONT_FACE_TYPE face_type = DWRITE_FONT_FACE_TYPE_UNKNOWN;
    UINT32 face_count = 0;
    if (SUCCEEDED(status))
        status = file->Analyze(&supported, &file_type, &face_type, &face_count);
    if (SUCCEEDED(status) && (!supported ||
            static_cast<unsigned long>(face_index) >= face_count)) status = E_FAIL;
    if (SUCCEEDED(status))
        status = factory->CreateFontFace(face_type, 1, &file,
            static_cast<UINT32>(face_index), DWRITE_FONT_SIMULATIONS_NONE, &face);
    if (SUCCEEDED(status)) status = factory->GetGdiInterop(&interop);
    if (SUCCEEDED(status)) status = interop->ConvertFontFaceToLOGFONT(face, &description);
    if (interop) interop->Release();
    if (face) face->Release();
    if (file) file->Release();
    if (factory) factory->Release();
    FreeLibrary(module);
    return SUCCEEDED(status) && description.lfFaceName[0] != L'\0';
}

inline FT_Error FT_New_Face(FT_Library, const char *path, long face_index, FT_Face *result) {
    if (!result) return 1;
    *result = nullptr;
    auto *face = new (std::nothrow) FT_FaceRec_();
    if (!face) return 1;
    face->font_description.lfWeight = FW_MEDIUM;
    face->font_description.lfCharSet = DEFAULT_CHARSET;
    face->font_description.lfPitchAndFamily = DEFAULT_PITCH | FF_DONTCARE;
    if (path && *path) {
        const std::wstring requested_path = dfcn_utf8_to_wide(path);
        const DWORD needed = requested_path.empty() ? 0 :
            GetFullPathNameW(requested_path.c_str(), 0, nullptr, nullptr);
        if (!needed) {
            delete face;
            return 1;
        }
        face->private_font_path.resize(needed);
        const DWORD length = GetFullPathNameW(requested_path.c_str(), needed,
            face->private_font_path.data(), nullptr);
        if (!length || length >= needed) {
            delete face;
            return 1;
        }
        face->private_font_path.resize(length);
        const DWORD attributes = GetFileAttributesW(face->private_font_path.c_str());
        if (attributes == INVALID_FILE_ATTRIBUTES || (attributes & FILE_ATTRIBUTE_DIRECTORY) ||
                !dfcn_font_file_description(face->private_font_path, face_index,
                    face->font_description)) {
            delete face;
            return 1;
        }
        face->family = face->font_description.lfFaceName;
    }
    face->dc = CreateCompatibleDC(nullptr);
    if (!face->dc) {
        delete face;
        return 1;
    }
    SetBkMode(face->dc, TRANSPARENT);
    SetTextColor(face->dc, RGB(255, 255, 255));
    face->glyph_storage.owner = face;
    if (!face->private_font_path.empty()) {
        if (AddFontResourceExW(face->private_font_path.c_str(), FR_PRIVATE, nullptr) <= 0) {
            DeleteDC(face->dc);
            delete face;
            return 1;
        }
        face->private_font_registered = true;
    }
    *result = face;
    return 0;
}

inline FT_Error FT_Done_Face(FT_Face face) {
    if (!face) return 0;
    if (face->previous_font) SelectObject(face->dc, face->previous_font);
    if (face->font) DeleteObject(face->font);
    if (face->dc) DeleteDC(face->dc);
    if (face->private_font_registered) {
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
    LOGFONTW description = face->font_description;
    description.lfHeight = -static_cast<int>(height);
    description.lfWidth = 0;
    description.lfEscapement = 0;
    description.lfOrientation = 0;
    description.lfUnderline = FALSE;
    description.lfStrikeOut = FALSE;
    description.lfOutPrecision = OUT_TT_PRECIS;
    description.lfClipPrecision = CLIP_DEFAULT_PRECIS;
    description.lfQuality = ANTIALIASED_QUALITY;
    lstrcpynW(description.lfFaceName,
        face->family.empty() ? L"Noto Sans SC" : face->family.c_str(), LF_FACESIZE);
    face->font = CreateFontIndirectW(&description);
    if (!face->font && face->family.empty()) {
        lstrcpynW(description.lfFaceName, L"Microsoft YaHei", LF_FACESIZE);
        face->font = CreateFontIndirectW(&description);
    }
    if (!face->font) return 1;
    face->previous_font = SelectObject(face->dc, face->font);
    face->pixel_size = static_cast<int>(height);
    return 0;
}

inline FT_UInt FT_Get_Char_Index(FT_Face face, unsigned long codepoint) {
    if (!face || !face->font || codepoint == 0 || codepoint > 0xffff) return 0;
    const wchar_t character = static_cast<wchar_t>(codepoint);
    WORD index = 0xffff;
    if (GetGlyphIndicesW(face->dc, &character, 1, &index,
            GGI_MARK_NONEXISTING_GLYPHS) == GDI_ERROR || index == 0xffff || index == 0)
        return 0;
    // This adapter uses Unicode values as handles for GetGlyphOutlineW,
    // but must still distinguish a missing glyph from an available one.
    return static_cast<FT_UInt>(codepoint);
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
