// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseFirestoreInternal_ios.h"
#import "native/GMFirebaseFirestoreInternal_exports.h"
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

@implementation GMFirebaseFirestoreInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseFirestoreInternal class];

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

- (double)__EXT_NATIVE__firebase_firestore_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_get_instance_for_database:(char*)database_name arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_get_instance_for_database(database_name, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_settings_get_host:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_get_host(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_settings_set_host:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_set_host(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_settings_get_ssl_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_get_ssl_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_settings_set_ssl_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_set_ssl_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_settings_get_persistence_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_get_persistence_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_settings_set_persistence_enabled:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_set_persistence_enabled(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_settings_get_cache_size_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_get_cache_size_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_settings_set_cache_size_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_set_cache_size_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection_group:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_group(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_batch:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_batch(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_set_log_level:(double)level
{
    return __EXT_NATIVE__firebase_firestore_set_log_level(level);
}
- (double)__EXT_NATIVE__firebase_firestore_enable_network:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_enable_network(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_disable_network:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_disable_network(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_terminate:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_terminate(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_clear_persistence:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_clear_persistence(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_wait_for_pending_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_wait_for_pending_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_run_transaction:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_run_transaction(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_collection_ref_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_id(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_collection_ref_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection_ref_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection_ref_document:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_document(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection_ref_document_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_document_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection_ref_add:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_add(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_collection_ref_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_collection_ref_release(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_document_ref_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_id(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_document_ref_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_collection:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_collection(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_get(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_set:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_set(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_set_merge:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_set_merge(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_set_merge_fields:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_set_merge_fields(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_update:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_update(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_add_snapshot_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_add_snapshot_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_not_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_not_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_less_than:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_less_than(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_greater_than:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_greater_than(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_array_contains:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_array_contains(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_array_contains_any:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_array_contains_any(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_in:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_in(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_not_in:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_not_in(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_order_by:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_order_by(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_limit:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_limit(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_limit_to_last:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_limit_to_last(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_start_at_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_start_at_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_start_at_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_start_at_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_start_after_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_start_after_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_start_after_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_start_after_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_end_before_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_end_before_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_end_before_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_end_before_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_end_at_snapshot:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_end_at_snapshot(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_end_at_values:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_end_at_values(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_get(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_add_snapshot_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_add_snapshot_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_set:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_set(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_set_merge:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_set_merge(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_set_merge_fields:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_set_merge_fields(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_update:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_update(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_commit:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_commit(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_delete
{
    return __EXT_NATIVE__firebase_firestore_field_value_delete();
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_server_timestamp
{
    return __EXT_NATIVE__firebase_firestore_field_value_server_timestamp();
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_array_union:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_array_union(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_array_remove:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_array_remove(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_increment_integer:(double)value
{
    return __EXT_NATIVE__firebase_firestore_field_value_increment_integer(value);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_increment_double:(double)value
{
    return __EXT_NATIVE__firebase_firestore_field_value_increment_double(value);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_integer:(double)value
{
    return __EXT_NATIVE__firebase_firestore_field_value_integer(value);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_double:(double)value
{
    return __EXT_NATIVE__firebase_firestore_field_value_double(value);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_timestamp:(double)seconds arg1:(double)nanoseconds
{
    return __EXT_NATIVE__firebase_firestore_field_value_timestamp(seconds, nanoseconds);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_geo_point:(double)latitude arg1:(double)longitude
{
    return __EXT_NATIVE__firebase_firestore_field_value_geo_point(latitude, longitude);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_reference(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_blob:(char*)data
{
    return __EXT_NATIVE__firebase_firestore_field_value_blob(data);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_null
{
    return __EXT_NATIVE__firebase_firestore_field_value_null();
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_get_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_get(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_get_data:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_get_data(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_get_info:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_get_info(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_documents:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_documents(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_document_changes:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_document_changes(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_listener_registration_remove:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_listener_registration_remove(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_path_create:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_path_create(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_path_document_id
{
    return __EXT_NATIVE__firebase_firestore_field_path_document_id();
}
- (double)__EXT_NATIVE__firebase_firestore_field_path_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_path_is_valid(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_field_path_to_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_path_to_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_path_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_path_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_equal_to(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_not_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_not_equal_to(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_less_than:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_less_than(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_greater_than:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_greater_than(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_array_contains:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_array_contains(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_array_contains_any:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_array_contains_any(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_in:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_in(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_not_in:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_not_in(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_equal_to_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_not_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_not_equal_to_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_less_than_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_less_than_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_less_than_or_equal_to_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_greater_than_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_greater_than_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_greater_than_or_equal_to_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_array_contains_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_array_contains_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_array_contains_any_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_array_contains_any_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_in_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_in_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_not_in_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_not_in_field_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_and:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_and(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_or:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_or(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_filter_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_filter_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_filter:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_filter(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_equal_to_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_not_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_not_equal_to_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_less_than_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_less_than_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_less_than_or_equal_to_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_greater_than_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_greater_than_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_greater_than_or_equal_to_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_array_contains_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_array_contains_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_array_contains_any_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_array_contains_any_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_in_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_in_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_where_not_in_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_where_not_in_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_order_by_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_order_by_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_count(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_query_get_query:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_query_get_query(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_query_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_query_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_query_get:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_query_get(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_query_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_query_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_snapshot_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_snapshot_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_snapshot_get_query:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_snapshot_get_query(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_snapshot_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_snapshot_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_aggregate_snapshot_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_aggregate_snapshot_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_add_snapshots_in_sync_listener:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_add_snapshots_in_sync_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_load_bundle:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_load_bundle(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_named_query:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_named_query(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_set_merge_field_paths:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_set_merge_field_paths(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_set_merge_field_paths:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_set_merge_field_paths(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_type:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_type(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_null:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_null(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_boolean:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_boolean(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_integer:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_integer(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_double:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_double(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_timestamp:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_timestamp(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_blob:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_blob(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_reference(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_geo_point:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_geo_point(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_array:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_array(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_is_map:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_is_map(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_boolean_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_boolean_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_integer_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_integer_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_double_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_double_value(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_field_value_string_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_string_value(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_blob_size:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_blob_size(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_blob_copy:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_blob_copy(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_reference_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_reference_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_timestamp_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_timestamp_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_geo_point_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_geo_point_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_array_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_array_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_map_value:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_map_value(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_field_value_to_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_to_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_get_firestore:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_get_firestore(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_get_firestore:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_get_firestore(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_document_ref_to_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_to_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_ref_update_field_paths:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_ref_update_field_paths(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_update_field_paths:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_update_field_paths(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_write_batch_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_write_batch_is_valid(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_settings_to_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_settings_to_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_is_valid(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_document_snapshot_to_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_to_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_get_field_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_get_field_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_get_query:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_get_query(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_listener_registration_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_listener_registration_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_get_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_get_instance_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_get_instance_for_app_database:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_get_instance_for_app_database(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_boolean:(double)value
{
    return __EXT_NATIVE__firebase_firestore_field_value_boolean(value);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_string:(char*)value
{
    return __EXT_NATIVE__firebase_firestore_field_value_string(value);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_array:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_array(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_field_value_map:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_field_value_map(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_document_snapshot_metadata_to_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_to_string(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_query_snapshot_metadata_to_string:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_to_string(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_exists:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_exists(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_firestore_document_snapshot_id:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_id(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_metadata_has_pending_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_has_pending_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_document_snapshot_metadata_is_from_cache:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_document_snapshot_metadata_is_from_cache(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_size:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_size(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_empty:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_empty(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_metadata_has_pending_writes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_has_pending_writes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_firestore_query_snapshot_metadata_is_from_cache:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_firestore_query_snapshot_metadata_is_from_cache(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseFirestore_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseFirestore_invocation_handler(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseFirestore_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseFirestore_queue_buffer(__arg_buffer, __arg_buffer_length);
}
@end

