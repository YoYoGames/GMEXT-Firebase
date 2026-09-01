// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include "core/GMExtUtils.h"

// Internal function used for fetching dispatched function calls to GML
GMEXPORT double __EXT_NATIVE__GMFirebaseAnalytics_invocation_handler(char* __ret_buffer, double __ret_buffer_length);

// Internal function used for queueing buffers to native code
GMEXPORT double __EXT_NATIVE__GMFirebaseAnalytics_queue_buffer(char* __arg_buffer, double __arg_buffer_length);

GMEXPORT double __EXT_NATIVE__firebase_analytics_initialize();
GMEXPORT double __EXT_NATIVE__firebase_analytics_terminate();
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled(double enabled);
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization);
GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event(char* name);
GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event_string(char* name, char* parameter_name, char* parameter_value);
GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event_number(char* name, char* parameter_name, double parameter_value);
GMEXPORT double __EXT_NATIVE__firebase_analytics_log_event_params(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_default_event_parameters(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_log_apple_transaction(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_user_property(char* name, char* value);
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_user_id(char* user_id);
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_session_timeout_duration(double milliseconds);
GMEXPORT double __EXT_NATIVE__firebase_analytics_reset_analytics_data();
GMEXPORT double __EXT_NATIVE__firebase_analytics_get_analytics_instance_id(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_get_session_id(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination();
GMEXPORT double __EXT_NATIVE__firebase_analytics_is_desktop_initialized();
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_desktop_debug_mode(double enabled);
GMEXPORT double __EXT_NATIVE__firebase_analytics_set_log_callback(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email(char* email_address);
GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone(char* phone_number);
GMEXPORT double __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_change(double state);
GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_analytics_initialize_for_app(char* __arg_buffer, double __arg_buffer_length);

