// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseFunctionsInternal_ios.h"
#import "native/GMFirebaseFunctionsInternal_exports.h"
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

@implementation GMFirebaseFunctionsInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseFunctionsInternal class];

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

- (double)__EXT_NATIVE__firebase_functions_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_instance_with_region:(char*)region arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_instance_with_region(region, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_use_functions_emulator:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_functions_use_functions_emulator(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_https_callable:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_https_callable(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_https_callable_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_https_callable_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_https_callable_from_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_https_callable_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_https_callable_from_url_with_options:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_https_callable_from_url_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_callable_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_functions_callable_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_callable_call:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_functions_callable_call(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_callable_call_with_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_functions_callable_call_with_data(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_callable_get_functions:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_callable_get_functions(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_instance_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_functions_get_instance_for_app_region:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_functions_get_instance_for_app_region(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseFunctions_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseFunctions_invocation_handler(__arg_buffer, __arg_buffer_length);
}
@end

