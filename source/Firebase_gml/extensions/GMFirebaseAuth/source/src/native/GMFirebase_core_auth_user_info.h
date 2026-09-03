#pragma once

#include <string>

// Mirrors gm_structs::FirebaseAuthUserInfo (this module's own extgen-generated
// type) field-for-field. GMFirebaseCore cannot depend on a product module's
// generated code, so this hand-written twin is what actually crosses the
// Core<->Auth boundary; firebase_auth_user_get_info() below copies these
// fields into the real gm_structs::FirebaseAuthUserInfo its generated stub
// expects.
//
// Duplicated verbatim in GMFirebaseCore/source/src/native/ (same pattern as
// GMFirebase_core_api.h / GMFirebase_core_client.h) - keep both copies in
// sync if this ever changes.
struct GMFirebaseAuthUserInfo
{
    std::string uid;
    std::string email;
    std::string display_name;
    std::string photo_url;
    std::string provider_id;
    std::string phone_number;
    bool is_email_verified;
    bool is_anonymous;
    bool is_valid;
    double creation_timestamp;
    double last_sign_in_timestamp;
};
