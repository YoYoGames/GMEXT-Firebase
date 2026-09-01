// ##### extgen :: Auto-generated file do not edit!! #####

#import <Foundation/Foundation.h>

@interface GMFirebaseMessagingInternal : NSObject
- (double)__EXT_NATIVE__firebase_messaging_initialize;
- (double)__EXT_NATIVE__firebase_messaging_terminate;
- (double)__EXT_NATIVE__firebase_messaging_set_token_registration_on_init_enabled:(double)enabled;
- (double)__EXT_NATIVE__firebase_messaging_is_token_registration_on_init_enabled;
- (double)__EXT_NATIVE__firebase_messaging_delivery_metrics_export_to_big_query_enabled;
- (double)__EXT_NATIVE__firebase_messaging_set_delivery_metrics_export_to_big_query:(double)enabled;
- (double)__EXT_NATIVE__firebase_messaging_request_permission:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_messaging_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_messaging_delete_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_messaging_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_messaging_unsubscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_messaging_poll_message;
- (double)__EXT_NATIVE__firebase_messaging_poll_token;
- (char*)__EXT_NATIVE__firebase_messaging_current_token;
- (char*)__EXT_NATIVE__firebase_messaging_message_from;
- (char*)__EXT_NATIVE__firebase_messaging_message_to;
- (char*)__EXT_NATIVE__firebase_messaging_message_collapse_key;
- (char*)__EXT_NATIVE__firebase_messaging_message_message_id;
- (char*)__EXT_NATIVE__firebase_messaging_message_message_type;
- (char*)__EXT_NATIVE__firebase_messaging_message_priority;
- (char*)__EXT_NATIVE__firebase_messaging_message_original_priority;
- (double)__EXT_NATIVE__firebase_messaging_message_time_to_live;
- (double)__EXT_NATIVE__firebase_messaging_message_sent_time;
- (char*)__EXT_NATIVE__firebase_messaging_message_error;
- (char*)__EXT_NATIVE__firebase_messaging_message_error_description;
- (char*)__EXT_NATIVE__firebase_messaging_message_link;
- (double)__EXT_NATIVE__firebase_messaging_message_notification_opened;
- (double)__EXT_NATIVE__firebase_messaging_message_data_count;
- (char*)__EXT_NATIVE__firebase_messaging_message_data_key_at:(double)index;
- (char*)__EXT_NATIVE__firebase_messaging_message_get_data:(char*)key;
- (double)__EXT_NATIVE__firebase_messaging_message_raw_data_size;
- (double)__EXT_NATIVE__firebase_messaging_message_raw_data_copy:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_messaging_message_has_notification;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_title;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_body;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_icon;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_sound;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_badge;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_tag;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_color;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_click_action;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_body_loc_key;
- (double)__EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_count;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_at:(double)index;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_title_loc_key;
- (double)__EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_count;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_at:(double)index;
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_android_channel_id;
- (double)__EXT_NATIVE__firebase_messaging_initialize_with_options:(double)suppress_notification_permission_prompt;
- (double)__EXT_NATIVE__firebase_messaging_initialize_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_messaging_initialize_for_app_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__GMFirebaseMessaging_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__GMFirebaseMessaging_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
@end

