// ##### extgen :: Auto-generated file do not edit!! #####

#import <Foundation/Foundation.h>

@interface GMFirebaseAnalyticsInternal : NSObject
- (double)__EXT_NATIVE__firebase_analytics_initialize;
- (double)__EXT_NATIVE__firebase_analytics_terminate;
- (double)__EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled:(double)enabled;
- (double)__EXT_NATIVE__firebase_analytics_set_consent:(double)ad_storage arg1:(double)analytics_storage arg2:(double)ad_user_data arg3:(double)ad_personalization;
- (double)__EXT_NATIVE__firebase_analytics_log_event:(char*)name;
- (double)__EXT_NATIVE__firebase_analytics_log_event_string:(char*)name arg1:(char*)parameter_name arg2:(char*)parameter_value;
- (double)__EXT_NATIVE__firebase_analytics_log_event_number:(char*)name arg1:(char*)parameter_name arg2:(double)parameter_value;
- (double)__EXT_NATIVE__firebase_analytics_log_event_params:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_set_default_event_parameters:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_log_apple_transaction:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_set_user_property:(char*)name arg1:(char*)value;
- (double)__EXT_NATIVE__firebase_analytics_set_user_id:(char*)user_id;
- (double)__EXT_NATIVE__firebase_analytics_set_session_timeout_duration:(double)milliseconds;
- (double)__EXT_NATIVE__firebase_analytics_reset_analytics_data;
- (double)__EXT_NATIVE__firebase_analytics_get_analytics_instance_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_get_session_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination;
- (double)__EXT_NATIVE__firebase_analytics_is_desktop_initialized;
- (double)__EXT_NATIVE__firebase_analytics_set_desktop_debug_mode:(double)enabled;
- (double)__EXT_NATIVE__firebase_analytics_set_log_callback:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email:(char*)email_address;
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone:(char*)phone_number;
- (double)__EXT_NATIVE__firebase_analytics_notify_app_lifecycle_change:(double)state;
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_analytics_initialize_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__GMFirebaseAnalytics_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__GMFirebaseAnalytics_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
@end

