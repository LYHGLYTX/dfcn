#pragma once

// Included after NativeHistoryEventData is defined. Page records have their
// own discriminator and never impersonate a history_eventst ID or subtype.
enum class NativeHistoryPageKind : uint8_t {
    FigureBiography, MilitaryParticipation, RelatedFigure, RelatedEntity,
    RelatedSite, SectionHeading, CollectionIntroduction, AgeIntroduction, KillSummary,
    ArtifactIntroduction, ArtifactDescription, RegionIntroduction, EntityIntroduction,
    SiteIntroduction, StructureIntroduction,
    Count // Keep last: the shared reload format accepts exactly these page kinds.
};

struct NativeHistoryPageData {
    NativeHistoryPageKind kind = NativeHistoryPageKind::FigureBiography;
    NativeHistoryEventData data;
};
