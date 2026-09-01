#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseRemoteConfigInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_remote_config_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_remote_config_get_instance") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_instance);
    if (std::strcmp(symbol, "firebase_remote_config_ensure_initialized") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_ensure_initialized);
    if (std::strcmp(symbol, "firebase_remote_config_set_config_settings") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_set_config_settings);
    if (std::strcmp(symbol, "firebase_remote_config_get_config_settings_fetch_timeout") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_config_settings_fetch_timeout);
    if (std::strcmp(symbol, "firebase_remote_config_get_config_settings_minimum_fetch_interval") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_config_settings_minimum_fetch_interval);
    if (std::strcmp(symbol, "firebase_remote_config_fetch") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_fetch);
    if (std::strcmp(symbol, "firebase_remote_config_fetch_with_expiration") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_fetch_with_expiration);
    if (std::strcmp(symbol, "firebase_remote_config_fetch_and_activate") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_fetch_and_activate);
    if (std::strcmp(symbol, "firebase_remote_config_activate") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_activate);
    if (std::strcmp(symbol, "firebase_remote_config_get_boolean") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_boolean);
    if (std::strcmp(symbol, "firebase_remote_config_get_long") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_long);
    if (std::strcmp(symbol, "firebase_remote_config_get_double") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_double);
    if (std::strcmp(symbol, "firebase_remote_config_get_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_string);
    if (std::strcmp(symbol, "firebase_remote_config_get_data_size") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_data_size);
    if (std::strcmp(symbol, "firebase_remote_config_get_data") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_data);
    if (std::strcmp(symbol, "firebase_remote_config_get_keys_by_prefix") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_keys_by_prefix);
    if (std::strcmp(symbol, "firebase_remote_config_get_keys") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_keys);
    if (std::strcmp(symbol, "firebase_remote_config_get_all") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_all);
    if (std::strcmp(symbol, "firebase_remote_config_set_defaults") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_set_defaults);
    if (std::strcmp(symbol, "firebase_remote_config_get_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_info);
    if (std::strcmp(symbol, "firebase_remote_config_add_config_update_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_add_config_update_listener);
    if (std::strcmp(symbol, "firebase_remote_config_remove_config_update_listener") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_remove_config_update_listener);
    if (std::strcmp(symbol, "firebase_remote_config_ensure_initialized_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_ensure_initialized_info);
    if (std::strcmp(symbol, "firebase_remote_config_get_boolean_with_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_boolean_with_info);
    if (std::strcmp(symbol, "firebase_remote_config_get_long_with_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_long_with_info);
    if (std::strcmp(symbol, "firebase_remote_config_get_double_with_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_double_with_info);
    if (std::strcmp(symbol, "firebase_remote_config_get_string_with_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_string_with_info);
    if (std::strcmp(symbol, "firebase_remote_config_get_data_with_info") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_data_with_info);
    if (std::strcmp(symbol, "firebase_remote_config_get_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_app);
    if (std::strcmp(symbol, "firebase_remote_config_get_instance_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_remote_config_get_instance_for_app);
    return nullptr;
}
