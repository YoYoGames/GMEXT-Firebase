// ##### extgen :: Auto-generated file do not edit!! #####

#import <Foundation/Foundation.h>

@interface GMFirebaseAppCheckInternal : NSObject
- (double)__EXT_NATIVE__firebase_app_check_set_provider_factory:(double)provider;
- (double)__EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token:(char*)token;
- (double)__EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled:(double)enabled;
- (double)__EXT_NATIVE__firebase_app_check_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_get_limited_use_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_add_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_remove_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_get_app:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_get_instance_handle:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_get_instance_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_instance_get_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_instance_set_token_auto_refresh_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_instance_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_instance_get_limited_use_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_app_check_instance_add_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length;
- (double)__EXT_NATIVE__GMFirebaseAppCheck_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
@end

