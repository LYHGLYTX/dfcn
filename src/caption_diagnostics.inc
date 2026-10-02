// Data-only entry for inspecting the actual caption translators in a separate
// process. It never initializes graphics, fonts, hooks or the running game.
// The caller supplies the game root as its working directory.
#include <limits>

namespace dfcn {

int Overlay::caption_diagnostic(std::string_view route, std::string_view source,
        std::string &output) {
    TranslationStateScope state;
    output.clear();
    if (source.empty() || (route != "item" && route != "inventory" &&
            route != "building" && route != "tile" && route != "term" &&
            route != "subject" && route != "person" && route != "composition" &&
            route != "engraving" && route != "planned_engraving")) {
        output = "Invalid diagnostic route or empty source";
        return -4;
    }
    // Native captures use CP437, with authored CJK retained by the existing
    // converter. Also accept an already-native byte string from a disassembler.
    auto native = utf8_to_cp437(source, true);
    if (!native) {
        std::vector<uint32_t> codepoints;
        if (decode_utf8(std::string(source), codepoints)) {
            output = "Source contains characters unavailable in native caption encoding";
            return -4;
        }
        native = std::string(source);
    }

    // The exported entry exclusively owns this data-only lifetime. Keep the
    // real global instance so static material bridges see the same dictionaries.
    static const std::string initialization_error = [this] {
        try {
            if (!std::ifstream(runtime::config_path()))
                return std::string("Runtime configuration is missing: ") + runtime::utf8(runtime::config_path());
            if (!load_config()) return std::string("Cannot load caption configuration");
            if (!load_rules()) return std::string("Cannot load translation rules");
            if (!load_generated_instrument_names())
                return std::string("Cannot load native personal/instrument name vocabularies");
            if (!load_procedural_terms())
                return std::string("Cannot load procedural name vocabulary");
            if (!load_compositional_rules())
                return std::string("Cannot load compositional rules: ") + RULESETS.last_load_error();
            return std::string{};
        } catch (const std::exception &error) {
            return std::string("Caption initialization failed: ") + error.what();
        } catch (...) {
            return std::string("Caption initialization failed with an unknown error");
        }
    }();
    if (!initialization_error.empty()) {
        output = initialization_error;
        return -3;
    }

    try {
        TranslationWorkScope work;
        TranslationWorkFrame frame("caption diagnostic", *native);
        std::optional<std::string> target;
        if (route == "item") target = translate_fortress_item_caption(*native);
        else if (route == "inventory") target = translate_inventory_item_name(*native, -1, -1);
        else if (route == "term") target = translate_item_description_term(*native);
        else if (route == "subject") target = translate_symbol_elements(*native);
        else if (route == "person") target = translate_legends_name(*native, true);
        else if (route == "composition") target = translate_compositional(*native);
        else if (route == "tile")
            target = translate_info_panel_title(NativeInfoTitleKind::Terrain, *native);
        else if (route == "engraving")
            target = translate_info_panel_title(NativeInfoTitleKind::Engraving, *native);
        else if (route == "planned_engraving")
            target = translate_info_panel_title(NativeInfoTitleKind::PlannedEngraving, *native);
        else target = translate_info_panel_title(NativeInfoTitleKind::Building, *native);
        if (!target) {
            output = "No complete translation for route " + std::string(route);
            return -1;
        }
        output = std::move(*target);
        if (output.size() >= static_cast<size_t>(std::numeric_limits<int>::max())) {
            output = "Caption translation exceeds the diagnostic output limit";
            return -4;
        }
        return static_cast<int>(output.size() + 1);
    } catch (const TranslationWorkLimit &limit) {
        output = "Translation work limit: " + std::string(limit.reason) +
            "; stage=" + limit.stage + "; input=" + native_text_to_utf8(limit.input) +
            "; steps=" + std::to_string(limit.steps) + "; depth=" + std::to_string(limit.depth);
        return -2;
    } catch (const std::exception &error) {
        output = std::string("Caption translation failed: ") + error.what();
        return -5;
    } catch (...) {
        output = "Caption translation failed with an unknown error";
        return -5;
    }
}

} // namespace dfcn

// Positive results give the required UTF-8 byte capacity including NUL; a
// smaller buffer is safely terminated and the caller may request that size.
// Negative results distinguish no match (-1), work limit (-2), initialization
// (-3), invalid input/context (-4) and an unexpected translation failure (-5).
DFCN_EXPORT int dfcn_caption_diagnostic(const char *route, const char *source,
        char *output, size_t capacity) {
    const auto copy = [&](std::string_view text) {
        if (!output || capacity == 0) return;
        const size_t length = std::min(text.size(), capacity - 1);
        std::memcpy(output, text.data(), length);
        output[length] = '\0';
    };
    if (dfcn::g_core_ready) {
        copy("Caption diagnostics are available only in a separate data-only process");
        return -4;
    }
    if (!route || !source || (!output && capacity)) {
        copy("Invalid diagnostic pointer or buffer");
        return -4;
    }
    try {
        std::string result;
        const int status = dfcn::g_overlay.caption_diagnostic(route, source, result);
        copy(result);
        return status;
    } catch (const std::exception &error) {
        copy(error.what());
        return -5;
    } catch (...) {
        copy("Unexpected caption diagnostic error");
        return -5;
    }
}
