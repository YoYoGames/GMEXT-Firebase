// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseMessagingInternal_ios.h"
#import "native/GMFirebaseMessagingInternal_exports.h"
#import <objc/runtime.h>


extern "C" const char* extOptGetString(char* _ext, char* _opt);

// Adapter: matches const signature expected by the C++ API
static const char* ExtOptGetString(const char* ext, const char* opt)
{
    return extOptGetString(const_cast<char*>(ext), const_cast<char*>(opt));
}

static BOOL GMIsSubclassOf(Class cls, Class base)
{
    for (Class c = cls; c != Nil; c = class_getSuperclass(c)) {
        if (c == base) return YES;
    }
    return NO;
}

static void GMInjectSelectorsIntoSubclass(Class subclass, Class base)
{
    // Build set of methods already defined on subclass
    unsigned subCount = 0;
    Method *subList = class_copyMethodList(subclass, &subCount);

    CFMutableSetRef owned = CFSetCreateMutable(kCFAllocatorDefault, 0, NULL);
    for (unsigned i = 0; i < subCount; ++i) {
        CFSetAddValue(owned, method_getName(subList[i]));
    }

    // Walk base class methods
    unsigned baseCount = 0;
    Method *baseList = class_copyMethodList(base, &baseCount);

    for (unsigned i = 0; i < baseCount; ++i) {
        SEL sel = method_getName(baseList[i]);
        const char *name = sel_getName(sel);

        // Only inject extension selectors (methods prefixed with __EXT_NATIVE__)
        if (!name || strncmp(name, "__EXT_NATIVE__", 13) != 0) continue;

        // Add only if subclass doesn't already have it
        if (!CFSetContainsValue(owned, sel)) {
            IMP imp = method_getImplementation(baseList[i]);
            const char *types = method_getTypeEncoding(baseList[i]);
            if (class_addMethod(subclass, sel, imp, types)) {
                CFSetAddValue(owned, sel);
            }
        }
    }

    if (subList) free(subList);
    if (baseList) free(baseList);
    if (owned) CFRelease(owned);
}

@implementation GMFirebaseMessagingInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseMessagingInternal class];

    for (int i = 0; i < num; ++i) {
        Class cls = classes[i];
        if (cls == base) continue;

        // We only care about direct or indirect subclasses
        if (GMIsSubclassOf(cls, base)) {
            GMInjectSelectorsIntoSubclass(cls, base);
        }
    }

    free(classes);

    gm::details::GMRTRunnerInterface ri{};
    ri.ExtOptGetString = &ExtOptGetString;
    GMExtensionInitialise(&ri, sizeof(ri));
}

