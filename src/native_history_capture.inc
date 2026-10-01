// Owned event records and live draw identities. Saved game addresses are keys,
// never pointers dereferenced by the registry or by the overlay.
static std::mutex g_native_history_mutex;
static std::vector<std::shared_ptr<const NativeHistoryDocument>> g_native_history_documents;
// Changes only when owned records are replaced, invalidated or relaid out.
// A visible-frame query must not rebuild an index of an entire age's events.
static uint64_t g_native_history_registry_revision = 1;
static void advance_native_history_registry_revision() {
    if (++g_native_history_registry_revision == 0) ++g_native_history_registry_revision;
}
static uint64_t native_history_registry_revision() {
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    return g_native_history_registry_revision;
}
struct NativeHistoryTokenOwner {
    std::shared_ptr<const NativeHistoryDocument> document;
    size_t index = 0;
};
static std::unordered_map<uintptr_t, NativeHistoryTokenOwner> g_native_history_token_owners;
static std::vector<std::shared_ptr<const NativeHistoryRegion>> g_native_history_regions;
struct NativeHistoryRegionOwner {
    std::shared_ptr<const NativeHistoryRegion> region;
    size_t index = 0;
};
static std::unordered_map<uintptr_t, NativeHistoryRegionOwner> g_native_history_region_owners;
static std::vector<NativeHistoryUnboundDraw> g_native_history_region_draws;
static uint64_t g_native_history_sequence = 0;
static std::vector<NativeHistoryDraw> g_native_history_draws;
static uint64_t g_native_history_draw_epoch = 0;
static int g_native_history_last_draw_x = -1, g_native_history_last_draw_y = -1;
static uintptr_t g_native_history_last_draw_identity = 0;
static std::string g_native_history_last_draw_source;
// Legends has an explicit native render boundary. SDL presentation epochs
// and decreasing cursor positions are not boundaries inside that render.
static thread_local bool g_native_history_legends_rendering = false;

static void begin_native_history_draw_pass() {
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    g_native_history_draws.clear();
    g_native_history_region_draws.clear();
    g_native_history_draw_epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
    g_native_history_last_draw_x = g_native_history_last_draw_y = -1;
    g_native_history_last_draw_identity = 0;
    g_native_history_last_draw_source.clear();
}

// Caller holds the registry mutex. Build the index before replacing either
// half, so an allocation failure cannot publish partial token ownership.
static void commit_native_history_documents(
        std::vector<std::shared_ptr<const NativeHistoryDocument>> documents) {
    if (documents.size() > kNativeHistoryCaptureDocuments)
        throw std::runtime_error("Too many native history documents");
    size_t remaining_tokens = kNativeHistoryCaptureTokens;
    decltype(g_native_history_token_owners) owners;
    for (const auto &document : documents) {
        if (!document || !document->owner || document->tokens.empty() ||
            document->tokens.size() > kNativeHistoryDocumentTokens || document->tokens.size() > remaining_tokens)
            throw std::runtime_error("Invalid native history document");
        remaining_tokens -= document->tokens.size();
        for (size_t i = 0; i < document->tokens.size(); ++i) {
            const uintptr_t identity = document->tokens[i].identity;
            if (!identity || !owners.emplace(identity, NativeHistoryTokenOwner{document, i}).second)
                throw std::runtime_error("Duplicate native history token identity");
        }
    }
    g_native_history_documents.swap(documents);
    g_native_history_token_owners.swap(owners);
    advance_native_history_registry_revision();
}

static auto index_native_history_regions(
        const std::vector<std::shared_ptr<const NativeHistoryRegion>> &regions) {
    decltype(g_native_history_region_owners) owners;
    size_t remaining = kNativeHistoryCaptureTokens;
    for (const auto &region : regions) {
        if (!region || !region->owner || region->tokens.empty() || region->tokens.size() > remaining)
            throw std::runtime_error("Invalid native history region");
        remaining -= region->tokens.size();
        for (size_t i = 0; i < region->tokens.size(); ++i) {
            const auto &token = region->tokens[i];
            if (!token.identity || token.source.size() > kNativeHistoryStringLimit ||
                !owners.emplace(token.identity, NativeHistoryRegionOwner{region, i}).second)
                throw std::runtime_error("Invalid native history region token");
        }
    }
    return owners;
}

