// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseDatabaseInternal_ios.h"
#import "native/GMFirebaseDatabaseInternal_exports.h"
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

@implementation GMFirebaseDatabaseInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseDatabaseInternal class];

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

- (double)__EXT_NATIVE__firebase_database_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_instance_for_url:(char*)url arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_instance_for_url(url, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_get_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_reference_at_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_reference_at_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_reference_from_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_reference_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_go_offline:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_go_offline(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_go_online:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_go_online(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_purge_outstanding_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_purge_outstanding_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_set_persistence_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_set_persistence_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_set_log_level:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_set_log_level(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_log_level:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_log_level(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_order_by_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_start_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_start_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_end_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_end_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_equal_to_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_limit_to_first:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_limit_to_last:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_keep_synchronized:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_add_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_value_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_all_value_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_add_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_child_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_all_child_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_order_by_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_order_by_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_start_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_start_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_start_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_start_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_end_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_end_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_end_at_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_end_at_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_equal_to_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_equal_to_key(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_limit_to_first:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_limit_to_first(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_limit_to_last:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_set_keep_synchronized:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_set_keep_synchronized(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_get_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_get_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_add_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_add_value_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_value_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_value_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_all_value_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_all_value_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_add_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_add_child_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_child_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_child_listener(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_remove_all_child_listeners:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_remove_all_child_listeners(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_query_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_query_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_push:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_push(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_go_online:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_go_online(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_go_offline:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_go_offline(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_priority(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_set_value_and_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_set_value_and_priority(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_update_children:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_update_children(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_remove_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_remove_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_run_transaction:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_run_transaction(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_exists:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_exists(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_has_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_has_child(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_has_children:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_has_children(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_children_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_children_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_children:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_children(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_snapshot_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_key(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_get_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_get_priority(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_snapshot_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_snapshot_release(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_ref_key:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_key(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_is_root:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_is_root(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_root:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_root(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_get_database:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_database(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_database_ref_get_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_get_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_server_timestamp:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_server_timestamp(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_ref_on_disconnect:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_ref_on_disconnect(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_on_disconnect_cancel:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_on_disconnect_cancel(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_on_disconnect_remove_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_on_disconnect_remove_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_on_disconnect_set_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_on_disconnect_set_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_on_disconnect_set_value_and_priority:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_on_disconnect_set_value_and_priority(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_on_disconnect_update_children:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_on_disconnect_update_children(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_on_disconnect_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_database_on_disconnect_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_instance_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_database_get_instance_for_app_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_database_get_instance_for_app_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseDatabase_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseDatabase_invocation_handler(__arg_buffer, __arg_buffer_length);
}
@end

