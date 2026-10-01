// history::describe's artifact branch (53.16 RVA b8f1d1..b8f28b).
// The caption and item body have independent native paragraph boundaries.
// Their semantics are copied from the selected artifact and item, never
// recovered from a screen row or the producer's complete English paragraph.
#include "native_history_item_base_data.inc"
#include "native_history_written_content.inc"
#include "native_history_item_writing.inc"
#include "native_history_item_improvements.inc"
#include "native_history_item_extras.inc"
#include "native_history_slab_data.inc"

static bool capture_native_history_artifact_page_item(uintptr_t item,
        NativeHistoryEventData &data) {
    int32_t type = -1;
    if (!item || !native_history_typed_getter(item, 0, type) || type < 0 || type > 92)
        return false;
    data.fields["item.type"] = {type};
    if (type == 87) {
        // item_slabst::getMaterial/getMaterialIndex (fca10/fca20) read
        // +b8/+bc. Its a82c10 label uses the solid material adjective.
        // Share the material snapshot with improvements, including a named
        // material owner, instead of rejecting that valid item state.
        int16_t material = -1;
        int32_t index = -1;
        if (!native_history_copy(native_history_object_field(item, "", 0xb8), material) ||
            !native_history_copy(native_history_object_field(item, "", 0xbc), index) ||
            !capture_native_history_improvement_material(data, "item.artifact", material, index, 0, true))
            return false;
        data.fields["item.artifact"] = {type, -1, material, index};
        data.texts["item.artifact.type"] = "slab";
        return true;
    }
    // Other item classes retain the existing typed-label adapter. This is
    // one independently formatted object label, not the introduction/body.
    if (!g_real_native_history_artifact_item) return false;
    NativeHistoryPageString label;
    g_real_native_history_artifact_item(reinterpret_cast<void *>(item), &label.value, true, -1);
    std::string_view value;
    if (!native_string_view(&label.value, &value, kNativeHistoryStringLimit) || value.empty())
        return false;
    data.texts["item.artifact"] = std::string(value);
    return true;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_artifact_introduction(
        int32_t artifact_id) {
    const uintptr_t artifact = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Artifact, artifact_id);
    uintptr_t item = 0;
    uint8_t named = 0;
    if (!artifact || !native_history_copy(artifact + 0x90, item) || !item ||
        !native_history_copy(artifact + 0x7a, named) || named > 1) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::ArtifactIntroduction;
    auto &data = page.data;
    data.artifact_id = artifact_id;
    data.fields["artifact.named"] = {named};
    if (!capture_native_history_artifact_page_item(item, data) ||
        !populate_native_history_subjects(data)) return std::nullopt;
    return page;
}

static std::optional<NativeHistoryPageData> snapshot_native_history_artifact_description(
        int32_t artifact_id) {
    const uintptr_t artifact = native_history_find_subject(native_history_profile_base(),
        NativeHistoryObjectKind::Artifact, artifact_id);
    uintptr_t item = 0;
    if (!artifact || !native_history_copy(artifact + 0x90, item) || !item) return std::nullopt;
    NativeHistoryPageData page;
    page.kind = NativeHistoryPageKind::ArtifactDescription;
    auto &data = page.data;
    data.artifact_id = artifact_id;
    data.fields["confidence"] = {0}; // Supplied by b8fd35's actual argument.
    if (!capture_native_history_artifact_page_item(item, data) ||
        !capture_native_history_item_base(item, data) ||
        !capture_native_history_item_improvements(item, data, "improvements") ||
        !capture_native_history_item_writing(item, data, "writing") ||
        !capture_native_history_item_extras(item, data, "extras") ||
        !capture_native_history_slab_data(item, data) ||
        !populate_native_history_subjects(data)) return std::nullopt;
    return page;
}
