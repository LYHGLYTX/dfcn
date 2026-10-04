// The DFHack logo is foreign artwork, not part of the native text grid.
// Keep its suppression local to capture reads and preserve every grid pointer
// used by the native draw-ownership registries.
static bool native_capture_logo_at(const graphicst *gps,
        const unsigned char *screen, int left, int top) {
    if (!gps || !screen || left < 0 || top < 0 ||
            left > gps->dimx - 4 || top > gps->dimy - 3) return false;
    static constexpr unsigned char logo[3][4] = {
        {0xb3, 'D', 'F', 0xb3},
        {0xb3, 'H', 'a', 0xb3},
        {0xb3, 'c', 'k', 0xb3},
    };
    for (int y = 0; y < 3; ++y)
        for (int x = 0; x < 4; ++x) {
            const size_t at = static_cast<size_t>(left + x) * gps->dimy + top + y;
            if (screen[at * 8] != logo[y][x]) return false;
        }
    return true;
}

static bool native_capture_grid_valid(const graphicst *gps) {
    return gps && gps->dimx > 0 && gps->dimx <= 1000 &&
        gps->dimy > 0 && gps->dimy <= 1000;
}

// The caller has bounded x/y. A cell can belong to an ASCII logo only at
// the positions carrying its current character; ordinary glyphs need no
// neighboring-anchor reads. Still prove the entire logo before ignoring it.
static bool native_capture_logo_owns_cell(const graphicst *gps,
        const unsigned char *screen, int x, int y) {
    if (!screen) return false;
    const size_t at = static_cast<size_t>(x) * gps->dimy + y;
    switch (screen[at * 8]) {
    case 0xb3:
        for (int dy = 0; dy < 3; ++dy)
            for (const int dx : {0, 3})
                if (native_capture_logo_at(gps, screen, x - dx, y - dy)) return true;
        return false;
    case 'D': return native_capture_logo_at(gps, screen, x - 1, y);
    case 'F': return native_capture_logo_at(gps, screen, x - 2, y);
    case 'H': return native_capture_logo_at(gps, screen, x - 1, y - 1);
    case 'a': return native_capture_logo_at(gps, screen, x - 2, y - 1);
    case 'c': return native_capture_logo_at(gps, screen, x - 1, y - 2);
    case 'k': return native_capture_logo_at(gps, screen, x - 2, y - 2);
    default: return false;
    }
}

static bool native_capture_rect_contains(const SDL_Rect &box, int x, int y) {
    return x >= box.x && x < box.x + box.w &&
        y >= box.y && y < box.y + box.h;
}

static void native_capture_append_region(std::vector<SDL_Rect> &regions,
        const SDL_Rect &box) {
    if (std::none_of(regions.begin(), regions.end(), [&](const SDL_Rect &other) {
            return box.x == other.x && box.y == other.y &&
                box.w == other.w && box.h == other.h;
        })) regions.push_back(box);
}

static std::vector<SDL_Rect> native_capture_mask_regions(const graphicst *gps);
static bool native_capture_ignored_cell(const graphicst *gps, int x, int y);

class NativeCaptureMaskScope {
    using Texture = std::remove_pointer_t<decltype(graphicst::screentexpos)>;
    struct Cell {
        unsigned char *screen = nullptr;
        std::array<unsigned char, 8> bytes{};
        std::array<Texture *, 5> texture{};
        std::array<Texture, 5> texture_values{};
        uint32_t *flag = nullptr;
        uint32_t flag_value = 0;
    };
    int dimx_ = 0, dimy_ = 0;
    const graphicst *graphics_ = nullptr;
    std::vector<SDL_Rect> regions_;
    std::vector<Cell> saved_;
    NativeCaptureMaskScope *previous_ = nullptr;
    bool installed_ = false;
    inline static thread_local NativeCaptureMaskScope *active_ = nullptr;

    bool compatible(const graphicst *gps) const {
        // Tooltip/help ABI views own copied bytes from this same logical
        // page. Their buffers no longer carry the logo signature, but their
        // coordinates still belong to the active capture's grid dimensions.
        return gps && gps->dimx == dimx_ && gps->dimy == dimy_;
    }

