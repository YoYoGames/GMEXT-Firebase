// ##### extgen :: Auto-generated file do not edit!! #####

#import "GMFirebaseStorageInternal_ios.h"
#import "native/GMFirebaseStorageInternal_exports.h"
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

@implementation GMFirebaseStorageInternal

+ (void)load
{
    // Find all loaded classes
    int num = objc_getClassList(NULL, 0);
    if (num <= 0) return;

    Class *classes = (Class *)malloc(sizeof(Class) * (unsigned)num);
    num = objc_getClassList(classes, num);

    Class base = [GMFirebaseStorageInternal class];

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

- (double)__EXT_NATIVE__firebase_storage_get_instance:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_instance(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_get_instance_with_url:(char*)url arg1:(char*)__ret_buffer arg2:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_instance_with_url(url, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_get_reference_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_reference_path(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_get_reference_from_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_reference_from_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_max_download_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_max_download_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_set_max_download_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_set_max_download_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_max_upload_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_max_upload_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_set_max_upload_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_set_max_upload_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_max_operation_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_max_operation_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_set_max_operation_retry_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_set_max_operation_retry_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_use_emulator:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_use_emulator(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_child:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_child(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_get_parent:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_get_parent(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_ref_bucket:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_bucket(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_ref_full_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_full_path(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_ref_name:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_name(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_storage:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_storage(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_delete:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_delete(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_get_download_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_get_download_url(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_get_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_get_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_update_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_update_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_put_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_put_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_put_file:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_put_file(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_get_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_get_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_get_file:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_get_file(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_ref_list:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_ref_list(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_create:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_create(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_is_valid(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_bucket:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_bucket(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_cache_control:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_cache_control(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_set_cache_control:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_set_cache_control(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_content_disposition:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_content_disposition(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_set_content_disposition:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_set_content_disposition(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_content_encoding:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_content_encoding(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_set_content_encoding:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_set_content_encoding(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_content_language:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_content_language(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_set_content_language:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_set_content_language(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_content_type:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_content_type(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_set_content_type:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_set_content_type(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_creation_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_creation_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_generation:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_generation(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_metadata_generation:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_metadata_generation(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_name:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_name(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_path:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_path(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_size_bytes:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_size_bytes(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_updated_time:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_updated_time(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_custom_metadata_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_custom_metadata_count(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_custom_metadata_key_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_custom_metadata_key_at(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_get_custom_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_get_custom_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_metadata_set_custom_metadata:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_set_custom_metadata(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_create:(char*)__ret_buffer arg1:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_create(__ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_pause:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_pause(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_resume:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_resume(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_cancel:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_cancel(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_is_paused:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_is_paused(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_bytes_transferred:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_bytes_transferred(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_total_byte_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_total_byte_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_controller_get_reference:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_controller_get_reference(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_list_result_release:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_list_result_release(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_list_result_is_valid:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_list_result_is_valid(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_list_result_item_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_list_result_item_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_list_result_item_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_list_result_item_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_list_result_prefix_count:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_list_result_prefix_count(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_list_result_prefix_at:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_list_result_prefix_at(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_list_result_next_page_token:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_list_result_next_page_token(__arg_buffer, __arg_buffer_length);
}
- (char*)__EXT_NATIVE__firebase_storage_metadata_md5_hash:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__firebase_storage_metadata_md5_hash(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_get_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_get_instance_for_app:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__firebase_storage_get_instance_for_app_url:(char*)__arg_buffer arg1:(double)__arg_buffer_length arg2:(char*)__ret_buffer arg3:(double)__ret_buffer_length
{
    return __EXT_NATIVE__firebase_storage_get_instance_for_app_url(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseStorage_invocation_handler:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseStorage_invocation_handler(__arg_buffer, __arg_buffer_length);
}
- (double)__EXT_NATIVE__GMFirebaseStorage_queue_buffer:(char*)__arg_buffer arg1:(double)__arg_buffer_length
{
    return __EXT_NATIVE__GMFirebaseStorage_queue_buffer(__arg_buffer, __arg_buffer_length);
}
@end

