// Optional passive timings. Render aggregates hold TranslationStateScope;
// input uses a separate bounded buffer. No worker or simulated input is used.
enum class RenderTimingStage : size_t {
    Present, Glyph, Graphic, Prepare, Match, Context, Rows, ItemFields,
    Layout, Collect, Draw, Snapshot, Ownership, Panels, Documents, UiMessages, Scenes, ItemsContext, Places, Workshops, Sites, Roster, Captions, Help,
    Tooltips, Choices, ItemDocuments, Knowledge, Legends, Saves, Ammunition, ItemCaptions, UiDynamic, UiLiteral, RowCaptures, RowLiterals, RowTemplates,
    RowEquipment, RowFragments, RowSelect, PostMatch,
    DrawReadback, DrawClearPixels, DrawTexture, DrawCopy, DrawDecorations,
    DrawWorkOrder, DrawBorderRepairs, DrawMatches, Rasterize, Count,
};

static void flush_pending_input_delivery_timing() noexcept;

struct RenderTimings {
    static constexpr size_t count = static_cast<size_t>(RenderTimingStage::Count);
    struct Sample {
        std::array<double, count> ms{};
        std::array<uint64_t, count> calls{};
        uint64_t readback_pixels = 0;
        uint64_t texture_hits = 0, texture_misses = 0;
        double readback_first_ms = 0;
        double readback_max_ms = 0;
        std::string readback_max_source;
        int readback_max_width = 0, readback_max_height = 0;
    } current, worst;
    using Clock = std::chrono::steady_clock;
    Clock::time_point last_report{}, last_present{};
    uint64_t frames = 0;
    double total_ms = 0, worst_ms = 0, worst_interval_ms = 0;
    double previous_report_ms = 0;

    void finish(bool enabled) {
        if (!enabled) {
            *this = {};
            return;
        }
        const auto now = Clock::now();
        if (last_report == Clock::time_point{}) last_report = now;
        const double interval = last_present == Clock::time_point{} ? 0 :
            std::chrono::duration<double, std::milli>(now - last_present).count();
        last_present = now;
        // Only these three scopes are disjoint. The other named scopes are
        // inclusive drill-downs, not additional frame time to be summed.
        const double elapsed = current.ms[static_cast<size_t>(RenderTimingStage::Present)] +
            current.ms[static_cast<size_t>(RenderTimingStage::Glyph)] +
            current.ms[static_cast<size_t>(RenderTimingStage::Graphic)];
        // A long input/game/lock/driver wait may lie outside all overlay
        // scopes. Record the gap even when it is not the slowest overlay.
        if (interval >= 1000.0) {
            std::ostringstream gap;
            gap << std::fixed << std::setprecision(2)
                << "Render frame gap: interval_ms=" << interval
                << "; measured_overlay_ms=" << elapsed
                << "; previous_report_ms=" << previous_report_ms;
            log_line("WARN", gap.str());
        }
        ++frames;
        total_ms += elapsed;
        if (elapsed >= worst_ms) {
            worst_ms = elapsed;
            worst_interval_ms = interval;
            worst = current;
        }
        current = {};
        if (now - last_report < std::chrono::seconds(2)) return;

        static constexpr std::array<const char *, count> names{
            "present", "glyph", "graphic", "prepare", "match", "context",
            "rows", "item_fields", "layout", "collect", "draw", "snapshot",
            "ownership", "panels", "documents", "ui_messages", "scenes", "items_context",
            "places", "workshops", "sites", "roster", "captions", "help",
            "tooltips", "choices", "item_documents", "knowledge", "legends", "saves",
            "ammunition", "item_captions", "ui_dynamic", "ui_literal",
            "row_captures", "row_literals", "row_templates", "row_equipment",
            "row_fragments", "row_select", "post_match",
            "draw_readback", "draw_clear_pixels", "draw_texture", "draw_copy",
            "draw_decorations",
            "draw_work_order", "draw_border_repairs", "draw_matches", "rasterize",
        };
        std::ostringstream line;
        line << std::fixed << std::setprecision(2)
             << "Render timing: frames=" << frames << "; mean_overlay_ms="
             << total_ms / frames << "; worst_overlay_ms=" << worst_ms
             << "; worst_interval_ms=" << worst_interval_ms
             << "; worst_frame inclusive ms/calls:";
        for (size_t i = 0; i < count; ++i)
            line << ' ' << names[i] << '=' << worst.ms[i] << '/' << worst.calls[i];
        std::string readback_source = worst.readback_max_source.substr(0, 120);
        for (char &ch : readback_source)
            if (ch == '\r' || ch == '\n') ch = ' ';
        line << "; readback_pixels=" << worst.readback_pixels
             << "; first_readback_ms=" << worst.readback_first_ms
             << "; texture_hits=" << worst.texture_hits
             << "; texture_misses=" << worst.texture_misses
             << "; slowest_readback_ms=" << worst.readback_max_ms
             << "; rect=" << worst.readback_max_width << 'x' << worst.readback_max_height
             << "; source=" << readback_source
             << "; previous_report_ms=" << previous_report_ms;
        const auto report_started = Clock::now();
        log_line("INFO", line.str());
        flush_pending_input_delivery_timing();
        previous_report_ms = std::chrono::duration<double, std::milli>(
            Clock::now() - report_started).count();
        frames = 0;
        total_ms = worst_ms = worst_interval_ms = 0;
        worst = {};
        last_report = now;
    }
};

