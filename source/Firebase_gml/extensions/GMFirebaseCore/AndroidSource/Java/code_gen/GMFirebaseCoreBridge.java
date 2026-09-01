package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseCoreBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseCore");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__firebase_app_initialize();
    public static native double __EXT_JNI__firebase_app_is_initialized();
    public static native String __EXT_JNI__firebase_app_get_name();
    public static native double __EXT_JNI__firebase_last_error_code();
    public static native String __EXT_JNI__firebase_last_error_message();
    public static native double __EXT_JNI__firebase_app_get_default_handle(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_get_instance(String name, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_get_apps(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_initialize_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_initialize_from_json(String json_config, String name, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native String __EXT_JNI__firebase_app_handle_get_name(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_app_handle_get_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_get_default_options(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_release_handle(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_set_log_level(double level);
    public static native double __EXT_JNI__firebase_get_log_level();
    public static native String __EXT_JNI__firebase_get_sdk_version();
}