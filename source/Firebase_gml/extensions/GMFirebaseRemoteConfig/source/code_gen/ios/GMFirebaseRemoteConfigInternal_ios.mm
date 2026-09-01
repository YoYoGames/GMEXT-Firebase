// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseRemoteConfigInternal_ios.h"
#import "native/GMFirebaseRemoteConfigInternal_exports.h"
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

@implementation GMFirebaseRemoteConfigInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseRemoteConfigInternal class];

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

- (double)__EXT_NATIVE__firebase_remote_config_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_ensure_initialized:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_ensure_initialized(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_set_config_settings:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_set_config_settings(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_config_settings_fetch_timeout:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_config_settings_fetch_timeout(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_config_settings_minimum_fetch_interval:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_config_settings_minimum_fetch_interval(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_fetch:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_fetch(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_fetch_with_expiration:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_fetch_with_expiration(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_fetch_and_activate:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_fetch_and_activate(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_activate:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_activate(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_boolean:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_boolean(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_long:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_long(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_double:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_double(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_remote_config_get_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_data_size:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_data_size(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_data(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_keys_by_prefix:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_keys_by_prefix(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_keys:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_keys(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_all:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_all(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_set_defaults:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_set_defaults(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_add_config_update_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_add_config_update_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_remove_config_update_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_remove_config_update_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_ensure_initialized_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_ensure_initialized_info(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_boolean_with_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_boolean_with_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_long_with_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_long_with_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_double_with_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_double_with_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_string_with_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_string_with_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_data_with_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_data_with_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_remote_config_get_instance_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_remote_config_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseRemoteConfig_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseRemoteConfig_invocation_handler(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseRemoteConfig_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseRemoteConfig_queue_buffer(__arg_buffer, __arg_buffer_length);
}
@end

