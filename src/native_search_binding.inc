// One binding resolver for every search feature. Executable signatures are
// data, not platform feature switches. An unsupported/missing binding fails
// installation instead of silently leaving a search field untranslated.
struct NativeSearchSignature {
    uintptr_t offset;
    std::vector<unsigned char> bytes;
};

#ifdef _WIN32
static constexpr uintptr_t native_search_reference_origin = 0;
#else
static constexpr uintptr_t native_search_reference_origin = 0x400000;
#endif

// Relocated native routines use the same instruction/field signatures rather
// than borrowing a Classic executable's addresses for a Steam image. Ranges
// and fragments are ABI data; matching/filtering policy never lives here.
struct NativeSearchRoutineSignature {
    uintptr_t begin, end;
    std::vector<NativeSearchSignature> fragments;
};

static uintptr_t locate_native_search_routine(uintptr_t base,
        NativeSearchRoutineSignature routine) {
    if (!base || routine.begin >= routine.end ||
        routine.end - routine.begin > 1024 * 1024 ||
        routine.end > UINTPTR_MAX - base || routine.fragments.empty() ||
        routine.fragments.front().offset != 0 ||
        routine.fragments.front().bytes.empty()) return 0;
    const uintptr_t reference_begin = routine.begin;
    const uintptr_t length = routine.end - routine.begin;
    routine.begin = native_reference_rva(reference_begin);
    if (!routine.begin || length > UINTPTR_MAX - routine.begin) return 0;
    routine.end = routine.begin + length;
    for (auto &fragment : routine.fragments)
        if (!native_reference_bytes(native_search_reference_origin + reference_begin + fragment.offset,
                                    fragment.bytes)) return 0;
    std::vector<unsigned char> code(routine.end - routine.begin);
    if (!native_history_copy_bytes(base + routine.begin, code.data(), code.size()))
        return 0;
    const auto &anchor = routine.fragments.front().bytes;
    uintptr_t found = 0;
    auto cursor = code.begin();
    while ((cursor = std::search(cursor, code.end(), anchor.begin(), anchor.end()))
            != code.end()) {
        const size_t offset = static_cast<size_t>(cursor - code.begin());
        const bool matches = std::all_of(routine.fragments.begin(),
            routine.fragments.end(), [&](const NativeSearchSignature &part) {
                return part.offset <= code.size() - offset &&
                    part.bytes.size() <= code.size() - offset - part.offset &&
                    std::equal(part.bytes.begin(), part.bytes.end(),
                        cursor + part.offset);
            });
        if (matches) {
            if (found) return 0; // Never guess between two native routines.
            found = routine.begin + offset;
        }
        ++cursor;
    }
    return found;
}

static bool native_search_signatures_match(uintptr_t base,
        const std::vector<NativeSearchSignature> &signatures, std::string &failure) {
    if (!base || signatures.empty()) {
        failure = "missing image base or signatures";
        return false;
    }
    for (const auto &signature : signatures) {
        const auto fail = [&](const char *reason, uintptr_t address = 0) {
            char detail[192];
            std::snprintf(detail, sizeof(detail), "%s; reference RVA=0x%llx; native address=0x%llx",
                reason, static_cast<unsigned long long>(signature.offset),
                static_cast<unsigned long long>(address));
            failure = detail;
            return false;
        };
        if (signature.bytes.empty() || signature.offset > UINTPTR_MAX - base)
            return fail("invalid signature extent");
        auto expected = signature.bytes;
        if (!native_reference_bytes(native_search_reference_origin + signature.offset, expected))
            return fail("unresolved expected-byte binding");
        const uintptr_t address = native_reference_address(base, signature.offset);
        if (!address) return fail("unresolved address binding");
        std::vector<unsigned char> observed(expected.size());
        if (!native_history_copy_bytes(address, observed.data(), observed.size()))
            return fail("unreadable signature", address);
        if (observed != expected) return fail("signature bytes differ", address);
    }
    return true;
}

template<typename Profile>
struct NativeSearchBinding {
    std::vector<NativeSearchSignature> signatures;
    Profile profile;
};

