package ${YYAndroidPackageName};
import static com.gamemaker.ExtensionCore.ExtBridge.GMFirebaseAppCheckBridge.*;
import java.lang.String;
import java.nio.ByteBuffer;

public class GMFirebaseAppCheckInternal extends RunnerSocial {
    public double __EXT_NATIVE__GMFirebaseAppCheck_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__GMFirebaseAppCheck_invocation_handler(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_set_provider_factory(double provider)
    {
        return __EXT_JNI__firebase_app_check_set_provider_factory(provider);
    }
    public double __EXT_NATIVE__firebase_app_check_debug_provider_set_debug_token(String token)
    {
        return __EXT_JNI__firebase_app_check_debug_provider_set_debug_token(token);
    }
    public double __EXT_NATIVE__firebase_app_check_set_token_auto_refresh_enabled(double enabled)
    {
        return __EXT_JNI__firebase_app_check_set_token_auto_refresh_enabled(enabled);
    }
    public double __EXT_NATIVE__firebase_app_check_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_get_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_get_limited_use_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_get_limited_use_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_add_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_add_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_remove_listener(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_remove_listener(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_get_app(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_get_app(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_get_instance_handle(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_get_instance_handle(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_instance_get_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_instance_get_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_instance_set_token_auto_refresh_enabled(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_instance_set_token_auto_refresh_enabled(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_instance_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_instance_get_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_instance_get_limited_use_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_instance_get_limited_use_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_app_check_instance_add_listener(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_app_check_instance_add_listener(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
}