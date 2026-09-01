// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseAnalyticsInternal_ios.h"
#import "native/GMFirebaseAnalyticsInternal_exports.h"
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

@implementation GMFirebaseAnalyticsInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseAnalyticsInternal class];

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

- (double)__EXT_NATIVE__firebase_analytics_initialize
{
    return __EXT_NATIVE__firebase_analytics_initialize();
}
- (double)__EXT_NATIVE__firebase_analytics_terminate
{
    return __EXT_NATIVE__firebase_analytics_terminate();
}
- (double)__EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled:(double)enabled
{
    return __EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled(enabled);
}
- (double)__EXT_NATIVE__firebase_analytics_set_consent:(double)ad_storage arg1:(double)analytics_storage arg2:(double)ad_user_data arg3:(double)ad_personalization
{
    return __EXT_NATIVE__firebase_analytics_set_consent(ad_storage, analytics_storage, ad_user_data, ad_personalization);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event:(char*)name
{
    return __EXT_NATIVE__firebase_analytics_log_event(name);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event_string:(char*)name arg1:(char*)parameter_name arg2:(char*)parameter_value
{
    return __EXT_NATIVE__firebase_analytics_log_event_string(name, parameter_name, parameter_value);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event_number:(char*)name arg1:(char*)parameter_name arg2:(double)parameter_value
{
    return __EXT_NATIVE__firebase_analytics_log_event_number(name, parameter_name, parameter_value);
}
- (double)__EXT_NATIVE__firebase_analytics_log_event_params:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_log_event_params(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_set_default_event_parameters:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_set_default_event_parameters(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_log_apple_transaction:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_log_apple_transaction(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_set_user_property:(char*)name arg1:(char*)value
{
    return __EXT_NATIVE__firebase_analytics_set_user_property(name, value);
}
- (double)__EXT_NATIVE__firebase_analytics_set_user_id:(char*)user_id
{
    return __EXT_NATIVE__firebase_analytics_set_user_id(user_id);
}
- (double)__EXT_NATIVE__firebase_analytics_set_session_timeout_duration:(double)milliseconds
{
    return __EXT_NATIVE__firebase_analytics_set_session_timeout_duration(milliseconds);
}
- (double)__EXT_NATIVE__firebase_analytics_reset_analytics_data
{
    return __EXT_NATIVE__firebase_analytics_reset_analytics_data();
}
- (double)__EXT_NATIVE__firebase_analytics_get_analytics_instance_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_get_analytics_instance_id(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_get_session_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_get_session_id(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination
{
    return __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination();
}
- (double)__EXT_NATIVE__firebase_analytics_is_desktop_initialized
{
    return __EXT_NATIVE__firebase_analytics_is_desktop_initialized();
}
- (double)__EXT_NATIVE__firebase_analytics_set_desktop_debug_mode:(double)enabled
{
    return __EXT_NATIVE__firebase_analytics_set_desktop_debug_mode(enabled);
}
- (double)__EXT_NATIVE__firebase_analytics_set_log_callback:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_set_log_callback(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email:(char*)email_address
{
    return __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email(email_address);
}
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone:(char*)phone_number
{
    return __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone(phone_number);
}
- (double)__EXT_NATIVE__firebase_analytics_notify_app_lifecycle_change:(double)state
{
    return __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_change(state);
}
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_analytics_initialize_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_analytics_initialize_for_app(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseAnalytics_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseAnalytics_invocation_handler(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseAnalytics_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseAnalytics_queue_buffer(__arg_buffer, __arg_buffer_length);
}
@end

