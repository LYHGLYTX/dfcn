#pragma once
#include <cstddef>
#include <cstdint>
#include <vector>

namespace dfcn {
// A read-only view of the current background beneath a verified help card.
// No game buffers are modified, and no data from an earlier frame is replayed.
class NativeUiReadScope {
public:
    inline static thread_local const NativeUiReadScope *active = nullptr;
    NativeUiReadScope(const void *graphics, const std::vector<uint8_t> *base_cells)
        : graphics_(graphics), base_cells_(base_cells), previous_(active) { active = this; }
    ~NativeUiReadScope() { reset(); }
    NativeUiReadScope(const NativeUiReadScope &) = delete;
    NativeUiReadScope &operator=(const NativeUiReadScope &) = delete;
    void reset() { if (active == this) active = previous_; }
    static bool base_at(const void *graphics, size_t at) {
        return active && active->graphics_ == graphics && active->base_cells_ &&
            at < active->base_cells_->size() && (*active->base_cells_)[at];
    }
    static bool background_view(const void *graphics) {
        return active && active->graphics_ == graphics && active->base_cells_;
    }
private:
    const void *graphics_;
    const std::vector<uint8_t> *base_cells_;
    const NativeUiReadScope *previous_;
};
// Native top glyphs with a black background are drawn transparently. A blank
// space in that layer therefore leaves the base cell visible (for example
// outside a tutorial). Text, opaque spaces and any top artwork still own the
// cell. Share this decision between source capture, colors and widget borders.
template <typename Graphics>
bool native_ui_top_layer_at(const Graphics &gps, std::size_t at) {
    if (NativeUiReadScope::base_at(&gps, at)) return false;
    if (!gps.top_in_use) return false;
    if ((gps.screentexpos_top && gps.screentexpos_top[at]) ||
        (gps.screentexpos_top_lower && gps.screentexpos_top_lower[at]) ||
        (gps.screentexpos_top_anchored && gps.screentexpos_top_anchored[at])) return true;
    if (!gps.screen_top) return false;
    const auto *cell = gps.screen_top + at * 8;
    return cell[0] != 0 &&
        (cell[0] != ' ' || cell[4] != 0 || cell[5] != 0 || cell[6] != 0);
}

// Every supported native ABI must expose the shared UI texture fields.
// A missing field is a build error instead of silently disabling captures,
// button recognition or layout on one host.
#define DFCN_TEXTURE_FIELD(name, storage) \
template <typename Graphics> const auto &native_texture_##name(const Graphics &gps) { \
    return gps.texpos_##name; \
}
DFCN_TEXTURE_FIELD(border_bottom, std::int32_t[3])
DFCN_TEXTURE_FIELD(border_bottom_left, std::int32_t[4][3])
DFCN_TEXTURE_FIELD(border_bottom_right, std::int32_t[4][3])
DFCN_TEXTURE_FIELD(border_left, std::int32_t[4])
DFCN_TEXTURE_FIELD(border_right, std::int32_t[4])
DFCN_TEXTURE_FIELD(border_top, std::int32_t[3])
DFCN_TEXTURE_FIELD(border_top_left, std::int32_t[4][3])
DFCN_TEXTURE_FIELD(border_top_right, std::int32_t[4][3])
DFCN_TEXTURE_FIELD(button_category_rectangle, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_category_rectangle_off, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_category_rectangle_off_selected, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_category_rectangle_on, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_category_rectangle_on_selected, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_category_rectangle_selected, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_rectangle, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_rectangle_dark, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_rectangle_divider, std::int32_t[3])
DFCN_TEXTURE_FIELD(button_rectangle_light, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_rectangle_selected, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_filter, std::int32_t[6][3])
DFCN_TEXTURE_FIELD(button_filter_name, std::int32_t[4][3])
DFCN_TEXTURE_FIELD(button_horizontal_option_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_horizontal_option_inactive, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_horizontal_option_remove, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_horizontal_option_confirm, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(grid_cell_inactive, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(grid_cell_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(grid_cell_button, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_picture_box, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_picture_box_selected, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_picture_box_highlighted, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_picture_box_sel_highlighted, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_picture_box_light, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_picture_box_dark, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_add, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_add_hover, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_add_pressed, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_add_invalid, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_subtract, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_subtract_hover, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_subtract_pressed, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_subtract_invalid, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(scrollbar, std::int32_t[2][3])
DFCN_TEXTURE_FIELD(scrollbar_up_hover, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_up_pressed, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_down_hover, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_down_pressed, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_small_scroller, std::int32_t[2][2])
DFCN_TEXTURE_FIELD(scrollbar_small_scroller_hover, std::int32_t[2][2])
DFCN_TEXTURE_FIELD(scrollbar_top_scroller, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_top_scroller_hover, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_bottom_scroller, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_bottom_scroller_hover, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_blank_scroller, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_blank_scroller_hover, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_center_scroller, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_center_scroller_hover, std::int32_t[2])
DFCN_TEXTURE_FIELD(scrollbar_offcenter_scroller, std::int32_t[2][2])
DFCN_TEXTURE_FIELD(scrollbar_offcenter_scroller_hover, std::int32_t[2][2])
DFCN_TEXTURE_FIELD(button_main, std::int32_t[715][4][3])
DFCN_TEXTURE_FIELD(button_assign_trade, std::int32_t[5][3][3])
DFCN_TEXTURE_FIELD(button_stocks_dump, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_dump_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_forbid, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_forbid_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_hide, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_hide_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_melt, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_melt_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_recenter, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_stocks_view_item, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(button_building_sheet, std::int32_t[3][4][3])
DFCN_TEXTURE_FIELD(button_unit_sheet, std::int32_t[4][3][3])
DFCN_TEXTURE_FIELD(button_large_unit_sheet, std::int32_t[5][4][3])
DFCN_TEXTURE_FIELD(button_pets_livestock, std::int32_t[12][3][3])
DFCN_TEXTURE_FIELD(button_inventory_item, std::int32_t[7][3][3])
DFCN_TEXTURE_FIELD(button_short_forbid, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(button_short_forbid_active, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(button_short_dump, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(button_short_dump_active, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(button_short_melt, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(button_short_melt_active, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(button_short_hide, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(button_short_hide_active, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(building_short_item_task, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(building_item_task, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_item_incorporated, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_item_trade, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_item_animal, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_item_bait, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_item_loaded, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_item_dead, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_item_other, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_repeat, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_repeat_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_do_now, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_do_now_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_suspended, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_suspended_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_priority_up, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_remove, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_quota, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(building_jobs_remove_worker, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(help_border, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(help_corner, std::int32_t[8][6])
DFCN_TEXTURE_FIELD(help_close, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(help_reveal, std::int32_t[3][2])
DFCN_TEXTURE_FIELD(embark_selected, std::int32_t[4][3])
DFCN_TEXTURE_FIELD(embark_not_selected, std::int32_t[4][3])
DFCN_TEXTURE_FIELD(hover_rectangle, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(hover_rectangle_join_w_sw, std::int32_t)
DFCN_TEXTURE_FIELD(hover_rectangle_join_w_s, std::int32_t)
DFCN_TEXTURE_FIELD(hover_rectangle_join_e_s, std::int32_t)
DFCN_TEXTURE_FIELD(hover_rectangle_join_e_se, std::int32_t)
DFCN_TEXTURE_FIELD(adventure_log_pinned_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(adventure_log_pinned_inactive, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(adventure_log_item_active, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(adventure_log_item_inactive, std::int32_t[3][3])
DFCN_TEXTURE_FIELD(interior_border_n_s, std::int32_t)
DFCN_TEXTURE_FIELD(interior_border_n_s_w_e, std::int32_t)
DFCN_TEXTURE_FIELD(interior_border_n_w_e, std::int32_t)
DFCN_TEXTURE_FIELD(interior_border_w_e, std::int32_t)
DFCN_TEXTURE_FIELD(type_filter_left, std::int32_t[3])
DFCN_TEXTURE_FIELD(type_filter_right, std::int32_t[3])
DFCN_TEXTURE_FIELD(type_filter_text, std::int32_t[3])
#undef DFCN_TEXTURE_FIELD

template <typename Graphics> constexpr bool native_has_graphics_metadata(const Graphics &) {
    static_assert(requires (const Graphics &gps) { gps.texpos_interior_border_n_s; },
                  "Every supported graphics ABI must expose UI metadata");
    return true;
}
} // namespace dfcn
