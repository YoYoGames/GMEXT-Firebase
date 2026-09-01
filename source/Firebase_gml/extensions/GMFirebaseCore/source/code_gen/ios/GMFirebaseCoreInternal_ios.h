// ##### extgen :: Auto-generated file do not edit!! #####

#import <Foundation/Foundation.h>

@interface GMFirebaseCoreInternal : NSObject
- (double)__EXT_NATIVE__firebase_app_initialize;
- (double)__EXT_NATIVE__firebase_app_is_initialized;
- (char*)__EXT_NATIVE__firebase_app_get_name;
- (double)__EXT_NATIVE__firebase_last_error_code;
- (char*)__EXT_NATIVE__firebase_last_error_message;
- (double)__EXT_NATIVE__firebase_app_get_default_handle:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_get_instance:(char*)name arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_get_apps:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_initialize_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_initialize_from_json:(char*)json_config arg1:(char*)name arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (char*)__EXT_NATIVE__firebase_app_handle_get_name:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_app_handle_get_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_get_default_options:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_release_handle:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_set_log_level:(double)level;
- (double)__EXT_NATIVE__firebase_get_log_level;
- (char*)__EXT_NATIVE__firebase_get_sdk_version;
@end

