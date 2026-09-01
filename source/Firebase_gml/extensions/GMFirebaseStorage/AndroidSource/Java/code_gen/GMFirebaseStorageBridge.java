package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseStorageBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseStorage");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__GMFirebaseStorage_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__GMFirebaseStorage_queue_buffer(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_instance_with_url(String url, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native String __EXT_JNI__firebase_storage_url(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_reference_path(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_reference_from_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_max_download_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_set_max_download_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_max_upload_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_set_max_upload_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_max_operation_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_set_max_operation_retry_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_use_emulator(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_child(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_get_parent(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native String __EXT_JNI__firebase_storage_ref_bucket(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_ref_full_path(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_ref_name(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_storage(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_delete(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_get_download_url(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_get_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_update_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_put_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_put_file(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_get_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_get_file(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_ref_list(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_create(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_bucket(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_cache_control(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_set_cache_control(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_content_disposition(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_set_content_disposition(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_content_encoding(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_set_content_encoding(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_content_language(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_set_content_language(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_content_type(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_set_content_type(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_creation_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_generation(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_metadata_generation(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_name(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_path(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_size_bytes(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_updated_time(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_custom_metadata_count(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_custom_metadata_key_at(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_get_custom_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_metadata_set_custom_metadata(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_create(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_pause(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_resume(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_cancel(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_is_paused(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_bytes_transferred(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_total_byte_count(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_controller_get_reference(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_list_result_release(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_list_result_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_list_result_item_count(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_list_result_item_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_list_result_prefix_count(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_list_result_prefix_at(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native String __EXT_JNI__firebase_storage_list_result_next_page_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native String __EXT_JNI__firebase_storage_metadata_md5_hash(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_storage_get_instance_for_app_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
}