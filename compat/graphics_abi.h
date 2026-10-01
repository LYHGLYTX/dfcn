#pragma once

#include <cstddef>
#include <cstdint>

// Shared subset of Bay 12's 53.16 InterfaceButtonMainType. These are atlas
// slots, not texture IDs; the active graphicst supplies the current textures.
enum InterfaceButtonMainType {
    INTERFACE_BUTTON_MAIN_WORK_ORDERS_ADJECTIVE_SELECTED = 303,
    INTERFACE_BUTTON_MAIN_WORK_ORDERS_ADJECTIVE_NOT_SELECTED = 304,
    INTERFACE_BUTTON_MAIN_NOBLES_ASSIGN_SYMBOL = 305,
    INTERFACE_BUTTON_MAIN_NOBLES_ADD = 322,
    INTERFACE_BUTTON_MAIN_NOBLES_ACCOUNTING_5_ACTIVE = 346,
    INTERFACE_BUTTON_MAIN_SQUADS_SELECTED = 456,
    INTERFACE_BUTTON_MAIN_SQUADS_NOT_SELECTED = 457,
    INTERFACE_BUTTON_MAIN_SQUADS_CANCEL_ORDER = 463,
};

// MSVC x64 ABI view of the 53.16 `graphicst` character grid and UI textures.
// Fixed-size storage for unused fields avoids constructing game-owned STL
// objects with the core's C++ runtime.
// Layout sources: https://www.bay12games.com/dwarves/df_53_16_linux.tar.bz2
// and https://github.com/DFHack/df-structures/tree/53.16-r1.
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

    // This ABI uses 24-byte cached_texturest values; texture_type has 12 usable
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

    // Shared UI textures from Bay 12's 53.16 graphics.h, laid out with the
    // game's MSVC x64 vector alignment. The live texture ids change when
    // DF switches graphical/classic interfaces; never cache their values.
    // PE references include 0x24fdb7 (border), 0x150959 (button),
    // 0x158749 (stocks dump), and 0x1debdd (help border).
    std::uint8_t texture_storage_0[0x107c];
    std::int32_t texpos_border_top_left[4][3];
    std::int32_t texpos_border_top_right[4][3];
    std::int32_t texpos_border_bottom_left[4][3];
    std::int32_t texpos_border_bottom_right[4][3];
    std::uint8_t texture_storage_1[0x98];
    std::int32_t texpos_border_left[4];
    std::int32_t texpos_border_right[4];
    std::int32_t texpos_border_top[3];
    std::int32_t texpos_border_bottom[3];
    std::int32_t texpos_hover_rectangle[3][3];
    std::int32_t texpos_hover_rectangle_join_w_sw;
    std::int32_t texpos_hover_rectangle_join_w_s;
    std::int32_t texpos_hover_rectangle_join_e_s;
    std::int32_t texpos_hover_rectangle_join_e_se;
    std::uint8_t texture_storage_2[0x50];
    std::int32_t texpos_button_rectangle[3][3];
    std::int32_t texpos_button_rectangle_selected[3][3];
    std::int32_t texpos_button_rectangle_light[3][3];
    std::int32_t texpos_button_rectangle_dark[3][3];
    std::int32_t texpos_button_rectangle_divider[3];
    std::int32_t texpos_button_category_rectangle[3][3];
    std::int32_t texpos_button_category_rectangle_selected[3][3];
    std::int32_t texpos_button_category_rectangle_on[3][3];
    std::int32_t texpos_button_category_rectangle_on_selected[3][3];
    std::int32_t texpos_button_category_rectangle_off[3][3];
    std::int32_t texpos_button_category_rectangle_off_selected[3][3];
    std::int32_t texpos_button_filter[6][3];
    std::int32_t texpos_button_filter_no_mag_right[3];
    std::int32_t texpos_button_filter_name[4][3];
    std::int32_t texpos_button_picture_box[3][3];
    std::int32_t texpos_button_picture_box_selected[3][3];
    std::int32_t texpos_button_picture_box_highlighted[3][3];
    std::int32_t texpos_button_picture_box_sel_highlighted[3][3];
    std::int32_t texpos_button_picture_box_light[3][3];
    std::int32_t texpos_button_picture_box_dark[3][3];
    std::int32_t texpos_button_add[3][3];
    std::int32_t texpos_button_add_hover[3][3];
    std::int32_t texpos_button_add_pressed[3][3];
    std::int32_t texpos_button_add_invalid[3][3];
    std::int32_t texpos_button_subtract[3][3];
    std::int32_t texpos_button_subtract_hover[3][3];
    std::int32_t texpos_button_subtract_pressed[3][3];
    std::int32_t texpos_button_subtract_invalid[3][3];
    std::uint8_t texture_storage_4b[0x30]; // Expander buttons.
    // 53.16 draw_scrollbar (0x14140fa16) reads the live two-column
    // track at gps+0x1dc8 and the complete thumb family through +0x1e7c.
    std::int32_t texpos_scrollbar[2][3];
    std::int32_t texpos_scrollbar_up_hover[2];
    std::int32_t texpos_scrollbar_up_pressed[2];
    std::int32_t texpos_scrollbar_down_hover[2];
    std::int32_t texpos_scrollbar_down_pressed[2];
    std::int32_t texpos_scrollbar_small_scroller[2][2];
    std::int32_t texpos_scrollbar_small_scroller_hover[2][2];
    std::int32_t texpos_scrollbar_top_scroller[2];
    std::int32_t texpos_scrollbar_top_scroller_hover[2];
    std::int32_t texpos_scrollbar_bottom_scroller[2];
    std::int32_t texpos_scrollbar_bottom_scroller_hover[2];
    std::int32_t texpos_scrollbar_blank_scroller[2];
    std::int32_t texpos_scrollbar_blank_scroller_hover[2];
    std::int32_t texpos_scrollbar_center_scroller[2];
    std::int32_t texpos_scrollbar_center_scroller_hover[2];
    std::int32_t texpos_scrollbar_offcenter_scroller[2][2];
    std::int32_t texpos_scrollbar_offcenter_scroller_hover[2][2];
    std::uint8_t texture_storage_4e[0x1d8]; // Sliders and tabs.
    std::int32_t texpos_button_main[715][4][3];
    std::uint8_t texture_storage_4d[0x100]; // Small buttons and left ornament.
    // The four caption skins and right ornament immediately precede the
    // interior borders in graphics.h; expose them without moving the ABI.
    std::int32_t texpos_button_horizontal_option_active[3][3];
    std::int32_t texpos_button_horizontal_option_inactive[3][3];
    std::uint8_t texture_storage_4c[0x30]; // Right ornament [4][3].
    std::int32_t texpos_button_horizontal_option_remove[3][3];
    std::int32_t texpos_button_horizontal_option_confirm[3][3];
    std::int32_t texpos_interior_border_n_s_w_e;
    std::int32_t texpos_interior_border_n_w_e;
    std::uint8_t texture_storage_5[0x4];
    std::int32_t texpos_interior_border_w_e;
    std::int32_t texpos_interior_border_n_s;
    // Sort and notification textures precede the schedule grid skins.
    std::uint8_t texture_storage_6a[0xc4];
    // PE monthly schedule drawing uses these at 0xa900/0xa924/0xa948.
    std::int32_t texpos_grid_cell_inactive[3][3];
    std::int32_t texpos_grid_cell_active[3][3];
    std::int32_t texpos_grid_cell_button[3][3];
    std::int32_t texpos_type_filter_left[3];
    std::int32_t texpos_type_filter_right[3];
    std::int32_t texpos_type_filter_text[3];
    std::uint8_t texture_storage_6b[0x74];
    std::int32_t texpos_adventure_log_pinned_active[3][3];
    std::int32_t texpos_adventure_log_pinned_inactive[3][3];
    std::int32_t texpos_adventure_log_item_active[3][3];
    std::int32_t texpos_adventure_log_item_inactive[3][3];
    std::uint8_t texture_storage_6c[0x120];
    std::int32_t texpos_button_stocks_recenter[3][3];
    std::int32_t texpos_button_stocks_view_item[3][3];
    std::int32_t texpos_button_stocks_forbid[3][3];
    std::int32_t texpos_button_stocks_forbid_active[3][3];
    std::int32_t texpos_button_stocks_dump[3][3];
    std::int32_t texpos_button_stocks_dump_active[3][3];
    std::int32_t texpos_button_stocks_melt[3][3];
    std::int32_t texpos_button_stocks_melt_active[3][3];
    std::int32_t texpos_button_stocks_hide[3][3];
    std::int32_t texpos_button_stocks_hide_active[3][3];
    std::int32_t texpos_button_short_forbid[3][2];
    std::int32_t texpos_button_short_forbid_active[3][2];
    std::int32_t texpos_button_short_dump[3][2];
    std::int32_t texpos_button_short_dump_active[3][2];
    std::int32_t texpos_button_short_melt[3][2];
    std::int32_t texpos_button_short_melt_active[3][2];
    std::int32_t texpos_button_short_hide[3][2];
    std::int32_t texpos_button_short_hide_active[3][2];
    std::int32_t texpos_building_short_item_task[3][2];
    std::int32_t texpos_building_item_task[3][3];
    std::int32_t texpos_building_item_incorporated[3][3];
    std::int32_t texpos_building_item_trade[3][3];
    std::int32_t texpos_building_item_animal[3][3];
    std::int32_t texpos_building_item_bait[3][3];
    std::int32_t texpos_building_item_loaded[3][3];
    std::int32_t texpos_building_item_dead[3][3];
    std::int32_t texpos_building_item_other[3][3];
    // Workshop queue actions use independent 3-by-3 skins, not button_main.
    // PE queue renderer 0x14018643e..0x1401867b0 reads this native family.
    std::int32_t texpos_building_jobs_repeat[3][3];
    std::int32_t texpos_building_jobs_repeat_active[3][3];
    std::int32_t texpos_building_jobs_do_now[3][3];
    std::int32_t texpos_building_jobs_do_now_active[3][3];
    std::int32_t texpos_building_jobs_suspended[3][3];
    std::int32_t texpos_building_jobs_suspended_active[3][3];
    std::int32_t texpos_building_jobs_priority_up[3][3];
    std::int32_t texpos_building_jobs_remove[3][3];
    std::int32_t texpos_building_jobs_active[3][3];
    std::int32_t texpos_building_jobs_quota[3][3];
    std::int32_t texpos_building_jobs_remove_worker[3][3];
    std::int32_t texpos_button_assign_trade[5][3][3];
    std::int32_t texpos_button_building_info[24][3][3];
    std::int32_t texpos_button_building_sheet[3][4][3];
    std::int32_t texpos_button_unit_sheet[4][3][3];
    std::int32_t texpos_button_large_unit_sheet[5][4][3];
    std::int32_t texpos_button_pets_livestock[12][3][3];
    std::int32_t texpos_button_inventory_item[7][3][3];
    std::uint8_t texture_storage_7b[0x31ce4];
    std::int32_t texpos_help_border[3][3];
    std::int32_t texpos_help_corner[8][6];
    std::int32_t texpos_help_close[3][2];
    std::int32_t texpos_help_hide[3][2];
    std::int32_t texpos_help_reveal[3][2];
    std::int32_t texpos_embark_selected[4][3];
    std::int32_t texpos_embark_not_selected[4][3];
};