class RenderTimingScope {
    RenderTimings *timings_;
    RenderTimingStage stage_;
    RenderTimings::Clock::time_point start_{};
public:
    RenderTimingScope(RenderTimings &timings, bool enabled, RenderTimingStage stage)
        : timings_(enabled ? &timings : nullptr), stage_(stage) {
        if (timings_) start_ = RenderTimings::Clock::now();
    }
    ~RenderTimingScope() { stop(); }
    void checkpoint(RenderTimingStage next) {
        if (!timings_) return;
        auto *timings = timings_;
        stop();
        timings_ = timings;
        stage_ = next;
        start_ = RenderTimings::Clock::now();
    }
    void stop() {
        if (!timings_) return;
        const auto index = static_cast<size_t>(stage_);
        timings_->current.ms[index] += std::chrono::duration<double, std::milli>(
            RenderTimings::Clock::now() - start_).count();
        ++timings_->current.calls[index];
        timings_ = nullptr;
    }
    RenderTimingScope(const RenderTimingScope &) = delete;
    RenderTimingScope &operator=(const RenderTimingScope &) = delete;
};

struct RenderTimingFrame {
    RenderTimings &timings;
    const bool &enabled;
    ~RenderTimingFrame() { timings.finish(enabled); }
};

// These boundaries include time outside Overlay::render, particularly native
// Present and queued work. Only long calls are logged; normal frames stay in
// the existing two-second summary.
class SlowBoundaryTiming {
    using Clock = std::chrono::steady_clock;
    bool enabled_ = translation_state_trace_enabled.load(std::memory_order_relaxed);
    const char *name_;
    Clock::time_point start_{}, last_{};
    std::array<std::pair<const char *, double>, 12> phases_{};
    size_t count_ = 0;
public:
    explicit SlowBoundaryTiming(const char *name) : name_(name) {
        if (enabled_) start_ = last_ = Clock::now();
    }
    void checkpoint(const char *phase) {
        if (!enabled_) return;
        const auto now = Clock::now();
        if (count_ < phases_.size())
            phases_[count_++] = {phase,
                std::chrono::duration<double, std::milli>(now - last_).count()};
        last_ = now;
    }
    ~SlowBoundaryTiming() noexcept {
        if (!enabled_) return;
        try {
            const double elapsed = std::chrono::duration<double, std::milli>(
                Clock::now() - start_).count();
            if (elapsed < 500.0) return;
            std::ostringstream line;
            line << std::fixed << std::setprecision(2)
                 << "Slow boundary: " << name_ << "; total_ms=" << elapsed
                 << "; thread=" << translation_state_thread_id();
            for (size_t i = 0; i < count_; ++i)
                line << "; " << phases_[i].first << "_ms=" << phases_[i].second;
            log_line("WARN", line.str());
        } catch (...) {}
    }
};

