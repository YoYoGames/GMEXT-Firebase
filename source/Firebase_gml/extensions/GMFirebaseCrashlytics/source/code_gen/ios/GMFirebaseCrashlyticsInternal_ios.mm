// ##### extgen :: Auto-generated file do not edit!! #####

#import <objc/runtime.h>
#import "core/GMExtUtils.h"
#import "GMFirebaseCrashlyticsInternal_ios.h"


extern "C" const char* extOptGetString(char* _ext, char* _opt);

// Adapter: matches const signature expected by the C++ API
static const char* ExtOptGetString(const char* ext, const char* opt)
{
    return extOptGetString(const_cast<char*>(ext), const_cast<char*>(opt));
}

extern "C" const char* extGetVersion(char* _ext);

// Adapter: matches const signature expected by the C++ API
static const char* ExtGetVersion(const char* ext)
{
    return extGetVersion(const_cast<char*>(ext));
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

@interface GMFirebaseCrashlyticsInternal ()
{
    gm::runtime::DispatchQueue __dispatch_queue;
    id<GMFirebaseCrashlyticsInterface> __impl;
}@end


@implementation GMFirebaseCrashlyticsInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseCrashlyticsInternal class];

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
    ri.ExtGetVersion = &ExtGetVersion;
    GMExtensionInitialise(&ri, sizeof(ri));
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        __impl = (id<GMFirebaseCrashlyticsInterface>)self;
    }
    return self;
}
- (double)__EXT_NATIVE__firebase_crashlytics_set_collection_enabled:(double)enabled
{
    [__impl firebase_crashlytics_set_collection_enabled:enabled];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_is_collection_enabled
{
    bool __result = [__impl firebase_crashlytics_is_collection_enabled];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_crashlytics_did_crash_on_previous_execution
{
    bool __result = [__impl firebase_crashlytics_did_crash_on_previous_execution];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_crashlytics_log:(char*)message
{
    [__impl firebase_crashlytics_log:message];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_set_user_id:(char*)user_id
{
    [__impl firebase_crashlytics_set_user_id:user_id];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_set_custom_key_string:(char*)key arg1:(char*)value
{
    [__impl firebase_crashlytics_set_custom_key_string:key value:value];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_set_custom_key_real:(char*)key arg1:(double)value
{
    [__impl firebase_crashlytics_set_custom_key_real:key value:static_cast<double>(value)];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_set_custom_key_bool:(char*)key arg1:(double)value
{
    [__impl firebase_crashlytics_set_custom_key_bool:key value:static_cast<bool>(value)];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_record_error:(char*)domain arg1:(double)code arg2:(char*)message
{
    [__impl firebase_crashlytics_record_error:domain code:static_cast<std::int32_t>(code) message:message];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_check_for_unsent_reports:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: callback, type: Function
    gm::wire::GMFunction callback = gm::wire::codec::readFunction(__br, &__dispatch_queue);

    [__impl firebase_crashlytics_check_for_unsent_reports:callback];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_send_unsent_reports
{
    [__impl firebase_crashlytics_send_unsent_reports];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_delete_unsent_reports
{
    [__impl firebase_crashlytics_delete_unsent_reports];

    return 0;
}

- (double)__EXT_NATIVE__firebase_crashlytics_test_crash
{
    [__impl firebase_crashlytics_test_crash];

    return 0;
}

// Internal function used for fetching dispatched function calls to GML
- (double)__EXT_NATIVE__GMFirebaseCrashlytics_invocation_handler:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    gm::byteio::BufferWriter __bw{ __ret_buffer, static_cast<size_t>(__ret_buffer_length) };
    return __dispatch_queue.fetch(__bw);
}

@end