static bool remember_native_history_region(uintptr_t owner, std::vector<NativeHistoryToken> tokens) {
    if (!owner || tokens.size() > kNativeHistoryCaptureTokens) return false;
    if (tokens.empty()) {
        // The real parser is about to replace this box. Invalidation must
        // not allocate: a failed allocation cannot leave old snapshots live
        // while native word addresses are subsequently reused.
        std::lock_guard<std::mutex> lock(g_native_history_mutex);
        // Parser-owned word objects can be reused with the same short text.
        // A previous draw cannot confirm that the replacement page painted.
        g_native_history_last_draw_identity = 0;
        g_native_history_last_draw_source.clear();
        std::erase_if(g_native_history_token_owners,
            [&](const auto &entry) { return entry.second.document->owner == owner; });
        std::erase_if(g_native_history_documents,
            [&](const auto &document) { return document->owner == owner; });
        std::erase_if(g_native_history_region_owners,
            [&](const auto &entry) { return entry.second.region->owner == owner; });
        std::erase_if(g_native_history_regions,
            [&](const auto &region) { return region->owner == owner; });
        std::erase_if(g_native_history_draws,
            [&](const auto &draw) { return draw.document && draw.document->owner == owner; });
        std::erase_if(g_native_history_region_draws,
            [&](const auto &draw) { return draw.owner == owner; });
        advance_native_history_registry_revision();
        return true;
    }
    auto region = std::make_shared<NativeHistoryRegion>();
    region->owner = owner;
    region->tokens = std::move(tokens);
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    std::unordered_set<const NativeHistoryRegion *> replaced;
    for (const auto &token : region->tokens) {
        const auto found = g_native_history_region_owners.find(token.identity);
        if (found != g_native_history_region_owners.end()) replaced.insert(found->second.region.get());
    }
    std::vector<std::shared_ptr<const NativeHistoryRegion>> next;
    size_t count = region->tokens.size();
    const size_t retention_limit = std::max(kNativeHistoryRetainedTokens, count);
    for (const auto &previous : g_native_history_regions) {
        if (previous->owner == owner || replaced.contains(previous.get())) continue;
        count += previous->tokens.size();
        next.push_back(previous);
    }
    size_t discard = 0;
    while (count > retention_limit) count -= next[discard++]->tokens.size();
    if (discard) next.erase(next.begin(), next.begin() + discard);
    if (!region->tokens.empty()) next.push_back(std::move(region));
    auto owners = index_native_history_regions(next);
    // A newly produced region supersedes that box's previous semantic
    // snapshots even when the new capture is incomplete. Reused native word
    // addresses must not keep an earlier event alive through source equality.
    decltype(g_native_history_documents) documents;
    for (const auto &document : g_native_history_documents) {
        if (document->owner == owner) continue;
        const bool overlap = std::any_of(document->tokens.begin(), document->tokens.end(),
            [&](const auto &token) {
                const auto current = owners.find(token.identity);
                return current != owners.end() && current->second.region->owner == owner;
            });
        if (!overlap) documents.push_back(document);
    }
    commit_native_history_documents(std::move(documents));
    g_native_history_regions.swap(next);
    g_native_history_region_owners.swap(owners);
    return true;
}

static void clear_native_history_documents() {
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    g_native_history_documents.clear();
    g_native_history_token_owners.clear();
    g_native_history_regions.clear();
    g_native_history_region_owners.clear();
    g_native_history_region_draws.clear();
    g_native_history_sequence = 0;
    g_native_history_draws.clear();
    g_native_history_draw_epoch = 0;
    g_native_history_last_draw_x = g_native_history_last_draw_y = -1;
    g_native_history_last_draw_identity = 0;
    g_native_history_last_draw_source.clear();
    advance_native_history_registry_revision();
}

static std::vector<std::shared_ptr<const NativeHistoryDocument>> captured_native_history_documents() {
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    return g_native_history_documents;
}

