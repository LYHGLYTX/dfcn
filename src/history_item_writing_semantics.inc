const auto item_written_description = [&](const std::string &prefix, bool pages)
        -> std::optional<Pieces> {
    Pieces result;
    for (int id : numbers(prefix + (pages ? ".pages" : ".writing"))) {
        const std::string key = prefix + "." + std::to_string(id);
        if (number(key + ".multiple")) continue; // Native carrier requires exactly one work ID.
        const auto value = number(key + ".blank") ? apply("The pages are blank.", {}) :
            written_content(key, pages ? 1 : 0);
        if (!value) return std::nullopt;
        join(result, *value);
    }
    return result;
};
