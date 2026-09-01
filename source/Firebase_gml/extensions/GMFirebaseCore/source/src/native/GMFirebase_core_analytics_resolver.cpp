#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseAnalyticsInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_analytics_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_analytics_initialize") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_initialize);
    if (std::strcmp(symbol, "firebase_analytics_terminate") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_terminate);
    if (std::strcmp(symbol, "firebase_analytics_set_analytics_collection_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_analytics_collection_enabled);
    if (std::strcmp(symbol, "firebase_analytics_set_consent") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_consent);
    if (std::strcmp(symbol, "firebase_analytics_log_event") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_log_event);
    if (std::strcmp(symbol, "firebase_analytics_log_event_string") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_log_event_string);
    if (std::strcmp(symbol, "firebase_analytics_log_event_number") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_log_event_number);
    if (std::strcmp(symbol, "firebase_analytics_log_event_params") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_log_event_params);
    if (std::strcmp(symbol, "firebase_analytics_set_default_event_parameters") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_default_event_parameters);
    if (std::strcmp(symbol, "firebase_analytics_log_apple_transaction") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_log_apple_transaction);
    if (std::strcmp(symbol, "firebase_analytics_set_user_property") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_user_property);
    if (std::strcmp(symbol, "firebase_analytics_set_user_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_user_id);
    if (std::strcmp(symbol, "firebase_analytics_set_session_timeout_duration") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_session_timeout_duration);
    if (std::strcmp(symbol, "firebase_analytics_reset_analytics_data") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_reset_analytics_data);
    if (std::strcmp(symbol, "firebase_analytics_get_analytics_instance_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_get_analytics_instance_id);
    if (std::strcmp(symbol, "firebase_analytics_get_session_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_get_session_id);
    if (std::strcmp(symbol, "firebase_analytics_notify_app_lifecycle_termination") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_notify_app_lifecycle_termination);
    if (std::strcmp(symbol, "firebase_analytics_is_desktop_initialized") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_is_desktop_initialized);
    if (std::strcmp(symbol, "firebase_analytics_set_desktop_debug_mode") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_desktop_debug_mode);
    if (std::strcmp(symbol, "firebase_analytics_set_log_callback") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_set_log_callback);
    if (std::strcmp(symbol, "firebase_analytics_initiate_on_device_conversion_measurement_email") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_initiate_on_device_conversion_measurement_email);
    if (std::strcmp(symbol, "firebase_analytics_initiate_on_device_conversion_measurement_phone") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_initiate_on_device_conversion_measurement_phone);
    if (std::strcmp(symbol, "firebase_analytics_notify_app_lifecycle_change") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_notify_app_lifecycle_change);
    if (std::strcmp(symbol, "firebase_analytics_initiate_on_device_conversion_measurement_hashed_email") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_initiate_on_device_conversion_measurement_hashed_email);
    if (std::strcmp(symbol, "firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone);
    if (std::strcmp(symbol, "firebase_analytics_initialize_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_analytics_initialize_for_app);
    return nullptr;
}
