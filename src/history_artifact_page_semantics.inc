// The native artifact branch owns these complete paragraphs. Item type,
// material, quality flags, true-name identity and summoning agreement were
// copied independently from memory before this renderer selects templates.
case NativeHistoryPageKind::ArtifactIntroduction: {
    auto label = item("artifact");
    if (!label) return std::nullopt;
    if (!number("artifact.named"))
        return apply("This was a legendary {i}.", {*label});
    const auto name = subject(NativeHistoryObjectKind::Artifact, event.artifact_id, false);
    return name ? apply("{p} was a legendary {i}.", {*name, *label}) : std::nullopt;
}
case NativeHistoryPageKind::ArtifactDescription: {
    Pieces result;
    const auto append = [&](std::string_view family, const auto &generate) {
        failure_detail.clear();
        const auto parts = generate();
        if (!parts) {
            failure_detail = "item-production-failed; artifact=" + std::to_string(event.artifact_id) +
                "; family=" + std::string(family) + (failure_detail.empty() ? "" : "; " + failure_detail);
            return false;
        }
        join(result, *parts);
        return true;
    };
    // These are c75000's composable production families, in native order.
    // Their presence is selected by item/improvement/RAW state rather than
    // an artifact ID, screen text or a whitelist of example item classes.
    if (!append("base", [&] { return item_base_description(); }) ||
        !append("initial-extras", [&] { return item_extra_phase("extras", 0); }) ||
        !append("food", [&] { return item_food_description(); }) ||
        !append("improvements", [&] { return item_improvements("improvements", item_art_image); }) ||
        !append("dice", [&] { return item_extra_phase("extras", 1); }) ||
        !append("writing", [&] { return item_written_description("writing", false); }) ||
        !append("pages", [&] { return item_written_description("writing", true); }) ||
        !append("coloration", [&] { return item_improvement_coloration("improvements.color"); }) ||
        !append("currency-and-dye", [&] { return item_extra_phase("extras", 2); }) ||
        !append("inscription", [&] { return item_slab_description(); }) ||
        !append("wear", [&] { return item_wear_description(); }) ||
        !append("effects-and-raw-description", [&] { return item_extra_phase("extras", 3); })) return std::nullopt;

    // b8fd35 passes the exact native knowledge level after the item body.
    if (!append_page_confidence(result)) return std::nullopt;
    return result;
}
