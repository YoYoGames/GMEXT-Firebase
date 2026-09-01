package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseMessagingBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseMessaging");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__GMFirebaseMessaging_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__GMFirebaseMessaging_queue_buffer(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_initialize();
    public static native double __EXT_JNI__firebase_messaging_terminate();
    public static native double __EXT_JNI__firebase_messaging_set_token_registration_on_init_enabled(double enabled);
    public static native double __EXT_JNI__firebase_messaging_is_token_registration_on_init_enabled();
    public static native double __EXT_JNI__firebase_messaging_delivery_metrics_export_to_big_query_enabled();
    public static native double __EXT_JNI__firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled);
    public static native double __EXT_JNI__firebase_messaging_request_permission(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_delete_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_subscribe(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_unsubscribe(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_poll_message();
    public static native double __EXT_JNI__firebase_messaging_poll_token();
    public static native String __EXT_JNI__firebase_messaging_current_token();
    public static native String __EXT_JNI__firebase_messaging_message_from();
    public static native String __EXT_JNI__firebase_messaging_message_to();
    public static native String __EXT_JNI__firebase_messaging_message_collapse_key();
    public static native String __EXT_JNI__firebase_messaging_message_message_id();
    public static native String __EXT_JNI__firebase_messaging_message_message_type();
    public static native String __EXT_JNI__firebase_messaging_message_priority();
    public static native String __EXT_JNI__firebase_messaging_message_original_priority();
    public static native double __EXT_JNI__firebase_messaging_message_time_to_live();
    public static native double __EXT_JNI__firebase_messaging_message_sent_time();
    public static native String __EXT_JNI__firebase_messaging_message_error();
    public static native String __EXT_JNI__firebase_messaging_message_error_description();
    public static native String __EXT_JNI__firebase_messaging_message_link();
    public static native double __EXT_JNI__firebase_messaging_message_notification_opened();
    public static native double __EXT_JNI__firebase_messaging_message_data_count();
    public static native String __EXT_JNI__firebase_messaging_message_data_key_at(double index);
    public static native String __EXT_JNI__firebase_messaging_message_get_data(String key);
    public static native double __EXT_JNI__firebase_messaging_message_raw_data_size();
    public static native double __EXT_JNI__firebase_messaging_message_raw_data_copy(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_message_has_notification();
    public static native String __EXT_JNI__firebase_messaging_message_notification_title();
    public static native String __EXT_JNI__firebase_messaging_message_notification_body();
    public static native String __EXT_JNI__firebase_messaging_message_notification_icon();
    public static native String __EXT_JNI__firebase_messaging_message_notification_sound();
    public static native String __EXT_JNI__firebase_messaging_message_notification_badge();
    public static native String __EXT_JNI__firebase_messaging_message_notification_tag();
    public static native String __EXT_JNI__firebase_messaging_message_notification_color();
    public static native String __EXT_JNI__firebase_messaging_message_notification_click_action();
    public static native String __EXT_JNI__firebase_messaging_message_notification_body_loc_key();
    public static native double __EXT_JNI__firebase_messaging_message_notification_body_loc_args_count();
    public static native String __EXT_JNI__firebase_messaging_message_notification_body_loc_args_at(double index);
    public static native String __EXT_JNI__firebase_messaging_message_notification_title_loc_key();
    public static native double __EXT_JNI__firebase_messaging_message_notification_title_loc_args_count();
    public static native String __EXT_JNI__firebase_messaging_message_notification_title_loc_args_at(double index);
    public static native String __EXT_JNI__firebase_messaging_message_notification_android_channel_id();
    public static native double __EXT_JNI__firebase_messaging_initialize_with_options(double suppress_notification_permission_prompt);
    public static native double __EXT_JNI__firebase_messaging_initialize_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_messaging_initialize_for_app_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length);
}