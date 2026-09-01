#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseUMPInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_ump_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_ump_get_instance") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_get_instance);
    if (std::strcmp(symbol, "firebase_ump_get_consent_status") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_get_consent_status);
    if (std::strcmp(symbol, "firebase_ump_get_consent_form_status") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_get_consent_form_status);
    if (std::strcmp(symbol, "firebase_ump_get_privacy_options_requirement_status") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_get_privacy_options_requirement_status);
    if (std::strcmp(symbol, "firebase_ump_can_request_ads") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_can_request_ads);
    if (std::strcmp(symbol, "firebase_ump_reset") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_reset);
    if (std::strcmp(symbol, "firebase_ump_request_consent_info_update") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_request_consent_info_update);
    if (std::strcmp(symbol, "firebase_ump_load_consent_form") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_load_consent_form);
    if (std::strcmp(symbol, "firebase_ump_show_consent_form") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_show_consent_form);
    if (std::strcmp(symbol, "firebase_ump_load_and_show_consent_form_if_required") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_load_and_show_consent_form_if_required);
    if (std::strcmp(symbol, "firebase_ump_show_privacy_options_form") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_show_privacy_options_form);
    if (std::strcmp(symbol, "firebase_ump_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_ump_get_instance_for_app);
    return nullptr;
}
