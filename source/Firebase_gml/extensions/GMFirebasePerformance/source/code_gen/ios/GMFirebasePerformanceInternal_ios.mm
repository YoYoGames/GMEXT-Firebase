// ##### extgen :: Auto-generated file do not edit!! #####

#import <objc/runtime.h>
#import "core/GMExtUtils.h"
#import "GMFirebasePerformanceInternal_ios.h"


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

@interface GMFirebasePerformanceInternal ()
{
    id<GMFirebasePerformanceInterface> __impl;
}@end


@implementation GMFirebasePerformanceInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebasePerformanceInternal class];

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
        __impl = (id<GMFirebasePerformanceInterface>)self;
    }
    return self;
}
- (double)__EXT_NATIVE__firebase_performance_set_collection_enabled:(double)enabled
{
    [__impl firebase_performance_set_collection_enabled:enabled];

    return 0;
}

- (double)__EXT_NATIVE__firebase_performance_is_collection_enabled
{
    bool __result = [__impl firebase_performance_is_collection_enabled];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_trace_start:(char*)name
{
    double __result = [__impl firebase_performance_trace_start:name];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_trace_stop:(double)trace
{
    bool __result = [__impl firebase_performance_trace_stop:trace];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_trace_put_attribute:(double)trace arg1:(char*)key arg2:(char*)value
{
    bool __result = [__impl firebase_performance_trace_put_attribute:trace key:key value:value];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_trace_remove_attribute:(double)trace arg1:(char*)key
{
    bool __result = [__impl firebase_performance_trace_remove_attribute:trace key:key];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_trace_put_metric:(double)trace arg1:(char*)name arg2:(double)value
{
    bool __result = [__impl firebase_performance_trace_put_metric:trace name:name value:static_cast<double>(value)];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_trace_increment_metric:(double)trace arg1:(char*)name arg2:(double)increment_by
{
    bool __result = [__impl firebase_performance_trace_increment_metric:trace name:name increment_by:static_cast<double>(increment_by)];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_start:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    gm::byteio::BufferReader __br{__arg_buffer, static_cast<size_t>(__arg_buffer_length)};

    // field: url, type: String
    std::string_view url = gm::wire::codec::readValue<std::string_view>(__br);

    // field: method, type: enum FirebasePerformanceHttpMethod
    gm_enums::FirebasePerformanceHttpMethod method = gm::wire::codec::readValue<gm_enums::FirebasePerformanceHttpMethod>(__br);

    double __result = [__impl firebase_performance_http_metric_start:url method:method];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_set_response_code:(double)metric arg1:(double)response_code
{
    bool __result = [__impl firebase_performance_http_metric_set_response_code:metric response_code:static_cast<std::int32_t>(response_code)];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_set_request_payload_size:(double)metric arg1:(double)bytes
{
    bool __result = [__impl firebase_performance_http_metric_set_request_payload_size:metric bytes:static_cast<double>(bytes)];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_set_response_payload_size:(double)metric arg1:(double)bytes
{
    bool __result = [__impl firebase_performance_http_metric_set_response_payload_size:metric bytes:static_cast<double>(bytes)];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_set_response_content_type:(double)metric arg1:(char*)content_type
{
    bool __result = [__impl firebase_performance_http_metric_set_response_content_type:metric content_type:content_type];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_put_attribute:(double)metric arg1:(char*)key arg2:(char*)value
{
    bool __result = [__impl firebase_performance_http_metric_put_attribute:metric key:key value:value];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_remove_attribute:(double)metric arg1:(char*)key
{
    bool __result = [__impl firebase_performance_http_metric_remove_attribute:metric key:key];

    return static_cast<double>(__result);
}

- (double)__EXT_NATIVE__firebase_performance_http_metric_stop:(double)metric
{
    bool __result = [__impl firebase_performance_http_metric_stop:metric];

    return static_cast<double>(__result);
}

@end

