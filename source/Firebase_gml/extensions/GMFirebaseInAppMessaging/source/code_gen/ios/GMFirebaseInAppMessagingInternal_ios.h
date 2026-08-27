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

@protocol GMFirebaseInAppMessagingInterface <NSObject>
- (void)firebase_in_app_messaging_set_automatic_data_collection_enabled:(bool)enabled;
- (bool)firebase_in_app_messaging_is_automatic_data_collection_enabled;
- (void)firebase_in_app_messaging_set_messages_suppressed:(bool)suppressed;
- (bool)firebase_in_app_messaging_are_messages_suppressed;
- (void)firebase_in_app_messaging_trigger_event:(std::string_view)event_name;
- (void)firebase_in_app_messaging_set_impression_callback:(gm::wire::GMFunction)callback;
- (void)firebase_in_app_messaging_set_click_callback:(gm::wire::GMFunction)callback;
- (void)firebase_in_app_messaging_set_dismiss_callback:(gm::wire::GMFunction)callback;
- (void)firebase_in_app_messaging_set_display_error_callback:(gm::wire::GMFunction)callback;
- (void)firebase_in_app_messaging_clear_callbacks;
@end


@interface GMFirebaseInAppMessagingInternal : NSObject
- (double)__EXT_NATIVE__firebase_in_app_messaging_set_automatic_data_collection_enabled:(double)enabled;
- (double)__EXT_NATIVE__firebase_in_app_messaging_is_automatic_data_collection_enabled;
- (double)__EXT_NATIVE__firebase_in_app_messaging_set_messages_suppressed:(double)suppressed;
- (double)__EXT_NATIVE__firebase_in_app_messaging_are_messages_suppressed;
- (double)__EXT_NATIVE__firebase_in_app_messaging_trigger_event:(char*)event_name;
- (double)__EXT_NATIVE__firebase_in_app_messaging_set_impression_callback:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_in_app_messaging_set_click_callback:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_in_app_messaging_set_dismiss_callback:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_in_app_messaging_set_display_error_callback:(char*)__arg_buffer arg1:(double)__arg_buffer_length;
- (double)__EXT_NATIVE__firebase_in_app_messaging_clear_callbacks;
- (double)__EXT_NATIVE__GMFirebaseInAppMessaging_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length;
@end