class InputDeliveryTiming {
    using Clock = std::chrono::steady_clock;
    struct Record {
        uint64_t sequence, thread;
        Uint32 ticks, type, event_age_ms;
        double callback_ms;
        bool begin, mouse_state;
        Uint32 event_timestamp, window_id, which;
        Uint8 button, clicks;
        int x, y;
        Uint32 buttons;
        int original_x, original_y;
        Uint8 coordinates;
    };
    static constexpr size_t capacity_ = 256;
    inline static std::array<Record, capacity_> pending_{};
    inline static size_t pending_count_ = 0;
    inline static std::mutex pending_mutex_;
    inline static std::atomic<uint64_t> dropped_{0};
    inline static std::atomic<double> last_flush_io_ms_{0};
    inline static std::atomic<Uint32> last_flush_ticks_{0};
    bool enabled_ = translation_state_trace_enabled.load(std::memory_order_relaxed);
    bool button_ = false;
    Uint32 type_ = 0, age_ = 0, ticks_ = 0;
    Uint32 event_timestamp_ = 0, window_id_ = 0, which_ = 0;
    Uint8 button_id_ = 0, clicks_ = 0;
    int x_ = 0, y_ = 0;
    uint64_t sequence_ = 0, thread_ = 0;
    Clock::time_point start_{};
    inline static std::atomic<uint64_t> next_sequence_{0};

    static void enqueue(const Record &record) noexcept {
        // Input must never wait behind a renderer or another input thread.
        // The bounded POD buffer does no allocation, formatting or file I/O.
        try {
            std::unique_lock<std::mutex> lock(pending_mutex_, std::try_to_lock);
            if (lock.owns_lock() && pending_count_ < capacity_) {
                pending_[pending_count_++] = record;
                return;
            }
        } catch (...) {}
        dropped_.fetch_add(1, std::memory_order_relaxed);
    }

    static void record_flush_io(Clock::time_point started, Uint32 ticks) noexcept {
        last_flush_io_ms_.store(std::chrono::duration<double, std::milli>(
            Clock::now() - started).count(), std::memory_order_relaxed);
        last_flush_ticks_.store(ticks, std::memory_order_relaxed);
    }

    Record event_record(bool begin, Uint32 ticks, double elapsed) const noexcept {
        return {sequence_, thread_, ticks, type_, age_, elapsed, begin, false,
            event_timestamp_, window_id_, which_, button_id_, clicks_, x_, y_,
            0, 0, 0, 0};
    }
public:
    explicit InputDeliveryTiming(const SDL_Event &event) noexcept {
        if (!enabled_) return;
        start_ = Clock::now();
        ticks_ = SDL_GetTicks();
        type_ = event.type;
        button_ = type_ == SDL_MOUSEBUTTONDOWN || type_ == SDL_MOUSEBUTTONUP;
        age_ = ticks_ - event.common.timestamp;
        thread_ = translation_state_thread_id();
        sequence_ = next_sequence_.fetch_add(1, std::memory_order_relaxed) + 1;
        if (button_) {
            event_timestamp_ = event.button.timestamp;
            window_id_ = event.button.windowID;
            which_ = event.button.which;
            button_id_ = event.button.button;
            clicks_ = event.button.clicks;
            x_ = event.button.x;
            y_ = event.button.y;
            enqueue(event_record(true, ticks_, 0));
        }
    }
    ~InputDeliveryTiming() noexcept {
        if (!enabled_) return;
        const double elapsed = std::chrono::duration<double, std::milli>(
            Clock::now() - start_).count();
        if (!button_ && elapsed < 100.0) return;
        const Uint32 finished_ticks = SDL_GetTicks();
        // Preserve both samples for an unexpectedly slow non-button event,
        // without filling the buffer with ordinary motion and text events.
        if (!button_)
            enqueue(event_record(true, ticks_, 0));
        enqueue(event_record(false, finished_ticks, elapsed));
    }

    static void note_mouse_state(Uint32 buttons, int original_x, int original_y,
            int mapped_x, int mapped_y, bool has_x, bool has_y) noexcept {
        if (!translation_state_trace_enabled.load(std::memory_order_relaxed)) return;
        // Trivial thread-local data has no destructor and does not retain the
        // reloadable core. Changes are always offered to the bounded buffer;
        // identical high-frequency polls are sampled at most every 100 ms.
        struct LastMouseState {
            Uint32 ticks, buttons;
            int original_x, original_y, mapped_x, mapped_y;
            Uint8 coordinates;
            bool valid;
        };
        static thread_local LastMouseState last{};
        const Uint32 ticks = SDL_GetTicks();
        const Uint8 coordinates = static_cast<Uint8>((has_x ? 1 : 0) | (has_y ? 2 : 0));
        if (last.valid && last.buttons == buttons && last.original_x == original_x &&
            last.original_y == original_y && last.mapped_x == mapped_x &&
            last.mapped_y == mapped_y && last.coordinates == coordinates &&
            static_cast<Uint32>(ticks - last.ticks) < 100) return;
        last = {ticks, buttons, original_x, original_y, mapped_x, mapped_y,
            coordinates, true};
        Record record{};
        record.sequence = next_sequence_.fetch_add(1, std::memory_order_relaxed) + 1;
        record.thread = translation_state_thread_id();
        record.ticks = ticks;
        record.mouse_state = true;
        record.buttons = buttons;
        record.original_x = original_x;
        record.original_y = original_y;
        record.x = mapped_x;
        record.y = mapped_y;
        record.coordinates = coordinates;
        enqueue(record);
    }

