package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseAppCheckBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseAppCheck");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__GMFirebaseAppCheck_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_set_provider_factory(double provider);
    public static native double __EXT_JNI__firebase_app_check_debug_provider_set_debug_token(String token);
    public static native double __EXT_JNI__firebase_app_check_set_token_auto_refresh_enabled(double enabled);
    public static native double __EXT_JNI__firebase_app_check_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_get_limited_use_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_add_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_remove_listener(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_get_app(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_get_instance_handle(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_instance_get_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_instance_set_token_auto_refresh_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_instance_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_instance_get_limited_use_token(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_app_check_instance_add_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
}