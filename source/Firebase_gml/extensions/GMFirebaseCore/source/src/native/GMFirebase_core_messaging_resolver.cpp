#include "GMFirebase_core_product_api.h"
#include <native/GMFirebaseMessagingInternal_native.h>
#include <cstring>

GMFirebaseCoreProc gmfirebase_core_resolve_messaging_proc(const char* symbol)
{
    if (symbol == nullptr) return nullptr;
    if (std::strcmp(symbol, "firebase_messaging_initialize") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_initialize);
    if (std::strcmp(symbol, "firebase_messaging_terminate") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_terminate);
    if (std::strcmp(symbol, "firebase_messaging_set_token_registration_on_init_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_set_token_registration_on_init_enabled);
    if (std::strcmp(symbol, "firebase_messaging_is_token_registration_on_init_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_is_token_registration_on_init_enabled);
    if (std::strcmp(symbol, "firebase_messaging_delivery_metrics_export_to_big_query_enabled") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_delivery_metrics_export_to_big_query_enabled);
    if (std::strcmp(symbol, "firebase_messaging_set_delivery_metrics_export_to_big_query") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_set_delivery_metrics_export_to_big_query);
    if (std::strcmp(symbol, "firebase_messaging_request_permission") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_request_permission);
    if (std::strcmp(symbol, "firebase_messaging_get_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_get_token);
    if (std::strcmp(symbol, "firebase_messaging_delete_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_delete_token);
    if (std::strcmp(symbol, "firebase_messaging_subscribe") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_subscribe);
    if (std::strcmp(symbol, "firebase_messaging_unsubscribe") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_unsubscribe);
    if (std::strcmp(symbol, "firebase_messaging_poll_message") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_poll_message);
    if (std::strcmp(symbol, "firebase_messaging_poll_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_poll_token);
    if (std::strcmp(symbol, "firebase_messaging_current_token") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_current_token);
    if (std::strcmp(symbol, "firebase_messaging_message_from") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_from);
    if (std::strcmp(symbol, "firebase_messaging_message_to") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_to);
    if (std::strcmp(symbol, "firebase_messaging_message_collapse_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_collapse_key);
    if (std::strcmp(symbol, "firebase_messaging_message_message_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_message_id);
    if (std::strcmp(symbol, "firebase_messaging_message_message_type") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_message_type);
    if (std::strcmp(symbol, "firebase_messaging_message_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_priority);
    if (std::strcmp(symbol, "firebase_messaging_message_original_priority") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_original_priority);
    if (std::strcmp(symbol, "firebase_messaging_message_time_to_live") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_time_to_live);
    if (std::strcmp(symbol, "firebase_messaging_message_sent_time") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_sent_time);
    if (std::strcmp(symbol, "firebase_messaging_message_error") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_error);
    if (std::strcmp(symbol, "firebase_messaging_message_error_description") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_error_description);
    if (std::strcmp(symbol, "firebase_messaging_message_link") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_link);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_opened") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_opened);
    if (std::strcmp(symbol, "firebase_messaging_message_data_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_data_count);
    if (std::strcmp(symbol, "firebase_messaging_message_data_key_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_data_key_at);
    if (std::strcmp(symbol, "firebase_messaging_message_get_data") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_get_data);
    if (std::strcmp(symbol, "firebase_messaging_message_raw_data_size") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_raw_data_size);
    if (std::strcmp(symbol, "firebase_messaging_message_raw_data_copy") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_raw_data_copy);
    if (std::strcmp(symbol, "firebase_messaging_message_has_notification") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_has_notification);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_title") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_title);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_body") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_body);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_icon") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_icon);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_sound") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_sound);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_badge") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_badge);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_tag") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_tag);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_color") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_color);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_click_action") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_click_action);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_body_loc_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_body_loc_key);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_body_loc_args_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_body_loc_args_count);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_body_loc_args_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_body_loc_args_at);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_title_loc_key") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_title_loc_key);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_title_loc_args_count") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_title_loc_args_count);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_title_loc_args_at") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_title_loc_args_at);
    if (std::strcmp(symbol, "firebase_messaging_message_notification_android_channel_id") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_message_notification_android_channel_id);
    if (std::strcmp(symbol, "firebase_messaging_initialize_with_options") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_initialize_with_options);
    if (std::strcmp(symbol, "firebase_messaging_initialize_for_app") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_initialize_for_app);
    if (std::strcmp(symbol, "firebase_messaging_initialize_for_app_with_options") == 0)
        return reinterpret_cast<GMFirebaseCoreProc>(&firebase_messaging_initialize_for_app_with_options);
    return nullptr;
}