- (double)__EXT_NATIVE__firebase_messaging_initialize
{
    return __EXT_NATIVE__firebase_messaging_initialize();
}
- (double)__EXT_NATIVE__firebase_messaging_terminate
{
    return __EXT_NATIVE__firebase_messaging_terminate();
}
- (double)__EXT_NATIVE__firebase_messaging_set_token_registration_on_init_enabled:(double)enabled
{
    return __EXT_NATIVE__firebase_messaging_set_token_registration_on_init_enabled(enabled);
}
- (double)__EXT_NATIVE__firebase_messaging_is_token_registration_on_init_enabled
{
    return __EXT_NATIVE__firebase_messaging_is_token_registration_on_init_enabled();
}
- (double)__EXT_NATIVE__firebase_messaging_delivery_metrics_export_to_big_query_enabled
{
    return __EXT_NATIVE__firebase_messaging_delivery_metrics_export_to_big_query_enabled();
}
- (double)__EXT_NATIVE__firebase_messaging_set_delivery_metrics_export_to_big_query:(double)enabled
{
    return __EXT_NATIVE__firebase_messaging_set_delivery_metrics_export_to_big_query(enabled);
}
- (double)__EXT_NATIVE__firebase_messaging_request_permission:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_request_permission(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_messaging_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_get_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_messaging_delete_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_delete_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_messaging_subscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_subscribe(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_messaging_unsubscribe:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_unsubscribe(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_messaging_poll_message
{
    return __EXT_NATIVE__firebase_messaging_poll_message();
}
- (double)__EXT_NATIVE__firebase_messaging_poll_token
{
    return __EXT_NATIVE__firebase_messaging_poll_token();
}
- (char*)__EXT_NATIVE__firebase_messaging_current_token
{
    return __EXT_NATIVE__firebase_messaging_current_token();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_from
{
    return __EXT_NATIVE__firebase_messaging_message_from();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_to
{
    return __EXT_NATIVE__firebase_messaging_message_to();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_collapse_key
{
    return __EXT_NATIVE__firebase_messaging_message_collapse_key();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_message_id
{
    return __EXT_NATIVE__firebase_messaging_message_message_id();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_message_type
{
    return __EXT_NATIVE__firebase_messaging_message_message_type();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_priority
{
    return __EXT_NATIVE__firebase_messaging_message_priority();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_original_priority
{
    return __EXT_NATIVE__firebase_messaging_message_original_priority();
}
- (double)__EXT_NATIVE__firebase_messaging_message_time_to_live
{
    return __EXT_NATIVE__firebase_messaging_message_time_to_live();
}
- (double)__EXT_NATIVE__firebase_messaging_message_sent_time
{
    return __EXT_NATIVE__firebase_messaging_message_sent_time();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_error
{
    return __EXT_NATIVE__firebase_messaging_message_error();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_error_description
{
    return __EXT_NATIVE__firebase_messaging_message_error_description();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_link
{
    return __EXT_NATIVE__firebase_messaging_message_link();
}
- (double)__EXT_NATIVE__firebase_messaging_message_notification_opened
{
    return __EXT_NATIVE__firebase_messaging_message_notification_opened();
}
- (double)__EXT_NATIVE__firebase_messaging_message_data_count
{
    return __EXT_NATIVE__firebase_messaging_message_data_count();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_data_key_at:(double)index
{
    return __EXT_NATIVE__firebase_messaging_message_data_key_at(index);
}
- (char*)__EXT_NATIVE__firebase_messaging_message_get_data:(char*)key
{
    return __EXT_NATIVE__firebase_messaging_message_get_data(key);
}
- (double)__EXT_NATIVE__firebase_messaging_message_raw_data_size
{
    return __EXT_NATIVE__firebase_messaging_message_raw_data_size();
}
- (double)__EXT_NATIVE__firebase_messaging_message_raw_data_copy:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_message_raw_data_copy(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_messaging_message_has_notification
{
    return __EXT_NATIVE__firebase_messaging_message_has_notification();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_title
{
    return __EXT_NATIVE__firebase_messaging_message_notification_title();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_body
{
    return __EXT_NATIVE__firebase_messaging_message_notification_body();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_icon
{
    return __EXT_NATIVE__firebase_messaging_message_notification_icon();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_sound
{
    return __EXT_NATIVE__firebase_messaging_message_notification_sound();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_badge
{
    return __EXT_NATIVE__firebase_messaging_message_notification_badge();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_tag
{
    return __EXT_NATIVE__firebase_messaging_message_notification_tag();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_color
{
    return __EXT_NATIVE__firebase_messaging_message_notification_color();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_click_action
{
    return __EXT_NATIVE__firebase_messaging_message_notification_click_action();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_body_loc_key
{
    return __EXT_NATIVE__firebase_messaging_message_notification_body_loc_key();
}
- (double)__EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_count
{
    return __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_count();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_at:(double)index
{
    return __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_at(index);
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_title_loc_key
{
    return __EXT_NATIVE__firebase_messaging_message_notification_title_loc_key();
}
- (double)__EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_count
{
    return __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_count();
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_at:(double)index
{
    return __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_at(index);
}
- (char*)__EXT_NATIVE__firebase_messaging_message_notification_android_channel_id
{
    return __EXT_NATIVE__firebase_messaging_message_notification_android_channel_id();
}
- (double)__EXT_NATIVE__firebase_messaging_initialize_with_options:(double)suppress_notification_permission_prompt
{
    return __EXT_NATIVE__firebase_messaging_initialize_with_options(suppress_notification_permission_prompt);
}
- (double)__EXT_NATIVE__firebase_messaging_initialize_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_initialize_for_app(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_messaging_initialize_for_app_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_messaging_initialize_for_app_with_options(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseMessaging_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseMessaging_invocation_handler(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseMessaging_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseMessaging_queue_buffer(__arg_buffer, __arg_buffer_length);
}
@end

