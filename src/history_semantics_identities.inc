// Direct false-identity fields, shared by assumption and intrigue events.
const auto identity = [&](int32_t id, std::string_view prefix) -> std::optional<Pieces> {
    const auto identity_creature = [&](std::string_view raw) -> std::optional<Pieces> {
        const auto name = translate_creature_descriptor(std::string(raw));
        return name ? std::optional<Pieces>{Pieces{piece(*name, neutral)}} : std::nullopt;
    };
        std::optional<Pieces> value;
        if (number(std::string(prefix) + "_real_figure") >= 0) {
            value = subject(NativeHistoryObjectKind::Figure, number(std::string(prefix) + "_real_figure"));
        } else {
            const bool named = number(std::string(prefix) + "_named") != 0;
            std::string key;
            std::vector<Pieces> values;
            if (!text(std::string(prefix) + "_species").empty()) {
                const auto species = identity_creature(text(std::string(prefix) + "_species"));
                if (!species) return std::nullopt;
                key = named ? "the {s}" : "a {s}";
                values.push_back(*species);
            }
            if (!text(std::string(prefix) + "_profession").empty()) {
                auto profession = term(text(std::string(prefix) + "_profession"));
                if (!profession) {
                    const auto translated = exact_literal_translation(text(std::string(prefix) + "_profession"));
                    if (translated) profession = Pieces{piece(*translated, neutral)};
                }
                if (!profession) return std::nullopt;
                if (key.empty()) key = named ? "the {s}" : "a {s}";
                else key += named ? " the {s}" : " {s}";
                values.push_back(*profession);
            }
            if (named) {
                const auto name = subject(NativeHistoryObjectKind::Identity, id, false);
                if (!name) return std::nullopt;
                if (!key.empty()) key += " ";
                key += "{n}";
                values.push_back(*name);
            }
            if (number(std::string(prefix) + "_entity") >= 0) {
                const auto entity = subject(NativeHistoryObjectKind::Entity, number(std::string(prefix) + "_entity"));
                if (!entity) return std::nullopt;
                key += " of {p}";
                values.push_back(*entity);
            }
            value = key == "{n}" ? std::optional<Pieces>{values.front()} : apply(key, values);
            if (value && named) value = apply("\"{n}\"", {*value});
        }
    return value;
};
(void)identity;