template<typename Profile, size_t Count>
static bool resolve_native_search_binding(
        const NativeSearchBinding<Profile> (&bindings)[Count], Profile &profile,
        const char *label) {
    const uintptr_t base = native_history_profile_base();
    const Profile *found = nullptr;
    std::vector<std::string> failures;
    for (const auto &binding : bindings) {
        std::string failure;
        if (!native_search_signatures_match(base, binding.signatures, failure)) {
            failures.push_back(std::move(failure));
            continue;
        }
        if (found) {
            report_native_patch_error("ERROR", label, "ambiguous executable binding");
            return false;
        }
        found = &binding.profile;
    }
    if (!found || found->calls.empty()) {
        report_native_patch_error("ERROR", label, "complete native search binding is unavailable");
        for (const auto &failure : failures)
            report_native_patch_error("ERROR", label, failure.c_str());
        return false;
    }
    profile = *found;
    profile.base = base;
    if (!native_reference_calls(profile.calls, native_search_reference_origin)) {
        report_native_patch_error("ERROR", label, "unresolved edition call binding");
        return false;
    }
    return true;
}

// This is the byte substring contract used by the native filters (including
// empty queries and npos). A single implementation avoids exposing compiler
// specific argument orders to the shared translated-search callbacks.
static size_t native_search_byte_find(const char *text, size_t length, size_t start,
        const char *query, size_t query_length) {
    if ((!text && length) || (!query && query_length)) return SIZE_MAX;
    return std::string_view(text ? text : "", length).find(
        std::string_view(query ? query : "", query_length), start);
}

// POD native strings require the game's destructor; an owning NativeString
// destroys itself. The binding supplies only the additional ABI destructor.
using NativeSearchDestroyFn = void (*)(NativeString *);
struct NativeSearchString {
    NativeString value = native_empty_string();
    NativeSearchDestroyFn destroy = nullptr;
    explicit NativeSearchString(NativeSearchDestroyFn fn) : destroy(fn) {}
    NativeSearchString(const NativeSearchString &) = delete;
    NativeSearchString &operator=(const NativeSearchString &) = delete;
    ~NativeSearchString() { if (destroy) destroy(&value); }
};

using NativeSearchFoldFn = void (*)(NativeString *);
static void fold_native_search_query(NativeString *text, NativeSearchFoldFn original) {
    NativeInputCallbackScope callback;
    try { if (fold_native_unicode_search_query(text)) return; } catch (...) {}
    if (original) callback.call_native([&] { original(text); });
}

static void fold_native_search_term(NativeString *text,
        const NativeString *query_string, NativeSearchFoldFn original) {
    NativeInputCallbackScope callback;
    try {
        std::string_view query;
        // Translated matching needs the complete display spelling, including
        // generated names. Only temporary filter strings reach this boundary.
        if (g_overlay.translation_enabled() &&
            native_string_view(query_string, &query, 4096) &&
            contains_non_ascii_codepoint(query)) return;
    } catch (...) {}
    if (original) callback.call_native([&] { original(text); });
}

// Some native compilers inline substring comparisons. Their temporary search
// key is still prepared at a normal folding call. Feed the SAME match result
// into that temporary key, without editing candidate records or duplicating
// candidate traversal/eligibility/selection in another implementation.
template<typename Match>
static void prepare_native_inlined_search_term(NativeString *term,
        const NativeString *query_string, NativeSearchFoldFn original, Match match) {
    NativeInputCallbackScope callback;
    if (original) callback.call_native([&] { original(term); });
    try {
        std::string_view query, text;
        if (!g_overlay.translation_enabled() ||
            !native_string_view(query_string, &query, 4096) ||
            !contains_non_ascii_codepoint(query) ||
            !native_string_view(term, &text, 65536) ||
            text.find(query) != std::string_view::npos || !match(text, query)) return;
        // Native assignment preserves the game's allocator/SSO ownership.
        // Only this filter's disposable key is changed, never its source.
        const auto assign = reinterpret_cast<void (*)(NativeString *, const char *)>(
            native_history_page_address(NativeHistoryPageSymbol::AssignLiteral));
        if (assign) {
            const std::string committed(query);
            assign(term, committed.c_str());
        }
    } catch (...) {}
}
