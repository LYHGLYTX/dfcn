// unretire-anyone.lua:96-104 uses the legacy dialogs.ListBox. Its preinit
// clears on_accept, so this window has no modern Ok/Close footer to classify.
{
    const auto unretire_anyone_list = [&]() -> bool {
        constexpr std::string_view command_title = "unretire-anyone";
        constexpr std::string_view prompt_source =
            "Select someone to add to the \"Specific Person\" list:";
        constexpr std::string_view unknown_source = "Unknown Creature";
        constexpr std::string_view unnamed_source = "Unnamed";
        if (title != command_title ||
                read_row(title_y).compare(at, title.size(), title) != 0)
            return false;

        // Legacy MessageBox's right inset is zero, unlike Window's one.
        // FramedScreen adds a one-cell gap, so the body ends at edge-1,
        // inclusive; its exclusive right bound is the actual frame edge.
        const int body_right = right;
        const int body_width = body_right - left;
        const int list_top = top + 4;
        const int summary_right = body_right - 2;
        // One prompt row + 3 + min(18, 3*choices+2), then four frame/inset
        // rows. Reject vertical clipping that cannot prove full summary rows.
        constexpr std::array<int, 7> native_heights{{10, 13, 16, 19, 22, 25, 26}};
        if (body_width <= 2 || list_top > footer_y ||
                prompt_source.size() > static_cast<size_t>(body_width) ||
                unknown_source.size() > static_cast<size_t>(summary_right - left) ||
                std::find(native_heights.begin(), native_heights.end(), frame->h) ==
                    native_heights.end()) return false;
        const auto prompt_band = std::string_view(dfhack_context_rows[top]).substr(
            left, body_width);
        const auto prompt_raw = read_row(top);
        if (!prompt_band.starts_with(prompt_source) ||
                !trim_view(prompt_band.substr(prompt_source.size())).empty() ||
                prompt_raw.compare(left, prompt_source.size(), prompt_source) != 0 ||
                !trim_view(std::string_view(prompt_raw).substr(
                    left + prompt_source.size(), body_width - prompt_source.size())).empty())
            return false;
        // ListBox places FilteredList at message height+1. Its edit row is
        // top+2, its own gap is top+3, and List starts at top+4 with row_height=3.
        // The filter and its cursor are deliberately never inspected as prose.
        for (const int y : {top + 1, top + 3}) {
            const auto raw = read_row(y);
            if (!trim_view(std::string_view(dfhack_context_rows[y]).substr(
                        left, body_width)).empty() ||
                    !trim_view(std::string_view(raw).substr(left, body_width)).empty())
                return false;
        }
        const auto prompt_target = exact_literal_translation(
            "DFHack output: " + std::string(prompt_source));
        const auto unknown_target = exact_literal_translation(
            "DFHack output: " + std::string(unknown_source));
        const auto unnamed_target = exact_literal_translation(
            "DFHack output: " + std::string(unnamed_source));
        if (!prompt_target || !unknown_target || !unnamed_target ||
                !contains_cjk_utf8(*prompt_target) || !contains_cjk_utf8(*unknown_target) ||
                !contains_cjk_utf8(*unnamed_target)) return false;

        dfhack_auxiliary_regions.push_back(*frame);
        auxiliary_literal(left, top, prompt_source, body_right, false, "DFHack output: ");
        const auto fallback = [&](int y, std::string_view source) {
            const auto band = std::string_view(dfhack_context_rows[y]).substr(
                left, summary_right - left);
            if (!band.starts_with(source) ||
                    !trim_view(band.substr(source.size())).empty()) return;
            const auto raw = read_row(y);
            if (raw.compare(left, source.size(), source) != 0 ||
                    !trim_view(std::string_view(raw).substr(left + source.size(),
                        summary_right - left - source.size())).empty()) return;
            auxiliary_literal(left, y, source,
                left + static_cast<int>(source.size()), false, "DFHack output: ");
        };
        for (int y = list_top; y + 2 <= footer_y; y += 3) {
            // The first line owns this fallback only without any suffix.
            // The third is either a quoted proper name or authored Unnamed.
            // The second readable name and the filter remain native.
            fallback(y, unknown_source);
            fallback(y + 2, unnamed_source);
        }
        // command_title is an executable command identifier, not a GUI title
        // translation. Owning the frame also protects every proper name row.
        return true;
    };
    if (unretire_anyone_list()) continue;
}
