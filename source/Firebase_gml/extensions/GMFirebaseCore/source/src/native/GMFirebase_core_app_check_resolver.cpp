#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseAppCheckInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_app_check_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_app_check_set_provider_factory") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_set_provider_factory);
    if (std::strcmp(symbol, "firebase_app_check_debug_provider_set_debug_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_debug_provider_set_debug_token);
    if (std::strcmp(symbol, "firebase_app_check_set_token_auto_refresh_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_set_token_auto_refresh_enabled);
    if (std::strcmp(symbol, "firebase_app_check_get_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_get_token);
    if (std::strcmp(symbol, "firebase_app_check_get_limited_use_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_get_limited_use_token);
    if (std::strcmp(symbol, "firebase_app_check_add_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_add_listener);
    if (std::strcmp(symbol, "firebase_app_check_remove_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_remove_listener);
    if (std::strcmp(symbol, "firebase_app_check_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_get_app);
    if (std::strcmp(symbol, "firebase_app_check_get_instance_handle") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_get_instance_handle);
    if (std::strcmp(symbol, "firebase_app_check_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_get_instance_for_app);
    if (std::strcmp(symbol, "firebase_app_check_instance_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_instance_get_app);
    if (std::strcmp(symbol, "firebase_app_check_instance_set_token_auto_refresh_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_instance_set_token_auto_refresh_enabled);
    if (std::strcmp(symbol, "firebase_app_check_instance_get_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_instance_get_token);
    if (std::strcmp(symbol, "firebase_app_check_instance_get_limited_use_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_instance_get_limited_use_token);
    if (std::strcmp(symbol, "firebase_app_check_instance_add_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_app_check_instance_add_listener);
    return nullptr;
}
