package ${YYAndroidPackageName};
import static com.gamemaker.ExtensionCore.ExtBridge.GMFirebaseCoreBridge.*;
import java.lang.String;
import java.nio.ByteBuffer;

public class GMFirebaseCoreInternal extends RunnerSocial {
    public double __EXT_NATIVE__firebase_app_initialize()
    {
        return __EXT_JNI__firebase_app_initialize();
    }
    public double __EXT_NATIVE__firebase_app_is_initialized()
    {
        return __EXT_JNI__firebase_app_is_initialized();
    }
    public String __EXT_NATIVE__firebase_app_get_name()
    {
        return __EXT_JNI__firebase_app_get_name();
    }
    public double __EXT_NATIVE__firebase_last_error_code()
    {
        return __EXT_JNI__firebase_last_error_code();
    }
    public String __EXT_NATIVE__firebase_last_error_message()
    {
        return __EXT_JNI__firebase_last_error_message();
    }
    public double __EXT_NATIVE__firebase_app_get_default_handle(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_get_default_handle(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_get_instance(String name, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_get_instance(name, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_get_apps(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_get_apps(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_initialize_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_initialize_with_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_initialize_from_json(String json_config, String name, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_initialize_from_json(json_config, name, __ret_buffer, __ret_buffer_length);
    }
    public String __EXT_NATIVE__firebase_app_handle_get_name(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_handle_get_name(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_handle_get_options(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_handle_get_options(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_get_default_options(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_get_default_options(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_release_handle(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_release_handle(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_set_log_level(double level)
    {
        return __EXT_JNI__firebase_set_log_level(level);
    }
    public double __EXT_NATIVE__firebase_get_log_level()
    {
        return __EXT_JNI__firebase_get_log_level();
    }
    public String __EXT_NATIVE__firebase_get_sdk_version()
    {
        return __EXT_JNI__firebase_get_sdk_version();
    }
}