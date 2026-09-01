// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseAppCheckInternal_ios.h"
#import "native/GMFirebaseAppCheckInternal_exports.h"
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

@implementation GMFirebaseAppCheckInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseAppCheckInternal class];

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

- (double)__EXT_NATIVE__firebase_app_check_set_provider_factory:(double)provider
{
    return __EXT_NATIVE__firebase_app_check_set_provider_factory(provider);
}
- (double)__EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token:(char*)token
{
    return __EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token(token);
}
- (double)__EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled:(double)enabled
{
    return __EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled(enabled);
}
- (double)__EXT_NATIVE__firebase_app_check_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_get_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_get_limited_use_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_get_limited_use_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_add_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_add_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_remove_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_remove_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_get_app:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_get_app(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_get_instance_handle:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_get_instance_handle(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_get_instance_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_instance_get_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_instance_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_instance_set_token_auto_refresh_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_instance_set_token_auto_refresh_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_instance_get_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_instance_get_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_instance_get_limited_use_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_instance_get_limited_use_token(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_check_instance_add_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_check_instance_add_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseAppCheck_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseAppCheck_invocation_handler(__arg_buffer, __arg_buffer_length);
}
@end

