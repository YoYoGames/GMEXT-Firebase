// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#include "core/GMExtUtils.h"

GMEXPORT double __EXT_NATIVE__firebase_app_initialize();
GMEXPORT double __EXT_NATIVE__firebase_app_is_initialized();
GMEXPORT char* __EXT_NATIVE__firebase_app_get_name();
GMEXPORT double __EXT_NATIVE__firebase_last_error_code();
GMEXPORT char* __EXT_NATIVE__firebase_last_error_message();
GMEXPORT double __EXT_NATIVE__firebase_app_get_default_handle(char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_app_get_instance(char* name, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_app_get_apps(char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_app_initialize_with_options(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_app_initialize_from_json(char* json_config, char* name, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT char* __EXT_NATIVE__firebase_app_handle_get_name(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_app_handle_get_options(char* __arg_buffer, double __arg_buffer_length, char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_app_get_default_options(char* __ret_buffer, double __ret_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_app_release_handle(char* __arg_buffer, double __arg_buffer_length);
GMEXPORT double __EXT_NATIVE__firebase_set_log_level(double level);
GMEXPORT double __EXT_NATIVE__firebase_get_log_level();
GMEXPORT char* __EXT_NATIVE__firebase_get_sdk_version();

