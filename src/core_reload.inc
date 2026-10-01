// Included after the core's public entry points. No STL objects,
// deleters, string_views or callback pointers survive in the resident loader.
namespace dfcn {

class CaptureWriter {
    std::string bytes_;
public:
    void number(uint64_t value) {
        for (unsigned i = 0; i < 8; ++i) {
            bytes_.push_back(static_cast<char>(value & 255));
            value >>= 8;
        }
    }
    void signed32(int32_t value) { number(static_cast<uint32_t>(value)); }
    void string(const std::string &value) {
        number(value.size());
        bytes_.append(value);
    }
    void strings(const std::vector<std::string> &values) {
        number(values.size());
        for (const auto &value : values) string(value);
    }
    bool send(DfcnStateSink sink, void *context) const {
        return sink && sink(context, bytes_.data(), bytes_.size());
    }
};

class CaptureReader {
    std::string_view bytes_;
public:
    CaptureReader(const void *data, size_t size)
        : bytes_(static_cast<const char *>(data), size) {}
    uint64_t number() {
        if (bytes_.size() < 8) throw std::runtime_error("Truncated capture state");
        uint64_t value = 0;
        for (unsigned i = 0; i < 8; ++i)
            value |= uint64_t(static_cast<unsigned char>(bytes_[i])) << (8 * i);
        bytes_.remove_prefix(8);
        return value;
    }
    size_t count(size_t maximum) {
        const uint64_t value = number();
        if (value > maximum) throw std::runtime_error("Invalid capture state count");
        return static_cast<size_t>(value);
    }
    int32_t signed32() {
        const uint32_t bits = static_cast<uint32_t>(count(UINT32_MAX));
        int32_t value = 0;
        std::memcpy(&value, &bits, sizeof(value));
        return value;
    }
    int16_t signed16() {
        const int32_t value = signed32();
        if (value < INT16_MIN || value > INT16_MAX)
            throw std::runtime_error("Invalid capture signed field");
        return static_cast<int16_t>(value);
    }
    std::string string(size_t maximum = SIZE_MAX) {
        const size_t size = count(std::min(maximum, bytes_.size()));
        if (size > bytes_.size()) throw std::runtime_error("Truncated capture string");
        std::string value(bytes_.substr(0, size));
        bytes_.remove_prefix(size);
        return value;
    }
    std::vector<std::string> strings() {
        std::vector<std::string> values(count(262144));
        for (auto &value : values) value = string();
        return values;
    }
    bool done() const { return bytes_.empty(); }
};

// These bounds match the native history registry and live rich box. Signed
// fields use an explicit uint32 bit pattern, including the native -1 sentinel.
static constexpr size_t kHistoryCaptureDocuments = kNativeHistoryCaptureDocuments;
static constexpr size_t kHistoryCaptureTokens = kNativeHistoryCaptureTokens;
static constexpr size_t kHistoryCaptureDocumentTokens = kNativeHistoryDocumentTokens;
static constexpr size_t kHistoryCaptureSubjects = kNativeHistoryNodeSubjects;
static constexpr size_t kHistoryCaptureFields = kNativeHistoryNodeFields;
static constexpr size_t kHistoryCaptureFieldValues = kNativeHistoryNodeValues;
static constexpr size_t kHistoryCaptureString = kNativeHistoryStringLimit;
// Legacy events start with kind 0..3. This discriminator preserves the old
// no-children format while making every new event's tree layout explicit.
static constexpr uint64_t kHistoryCaptureEventTreeFormat = 0x4446434e48495302ULL;
// Optional tail: old cores saved no native producer-region registry. The new
// reader accepts those snapshots and lets native page recovery rebuild it.
static constexpr uint64_t kHistoryCaptureRegionsFormat = 0x4446434e52454701ULL;
static constexpr uint64_t kHistoryCapturePageFormat = 0x4446434e50414701ULL;
static std::string restore_history_string(CaptureReader &in, NativeHistoryTreeBudget &budget,
        size_t maximum = kHistoryCaptureString) {
    auto value = in.string(std::min(maximum, budget.strings));
    budget.strings -= value.size();
    return value;
}

static void save_history_name(CaptureWriter &out, const NativeHistoryName &name) {
    out.number(name.has_name);
    out.signed32(name.language);
    out.signed32(name.nickname_mode);
    out.signed32(name.type);
    out.string(name.first_name);
    out.string(name.nickname);
    for (const auto &word : name.words) {
        out.string(word.id);
        out.signed32(word.part_of_speech);
        out.number(word.has_form);
    }
}

static NativeHistoryName restore_history_name(CaptureReader &in, NativeHistoryTreeBudget &budget) {
    NativeHistoryName name;
    name.has_name = in.count(1) != 0;
    name.language = in.signed32();
    name.nickname_mode = in.signed32();
    if (name.nickname_mode < 0 || name.nickname_mode > 2)
        throw std::runtime_error("Invalid history nickname mode");
    name.type = in.signed16();
    name.first_name = restore_history_string(in, budget);
    name.nickname = restore_history_string(in, budget);
    for (auto &word : name.words) {
        word.id = restore_history_string(in, budget);
        word.part_of_speech = in.signed16();
        word.has_form = in.count(1) != 0;
        // An absent WORD slot retains its native unused POS value. Only a
        // populated WORD is required to index one of the nine language forms.
        if (!word.id.empty() && (word.part_of_speech < 0 || word.part_of_speech > 8))
            throw std::runtime_error("Invalid history word form");
    }
    return name;
}

static void save_history_event_node(CaptureWriter &out, const NativeHistoryEventData &event) {
    out.number(kHistoryCaptureEventTreeFormat);
    out.number(static_cast<uint8_t>(event.kind));
    for (const int32_t value : {event.native_type, event.id, event.year, event.seconds, event.goal,
            event.artifact_id, event.creator_unit_id, event.actor_id, event.entity_id,
            event.site_id, event.site_entity_id, event.position_id,
            event.circumstance, event.circumstance_data, event.reason, event.reason_data})
        out.signed32(value);
    out.number(event.flags);
    out.string(event.position);
    out.number(event.texts.size());
    for (const auto &[key, value] : event.texts) {
        out.string(key);
        out.string(value);
    }
    out.number(event.context.size());
    for (const auto &[key, value] : event.context) {
        out.string(key);
        out.signed32(value);
    }
    out.number(event.fields.size());
    for (const auto &[key, values] : event.fields) {
        out.string(key);
        out.number(values.size());
        for (int32_t value : values) out.signed32(value);
    }
    out.number(event.subjects.size());
    for (const auto &subject : event.subjects) {
        out.number(static_cast<uint8_t>(subject.kind));
        out.signed32(subject.id);
        out.signed32(subject.subid);
        out.signed32(subject.native_type);
        save_history_name(out, subject.name);
        out.string(subject.species);
        out.string(subject.label_key);
        out.string(subject.raw_title);
    }
    out.number(event.children.size());
    for (const auto &[id, child] : event.children) {
        out.signed32(id);
        save_history_event_node(out, *child);
    }
}

static void save_history_event(CaptureWriter &out, const NativeHistoryEventData &event) {
    if (!native_history_tree_within_limits(event))
        throw std::runtime_error("Invalid history capture tree");
    save_history_event_node(out, event);
}

static NativeHistoryEventData restore_history_event_node(CaptureReader &in,
        NativeHistoryTreeBudget &budget, std::vector<int32_t> &ancestors, size_t depth,
        bool page_root = false) {
    if (depth >= kNativeHistoryTreeDepth || !NativeHistoryTreeBudget::take(budget.nodes, 1))
        throw std::runtime_error("History capture tree too deep or large");
    NativeHistoryEventData event;
    const uint64_t discriminator = in.number();
    const bool has_children = discriminator == kHistoryCaptureEventTreeFormat;
    const uint64_t kind = has_children ? in.number() : discriminator;
    if (kind > static_cast<uint8_t>(NativeHistoryEventKind::PackedRelationship))
        throw std::runtime_error("Invalid history event kind");
    event.kind = static_cast<NativeHistoryEventKind>(kind);
    for (int32_t *value : {&event.native_type, &event.id, &event.year, &event.seconds, &event.goal,
            &event.artifact_id, &event.creator_unit_id, &event.actor_id, &event.entity_id,
            &event.site_id, &event.site_entity_id, &event.position_id,
            &event.circumstance, &event.circumstance_data, &event.reason, &event.reason_data})
        *value = in.signed32();
    if (page_root && depth == 0
            ? event.id != -1 || event.native_type != -1 || event.kind != NativeHistoryEventKind::Unsupported
            : !native_history_event_identity_valid(event))
        throw std::runtime_error("Invalid history event identity");
    if (std::find(ancestors.begin(), ancestors.end(), event.id) != ancestors.end())
        throw std::runtime_error("Cyclic history capture tree");
    ancestors.push_back(event.id);
    event.flags = static_cast<uint32_t>(in.count(UINT32_MAX));
    event.position = restore_history_string(in, budget);
    const size_t text_count = in.count(std::min(kHistoryCaptureFields, budget.fields));
    budget.fields -= text_count;
    for (size_t i = 0; i < text_count; ++i) {
        auto key = restore_history_string(in, budget, 128);
        auto value = restore_history_string(in, budget);
        if (key.empty() || !event.texts.emplace(std::move(key), std::move(value)).second)
            throw std::runtime_error("Invalid history text key");
    }
    const size_t context_count = in.count(std::min(size_t{64}, budget.fields));
    budget.fields -= context_count;
    for (size_t i = 0; i < context_count; ++i) {
        auto key = restore_history_string(in, budget, 128);
        const int32_t value = in.signed32();
        if (key.empty() || !event.context.emplace(std::move(key), value).second)
            throw std::runtime_error("Invalid history context key");
    }
    const size_t field_count = in.count(std::min(kHistoryCaptureFields, budget.fields));
    budget.fields -= field_count;
    size_t remaining_values = kHistoryCaptureFieldValues;
    for (size_t i = 0; i < field_count; ++i) {
        auto key = restore_history_string(in, budget, 128);
        if (key.empty() || event.fields.contains(key))
            throw std::runtime_error("Invalid history field key");
        const size_t value_count = in.count(std::min(remaining_values, budget.values));
        remaining_values -= value_count;
        budget.values -= value_count;
        std::vector<int32_t> values(value_count);
        for (auto &value : values) value = in.signed32();
        event.fields.emplace(std::move(key), std::move(values));
    }
    const size_t count = in.count(std::min(kHistoryCaptureSubjects, budget.subjects));
    budget.subjects -= count;
    event.subjects.reserve(count);
    std::set<std::tuple<uint8_t, int32_t, int32_t>> identities;
    for (size_t i = 0; i < count; ++i) {
        NativeHistorySubject subject;
        subject.kind = static_cast<NativeHistoryObjectKind>(in.count(
            static_cast<uint8_t>(NativeHistoryObjectKind::World)));
        subject.id = in.signed32();
        subject.subid = in.signed32();
        subject.native_type = in.signed32();
        const auto identity = std::tuple{static_cast<uint8_t>(subject.kind), subject.id, subject.subid};
        if (subject.id < -1 || !identities.insert(identity).second)
            throw std::runtime_error("Invalid history subject identity");
        subject.name = restore_history_name(in, budget);
        // A creature label can include both the original singular race and
        // its native curse suffix, each copied with the normal string bound.
        subject.species = restore_history_string(in, budget, 2 * kHistoryCaptureString + 32);
        subject.label_key = restore_history_string(in, budget, 128);
        subject.raw_title = restore_history_string(in, budget);
        event.subjects.push_back(std::move(subject));
    }
    if (has_children) {
        const size_t child_count = in.count(budget.nodes);
        for (size_t index = 0; index < child_count; ++index) {
            const int32_t id = in.signed32();
            if (id < 0 || event.children.contains(id))
                throw std::runtime_error("Invalid child history identity");
            auto child = std::make_shared<NativeHistoryEventData>(
                restore_history_event_node(in, budget, ancestors, depth + 1));
            if (child->id != id) throw std::runtime_error("Mismatched child history identity");
            event.children.emplace(id, std::move(child));
        }
    }
    ancestors.pop_back();
    return event;
}

static NativeHistoryEventData restore_history_event(CaptureReader &in) {
    NativeHistoryTreeBudget budget;
    std::vector<int32_t> ancestors;
    return restore_history_event_node(in, budget, ancestors, 0);
}

static void save_history_document(CaptureWriter &out, const NativeHistoryDocument &document) {
    if (!document.owner || !document.sequence || document.native_source.empty() ||
        document.native_source.size() > kHistoryCaptureString || document.tokens.empty() ||
        document.tokens.size() > kHistoryCaptureDocumentTokens)
        throw std::runtime_error("Invalid history document");
    for (const auto &token : document.tokens)
        if (!token.identity || token.source.size() > kHistoryCaptureString ||
            token.color < 0 || token.color > 0xffffff || token.link_type < -1 || token.link_type > 11)
            throw std::runtime_error("Invalid history token");
    if (document.page) {
        if (static_cast<uint8_t>(document.page->kind) >= static_cast<uint8_t>(NativeHistoryPageKind::Count) ||
            !native_history_tree_within_limits(document.page->data, true))
            throw std::runtime_error("Invalid native history page fields");
        out.number(kHistoryCapturePageFormat);
        out.number(static_cast<uint8_t>(document.page->kind));
    }
    out.number(document.owner);
    out.number(document.sequence);
    if (document.page) save_history_event_node(out, document.page->data);
    else save_history_event(out, document.event);
    out.string(document.native_source);
    out.number(document.tokens.size());
    for (const auto &token : document.tokens) {
        out.number(token.identity);
        out.string(token.source);
        out.signed32(token.x);
        out.signed32(token.y);
        out.signed32(token.color);
        out.signed32(token.link_type);
        out.signed32(token.link_id);
        out.signed32(token.link_subid);
    }
}

static std::shared_ptr<const NativeHistoryDocument> restore_history_document(
        CaptureReader &in, size_t &remaining_tokens) {
    auto document = std::make_shared<NativeHistoryDocument>();
    const uint64_t header = in.number();
    if (header == kHistoryCapturePageFormat) {
        document->page.emplace();
        document->page->kind = static_cast<NativeHistoryPageKind>(
            in.count(static_cast<uint8_t>(NativeHistoryPageKind::Count) - 1));
        document->owner = in.count(UINTPTR_MAX);
    } else {
        if (header > UINTPTR_MAX) throw std::runtime_error("Invalid history owner");
        document->owner = static_cast<uintptr_t>(header);
    }
    document->sequence = in.number();
    if (!document->owner || !document->sequence)
        throw std::runtime_error("Invalid history document identity");
    if (document->page) {
        NativeHistoryTreeBudget budget;
        std::vector<int32_t> ancestors;
        document->page->data = restore_history_event_node(in, budget, ancestors, 0, true);
    } else document->event = restore_history_event(in);
    document->native_source = in.string(kHistoryCaptureString);
    const size_t count = in.count(std::min(remaining_tokens, kHistoryCaptureDocumentTokens));
    if (!count || document->native_source.empty())
        throw std::runtime_error("Empty history document");
    remaining_tokens -= count;
    document->tokens.reserve(count);
    for (size_t i = 0; i < count; ++i) {
        NativeHistoryToken token;
        token.identity = in.count(UINTPTR_MAX);
        token.source = in.string(kHistoryCaptureString);
        token.x = in.signed32();
        token.y = in.signed32();
        token.color = in.signed32();
        token.link_type = in.signed32();
        token.link_id = in.signed32();
        token.link_subid = in.signed32();
        if (!token.identity || token.color < 0 || token.color > 0xffffff ||
            token.link_type < -1 || token.link_type > 11)
            throw std::runtime_error("Invalid history token");
        document->tokens.push_back(std::move(token));
    }
    return document;
}

static bool save_reload_captures(DfcnStateSink sink, void *context) {
    try {
        std::scoped_lock lock(g_native_paragraph_mutex, g_native_knowledge_mutex, g_native_history_mutex);
        CaptureWriter out;
        out.number(DFCN_CORE_ABI);
        out.number(g_native_paragraph_sequence);
        out.number(g_native_paragraph_captures.size());
        for (const auto &capture : g_native_paragraph_captures) {
            out.number(capture.owner);
            out.number(capture.paragraph_width);
            out.string(capture.source);
            out.strings(capture.wrapped_lines);
            out.number(capture.sequence);
            out.number(capture.first_line);
        }
        out.number(g_native_knowledge_document_order.size());
        for (uintptr_t owner : g_native_knowledge_document_order) {
            const auto &document = *g_native_knowledge_documents.at(owner);
            out.number(owner);
            out.string(document.source);
            out.number(document.width);
            // Reuse the existing kind slot: 0/1 snapshots from older cores
            // remain readable; 2 denotes a complete Thoughts document.
            out.number(document.thoughts ? 2 : document.personality ? 1 : 0);
            out.number(document.health);
            out.number(document.foreground);
            out.strings(document.rows);
            out.number(document.row_addresses.size());
            for (uintptr_t address : document.row_addresses) out.number(address);
        }
        // Aggregate personality documents can own rows also present in their
        // component boxes. Preserve the exact registry rather than guessing
        // which document should win when rebuilding the row ownership map.
        out.number(g_native_knowledge_row_owners.size());
        for (const auto &[address, owner_line] : g_native_knowledge_row_owners) {
            out.number(address);
            out.number(owner_line.first);
            out.number(owner_line.second);
        }
        if (g_native_history_documents.size() > kHistoryCaptureDocuments) return false;
        size_t remaining_tokens = kHistoryCaptureTokens;
        out.number(g_native_history_sequence);
        out.number(g_native_history_documents.size());
        for (const auto &document : g_native_history_documents) {
            if (!document || document->tokens.size() > remaining_tokens ||
                document->tokens.size() > kHistoryCaptureDocumentTokens ||
                document->event.subjects.size() > kHistoryCaptureSubjects) return false;
            remaining_tokens -= document->tokens.size();
            save_history_document(out, *document);
        }
        out.number(kHistoryCaptureRegionsFormat);
        out.number(g_native_history_regions.size());
        remaining_tokens = kHistoryCaptureTokens;
        for (const auto &region : g_native_history_regions) {
            if (!region || !region->owner || region->tokens.empty() ||
                    region->tokens.size() > remaining_tokens) return false;
            remaining_tokens -= region->tokens.size();
            out.number(region->owner);
            out.number(region->tokens.size());
            for (const auto &token : region->tokens) {
                if (!token.identity || token.source.size() > kHistoryCaptureString) return false;
                out.number(token.identity);
                out.string(token.source);
            }
        }
        return out.send(sink, context);
    } catch (...) {
        log_line("ERROR", "Cannot snapshot native text for core reload");
        return false;
    }
}

static bool restore_reload_captures(const void *data, size_t size) {
    try {
        if (!data || !size) return false;
        CaptureReader in(data, size);
        if (in.number() != DFCN_CORE_ABI) return false;
        const uint64_t sequence = in.number();
        decltype(g_native_paragraph_captures) paragraphs;
        const size_t paragraph_count = in.count(4096);
        for (size_t i = 0; i < paragraph_count; ++i) {
            NativeParagraphCapture capture;
            capture.owner = in.number();
            capture.paragraph_width = static_cast<int>(in.count(INT32_MAX));
            capture.source = in.string();
            capture.display_source = std::make_shared<const std::string>(
                native_announcement_display_source(capture.source));
            capture.wrapped_lines = in.strings();
            capture.sequence = in.number();
            capture.first_line = in.number();
            paragraphs.push_back(std::move(capture));
        }
        decltype(g_native_knowledge_documents) documents;
        decltype(g_native_knowledge_document_order) order;
        decltype(g_native_knowledge_row_owners) rows;
        const size_t document_count = in.count(512);
        for (size_t i = 0; i < document_count; ++i) {
            const uintptr_t owner = in.number();
            auto document = std::make_shared<NativeKnowledgeDocument>();
            document->source = in.string();
            document->width = static_cast<int>(in.count(768));
            const auto kind = in.count(2);
            document->personality = kind == 1;
            document->thoughts = kind == 2;
            document->health = in.count(1) != 0;
            document->foreground = static_cast<unsigned char>(in.count(255));
            document->rows = in.strings();
            const size_t count = in.count(16384);
            if (count != document->rows.size()) return false;
            for (size_t row = 0; row < count; ++row)
                document->row_addresses.push_back(in.number());
            if (!documents.emplace(owner, std::move(document)).second) return false;
            order.push_back(owner);
        }
        const size_t row_count = in.count(512 * 16384);
        for (size_t i = 0; i < row_count; ++i) {
            const uintptr_t address = in.number();
            const uintptr_t owner = in.number();
            const size_t line = in.count(16383);
            const auto found = documents.find(owner);
            if (found == documents.end() || line >= found->second->rows.size() ||
                found->second->row_addresses[line] != address) return false;
            rows.emplace(address, std::make_pair(owner, static_cast<int>(line)));
        }
        const uint64_t history_sequence = in.number();
        decltype(g_native_history_documents) history;
        const size_t history_count = in.count(kHistoryCaptureDocuments);
        history.reserve(history_count);
        size_t remaining_tokens = kHistoryCaptureTokens;
        std::unordered_set<uintptr_t> history_token_ids;
        for (size_t i = 0; i < history_count; ++i) {
            auto document = restore_history_document(in, remaining_tokens);
            for (const auto &token : document->tokens)
                if (!history_token_ids.insert(token.identity).second) return false;
            history.push_back(std::move(document));
        }
        if (!history.empty() && !history_sequence) return false;
        decltype(g_native_history_regions) history_regions;
        if (!in.done()) {
            if (in.number() != kHistoryCaptureRegionsFormat) return false;
            const size_t region_count = in.count(kHistoryCaptureTokens);
            remaining_tokens = kHistoryCaptureTokens;
            history_regions.reserve(region_count);
            for (size_t i = 0; i < region_count; ++i) {
                auto region = std::make_shared<NativeHistoryRegion>();
                region->owner = in.count(UINTPTR_MAX);
                const size_t token_count = in.count(remaining_tokens);
                if (!region->owner || !token_count) return false;
                remaining_tokens -= token_count;
                region->tokens.reserve(token_count);
                for (size_t j = 0; j < token_count; ++j) {
                    NativeHistoryToken token;
                    token.identity = in.count(UINTPTR_MAX);
                    token.source = in.string(kHistoryCaptureString);
                    region->tokens.push_back(std::move(token));
                }
                history_regions.push_back(std::move(region));
            }
        }
        if (!in.done()) return false;
        auto history_region_owners = index_native_history_regions(history_regions);
        NativeParagraphIndex paragraph_index;
        decltype(g_native_paragraph_row_index) paragraph_row_index;
        decltype(g_native_paragraph_prefix_index) paragraph_prefix_index;
        std::array<size_t, 5> paragraph_prefix_lengths{};
        uint64_t paragraph_registry_order = 0;
        for (auto paragraph = paragraphs.begin(); paragraph != paragraphs.end(); ++paragraph) {
            // Saved list order already carries insertion precedence. These
            // process-local indices and opaque pointers are never serialized.
            paragraph->registry_order = ++paragraph_registry_order;
            paragraph_index.emplace(NativeParagraphKey{paragraph->owner,
                paragraph->paragraph_width, paragraph->first_line}, paragraph);
            index_native_paragraph(*paragraph, true, paragraph_row_index,
                paragraph_prefix_index, paragraph_prefix_lengths);
        }
        // Allocate this thread's pending slot before committing any registry.
        // Bumping the generation below invalidates pending work on other game
        // threads without dereferencing their saved event/string identities.
        auto &history_pending = pending_native_history();
        // Only commit fully parsed captures. Saved game addresses are identity
        // keys, never dereferenced here; the existing draw hooks match text too.
        std::scoped_lock lock(g_native_paragraph_mutex, g_native_knowledge_mutex, g_native_history_mutex);
        // Index construction is the final allocating operation. The remaining
        // swaps and scalar assignments cannot leave only some registries restored.
        commit_native_history_documents(std::move(history));
        g_native_history_regions.swap(history_regions);
        g_native_history_region_owners.swap(history_region_owners);
        g_native_history_region_draws.clear();
        g_native_paragraph_captures.swap(paragraphs);
        g_native_paragraph_index.swap(paragraph_index);
        g_native_paragraph_row_index.swap(paragraph_row_index);
        g_native_paragraph_prefix_index.swap(paragraph_prefix_index);
        g_native_paragraph_prefix_lengths.swap(paragraph_prefix_lengths);
        g_native_paragraph_sequence = sequence;
        g_native_paragraph_registry_order = paragraph_registry_order;
        g_native_knowledge_documents.swap(documents);
        g_native_knowledge_document_order.swap(order);
        g_native_knowledge_row_owners.swap(rows);
        g_native_history_sequence = history_sequence;
        g_native_history_draws.clear();
        g_native_history_draw_epoch = 0;
        g_native_history_last_draw_x = g_native_history_last_draw_y = -1;
        g_native_history_last_draw_identity = 0;
        g_native_history_last_draw_source.clear();
        history_pending = {};
        g_native_history_capture_generation.fetch_add(1, std::memory_order_acq_rel);
        return true;
    } catch (...) {
        log_line("ERROR", "Cannot restore native text for core reload");
        return false;
    }
}

static bool initialize_reloadable_core() {
    g_core_ready = false;
    try {
        dfhooks_init();
        return g_core_ready;
    } catch (...) {
        log_line("ERROR", "Core initialization threw an exception");
        return false;
    }
}

static bool shutdown_reloadable_core() {
    g_core_ready = false;
    try {
        return stop_reloadable_core();
    } catch (...) {
        log_line("ERROR", "Core shutdown threw an exception; keeping it resident");
        return false;
    }
}

} // namespace dfcn

DFCN_EXPORT const DfcnCoreDescriptor dfcn_core_descriptor{
    DFCN_CORE_ABI, sizeof(DfcnCoreApi),
};

DFCN_EXPORT const DfcnCoreApi *dfcn_get_core_api(uint32_t abi) {
    static const DfcnCoreApi api{
        DFCN_CORE_ABI, sizeof(DfcnCoreApi), __DATE__ " " __TIME__,
        dfcn::initialize_reloadable_core,
        dfcn::shutdown_reloadable_core,
        [] { return dfcn::g_overlay.translation_enabled(); },
        [](bool enabled) { dfcn::g_overlay.set_translation_enabled(enabled); },
        [] { dfcn::g_overlay.request_reload(); },
        dfhooks_sdl_event,
        dfcn::save_reload_captures,
        dfcn::restore_reload_captures,
    };
    return abi == DFCN_CORE_ABI ? &api : nullptr;
}
