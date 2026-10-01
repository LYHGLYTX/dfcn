// Called in the direct memory-event translator after its object helpers.
const auto commodity = [&](const std::string &prefix) -> std::optional<Pieces> {
    const auto label = [&](const std::string &raw) -> std::optional<Pieces> {
        if (raw.empty()) return Pieces{piece("", neutral)};
        if (const auto known = term(raw)) return known;
        const auto translated = translate_legends_item(raw);
        return translated ? std::optional<Pieces>(Pieces{piece(*translated, neutral)}) : std::nullopt;
    };
    if (number(prefix + "present") == 0) return label("goods");
    const int32_t allotment = number(prefix + "allotment");
    // These are b87518's exact allotment choices. They describe the typed
    // commodity, and are never inferred from the formatter's English output.
    const char *suffix = "";
    switch (allotment) {
    case 0: case 1: case 2: case 3: case 17: case 20:
    case 31: case 32: case 33: case 34: case 35: case 36: case 37:
    case 38: case 39: case 40: case 41: case 42: break;
    case 4: suffix = " armor"; break;
    case 5: suffix = " leg armor"; break;
    case 6: suffix = " hand armor"; break;
    case 7: suffix = " foot armor"; break;
    case 8: suffix = " helmets"; break;
    case 9: suffix = " bodywear"; break;
    case 10: suffix = " legwear"; break;
    case 11: suffix = " handwear"; break;
    case 12: suffix = " footwear"; break;
    case 13: suffix = " headwear"; break;
    case 14: suffix = " weapons"; break;
    case 15: suffix = " ranged weapons"; break;
    case 16: suffix = " anvils"; break;
    case 18: suffix = " thread"; break;
    case 19: suffix = " cloth"; break;
    case 21: suffix = " quivers"; break;
    case 22: suffix = " backpacks"; break;
    case 23: suffix = " flasks"; break;
    case 24: suffix = " bags"; break;
    case 25: suffix = " tables"; break;
    case 26: suffix = " cabinets"; break;
    case 27: suffix = " chairs"; break;
    case 28: suffix = " boxes"; break;
    case 29: suffix = " beds"; break;
    case 30: suffix = " crafts"; break;
    case 43: suffix = " ammunition"; break;
    default: return std::nullopt;
    }
    const auto &raw_prefix = text(prefix + "prefix");
    const auto &raw_state = text(prefix + "state");
    auto result = label((raw_prefix.empty() ? raw_state : raw_prefix + " " + raw_state) + suffix);
    if (!result || number(prefix + "owner") == 0) return result;
    // The native formatter appends the possessive when the original figure
    // has a name, even if its chosen assumed identity has an empty name.
    const auto owner = number(prefix + "owner_has_name") == 0
        ? std::optional<Pieces>(Pieces{piece("", neutral)})
        : subject(NativeHistoryObjectKind::MaterialOwner, number(prefix + "owner_id"),
            false, number(prefix + "owner_subid"));
    return owner ? apply("{n}'s {s}", {*owner, *result}) : std::nullopt;
};
(void)commodity;