    friend std::vector<SDL_Rect> native_capture_mask_regions(const graphicst *gps);
    friend bool native_capture_ignored_cell(const graphicst *gps, int x, int y);

public:
    explicit NativeCaptureMaskScope(const graphicst *gps) {
        if (!native_capture_grid_valid(gps)) return;
        graphics_ = gps;
        dimx_ = gps->dimx;
        dimy_ = gps->dimy;
        regions_ = native_capture_mask_regions(gps);

        // Collect the union before touching any cell. All potentially throwing
        // allocations finish before the first native buffer modification.
        std::vector<size_t> cells;
        cells.reserve(regions_.size() * 12);
        for (const auto &box : regions_)
            for (int x = box.x; x < box.x + box.w; ++x)
                for (int y = box.y; y < box.y + box.h; ++y)
                    cells.push_back(static_cast<size_t>(x) * dimy_ + y);
        std::sort(cells.begin(), cells.end());
        cells.erase(std::unique(cells.begin(), cells.end()), cells.end());
        saved_.reserve(cells.size() * 2);
        for (const size_t at : cells)
            for (const bool top : {false, true}) {
                Cell cell;
                auto *screen = top ? gps->screen_top : gps->screen;
                if (screen) {
                    cell.screen = screen + at * 8;
                    std::memcpy(cell.bytes.data(), cell.screen, cell.bytes.size());
                }
                const std::array<Texture *, 5> layers{
                    top ? gps->screentexpos_top : gps->screentexpos,
                    top ? gps->screentexpos_top_lower : gps->screentexpos_lower,
                    top ? gps->screentexpos_top_anchored : gps->screentexpos_anchored,
                    top ? gps->screentexpos_top_anchored_x : gps->screentexpos_anchored_x,
                    top ? gps->screentexpos_top_anchored_y : gps->screentexpos_anchored_y,
                };
                for (size_t i = 0; i < layers.size(); ++i)
                    if (layers[i]) {
                        cell.texture[i] = layers[i] + at;
                        cell.texture_values[i] = *cell.texture[i];
                    }
                auto *flags = top ? gps->screentexpos_top_flag : gps->screentexpos_flag;
                if (flags) {
                    cell.flag = flags + at;
                    cell.flag_value = *cell.flag;
                }
                saved_.push_back(cell);
            }
        for (const auto &cell : saved_) {
            if (cell.screen) {
                std::memset(cell.screen, 0, cell.bytes.size());
                cell.screen[0] = ' ';
            }
            for (auto *texture : cell.texture)
                if (texture) *texture = 0;
            if (cell.flag) *cell.flag = 0;
        }
        previous_ = active_;
        active_ = this;
        installed_ = true;
    }

    ~NativeCaptureMaskScope() noexcept { reset(); }
    NativeCaptureMaskScope(const NativeCaptureMaskScope &) = delete;
    NativeCaptureMaskScope &operator=(const NativeCaptureMaskScope &) = delete;

    void reset() noexcept {
        if (!installed_) return;
        for (const auto &cell : saved_) {
            if (cell.screen)
                std::memcpy(cell.screen, cell.bytes.data(), cell.bytes.size());
            for (size_t i = 0; i < cell.texture.size(); ++i)
                if (cell.texture[i]) *cell.texture[i] = cell.texture_values[i];
            if (cell.flag) *cell.flag = cell.flag_value;
        }
        auto **link = &active_;
        while (*link && *link != this) link = &(*link)->previous_;
        if (*link == this) *link = previous_;
        installed_ = false;
    }
};

static std::vector<SDL_Rect> native_capture_mask_regions(const graphicst *gps) {
    std::vector<SDL_Rect> regions;
    if (!native_capture_grid_valid(gps)) return regions;
    for (auto *scope = NativeCaptureMaskScope::active_; scope; scope = scope->previous_)
        if (scope->graphics_ == gps && scope->compatible(gps)) return scope->regions_;
    // An outer read scope has already erased the signature. Retain its region
    // for nested captures and for pixel readbacks performed in that scope.
    for (auto *scope = NativeCaptureMaskScope::active_; scope; scope = scope->previous_)
        if (scope->compatible(gps))
            for (const auto &box : scope->regions_)
                native_capture_append_region(regions, box);
    // DFHack graphics pens clear screen[0]. Their captured native texture
    // identities establish the same exclusion without relying on fallback
    // characters that exist only in classic mode.
    for (const auto &box : native_dfhack_logo_regions(gps))
        native_capture_append_region(regions, box);
    for (const auto *screen : {gps->screen, gps->top_in_use ? gps->screen_top : nullptr}) {
        if (!screen) continue;
        for (int y = 0; y <= gps->dimy - 3; ++y)
            for (int x = 0; x <= gps->dimx - 4; ++x)
                if (native_capture_logo_at(gps, screen, x, y))
                    native_capture_append_region(regions, SDL_Rect{x, y, 4, 3});
    }
    return regions;
}

