package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseFunctionsBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseFunctions");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__GMFirebaseFunctions_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_instance_with_region(String region, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_use_functions_emulator(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_https_callable(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_https_callable_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_https_callable_from_url(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_https_callable_from_url_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_callable_is_valid(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_functions_callable_call(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_functions_callable_call_with_data(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_callable_get_functions(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_functions_get_instance_for_app_region(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
}