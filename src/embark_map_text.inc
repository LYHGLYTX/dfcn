// Classic embark maps share the character grid with the UI. Their trees,
// rivers and hills are not words, even when adjacent CP437 tiles happen to
// form a native name or a valid UTF-8 sequence. Keep map bytes out of the
// shared matcher, rather than caching translations of changing terrain.
std::vector<uint8_t> Overlay::capture_embark_map_text_cells() const {
    if (!gps_ || !gps_->screen || gps_->dimx <= 0 || gps_->dimx > 1000 ||
        gps_->dimy <= 0 || gps_->dimy > 1000) return {};
    const auto settings = native_ui_settings();
    if (!settings || !settings->classic) return {};

    // Read the current logical composite, not last Present's observed glyph
    // order. The same scene must be recognized during base/top suppression.
    std::vector<std::string> context(gps_->dimy, std::string(gps_->dimx, ' '));
    for (int x = 0; x < gps_->dimx; ++x)
        for (int y = 0; y < gps_->dimy; ++y) {
            bool top = false;
            const auto *cell = cell_at(x, y, &top);
            context[y][x] = cell && cell[0] ? static_cast<char>(cell[0]) : ' ';
        }
    // These are native scene identifiers, not translations or a list of
    // allowed UI words. Require independent current controls; never retain
    // this gate after moving to a different page or infer it from map tiles.
    // Zooming replaces the overview controls and its first guidance line.
    // Placement also removes the recenter row: its independent controls are
    // the area-size hint and elevation/grade buttons. Requiring two of the
    // overview/navigation landmarks there sends the entire terrain grid
    // back into the expensive text grammars on every cursor movement.
    // Supporting controls alone must never identify an embark scene.
    // The recenter key is user-configurable: its surrounding native prose,
    // not the default binding, establishes the second independent landmark.
    struct Landmark {
        std::string_view prefix, suffix;
        bool scene = true;
    };
    constexpr std::array<Landmark, 9> landmarks = {{
        {"Find embark location", {}}, {"Choose origin civilization", {}},
        {"Click the map to zoom in and choose your embark location.", {}},
        {"Click \"Embark\" to place your fortress. Right click to zoom out.", {}},
        {"Click on the map to embark! Right click to abort.", {}},
        {"To recenter, press ", " or hold+drag the middle mouse button.", false},
        {"Recommended size.", {}, false},
        {"Show elevation", {}, false},
        {"Show cliffs/grade", {}, false}
    }};
    const auto has_landmark = [](std::string_view row, const Landmark &landmark) {
        const size_t at = row.find(landmark.prefix);
        if (at == std::string_view::npos) return false;
        size_t end = at + landmark.prefix.size();
        if (!landmark.suffix.empty()) {
            const size_t suffix = row.find(landmark.suffix, end);
            if (suffix == std::string_view::npos ||
                trim_view(row.substr(end, suffix - end)).empty()) return false;
            end = suffix + landmark.suffix.size();
        }
        return has_word_boundaries(row, at, end);
    };
    std::array<bool, landmarks.size()> present{};
    for (const auto &row : context) {
        // Native guidance uses two spaces after a sentence. The reviewed
        // message catalog normalizes those to one; ownership must use the
        // same whitespace semantics rather than require byte-identical
        // prose. Keep the original grid untouched for every source span.
        const std::string normalized = normalize_utterance(row);
        for (size_t i = 0; i < landmarks.size(); ++i)
            present[i] = present[i] || has_landmark(normalized, landmarks[i]);
    }
    uint32_t scene_landmarks = 0;
    for (size_t i = 0; i < landmarks.size(); ++i)
        if (present[i] && landmarks[i].scene) scene_landmarks |= uint32_t{1} << i;
    if (!scene_landmarks || std::count(present.begin(), present.end(), true) < 2) return {};

    const size_t cells = static_cast<size_t>(gps_->dimx) * gps_->dimy;
    std::vector<uint8_t> text_cells(cells, 0);
    auto retain = [&](const SDL_Rect &rect) {
        const int left = std::clamp(rect.x, 0, gps_->dimx);
        const int right = std::clamp(rect.x + rect.w, left, gps_->dimx);
        const int top = std::clamp(rect.y, 0, gps_->dimy);
        const int bottom = std::clamp(rect.y + rect.h, top, gps_->dimy);
        for (int x = left; x < right; ++x)
            std::fill(text_cells.begin() + static_cast<size_t>(x) * gps_->dimy + top,
                text_cells.begin() + static_cast<size_t>(x) * gps_->dimy + bottom, 1);
    };

    // Preserve COMPLETE current frames, including unknown text, headings,
    // resource colors, input fields and nested modal controls. No screenshot
    // coordinates, panel width or translated vocabulary decides ownership.
    const NativePanelBorders borders(*gps_);
    bool framed_landmark = false;
    for (int y = 0; y + 2 < gps_->dimy; ++y)
        for (int x = 0; x + 2 < gps_->dimx; ++x) {
            if (text_cells[static_cast<size_t>(x) * gps_->dimy + y] ||
                !borders.at(x, y, 0, context[y], std::pair{x, gps_->dimx})) continue;
            const auto panel = native_panel_interior(borders, *gps_, x + 1, x + 2, y + 1);
            if (!panel || panel->x != x + 1 || panel->y != y + 1) continue;
            retain({panel->x - 1, panel->y - 1, panel->w + 2, panel->h + 2});
            for (int row = panel->y; row < panel->y + panel->h; ++row) {
                const auto source = normalize_utterance(
                    std::string_view(context[row]).substr(panel->x, panel->w));
                for (const auto &landmark : landmarks)
                    framed_landmark = framed_landmark ||
                        (landmark.scene && has_landmark(source, landmark));
            }
        }
    // An incomplete redraw cannot establish the map/UI partition yet.
    if (!framed_landmark) return {};

    // Native string draws also prove unframed captions (including authored
    // Chinese names). A cached address alone is not proof: every visible byte
    // and the position must still agree. Single map/key glyphs are excluded
    // by the shared caption-source classifier, not by a terrain vocabulary.
    const auto retain_caption = [&](int x, int y, std::string_view source) {
        if (x < 0 || y < 0 || y >= gps_->dimy || x >= gps_->dimx || source.empty()) return;
        source = source.substr(0, static_cast<size_t>(gps_->dimx - x));
        if (context[y].compare(x, source.size(), source) == 0)
            retain({x, y, static_cast<int>(source.size()), 1});
    };
    {
        std::lock_guard<std::mutex> lock(g_native_drawn_text_mutex);
        for (const auto &draw : g_native_drawn_text_rows)
            if (draw.caption_source || contains_cjk_utf8(draw.source))
                retain_caption(draw.x, draw.y, draw.source);
    }
    for (const auto &caption : captured_clipped_captions())
        retain_caption(caption.x, caption.y, caption.visible);
    // Log once per newly recognized scene, not just once for the overview:
    // manual acceptance must be able to see that placement is filtered too.
    static std::atomic<uint32_t> logged_map_text_scenes{0};
    if (scene_landmarks & ~logged_map_text_scenes.fetch_or(scene_landmarks)) {
        log_line("INFO", "Embark map text ownership: " +
            std::to_string(std::count(text_cells.begin(), text_cells.end(), uint8_t{1})) +
            "/" + std::to_string(cells) +
            " cells retained from current native frames and captions; terrain excluded; scene landmarks=" +
            std::to_string(scene_landmarks));
    }
    return text_cells;
}

static void retain_native_text_cells(std::vector<std::string> &rows,
        const std::vector<uint8_t> &text_cells) {
    if (text_cells.empty() || rows.empty()) return;
    for (size_t y = 0; y < rows.size(); ++y)
        for (size_t x = 0; x < rows[y].size(); ++x)
            if (!text_cells[x * rows.size() + y]) rows[y][x] = ' ';
}