static_assert(sizeof(long) == 4, "DFCN graphics ABI requires a 32-bit long");
static_assert(offsetof(graphicst, screen_pixel_x) == 464);
static_assert(offsetof(graphicst, screen) == 480);
static_assert(offsetof(graphicst, top_in_use) == 544);
static_assert(offsetof(graphicst, screen_top) == 552);
static_assert(offsetof(graphicst, dimx) == 1808);
static_assert(offsetof(graphicst, dimy) == 1812);
static_assert(offsetof(graphicst, texpos_border_top_left) == 0x1794);
static_assert(offsetof(graphicst, texpos_border_top_right) == 0x17c4);
static_assert(offsetof(graphicst, texpos_border_bottom_left) == 0x17f4);
static_assert(offsetof(graphicst, texpos_border_bottom_right) == 0x1824);
static_assert(offsetof(graphicst, texpos_border_left) == 0x18ec);
static_assert(offsetof(graphicst, texpos_border_right) == 0x18fc);
static_assert(offsetof(graphicst, texpos_border_top) == 0x190c);
static_assert(offsetof(graphicst, texpos_border_bottom) == 0x1918);
static_assert(offsetof(graphicst, texpos_hover_rectangle) == 0x1924);
static_assert(offsetof(graphicst, texpos_hover_rectangle_join_w_sw) == 0x1948);
static_assert(offsetof(graphicst, texpos_hover_rectangle_join_w_s) == 0x194c);
static_assert(offsetof(graphicst, texpos_hover_rectangle_join_e_s) == 0x1950);
static_assert(offsetof(graphicst, texpos_hover_rectangle_join_e_se) == 0x1954);
static_assert(offsetof(graphicst, texpos_button_rectangle) == 0x19a8);
static_assert(offsetof(graphicst, texpos_button_rectangle_selected) == 0x19cc);
static_assert(offsetof(graphicst, texpos_button_rectangle_light) == 0x19f0);
static_assert(offsetof(graphicst, texpos_button_rectangle_dark) == 0x1a14);
static_assert(offsetof(graphicst, texpos_button_category_rectangle) == 0x1a44);
static_assert(offsetof(graphicst, texpos_button_category_rectangle_selected) == 0x1a68);
static_assert(offsetof(graphicst, texpos_button_category_rectangle_on) == 0x1a8c);
static_assert(offsetof(graphicst, texpos_button_category_rectangle_on_selected) == 0x1ab0);
static_assert(offsetof(graphicst, texpos_button_category_rectangle_off) == 0x1ad4);
static_assert(offsetof(graphicst, texpos_button_category_rectangle_off_selected) == 0x1af8);
static_assert(offsetof(graphicst, texpos_button_filter) == 0x1b1c);
static_assert(offsetof(graphicst, texpos_button_filter_no_mag_right) == 0x1b64);
static_assert(offsetof(graphicst, texpos_button_filter_name) == 0x1b70);
static_assert(offsetof(graphicst, texpos_scrollbar) == 0x1dc8);
static_assert(offsetof(graphicst, texpos_scrollbar_up_hover) == 0x1de0);
static_assert(offsetof(graphicst, texpos_scrollbar_down_hover) == 0x1df0);
static_assert(offsetof(graphicst, texpos_scrollbar_small_scroller) == 0x1e00);
static_assert(offsetof(graphicst, texpos_scrollbar_top_scroller) == 0x1e20);
static_assert(offsetof(graphicst, texpos_scrollbar_bottom_scroller) == 0x1e30);
static_assert(offsetof(graphicst, texpos_scrollbar_blank_scroller) == 0x1e40);
static_assert(offsetof(graphicst, texpos_scrollbar_center_scroller) == 0x1e50);
static_assert(offsetof(graphicst, texpos_scrollbar_offcenter_scroller_hover) == 0x1e70);
static_assert(offsetof(graphicst, texpos_button_main) == 0x2058);
static_assert(offsetof(graphicst, texpos_button_horizontal_option_active) == 0xa768);
static_assert(offsetof(graphicst, texpos_button_horizontal_option_inactive) == 0xa78c);
static_assert(offsetof(graphicst, texpos_button_horizontal_option_remove) == 0xa7e0);
static_assert(offsetof(graphicst, texpos_button_horizontal_option_confirm) == 0xa804);
static_assert(offsetof(graphicst, texpos_interior_border_n_s_w_e) == 0xa828);
static_assert(offsetof(graphicst, texpos_interior_border_n_w_e) == 0xa82c);
static_assert(offsetof(graphicst, texpos_interior_border_w_e) == 0xa834);
static_assert(offsetof(graphicst, texpos_interior_border_n_s) == 0xa838);
static_assert(offsetof(graphicst, texpos_adventure_log_pinned_active) == 0xaa04);
static_assert(offsetof(graphicst, texpos_adventure_log_pinned_inactive) == 0xaa28);
static_assert(offsetof(graphicst, texpos_adventure_log_item_active) == 0xaa4c);
static_assert(offsetof(graphicst, texpos_adventure_log_item_inactive) == 0xaa70);
static_assert(offsetof(graphicst, texpos_button_stocks_recenter) == 0xabb4);
static_assert(offsetof(graphicst, texpos_button_stocks_view_item) == 0xabd8);
static_assert(offsetof(graphicst, texpos_button_stocks_forbid) == 0xabfc);
static_assert(offsetof(graphicst, texpos_button_stocks_forbid_active) == 0xac20);
static_assert(offsetof(graphicst, texpos_button_stocks_dump) == 0xac44);
static_assert(offsetof(graphicst, texpos_button_stocks_dump_active) == 0xac68);
static_assert(offsetof(graphicst, texpos_button_stocks_melt) == 0xac8c);
static_assert(offsetof(graphicst, texpos_button_stocks_melt_active) == 0xacb0);
static_assert(offsetof(graphicst, texpos_button_stocks_hide) == 0xacd4);
static_assert(offsetof(graphicst, texpos_button_stocks_hide_active) == 0xacf8);
static_assert(offsetof(graphicst, texpos_button_short_forbid) == 0xad1c);
static_assert(offsetof(graphicst, texpos_button_short_hide_active) == 0xadc4);
static_assert(offsetof(graphicst, texpos_button_building_info) == 0xb154);
static_assert(offsetof(graphicst, texpos_button_building_sheet) == 0xb4b4);
static_assert(offsetof(graphicst, texpos_button_unit_sheet) == 0xb544);
static_assert(offsetof(graphicst, texpos_button_large_unit_sheet) == 0xb5d4);
static_assert(offsetof(graphicst, texpos_building_jobs_repeat) == 0xaf14);
static_assert(offsetof(graphicst, texpos_building_item_task) == 0xadf4);
static_assert(offsetof(graphicst, texpos_building_item_incorporated) == 0xae18);
static_assert(offsetof(graphicst, texpos_building_item_trade) == 0xae3c);
static_assert(offsetof(graphicst, texpos_building_item_animal) == 0xae60);
static_assert(offsetof(graphicst, texpos_building_item_bait) == 0xae84);
static_assert(offsetof(graphicst, texpos_building_item_loaded) == 0xaea8);
static_assert(offsetof(graphicst, texpos_building_item_dead) == 0xaecc);
static_assert(offsetof(graphicst, texpos_building_item_other) == 0xaef0);
static_assert(offsetof(graphicst, texpos_building_jobs_repeat_active) == 0xaf38);
static_assert(offsetof(graphicst, texpos_building_jobs_do_now) == 0xaf5c);
static_assert(offsetof(graphicst, texpos_building_jobs_do_now_active) == 0xaf80);
static_assert(offsetof(graphicst, texpos_building_jobs_suspended) == 0xafa4);
static_assert(offsetof(graphicst, texpos_building_jobs_suspended_active) == 0xafc8);
static_assert(offsetof(graphicst, texpos_building_jobs_priority_up) == 0xafec);
static_assert(offsetof(graphicst, texpos_building_jobs_remove) == 0xb010);
static_assert(offsetof(graphicst, texpos_building_jobs_active) == 0xb034);
static_assert(offsetof(graphicst, texpos_building_jobs_quota) == 0xb058);
static_assert(offsetof(graphicst, texpos_building_jobs_remove_worker) == 0xb07c);
static_assert(offsetof(graphicst, texpos_button_assign_trade) == 0xb0a0);
static_assert(offsetof(graphicst, texpos_button_inventory_item) == 0xb874);
static_assert(offsetof(graphicst, texpos_help_border) == 0x3d654);
// PE texture-token handlers at 0x141164c06 / 0x141164dde address these
// arrays at 0x142687b70 / 0x142687ba0; gps starts at 0x14264a3f0.
static_assert(offsetof(graphicst, texpos_embark_selected) == 0x3d780);
static_assert(offsetof(graphicst, texpos_embark_not_selected) == 0x3d7b0);
