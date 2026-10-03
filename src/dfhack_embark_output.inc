// embark-anyone uses the legacy ListBox: a prompt, an untouched filter
// EditField, then four-row civilization choices. Translate only authored
// prose and the species captions in those proved choice fields.
{
    constexpr std::string_view title = "Embark Anyone";
    constexpr std::string_view prompt_source =
        "Select a civilization to add to the list of origin civs:";
    constexpr std::string_view empty_source = "No additional civilizations found.";
    const auto catalog = g_dfhack_output_snapshot.load(std::memory_order_acquire);
    const auto emit_line = [&](int x, int y, std::string_view source,
            std::string_view target, int right) {
        if (source.empty() || !contains_cjk_utf8(target) || x < 0 || y < 0 ||
                y >= gps_->dimy || right > gps_->dimx || right <= x ||
                x + static_cast<int>(source.size()) > right ||
                read_row(y).compare(x, source.size(), source) != 0) return;
        std::vector<Match> rows{{x, y, static_cast<int>(source.size()),
            kDfhackHotkeysHintRule, {}, std::string(source)}};
        rows.front().layout_native_clip = auxiliary_pixels({x, y, right - x, 1});
        append_bounded_paragraph(std::move(rows), target, screen_rows,
            dfhack_auxiliary_matches, only_y, right, right, {}, false, x);
    };
    for (int title_y = 0; title_y < gps_->dimy; ++title_y) {
        const size_t at = dfhack_context_rows[title_y].find(title);
        if (at == std::string::npos) continue;
        const auto frame = native_dfhack_frame(dfhack_context_rows, title_y,
            static_cast<int>(at), static_cast<int>(title.size()), 23, 5);
        if (!frame) continue;
        const int edge = frame->x + frame->w - 1;
        const int bottom = frame->y + frame->h - 1;
        const int left = frame->x + 2, top = frame->y + 2, right = edge - 1;
        if (right <= left || top >= bottom ||
                dfhack_context_rows[bottom].compare(edge - 7, 6, "DFHack") != 0)
            continue;
        const auto full_source = [](const GuiPrompt &text) {
            std::string result;
            for (const auto &row : text.rows) {
                if (!result.empty()) result += ' ';
                result += row.source;
            }
            return result;
        };
        // The no-choice case is a legacy MessageBox without an Ok footer.
        if (const auto empty = gui_prompt("Viewer status", left, top, right, bottom - 1);
                empty && full_source(*empty) == empty_source) {
            dfhack_auxiliary_regions.push_back(*frame);
            gui_literal(static_cast<int>(at), title_y, title,
                static_cast<int>(at + title.size()), "Title", true);
            append_gui_prompt(*empty, left, right);
            continue;
        }
        const auto prompt = gui_prompt("List prompt", left, top, right, bottom - 1);
        if (!prompt || full_source(*prompt) != prompt_source) continue;
        // ListBox puts FilteredList at message height + 1. Its EditField is
        // at offset zero and its list starts two rows later.
        const int list_top = prompt->rows.back().y + 4;
        if (list_top >= bottom - 1) continue;
        dfhack_auxiliary_regions.push_back(*frame);
        gui_literal(static_cast<int>(at), title_y, title,
            static_cast<int>(at + title.size()), "Title", true);
        append_gui_prompt(*prompt, left, right);
        const auto row_text = [&](int y) {
            return trim_view(std::string_view(dfhack_context_rows[y]).substr(
                left, right - left));
        };
        if (row_text(list_top) == "No matches") {
            gui_literal(left, list_top, "No matches", right, "List status");
            continue;
        }
        for (int y = list_top; y + 2 < bottom - 1; y += 4) {
            const auto name = row_text(y), species = row_text(y + 1), status = row_text(y + 2);
            if (name.empty() || species.empty() || status.empty()) continue;
            std::optional<std::string> status_target;
            if (status == "Dead")
                status_target = exact_literal_translation("DFHack GUI List status: Dead");
            else if (catalog && status.starts_with("Pop: ") && status.find(" Sites: ") !=
                    std::string_view::npos)
                status_target = translate_dfhack_output_message(*catalog, status, 0, true, false);
            if (!status_target || !contains_cjk_utf8(*status_target)) continue;
            emit_line(left, y + 2, status, *status_target, right);
            if (auto target = translate_dfhack_caption("creature", species))
                emit_line(left, y + 1, species, *target, right);
            // Names authored by translateName remain native. Only the
            // script's explicitly unnamed fallback carries a species field.
            if (catalog && name.starts_with("Unnamed ") && name.ends_with(" civilisation"))
                if (auto target = translate_dfhack_output_message(*catalog, name, 0, true, false))
                    emit_line(left, y, name, *target, right);
        }
    }
}
