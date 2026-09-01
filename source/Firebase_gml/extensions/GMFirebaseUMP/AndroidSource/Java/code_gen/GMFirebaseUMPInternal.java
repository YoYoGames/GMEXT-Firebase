package ${YYAndroidPackageName};
import static com.gamemaker.ExtensionCore.ExtBridge.GMFirebaseUMPBridge.*;
import java.lang.String;
import java.nio.ByteBuffer;

public class GMFirebaseUMPInternal extends RunnerSocial {
    public double __EXT_NATIVE__GMFirebaseUMP_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__GMFirebaseUMP_invocation_handler(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_instance(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_instance(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_consent_status(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_consent_status(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_consent_form_status(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_consent_form_status(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_privacy_options_requirement_status(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_privacy_options_requirement_status(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_can_request_ads(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_can_request_ads(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_reset(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_reset(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_request_consent_info_update(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_request_consent_info_update(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_load_consent_form(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_load_consent_form(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_show_consent_form(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_show_consent_form(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_load_and_show_consent_form_if_required(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_load_and_show_consent_form_if_required(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_show_privacy_options_form(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_ump_show_privacy_options_form(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_ump_get_instance_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length, ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__firebase_ump_get_instance_for_app(__arg_buffer, __arg_buffer_length, __ret_buffer, __ret_buffer_length);
    }
}