package com.gamemaker.ExtensionCore.ExtBridge;
import java.lang.String;
import java.nio.ByteBuffer;
import ${YYAndroidPackageName}.GMExtUtils;

public final class GMFirebaseUMPBridge {
    static {
        // this is the extension lib name
        System.loadLibrary("GMFirebaseUMP");
        nativeRegister();
    }
    // this registers the native functions on the C++ layer
    private static native void nativeRegister();

    public static String __EXT_JAVA__GetExtensionOption(String extName, String optName)
    {
        return GMExtUtils.GetExtensionOption(extName, optName);
    }

    public static native double __EXT_JNI__GMFirebaseUMP_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_ump_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length);
    public static native double __EXT_JNI__firebase_ump_get_consent_status(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_get_consent_form_status(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_get_privacy_options_requirement_status(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_can_request_ads(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_reset(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_request_consent_info_update(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_load_consent_form(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_show_consent_form(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_load_and_show_consent_form_if_required(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_show_privacy_options_form(ByteBuffer __arg_buffer, double __arg_buffer_length);
    public static native double __EXT_JNI__firebase_ump_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length);
}