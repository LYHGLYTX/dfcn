#include "../compat/windows/freetype_win.h"

#include <cstdint>
#include <cstdio>

int main() {
    FT_Library library = nullptr;
    FT_Face face = nullptr;
    if (FT_Init_FreeType(&library) != 0 ||
        FT_New_Face(library, "C:/Windows/Fonts/NotoSansSC-VF.ttf", 0, &face) != 0 ||
        FT_Set_Pixel_Sizes(face, 0, 33) != 0) {
        std::fprintf(stderr, "font setup failed\n");
        return 1;
    }

    std::uint64_t checksum = 0;
    std::uint64_t rendered = 0;
    std::uint64_t empty_with_extent = 0;
    for (int pass = 0; pass < 2; ++pass) {
        for (std::uint32_t cp = 1; cp <= 0xffff; ++cp) {
            const FT_UInt glyph = FT_Get_Char_Index(face, cp);
            if (FT_Load_Glyph(face, glyph, FT_LOAD_DEFAULT) != 0 ||
                FT_Render_Glyph(face->glyph, FT_RENDER_MODE_NORMAL) != 0) {
                continue;
            }
            const FT_Bitmap &bitmap = face->glyph->bitmap;
            if (!bitmap.buffer && bitmap.rows && bitmap.width) {
                if (empty_with_extent++ < 20) {
                    std::printf("null bitmap U+%04X: %ux%u pitch=%d\n",
                                cp, bitmap.width, bitmap.rows, bitmap.pitch);
                }
                continue;
            }
            ++rendered;
            for (unsigned int y = 0; y < bitmap.rows; ++y) {
                const unsigned char *row = bitmap.buffer + y * bitmap.pitch;
                for (unsigned int x = 0; x < bitmap.width; ++x) checksum += row[x];
            }
        }
    }
    std::printf("font smoke test passed: rendered=%llu null_with_extent=%llu checksum=%llu\n",
                static_cast<unsigned long long>(rendered),
                static_cast<unsigned long long>(empty_with_extent),
                static_cast<unsigned long long>(checksum));
    FT_Done_Face(face);
    FT_Done_FreeType(library);
    return 0;
}
