// ##### extgen :: Auto-generated file do not edit!! #####

#pragma once
#import <Foundation/Foundation.h>

#include <cstdint>
#include <string_view>
#include <vector>
#include <array>
#include <optional>
#include "core/GMExtWire.h"

namespace gm_consts
{
}


namespace gm_enums
{
}


namespace gm_structs
{

}

namespace gm::wire::codec
{
}

namespace gm::wire::details
{
}

@protocol GMFirebaseCrashlyticsInterface <NSObject>
- (void)firebase_crashlytics_set_collection_enabled:(bool)enabled;
- (bool)firebase_crashlytics_is_collection_enabled;
- (bool)firebase_crashlytics_did_crash_on_previous_execution;
- (void)firebase_crashlytics_log:(std::string_view)message;
- (void)firebase_crashlytics_set_user_id:(std::string_view)user_id;
- (void)firebase_crashlytics_set_custom_key_string:(std::string_view)key value:(std::string_view)value;
- (void)firebase_crashlytics_set_custom_key_real:(std::string_view)key value:(double)value;
- (void)firebase_crashlytics_set_custom_key_bool:(std::string_view)key value:(bool)value;
- (void)firebase_crashlytics_record_error:(std::string_view)domain code:(std::int32_t)code message:(std::string_view)message;
- (void)firebase_crashlytics_check_for_unsent_reports:(gm::wire::GMFunction)callback;
- (void)firebase_crashlytics_send_unsent_reports;
- (void)firebase_crashlytics_delete_unsent_reports;
- (void)firebase_crashlytics_test_crash;
@end


@interface GMFirebaseCrashlyticsInternal : NSObject
- (double)__EXT_NATIVE__firebase_crashlytics_set_collection_enabled:(double)enabled;
- (double)__EXT_NATIVE__firebase_crashlytics_is_collection_enabled;
- (double)__EXT_NATIVE__firebase_crashlytics_did_crash_on_previous_execution;
- (double)__EXT_NATIVE__firebase_crashlytics_log:(char*)message;
- (double)__EXT_NATIVE__firebase_crashlytics_set_user_id:(char*)user_id;
- (double)__EXT_NATIVE__firebase_crashlytics_set_custom_key_string:(char*)key arg1:(char*)value;
- (double)__EXT_NATIVE__firebase_crashlytics_set_custom_key_real:(char*)key arg1:(double)value;
- (double)__EXT_NATIVE__firebase_crashlytics_set_custom_key_bool:(char*)key arg1:(double)value;
- (double)__EXT_NATIVE__firebase_crashlytics_record_error:(char*)domain arg1:(double)code arg2:(char*)message;
- (double)__EXT_NATIVE__firebase_crashlytics_check_for_unsent_reports:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_crashlytics_send_unsent_reports;
- (double)__EXT_NATIVE__firebase_crashlytics_delete_unsent_reports;
- (double)__EXT_NATIVE__firebase_crashlytics_test_crash;
- (double)__EXT_NATIVE__GMFirebaseCrashlytics_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
@end


