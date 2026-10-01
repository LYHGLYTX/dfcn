#pragma once

#include <cstddef>
#include <cstdint>

// Minimal Windows layout of the 53.16 `graphicst` object.  DFCN only reads
// the character-grid portion of this object.  Keeping the unused fields as
// fixed-size storage avoids depending on the game's MSVC STL ABI.
struct graphicst {
    std::uint8_t viewport[24];
    void *main_viewport;
    void *lower_viewport[8];
    std::uint8_t map_port[24];
    void *main_map_port;

    std::int32_t viewport_zoom_factor;
    std::int32_t screenx;
    std::int32_t screeny;
    std::uint8_t screenf;
    std::uint8_t screenb;
    bool screenbright;
    bool use_old_16_colors;
    std::uint8_t screen_color_r;
    std::uint8_t screen_color_g;
    std::uint8_t screen_color_b;
    std::uint8_t screen_color_br;
    std::uint8_t screen_color_bg;
    std::uint8_t screen_color_bb;
    std::uint8_t color_alignment[2];
    float ccolor[16][3];
    std::uint8_t uccolor[16][3];
    std::uint8_t default_palette[54];
    std::uint8_t palette_alignment[2];

    std::int32_t mouse_x;
    std::int32_t mouse_y;
    std::int32_t precise_mouse_x;
    std::int32_t precise_mouse_y;
    std::int32_t screen_pixel_x;
    std::int32_t screen_pixel_y;
    std::int32_t tile_pixel_x;
    std::int32_t tile_pixel_y;

    std::uint8_t *screen;
    std::uint8_t *screen_limit;
    long *screentexpos;
    long *screentexpos_lower;
    long *screentexpos_anchored;
    long *screentexpos_anchored_x;
    long *screentexpos_anchored_y;
    std::uint32_t *screentexpos_flag;

    bool top_in_use;
    std::uint8_t top_alignment[7];
    std::uint8_t *screen_top;
    std::uint8_t *screen_top_limit;
    long *screentexpos_top_lower;
    long *screentexpos_top_anchored;
    long *screentexpos_top;
    long *screentexpos_top_anchored_x;
    long *screentexpos_top_anchored_y;
    std::uint32_t *screentexpos_top_flag;

    bool display_title;
    std::uint8_t display_alignment[3];
    std::int32_t display_background;
    std::int32_t last_display_background;
    std::uint8_t refresh_pointer_alignment[4];
    std::int32_t *screentexpos_refresh_buffer;
    std::int32_t refresh_buffer_val;
    bool main_thread_requesting_reshape;
    bool main_thread_requesting_reshape_activate_map_port;
    std::uint8_t clip_alignment[2];
    long clipx[2];
    long clipy[2];

    // cached_texturest is 24 bytes on Win64 and texture_type has 12 usable
    // values (NONE is -1).  texblits is an MSVC vector, also 24 bytes.
    std::uint8_t tex[12][24];
    std::uint8_t texblits[24];
    long rect_id;
    std::uint8_t print_time_alignment[4];
    std::int64_t print_time[100];
    long print_index;
    std::int8_t display_frames;
    std::uint8_t frame_alignment[3];
    std::int32_t frame_display_sx;
    std::int32_t frame_display_dy;
    std::int16_t force_full_display_count;
    bool do_clean_tile_cache;
    bool do_post_init_texture_clear;
    std::int8_t original_rect;
    std::uint8_t dim_alignment[3];
    std::int32_t dimx;
    std::int32_t dimy;
};

static_assert(sizeof(long) == 4, "DFCN Windows layout requires a 32-bit long");
static_assert(offsetof(graphicst, screen_pixel_x) == 464);
static_assert(offsetof(graphicst, screen) == 480);
static_assert(offsetof(graphicst, top_in_use) == 544);
static_assert(offsetof(graphicst, screen_top) == 552);
static_assert(offsetof(graphicst, dimx) == 1808);
static_assert(offsetof(graphicst, dimy) == 1812);
