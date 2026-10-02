// These three captions are ink inside main-button artwork, not native text
// cells. The 53.16 token parser maps CHANGE_TYPE/MAT/ADJ to 294/295/296 at
// 0x1410fd5fa..0x1410fd648. graphics_interface.txt selects the corresponding
// 4x3 rectangles in INTERFACE_BITS_WORK_ORDERS, whose cells are 8x12 pixels.
// Match every visible tile before painting, so an overlaid dialog cannot
// borrow a button from the covered page. The normal glyph renderer and the
// shared glossary still own the translated caption.
void Overlay::draw_work_order_buttons(SDL_Renderer *renderer) {
    if (!gps_ || !face_ || !renderer || gps_->tile_pixel_x <= 0 ||
        gps_->tile_pixel_y <= 0) return;
    struct Caption {
        int kind;
        std::string_view key;
    };
    static constexpr auto captions = std::to_array<Caption>({
        {294, "Type"},
        {295, "Mat"},
        {296, "Work order condition button: Adj"},
    });
    std::array<std::optional<std::string>, captions.size()> targets;
    for (size_t index = 0; index < captions.size(); ++index)
        targets[index] = exact_literal_translation(captions[index].key);

    const int tile_w = gps_->tile_pixel_x, tile_h = gps_->tile_pixel_y;
    const int origin_x = (gps_->screen_pixel_x - gps_->dimx * tile_w) / 2;
    const int origin_y = (gps_->screen_pixel_y - gps_->dimy * tile_h) / 2;
    // The side frame is one atlas pixel wide; all Latin ink lies in the
    // middle tile row. Keep that frame, the top/bottom caps and hit box intact.
    const int inset = std::max(1, (tile_w + 7) / 8);
    const int font_pixels = std::max(config_.min_font_pixels,
        static_cast<int>(tile_h * config_.font_scale));
    SDL_Rect saved_clip{};
    const bool had_clip = SDL_RenderIsClipEnabled(renderer) == SDL_TRUE;
    SDL_RenderGetClipRect(renderer, &saved_clip);
    SDL_BlendMode saved_blend = SDL_BLENDMODE_NONE;
    SDL_GetRenderDrawBlendMode(renderer, &saved_blend);
    Uint8 saved_r = 0, saved_g = 0, saved_b = 0, saved_a = 0;
    SDL_GetRenderDrawColor(renderer, &saved_r, &saved_g, &saved_b, &saved_a);

    for (int y = 1; y + 1 < gps_->dimy; ++y) {
        for (int x = 0; x + 4 <= gps_->dimx; ++x) {
            for (size_t index = 0; index < captions.size(); ++index) {
                if (!targets[index] || targets[index]->empty() ||
                    !native_main_button_at(*gps_, x, y, captions[index].kind)) continue;
                const SDL_Rect inner{origin_x + x * tile_w + inset,
                    origin_y + y * tile_h, 4 * tile_w - 2 * inset, tile_h};
                if (inner.w <= 0 || inner.x < 0 || inner.y < 0 ||
                    inner.x + inner.w > gps_->screen_pixel_x ||
                    inner.y + inner.h > gps_->screen_pixel_y) continue;
                if (g_native_toolbar_tooltip && g_native_toolbar_tooltip->native_frame) {
                    const auto &card = *g_native_toolbar_tooltip;
                    const SDL_Rect popup{origin_x + card.left * tile_w,
                        origin_y + card.top * tile_h,
                        (card.right - card.left + 1) * tile_w,
                        (card.bottom - card.top + 1) * tile_h};
                    if (SDL_HasIntersection(&inner, &popup)) continue;
                }
                SDL_Rect clip = inner;
                if (had_clip && !SDL_IntersectRect(&inner, &saved_clip, &clip)) continue;
                const int text_width = std::max(1,
                    inner.w - 2 * config_.horizontal_padding);
                const GlyphTexture *glyph = get_glyph_texture(renderer, *targets[index],
                    text_width, tile_h, font_pixels);
                if (!glyph || !glyph->texture) continue;

                std::vector<Uint8> pixels(static_cast<size_t>(inner.w) * inner.h * 4);
                if (native_capture_read_pixels(gps_, renderer, &inner, SDL_PIXELFORMAT_RGBA32,
                        pixels.data(), inner.w * 4) != 0) continue;
                const auto pixel_key = [&](size_t offset) {
                    return (static_cast<uint32_t>(pixels[offset]) << 16) |
                        (static_cast<uint32_t>(pixels[offset + 1]) << 8) |
                        pixels[offset + 2];
                };
                // The first scanline of the middle atlas row is clean fill.
                // Sample the completed widget to preserve its current tint;
                // neither logical-cell colours nor a hardcoded black are its
                // actual background. The brightest interior ink is its text.
                std::unordered_map<uint32_t, int> fills;
                uint32_t background = 0, foreground = 0;
                int fill_count = 0, brightest = -1;
                for (int px = 0; px < inner.w; ++px) {
                    const uint32_t key = pixel_key(static_cast<size_t>(px) * 4);
                    const int count = ++fills[key];
                    if (count > fill_count) { fill_count = count; background = key; }
                }
                for (size_t offset = 0; offset < pixels.size(); offset += 4) {
                    const int brightness = pixels[offset] + pixels[offset + 1] + pixels[offset + 2];
                    if (brightness > brightest) {
                        brightest = brightness;
                        foreground = pixel_key(offset);
                    }
                }
                if (foreground == background) continue;
                SDL_RenderSetClipRect(renderer, &clip);
                SDL_SetRenderDrawBlendMode(renderer, SDL_BLENDMODE_NONE);
                SDL_SetRenderDrawColor(renderer, static_cast<Uint8>(background >> 16),
                    static_cast<Uint8>(background >> 8), static_cast<Uint8>(background), 255);
                SDL_RenderFillRect(renderer, &inner);

                // There are no native text cells to suppress or repaint. A
                // zero-length source keeps generic background clearing out of
                // this picture while sharing the normal font fitting path.
                Match caption{x, y, 0, -1, *targets[index], {}};
                caption.layout_x = x;
                caption.layout_y = y;
                caption.layout_length = 4;
                caption.layout_box_pixel_x = inner.x;
                caption.layout_box_pixel_width = inner.w;
                caption.layout_native_clip = inner;
                caption.layout_font_pixels = font_pixels;
                caption.layout_foreground_rgb = static_cast<int>(foreground);
                draw_match(renderer, caption);
                SDL_RenderSetClipRect(renderer, had_clip ? &saved_clip : nullptr);
                x += 3;
                break;
            }
        }
    }
    SDL_RenderSetClipRect(renderer, had_clip ? &saved_clip : nullptr);
    SDL_SetRenderDrawColor(renderer, saved_r, saved_g, saved_b, saved_a);
    SDL_SetRenderDrawBlendMode(renderer, saved_blend);
}
