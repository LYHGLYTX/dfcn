// The task selector's button captions are complete material names. Resolve
// their role before generic word matching; composition then only places the
// translated name inside the native row and preserves the separate count.
static std::string workshop_wood_material_name(std::string target) {
    target = trim(std::move(target));
    // The selector names wood stock, not a living tree or an item qualifier.
    // Remove existing terminal markers before adding the single noun suffix;
    // repeat so already combined endings cannot leave "树木" or "木木".
    bool stripped = true;
    while (stripped) {
        stripped = false;
        for (const std::string_view suffix : {"木材", "木质", "木制", "木头", "树", "木"}) {
            if (!target.ends_with(suffix)) continue;
            target.resize(target.size() - suffix.size());
            stripped = true;
            break;
        }
    }
    return target + "木";
}

void Overlay::append_workshop_material_translations(
        const std::vector<NativeTextCard> &fields, std::vector<std::string> &rows,
        std::vector<Match> &matches, int only_y) const {
    if (fields.empty()) return;
    const auto row_source = [](const NativeTextCardRow &row) {
        return trim_view(row.complete_source.empty() ? std::string_view(row.source)
                                                    : std::string_view(row.complete_source));
    };
    // Selector headings and task-detail action captions are complete UI
    // fields, not stock-material nouns. Own their whole source before generic
    // matches can independently center a title or a piece of its heading.
    for (const auto &field : fields) {
        if (!field.workshop_task_detail && field.button_box) continue;
        for (const auto &row : field.rows) {
            const std::string source(row_source(row));
            auto target = exact_literal_translation(source);
            if (!target && !field.button_box) target = translate_fortress_activity(source);
            const bool complete = target && !target->empty() &&
                target->find("[C:") == std::string::npos &&
                std::none_of(target->begin(), target->end(), [](unsigned char ch) {
                    return (ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') ||
                        ch == '\r' || ch == '\n';
                });
            Match match{row.x, row.y, static_cast<int>(row.source.size()),
                kWorkshopMaterialFieldRule,
                complete ? *target : native_text_to_utf8(row.source), row.source};
            match.layout_foreground_rgb = row.foregrounds.front();
            match.native_hover_untranslated = !complete;
            if (!complete) match.native_help_review_source = source;
            if (only_y < 0 || only_y == row.y) matches.push_back(std::move(match));
            std::fill_n(rows[row.y].begin() + row.x, row.source.size(), ' ');
        }
    }
    if (!config_.compositional_rules) return;
    const auto complete_wood = [](std::string_view source) {
        const auto wood = find_arena_wood_material(source);
        return wood.at == 0 && wood.length == trim_view(source).size()
            ? wood.source : std::string_view{};
    };
    bool wood_task = false, all_wood = true, unambiguous_wood = false;
    for (const auto &field : fields) {
        if (field.workshop_task_detail) continue;
        for (const auto &row : field.rows) {
            const auto source = row_source(row);
            if (field.button_box) {
                const auto wood = complete_wood(source);
                all_wood = all_wood && !wood.empty();
                const auto folded = lower(std::string(source));
                // Bare ash/ashes alone can also be the furnace product.
                // A sibling wood material proves the unfiltered wood list;
                // the task heading retains that role when it is filtered.
                unambiguous_wood = unambiguous_wood ||
                    (!wood.empty() && folded != "ash" && folded != "ashes");
            } else {
                const auto folded = lower(std::string(source));
                for (std::string_view word : {"wood", "wooden"}) {
                    for (size_t at = folded.find(word); at != std::string::npos;
                         at = folded.find(word, at + 1)) {
                        const size_t end = at + word.size();
                        if ((at == 0 || !ascii_word_byte(folded[at - 1])) &&
                            (end == folded.size() || !ascii_word_byte(folded[end])))
                            wood_task = true;
                    }
                }
            }
        }
    }
    const bool wood_context = wood_task || (all_wood && unambiguous_wood);
    for (const auto &field : fields) {
        if (field.workshop_task_detail) continue;
        if (!field.button_box) continue; // Complete selector headings were owned above.
        for (const auto &row : field.rows) {
            const auto source = row_source(row);
            const auto wood = wood_context ? complete_wood(source) : std::string_view{};
            std::optional<std::string> target;
            if (!wood.empty()) {
                // Use the canonical RAW wood adjective, so ash cannot pick
                // up the independent material noun meaning "burnt residue".
                target = translate_material_name(wood, true);
            }
            if (!target) target = translate_material_name(source);
            if (!target || target->empty() || target->find("[C:") != std::string::npos ||
                target->find_first_of("\r\n") != std::string::npos) continue;
            if (!wood.empty() && contains_cjk_utf8(*target))
                *target = workshop_wood_material_name(std::move(*target));
            Match match{row.x, row.y, static_cast<int>(row.source.size()),
                kWorkshopMaterialFieldRule, *target, row.source};
            match.layout_foreground_rgb = row.foregrounds.front();
            if (only_y < 0 || only_y == row.y) matches.push_back(std::move(match));
            std::fill_n(rows[row.y].begin() + row.x, row.source.size(), ' ');
        }
    }
}
