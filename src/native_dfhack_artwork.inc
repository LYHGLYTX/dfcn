// DFHack's graphical paintTile clears the character byte before storing its
// artwork. Retain the original pen characters and exact texture positions at
// that boundary; capture reads can then exclude only the still-visible logo.
struct NativeDfhackLogoCapture {
    SDL_Rect bounds{};
    int dimx = 0, dimy = 0;
    std::array<int32_t, 12> textures{};
    bool top_layer = false;
};

static bool install_native_dfhack_capture_hook();
static void uninstall_native_dfhack_capture_hook();
static bool native_dfhack_capture_hook_active();

struct NativeDfhackTileWrite {
    const graphicst *graphics = nullptr;
    int x = 0, y = 0, dimx = 0, dimy = 0;
    int32_t texture = 0;
    unsigned char ch = 0;
    bool top_layer = false;
};

static std::mutex g_native_dfhack_logo_mutex;
static std::array<NativeDfhackTileWrite, 12> g_native_dfhack_tile_writes{};
static size_t g_native_dfhack_tile_next = 0, g_native_dfhack_tile_count = 0;
static std::array<NativeDfhackLogoCapture, 16> g_native_dfhack_logos{};
static size_t g_native_dfhack_logo_count = 0, g_native_dfhack_logo_next = 0;

static bool native_dfhack_logo_grid_valid(const graphicst *gps) {
    return gps && gps->dimx > 0 && gps->dimx <= 1000 &&
        gps->dimy > 0 && gps->dimy <= 1000;
}

static void clear_native_dfhack_logo_captures() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_logo_mutex);
    g_native_dfhack_tile_writes = {};
    g_native_dfhack_tile_next = g_native_dfhack_tile_count = 0;
    g_native_dfhack_logos = {};
    g_native_dfhack_logo_count = g_native_dfhack_logo_next = 0;
}

static void record_native_dfhack_tile_write(const graphicst *gps,
        const void *pen, int x, int y) {
    if (!pen || !native_dfhack_logo_grid_valid(gps) || x < 0 || y < 0 ||
            x >= gps->dimx || y >= gps->dimy) return;
    NativeDfhackTileWrite write;
    write.graphics = gps;
    write.x = x;
    write.y = y;
    write.dimx = gps->dimx;
    write.dimy = gps->dimy;
    write.top_layer = gps->top_in_use;
    const auto *bytes = static_cast<const unsigned char *>(pen);
    write.ch = bytes[0];
    std::memcpy(&write.texture, bytes + 4, sizeof(write.texture));

    std::lock_guard<std::mutex> lock(g_native_dfhack_logo_mutex);
    // A callback already in flight when the hook was detached must not
    // repopulate records that shutdown has just cleared.
    if (!native_dfhack_capture_hook_active()) return;
    g_native_dfhack_tile_writes[g_native_dfhack_tile_next] = write;
    g_native_dfhack_tile_next = (g_native_dfhack_tile_next + 1) %
        g_native_dfhack_tile_writes.size();
    g_native_dfhack_tile_count = std::min(g_native_dfhack_tile_count + 1,
        g_native_dfhack_tile_writes.size());
    if (g_native_dfhack_tile_count != g_native_dfhack_tile_writes.size()) return;

    static constexpr std::array<unsigned char, 12> chars{
        0xb3, 'D', 'F', 0xb3, 0xb3, 'H', 'a', 0xb3,
        0xb3, 'c', 'k', 0xb3,
    };
    const auto &first = g_native_dfhack_tile_writes[g_native_dfhack_tile_next];
    if (first.x > first.dimx - 4 || first.y > first.dimy - 3) return;
    NativeDfhackLogoCapture capture;
    capture.bounds = SDL_Rect{first.x, first.y, 4, 3};
    capture.dimx = first.dimx;
    capture.dimy = first.dimy;
    capture.top_layer = first.top_layer;
    for (size_t i = 0; i < chars.size(); ++i) {
        const auto &cell = g_native_dfhack_tile_writes[
            (g_native_dfhack_tile_next + i) % g_native_dfhack_tile_writes.size()];
        if (cell.ch != chars[i] || cell.texture <= 0 ||
                cell.graphics != first.graphics || cell.dimx != first.dimx ||
                cell.dimy != first.dimy || cell.top_layer != first.top_layer ||
                cell.x != first.x + static_cast<int>(i % 4) ||
                cell.y != first.y + static_cast<int>(i / 4)) return;
        capture.textures[i] = cell.texture;
    }
    for (size_t i = 0; i < g_native_dfhack_logo_count; ++i) {
        auto &other = g_native_dfhack_logos[i];
        if (other.bounds.x == capture.bounds.x && other.bounds.y == capture.bounds.y &&
                other.dimx == capture.dimx && other.dimy == capture.dimy &&
                other.top_layer == capture.top_layer) {
            other = capture;
            return;
        }
    }
    if (g_native_dfhack_logo_count < g_native_dfhack_logos.size()) {
        g_native_dfhack_logos[g_native_dfhack_logo_count++] = capture;
    } else {
        g_native_dfhack_logos[g_native_dfhack_logo_next] = capture;
        g_native_dfhack_logo_next = (g_native_dfhack_logo_next + 1) %
            g_native_dfhack_logos.size();
    }
}