// Publish native records in one transaction. A producer can submit a page in
// several batches (retained collection body, then its introduction). Budget
// the full owners being updated, not just the newest batch, and evict older
// owners as whole pages rather than leaving a partially retained timeline.
static bool remember_native_history_documents(
        const std::vector<std::shared_ptr<NativeHistoryDocument>> &documents) {
    if (documents.empty()) return true;
    if (documents.size() > kNativeHistoryCaptureDocuments) return false;
    size_t incoming_tokens = 0;
    std::unordered_set<uintptr_t> incoming_owners;
    for (const auto &document : documents) {
        if (!document || !document->owner || document->tokens.empty() ||
            document->tokens.size() > kNativeHistoryDocumentTokens ||
            document->tokens.size() > kNativeHistoryCaptureTokens - incoming_tokens) return false;
        incoming_tokens += document->tokens.size();
        incoming_owners.insert(document->owner);
    }
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    std::unordered_set<const NativeHistoryDocument *> replaced;
    for (const auto &document : documents)
        for (const auto &token : document->tokens) {
            const auto owner = g_native_history_token_owners.find(token.identity);
            if (owner != g_native_history_token_owners.end()) replaced.insert(owner->second.document.get());
        }
    std::vector<std::shared_ptr<const NativeHistoryDocument>> next;
    next.reserve(g_native_history_documents.size() + documents.size());
    size_t token_count = incoming_tokens;
    size_t protected_tokens = incoming_tokens, protected_documents = documents.size();
    struct PageBudget { size_t tokens = 0, documents = 0; };
    std::unordered_map<uintptr_t, PageBudget> older_pages;
    std::vector<uintptr_t> eviction_order;
    for (const auto &previous : g_native_history_documents) {
        if (replaced.contains(previous.get())) continue;
        const size_t tokens = previous->tokens.size();
        if (incoming_owners.contains(previous->owner)) {
            if (tokens > kNativeHistoryCaptureTokens - protected_tokens ||
                    protected_documents == kNativeHistoryCaptureDocuments) return false;
            protected_tokens += tokens;
            ++protected_documents;
        } else {
            auto [page, inserted] = older_pages.try_emplace(previous->owner);
            if (inserted) eviction_order.push_back(previous->owner);
            page->second.tokens += tokens;
            ++page->second.documents;
        }
        token_count += tokens;
        next.push_back(previous);
    }
    // A small follow-up must not shrink a large live owner's budget back to
    // the ordinary cache target. Hard capture limits still apply to the
    // combined page, including every already-retained non-replaced record.
    const size_t retention_limit = std::max(kNativeHistoryRetainedTokens, protected_tokens);
    size_t document_count = next.size() + documents.size();
    std::unordered_set<uintptr_t> evicted_owners;
    for (const uintptr_t owner : eviction_order) {
        if (document_count <= kNativeHistoryCaptureDocuments && token_count <= retention_limit) break;
        const auto &page = older_pages.at(owner);
        token_count -= page.tokens;
        document_count -= page.documents;
        evicted_owners.insert(owner);
    }
    if (!evicted_owners.empty())
        std::erase_if(next, [&](const auto &document) { return evicted_owners.contains(document->owner); });
    uint64_t sequence = g_native_history_sequence;
    for (const auto &document : documents) {
        sequence = sequence == UINT64_MAX ? 1 : sequence + 1;
        document->sequence = sequence;
        next.push_back(document);
    }
    commit_native_history_documents(std::move(next));
    g_native_history_sequence = sequence;
    return true;
}

static void remember_native_history_document(std::shared_ptr<NativeHistoryDocument> document) {
    remember_native_history_documents({std::move(document)});
}

static bool same_native_history_token(const NativeHistoryToken &a, const NativeHistoryToken &b) {
    return a.identity == b.identity && a.source == b.source && a.color == b.color &&
        a.link_type == b.link_type && a.link_id == b.link_id && a.link_subid == b.link_subid;
}

// The native layout callback prepares only verified document ranges. Do not
// overwrite a newer producer update if it published while those were copied.
static uint64_t refresh_native_history_documents(
        const std::vector<std::shared_ptr<const NativeHistoryDocument>> &previous,
        std::vector<std::shared_ptr<const NativeHistoryDocument>> updated) {
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    if (g_native_history_documents != previous) return 0;
    if (updated != previous) commit_native_history_documents(std::move(updated));
    return g_native_history_registry_revision;
}

