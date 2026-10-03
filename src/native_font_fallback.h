#pragma once

#include "native_runtime.h"

namespace dfcn {

// Only discovery is platform-specific. The shared renderer owns the returned
// face and uses the same glyph for advances, ink bounds and final drawing.
#ifdef _WIN32
struct NativeFallbackFontSearch {
    FT_Library library;
    uint32_t codepoint;
    int pixel_size;
    bool bold;
    FT_Face face = nullptr;
};

inline int CALLBACK native_fallback_font_candidate(const LOGFONTW *font,
        const TEXTMETRICW *, DWORD type, LPARAM parameter) {
    auto &search = *reinterpret_cast<NativeFallbackFontSearch *>(parameter);
    if (!(type & TRUETYPE_FONTTYPE) || font->lfFaceName[0] == L'@' ||
            font->lfCharSet == SYMBOL_CHARSET) return 1;
    FT_Face candidate = nullptr;
    if (FT_New_Face(search.library, "", 0, &candidate) != 0) return 1;
    candidate->family = font->lfFaceName;
    if (search.bold) candidate->font_description.lfWeight = FW_BOLD;
    if (FT_Set_Pixel_Sizes(candidate, 0, search.pixel_size) == 0) {
        const FT_UInt index = FT_Get_Char_Index(candidate, search.codepoint);
        if (index && FT_Load_Glyph(candidate, index, FT_LOAD_DEFAULT) == 0) {
            search.face = candidate;
            return 0;
        }
    }
    FT_Done_Face(candidate);
    return 1;
}
#endif

inline FT_Face native_open_fallback_font(FT_Library library,
        uint32_t codepoint, int pixel_size, bool bold = false) {
#ifdef _WIN32
    if (codepoint > 0xffff) return nullptr;
    HDC dc = CreateCompatibleDC(nullptr);
    if (!dc) return nullptr;
    LOGFONTW query{};
    query.lfCharSet = DEFAULT_CHARSET;
    NativeFallbackFontSearch search{library, codepoint, pixel_size, bold};
    EnumFontFamiliesExW(dc, &query, native_fallback_font_candidate,
        reinterpret_cast<LPARAM>(&search), 0);
    DeleteDC(dc);
    return search.face;
#else
    if (!FcInit()) return nullptr;
    FcPattern *pattern = FcPatternCreate();
    FcCharSet *charset = FcCharSetCreate();
    if (!pattern || !charset) {
        if (pattern) FcPatternDestroy(pattern);
        if (charset) FcCharSetDestroy(charset);
        return nullptr;
    }
    FcCharSetAddChar(charset, codepoint);
    FcPatternAddCharSet(pattern, FC_CHARSET, charset);
    FcCharSetDestroy(charset);
    FcPatternAddString(pattern, FC_FAMILY,
        reinterpret_cast<const FcChar8 *>("sans-serif"));
    FcPatternAddString(pattern, FC_LANG,
        reinterpret_cast<const FcChar8 *>("zh-cn"));
    FcPatternAddInteger(pattern, FC_WEIGHT, bold ? FC_WEIGHT_BOLD : FC_WEIGHT_MEDIUM);
    FcPatternAddBool(pattern, FC_SCALABLE, FcTrue);
    FcConfigSubstitute(nullptr, pattern, FcMatchPattern);
    FcDefaultSubstitute(pattern);
    FcResult result = FcResultNoMatch;
    // Keep alternatives with overlapping coverage: an earlier font can be
    // unreadable or bitmap-only, so charset-based trimming is premature.
    FcFontSet *fonts = FcFontSort(nullptr, pattern, FcFalse, nullptr, &result);
    FcPatternDestroy(pattern);
    FT_Face selected = nullptr;
    if (!fonts) return nullptr;
    for (int at = 0; at < fonts->nfont && !selected; ++at) {
        FcPattern *font = fonts->fonts[at];
        FcCharSet *coverage = nullptr;
        FcChar8 *file = nullptr;
        int index = 0;
        if (FcPatternGetCharSet(font, FC_CHARSET, 0, &coverage) != FcResultMatch ||
                !FcCharSetHasChar(coverage, codepoint) ||
                FcPatternGetString(font, FC_FILE, 0, &file) != FcResultMatch) continue;
        FcPatternGetInteger(font, FC_INDEX, 0, &index);
        FT_Face candidate = nullptr;
        if (FT_New_Face(library, reinterpret_cast<const char *>(file), index,
                &candidate) != 0) continue;
        // Fontconfig's closest match is not proof of glyph coverage. Check
        // the actual face and reject bitmap-only/color-only substitutes.
        const FT_UInt glyph = FT_Get_Char_Index(candidate, codepoint);
        if (FT_IS_SCALABLE(candidate) && glyph &&
                FT_Set_Pixel_Sizes(candidate, 0, pixel_size) == 0 &&
                FT_Load_Glyph(candidate, glyph, FT_LOAD_DEFAULT) == 0 &&
                FT_Render_Glyph(candidate->glyph, FT_RENDER_MODE_NORMAL) == 0 &&
                candidate->glyph->bitmap.pixel_mode == FT_PIXEL_MODE_GRAY) {
            selected = candidate;
        } else {
            FT_Done_Face(candidate);
        }
    }
    FcFontSetDestroy(fonts);
    return selected;
#endif
}

} // namespace dfcn