static bool native_capture_ignored_cell(const graphicst *gps, int x, int y) {
    if (!native_capture_grid_valid(gps) || x < 0 || y < 0 ||
            x >= gps->dimx || y >= gps->dimy) return false;
    for (auto *scope = NativeCaptureMaskScope::active_; scope; scope = scope->previous_)
        if (scope->compatible(gps)) {
            const bool ignored = std::any_of(scope->regions_.begin(), scope->regions_.end(),
                [&](const SDL_Rect &box) { return native_capture_rect_contains(box, x, y); });
            if (ignored || scope->graphics_ == gps) return ignored;
        }
    if (native_dfhack_logo_owns_cell(gps, x, y)) return true;
    return native_capture_logo_owns_cell(gps, gps->screen, x, y) ||
        (gps->top_in_use && native_capture_logo_owns_cell(gps, gps->screen_top, x, y));
}

static int native_capture_read_pixels(const graphicst *gps, SDL_Renderer *renderer,
        const SDL_Rect *rect, Uint32 format, void *pixels, int pitch) {
    const auto regions = native_capture_mask_regions(gps);
    const int result = SDL_RenderReadPixels(renderer, rect, format, pixels, pitch);
    if (result != 0 || regions.empty()) return result;
    if (!pixels || pitch <= 0 || !gps || gps->tile_pixel_x <= 0 ||
            gps->tile_pixel_y <= 0 || gps->screen_pixel_x <= 0 || gps->screen_pixel_y <= 0)
        return SDL_SetError("Cannot mask DFHack logo in capture: invalid pixel geometry");

    int width = 0, height = 0;
    if (SDL_GetRendererOutputSize(renderer, &width, &height) != 0) return -1;
    if (auto *target = SDL_GetRenderTarget(renderer))
        if (SDL_QueryTexture(target, nullptr, nullptr, &width, &height) != 0) return -1;
    if (width <= 0 || height <= 0)
        return SDL_SetError("Cannot mask DFHack logo in capture: empty render output");
    const SDL_Rect capture = rect ? *rect : SDL_Rect{0, 0, width, height};
    if (capture.w <= 0 || capture.h <= 0) return result;
    auto *pixel_format = SDL_AllocFormat(format);
    if (!pixel_format) return -1;
    struct FreeFormat {
        SDL_PixelFormat *value;
        ~FreeFormat() { SDL_FreeFormat(value); }
    } free_format{pixel_format};
    if (pixel_format->BytesPerPixel != 4)
        return SDL_SetError("Cannot mask DFHack logo in capture: expected a 32-bit pixel format");
    if (static_cast<int64_t>(capture.w) * 4 > pitch)
        return SDL_SetError("Cannot mask DFHack logo in capture: insufficient pixel pitch");
    const Uint32 black = SDL_MapRGBA(pixel_format, 0, 0, 0, 255);
    const int64_t origin_x = (static_cast<int64_t>(gps->screen_pixel_x) -
        static_cast<int64_t>(gps->dimx) * gps->tile_pixel_x) / 2;
    const int64_t origin_y = (static_cast<int64_t>(gps->screen_pixel_y) -
        static_cast<int64_t>(gps->dimy) * gps->tile_pixel_y) / 2;
    const auto floor_scale = [](int64_t position, int output, int screen) {
        const int64_t numerator = position * output;
        return static_cast<int>((numerator - (numerator < 0 ? screen - 1 : 0)) / screen);
    };
    const auto ceil_scale = [](int64_t position, int output, int screen) {
        const int64_t numerator = position * output;
        return static_cast<int>((numerator + (numerator > 0 ? screen - 1 : 0)) / screen);
    };
    for (const auto &box : regions) {
        const int left = std::max({0, capture.x,
            floor_scale(origin_x + static_cast<int64_t>(box.x) * gps->tile_pixel_x,
                width, gps->screen_pixel_x)});
        const int right = std::min({width, capture.x + capture.w,
            ceil_scale(origin_x + static_cast<int64_t>(box.x + box.w) * gps->tile_pixel_x,
                width, gps->screen_pixel_x)});
        const int top = std::max({0, capture.y,
            floor_scale(origin_y + static_cast<int64_t>(box.y) * gps->tile_pixel_y,
                height, gps->screen_pixel_y)});
        const int bottom = std::min({height, capture.y + capture.h,
            ceil_scale(origin_y + static_cast<int64_t>(box.y + box.h) * gps->tile_pixel_y,
                height, gps->screen_pixel_y)});
        for (int y = top; y < bottom; ++y) {
            auto *row = static_cast<unsigned char *>(pixels) +
                static_cast<size_t>(y - capture.y) * pitch;
            for (int x = left; x < right; ++x)
                std::memcpy(row + static_cast<size_t>(x - capture.x) * 4, &black, sizeof(black));
        }
    }
    return result;
}