    static void flush_pending() noexcept {
        std::array<Record, capacity_> batch;
        size_t count = 0;
        uint64_t dropped = 0;
        try {
            {
                std::unique_lock<std::mutex> lock(pending_mutex_, std::try_to_lock);
                if (!lock.owns_lock()) return;
                count = pending_count_;
                std::copy_n(pending_.begin(), count, batch.begin());
                pending_count_ = 0;
                dropped = dropped_.exchange(0, std::memory_order_relaxed);
            }
            // The buffer lock is released before any allocation or disk I/O.
            // A slow write is reported on the next two-second flush, including
            // its collection time so it cannot masquerade as a game stall.
            const double previous_io_ms = last_flush_io_ms_.load(std::memory_order_relaxed);
            const Uint32 previous_ticks = last_flush_ticks_.load(std::memory_order_relaxed);
            if (!count && !dropped && previous_io_ms < 100.0) return;
            bool slow = previous_io_ms >= 100.0 || dropped != 0;
            std::ostringstream line;
            line << std::fixed << std::setprecision(2)
                 << "Input delivery batch: records=" << count << "; dropped=" << dropped
                 << "; previous_flush_ticks=" << previous_ticks
                 << "; previous_flush_io_ms=" << previous_io_ms;
            for (size_t i = 0; i < count; ++i) {
                const auto &record = batch[i];
                if (record.mouse_state) {
                    line << "\nInput delivery sample: kind=mouse_state; seq=" << record.sequence
                         << "; captured_ticks=" << record.ticks << "; thread=" << record.thread
                         << "; buttons=" << record.buttons
                         << "; original_x=" << record.original_x
                         << "; original_y=" << record.original_y
                         << "; mapped_x=" << record.x << "; mapped_y=" << record.y
                         << "; has_x=" << ((record.coordinates & 1) != 0)
                         << "; has_y=" << ((record.coordinates & 2) != 0);
                    continue;
                }
                slow = slow || record.callback_ms >= 100.0;
                line << "\nInput delivery " << (record.begin ? "begin" : "end")
                     << ": seq=" << record.sequence << "; captured_ticks=" << record.ticks
                     << "; type=" << record.type << "; thread=" << record.thread
                     << "; event_age_ms=" << record.event_age_ms
                     << "; event_timestamp=" << record.event_timestamp
                     << "; window_id=" << record.window_id << "; which=" << record.which
                     << "; button=" << static_cast<unsigned>(record.button)
                     << "; clicks=" << static_cast<unsigned>(record.clicks)
                     << "; x=" << record.x << "; y=" << record.y;
                if (!record.begin) line << "; callback_ms=" << record.callback_ms;
            }
            const std::string message = line.str();
            const Uint32 flush_ticks = SDL_GetTicks();
            const auto io_started = Clock::now();
            try {
                // One append/open/close for the entire batch, outside input.
                log_line(slow ? "WARN" : "INFO", message);
            } catch (...) {
                record_flush_io(io_started, flush_ticks);
                throw;
            }
            record_flush_io(io_started, flush_ticks);
        } catch (...) {
            // Retain visibility of lost samples even if formatting or logging
            // fails; no diagnostic exception may escape a native callback.
            dropped_.fetch_add(count + dropped, std::memory_order_relaxed);
        }
    }
    InputDeliveryTiming(const InputDeliveryTiming &) = delete;
    InputDeliveryTiming &operator=(const InputDeliveryTiming &) = delete;
};

static void flush_pending_input_delivery_timing() noexcept {
    InputDeliveryTiming::flush_pending();
}
