// Native pause-menu draws own their complete dynamic fields. Grid whitespace
// cannot delimit an authored folder, track title or credit: any can contain
// repeated spaces, and music metadata can even have an empty title/artist.
const auto has_pause_dynamic_field = [](const std::string &row) {
    return row.find("Save to timeline folder: ") != std::string::npos ||
        row.find("Track playing: ") != std::string::npos ||
        row.find("Last track: ") != std::string::npos ||
        row.find("Interlude playing: ") != std::string::npos ||
        row.find("Last interlude: ") != std::string::npos ||
        row.find("Combat music: ") != std::string::npos;
};
if (only_y >= 0 ? has_pause_dynamic_field(screen_rows[static_cast<size_t>(only_y)])
        : std::any_of(screen_rows.begin(), screen_rows.end(), has_pause_dynamic_field)) {
for (const bool top_layer : {true, false}) {
    const auto *grid = top_layer ? gps_->screen_top : gps_->screen;
    if (!grid || (screen_override && screen_override != grid)) continue;
    const auto draws = captured_native_drawn_text_rows(top_layer);
    for (auto it = draws.rbegin(); it != draws.rend(); ++it) {
        const auto &draw = *it;
        if (draw.draw_grid != grid || draw.draw_dimx != gps_->dimx ||
            draw.draw_dimy != gps_->dimy || draw.y < 0 || draw.y >= gps_->dimy ||
            draw.x < 0 || draw.x >= gps_->dimx ||
            (only_y >= 0 && draw.y != only_y)) continue;
        const auto source = trim_view(draw.source);
        if (!source.starts_with("Save to timeline folder: ") &&
            !is_embark_pause_soundtrack(source)) continue;
        const int x = draw.x + static_cast<int>(source.data() - draw.source.data());
        int end = std::min(gps_->dimx, x + static_cast<int>(source.size()));
        if (draw.draw_clip) end = std::min(end, draw.draw_clip->x + draw.draw_clip->w);
        if (x < 0 || end <= x) continue;
        auto &row = screen_rows[static_cast<size_t>(draw.y)];
        if (row.compare(x, end - x, source, 0, end - x) != 0) continue;
        const auto target = translate_procedural_fragment(std::string(source));
        if (!target || target->empty()) continue;
        Match match{x, draw.y, end - x, -2, *target,
            std::string(source.substr(0, end - x))};
        result.push_back(std::move(match));
        std::fill_n(row.begin() + x, end - x, ' ');
    }
}
}
