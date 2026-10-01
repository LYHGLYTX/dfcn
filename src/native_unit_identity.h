#pragma once

#include "native_history_data.h"

namespace dfcn {

enum class NativeUnitIdentityForm { Role, Name, NameOnly, Full };
enum class NativeUnitNamePrefix { None, Stray, Fierce, Agitated };

// Owned values read at the game's unit formatter boundary. In particular,
// custom_profession is an actual unit field, never an inference from English.
struct NativeUnitIdentity {
    NativeHistoryName name;
    std::array<std::string, 7> native_name_words;
    bool native_name_words_valid = false;
    std::string native_name, native_role, custom_profession;
    std::string creature_id, caste_id, caste_name;
    std::string raw_profession, curse_name, curse_name_prefix, animated_name;
    int32_t id = -1, race = -1, caste = -1, profession = -1, training_level = -1;
    int8_t sex = -1;
    NativeUnitIdentityForm form = NativeUnitIdentityForm::Full;
    NativeUnitNamePrefix prefix = NativeUnitNamePrefix::None;
    bool tame = false, gelded = false, ghostly = false;
    bool two_genders = false, pet = false, curse_named = false, undead = false;
    bool use_custom = true, show_gender = false, include_status = false;
    bool name_fallback = false, english_name = false;
    bool name_quoted = false;
};

} // namespace dfcn
