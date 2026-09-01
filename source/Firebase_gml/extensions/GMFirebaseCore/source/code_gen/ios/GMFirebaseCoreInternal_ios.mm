// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseCoreInternal_ios.h"
#import "native/GMFirebaseCoreInternal_exports.h"
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

@implementation GMFirebaseCoreInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseCoreInternal class];

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

- (double)__EXT_NATIVE__firebase_app_initialize
{
    return __EXT_NATIVE__firebase_app_initialize();
}
- (double)__EXT_NATIVE__firebase_app_is_initialized
{
    return __EXT_NATIVE__firebase_app_is_initialized();
}
- (char*)__EXT_NATIVE__firebase_app_get_name
{
    return __EXT_NATIVE__firebase_app_get_name();
}
- (double)__EXT_NATIVE__firebase_last_error_code
{
    return __EXT_NATIVE__firebase_last_error_code();
}
- (char*)__EXT_NATIVE__firebase_last_error_message
{
    return __EXT_NATIVE__firebase_last_error_message();
}
- (double)__EXT_NATIVE__firebase_app_get_default_handle:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_get_default_handle(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_get_instance:(char*)name arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_get_instance(name, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_get_apps:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_get_apps(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_initialize_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_initialize_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_initialize_from_json:(char*)json_config arg1:(char*)name arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_initialize_from_json(json_config, name, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_app_handle_get_name:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_handle_get_name(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_handle_get_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_handle_get_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_get_default_options:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_app_get_default_options(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_app_release_handle:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_app_release_handle(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_set_log_level:(double)level
{
    return __EXT_NATIVE__firebase_set_log_level(level);
}
- (double)__EXT_NATIVE__firebase_get_log_level
{
    return __EXT_NATIVE__firebase_get_log_level();
}
- (char*)__EXT_NATIVE__firebase_get_sdk_version
{
    return __EXT_NATIVE__firebase_get_sdk_version();
}
@end

