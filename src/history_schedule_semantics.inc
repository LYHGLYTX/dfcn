// One rendering path for d3bea0 schedule features, regardless of whether
// the program belongs to a history event or a collection-page introduction.
    const auto schedule_form = [&](NativeHistoryObjectKind kind, int id) -> std::optional<Pieces> {
        for (const auto &entry : event.subjects)
            if (entry.kind == kind && entry.id == id && entry.subid == -1) {
                if (!entry.label_key.empty()) return Pieces{}; // Native generic form branch.
                if (!entry.name.has_name) return Pieces{piece("", neutral)};
                return subject(kind, id, false);
            }
        return std::nullopt;
    };
    const auto schedule_raw_term = [&](std::string_view key) -> std::optional<Pieces> {
        const auto &raw = text(key);
        if (raw.empty()) return Pieces{piece("", neutral)};
        auto translated = term(raw);
        if (translated) return translated;
        auto label = translate_creature_descriptor(raw);
        if (!label) label = translate_legends_item(raw);
        return label ? std::optional<Pieces>(Pieces{piece(*label, neutral)}) : std::nullopt;
    };
    const auto schedule_features = [&]() -> std::optional<Pieces> {
        const auto &features = numbers("features");
        if (features.size() % 3) return std::nullopt;
        Pieces combined;
        size_t given_items = 0, sacrificed_items = 0;
        for (size_t index = 0; index < features.size() / 3; ++index) {
            const int type = features[index * 3], data = features[index * 3 + 1];
            const std::string raw_key = "feature." + std::to_string(index);
            std::optional<Pieces> feature;
            if (type == 0 || type == 1 || type == 19 || type == 20 || type == 11 || type == 12) {
                auto value = schedule_raw_term(raw_key);
                if (!value) return std::nullopt;
                if (type == 0) feature = value;
                else feature = apply(type == 1 ? "mounted {s}" : type == 11 ? "the carrying of {s}" :
                    type == 12 ? "the scattering of {s}" : "the sacrifice of {s}", {*value});
            } else if (type == 2) {
                if (data == -1) feature = term("storytelling");
                else {
                    auto content = story(data);
                    feature = content ? apply("Native history telling story {e}", {*content}) : std::nullopt;
                }
            } else if (type >= 3 && type <= 5) {
                auto work = schedule_form(type == 3 ? NativeHistoryObjectKind::Poem :
                    type == 4 ? NativeHistoryObjectKind::Music : NativeHistoryObjectKind::Dance, data);
                if (!work) return std::nullopt;
                feature = work->empty() ? term(type == 3 ? "a poetry recital" : type == 4 ? "a concert" : "a dance") :
                    apply(type == 3 ? "a recital of {b}" : "a performance of {b}", {*work});
                // d3c3d5 emits the introduction before attempting the dance
                // ID lookup. A missing non-sentinel ID retains both words.
                if (type == 5 && data != -1 && work->empty() && feature)
                    feature = apply("a performance of {b}", {*feature});
            } else if (type == 10) {
                if (data == -1) feature = term("images");
                else {
                    auto who = subject(NativeHistoryObjectKind::Figure, data, false);
                    feature = who ? apply("images of {n}", {*who}) : std::nullopt;
                }
            } else if (type == 17 || type == 18) {
                const std::string role = type == 17 ? "feature.give." + std::to_string(given_items++) :
                    "feature.sacrifice." + std::to_string(sacrificed_items++);
                auto value = item(role);
                feature = value ? apply(type == 17 ? "the giving of {i}" : "the sacrifice of {i}", {*value}) : std::nullopt;
            } else {
                const char *key = type == 6 ? "a moving performance stage" : type == 7 ? "criers in front" :
                    type == 8 ? "an order of precedence" : type == 9 ? "banners" : type == 13 ? "acrobats" :
                    type == 14 ? "incense burning" : type == 15 ? "costumes" : type == 16 ? "candles" : nullptr;
                if (!key) continue; // Native out-of-enum branch contributes no words.
                feature = term(key);
            }
            if (!feature) return std::nullopt;
            if (combined.empty()) combined = *feature;
            else {
                auto joined = apply(index + 1 == features.size() / 3 ? "{a} and {a}" : "{a}, {a}", {combined, *feature});
                if (!joined) return std::nullopt;
                combined = *joined;
            }
        }
        return combined;
    };
    (void)schedule_features;