static std::vector<NativeDfhackLogoCapture> native_dfhack_logo_captures() {
    std::lock_guard<std::mutex> lock(g_native_dfhack_logo_mutex);
    return {g_native_dfhack_logos.begin(),
        g_native_dfhack_logos.begin() + g_native_dfhack_logo_count};
}

// Caller holds the record mutex. Exact current textures reject an old draw
// after a page changes, resizes, or paints over any part of the logo.
static bool native_dfhack_logo_still_visible(const graphicst *gps,
        const NativeDfhackLogoCapture &capture) {
    if (!native_dfhack_logo_grid_valid(gps) || capture.dimx != gps->dimx ||
            capture.dimy != gps->dimy || (capture.top_layer && !gps->top_in_use) ||
            capture.bounds.x < 0 || capture.bounds.y < 0 ||
            capture.bounds.x > gps->dimx - 4 || capture.bounds.y > gps->dimy - 3)
        return false;
    const auto *textures = capture.top_layer ? gps->screentexpos_top : gps->screentexpos;
    if (!textures) return false;
    for (size_t i = 0; i < capture.textures.size(); ++i) {
        const size_t at = static_cast<size_t>(capture.bounds.x + i % 4) * gps->dimy +
            capture.bounds.y + i / 4;
        if (textures[at] != capture.textures[i]) return false;
    }
    return true;
}

static std::vector<SDL_Rect> native_dfhack_logo_regions(const graphicst *gps) {
    std::vector<SDL_Rect> regions;
    if (!native_dfhack_logo_grid_valid(gps)) return regions;
    std::lock_guard<std::mutex> lock(g_native_dfhack_logo_mutex);
    for (size_t i = 0; i < g_native_dfhack_logo_count; ++i) {
        const auto &capture = g_native_dfhack_logos[i];
        if (!native_dfhack_logo_still_visible(gps, capture)) continue;
        if (std::none_of(regions.begin(), regions.end(), [&](const SDL_Rect &other) {
                return other.x == capture.bounds.x && other.y == capture.bounds.y;
            })) regions.push_back(capture.bounds);
    }
    return regions;
}

static bool native_dfhack_logo_owns_cell(const graphicst *gps, int x, int y) {
    if (!native_dfhack_logo_grid_valid(gps) || x < 0 || y < 0 ||
            x >= gps->dimx || y >= gps->dimy) return false;
    std::lock_guard<std::mutex> lock(g_native_dfhack_logo_mutex);
    for (size_t i = 0; i < g_native_dfhack_logo_count; ++i) {
        const auto &capture = g_native_dfhack_logos[i];
        if (x >= capture.bounds.x && x < capture.bounds.x + 4 &&
                y >= capture.bounds.y && y < capture.bounds.y + 3 &&
                native_dfhack_logo_still_visible(gps, capture)) return true;
    }
    return false;
}