// The unique chronicle addst call supplies a live NativeString address and
// cursor. Native word-local px/py are not screen coordinates after scrolling.
static void remember_native_history_draw(uintptr_t identity, std::string_view source,
        int x, int y, int clip_left, int clip_right) {
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    const uint64_t epoch = g_embark_item_capture_epoch.load(std::memory_order_acquire);
    if (!g_native_history_legends_rendering && g_native_history_draw_epoch != epoch) {
        g_native_history_draws.clear();
        g_native_history_region_draws.clear();
        g_native_history_draw_epoch = epoch;
        g_native_history_last_draw_x = g_native_history_last_draw_y = -1;
        g_native_history_last_draw_identity = 0;
        g_native_history_last_draw_source.clear();
    }
    if (source.empty()) return;
    // Observe every native token, including unsupported events, so a restarted
    // draw loop cannot retain a previous pass's supported event rows.
    if (!g_native_history_legends_rendering && (y < g_native_history_last_draw_y ||
        (y == g_native_history_last_draw_y && x <= g_native_history_last_draw_x))) {
        g_native_history_draws.clear();
        g_native_history_region_draws.clear();
    }
    g_native_history_last_draw_x = x;
    g_native_history_last_draw_y = y;
    g_native_history_last_draw_identity = identity;
    g_native_history_last_draw_source.assign(source);
    const auto region = g_native_history_region_owners.find(identity);
    if (region != g_native_history_region_owners.end() &&
            region->second.index < region->second.region->tokens.size() &&
            region->second.region->tokens[region->second.index].source == source &&
            g_native_history_region_draws.size() < kNativeHistoryCaptureTokens)
        g_native_history_region_draws.push_back({region->second.region->owner,
            identity, std::string(source), x, y, epoch, clip_left, clip_right});
    const auto found = g_native_history_token_owners.find(identity);
    if (found == g_native_history_token_owners.end()) return;
    const auto &owner = found->second;
    if (owner.index >= owner.document->tokens.size() ||
        owner.document->tokens[owner.index].source != source) return;
    if (g_native_history_draws.size() < kNativeHistoryCaptureTokens)
        g_native_history_draws.push_back({owner.document, owner.index, x, y, epoch,
            clip_left, clip_right});
}

static std::vector<NativeHistoryUnboundDraw> captured_native_history_unbound_draws() {
    if (g_native_history_frame) return g_native_history_frame->unbound;
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    std::vector<NativeHistoryUnboundDraw> result;
    std::unordered_map<uintptr_t, const NativeHistoryDraw *> bound;
    for (const auto &draw : g_native_history_draws) {
        if (!draw.document || draw.token_index >= draw.document->tokens.size()) continue;
        const auto &token = draw.document->tokens[draw.token_index];
        const auto owner = g_native_history_token_owners.find(token.identity);
        if (owner == g_native_history_token_owners.end() ||
                owner->second.index != draw.token_index ||
                owner->second.document->sequence != draw.document->sequence ||
                owner->second.document->owner != draw.document->owner ||
                owner->second.index >= owner->second.document->tokens.size() ||
                !same_native_history_token(token, owner->second.document->tokens[owner->second.index])) continue;
        bound[token.identity] = &draw;
    }
    for (const auto &draw : g_native_history_region_draws) {
        const auto region = g_native_history_region_owners.find(draw.identity);
        if (region == g_native_history_region_owners.end() ||
                region->second.region->owner != draw.owner ||
                region->second.index >= region->second.region->tokens.size() ||
                region->second.region->tokens[region->second.index].source != draw.source) continue;
        const auto owner = bound.find(draw.identity);
        if (owner != bound.end() && owner->second->document->owner == draw.owner &&
                owner->second->x == draw.x && owner->second->y == draw.y &&
                owner->second->clip_left == draw.clip_left &&
                owner->second->clip_right == draw.clip_right &&
                owner->second->document->tokens[owner->second->token_index].source == draw.source) continue;
        result.push_back(draw);
    }
    return result;
}

static std::vector<NativeHistoryDraw> captured_native_history_draws() {
    if (g_native_history_frame) return g_native_history_frame->draws;
    std::lock_guard<std::mutex> lock(g_native_history_mutex);
    // Presenting retained glyphs does not repaint the native chronicle.
    // Keep the last actual draw until its producer starts another pass or
    // capture is cleared. The consumer verifies the active native page and
    // every source byte/position before allowing these owned tokens to draw.
    std::vector<NativeHistoryDraw> current;
    current.reserve(g_native_history_draws.size());
    for (const auto &draw : g_native_history_draws) {
        if (!draw.document || draw.token_index >= draw.document->tokens.size()) continue;
        const auto &token = draw.document->tokens[draw.token_index];
        const auto found = g_native_history_token_owners.find(token.identity);
        if (found == g_native_history_token_owners.end()) continue;
        const auto &owner = found->second;
        if (!owner.document || owner.index != draw.token_index ||
                owner.index >= owner.document->tokens.size() ||
                owner.document->sequence != draw.document->sequence ||
                owner.document->owner != draw.document->owner ||
                !same_native_history_token(token, owner.document->tokens[owner.index]))
            continue;
        // A layout refresh may clone the same record with new box coordinates.
        // Keep this draw's layout, which belongs to the glyphs actually shown;
        // a replaced event or reused token address must not survive the check.
        current.push_back(draw);
    }
    return current;
}
