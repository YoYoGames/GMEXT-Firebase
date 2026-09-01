package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseAnalyticsBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseAnalytics");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__GMFirebaseAnalytics_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__GMFirebaseAnalytics_queue_buffer(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_initialize();
    public static native double __EXT_JNI__firebase_analytics_terminate();
    public static native double __EXT_JNI__firebase_analytics_set_analytics_collection_enabled(double enabled);
    public static native double __EXT_JNI__firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization);
    public static native double __EXT_JNI__firebase_analytics_log_event(String name);
    public static native double __EXT_JNI__firebase_analytics_log_event_string(String name, String parameter_name, String parameter_value);
    public static native double __EXT_JNI__firebase_analytics_log_event_number(String name, String parameter_name, double parameter_value);
    public static native double __EXT_JNI__firebase_analytics_log_event_params(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_set_default_event_parameters(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_log_apple_transaction(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_set_user_property(String name, String value);
    public static native double __EXT_JNI__firebase_analytics_set_user_id(String user_id);
    public static native double __EXT_JNI__firebase_analytics_set_session_timeout_duration(double milliseconds);
    public static native double __EXT_JNI__firebase_analytics_reset_analytics_data();
    public static native double __EXT_JNI__firebase_analytics_get_analytics_instance_id(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_get_session_id(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_notify_app_lifecycle_termination();
    public static native double __EXT_JNI__firebase_analytics_is_desktop_initialized();
    public static native double __EXT_JNI__firebase_analytics_set_desktop_debug_mode(double enabled);
    public static native double __EXT_JNI__firebase_analytics_set_log_callback(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_email(String email_address);
    public static native double __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_phone(String phone_number);
    public static native double __EXT_JNI__firebase_analytics_notify_app_lifecycle_change(double state);
    public static native double __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_analytics_initialize_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length);
}