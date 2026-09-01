package ${YYAndroidPackageName};
import static com.gamemaker.ExtensionCore.ExtBridge.GMFirebaseAnalyticsBridge.*;
import java.lang.String;
import java.nio.ByteBuffer;

public class GMFirebaseAnalyticsInternal extends RunnerSocial {
    public double __EXT_NATIVE__GMFirebaseAnalytics_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__GMFirebaseAnalytics_invocation_handler(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__GMFirebaseAnalytics_queue_buffer(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__GMFirebaseAnalytics_queue_buffer(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_initialize()
    {
        return __EXT_JNI__firebase_analytics_initialize();
    }
    public double __EXT_NATIVE__firebase_analytics_terminate()
    {
        return __EXT_JNI__firebase_analytics_terminate();
    }
    public double __EXT_NATIVE__firebase_analytics_set_analytics_collection_enabled(double enabled)
    {
        return __EXT_JNI__firebase_analytics_set_analytics_collection_enabled(enabled);
    }
    public double __EXT_NATIVE__firebase_analytics_set_consent(double ad_storage, double analytics_storage, double ad_user_data, double ad_personalization)
    {
        return __EXT_JNI__firebase_analytics_set_consent(ad_storage, analytics_storage, ad_user_data, ad_personalization);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event(String name)
    {
        return __EXT_JNI__firebase_analytics_log_event(name);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event_string(String name, String parameter_name, String parameter_value)
    {
        return __EXT_JNI__firebase_analytics_log_event_string(name, parameter_name, parameter_value);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event_number(String name, String parameter_name, double parameter_value)
    {
        return __EXT_JNI__firebase_analytics_log_event_number(name, parameter_name, parameter_value);
    }
    public double __EXT_NATIVE__firebase_analytics_log_event_params(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_log_event_params(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_set_default_event_parameters(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_set_default_event_parameters(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_log_apple_transaction(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_log_apple_transaction(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_set_user_property(String name, String value)
    {
        return __EXT_JNI__firebase_analytics_set_user_property(name, value);
    }
    public double __EXT_NATIVE__firebase_analytics_set_user_id(String user_id)
    {
        return __EXT_JNI__firebase_analytics_set_user_id(user_id);
    }
    public double __EXT_NATIVE__firebase_analytics_set_session_timeout_duration(double milliseconds)
    {
        return __EXT_JNI__firebase_analytics_set_session_timeout_duration(milliseconds);
    }
    public double __EXT_NATIVE__firebase_analytics_reset_analytics_data()
    {
        return __EXT_JNI__firebase_analytics_reset_analytics_data();
    }
    public double __EXT_NATIVE__firebase_analytics_get_analytics_instance_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_get_analytics_instance_id(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_get_session_id(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_get_session_id(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_termination()
    {
        return __EXT_JNI__firebase_analytics_notify_app_lifecycle_termination();
    }
    public double __EXT_NATIVE__firebase_analytics_is_desktop_initialized()
    {
        return __EXT_JNI__firebase_analytics_is_desktop_initialized();
    }
    public double __EXT_NATIVE__firebase_analytics_set_desktop_debug_mode(double enabled)
    {
        return __EXT_JNI__firebase_analytics_set_desktop_debug_mode(enabled);
    }
    public double __EXT_NATIVE__firebase_analytics_set_log_callback(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_set_log_callback(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_email(String email_address)
    {
        return __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_email(email_address);
    }
    public double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_phone(String phone_number)
    {
        return __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_phone(phone_number);
    }
    public double __EXT_NATIVE__firebase_analytics_notify_app_lifecycle_change(double state)
    {
        return __EXT_JNI__firebase_analytics_notify_app_lifecycle_change(state);
    }
    public double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_hashed_email(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_initiate_on_device_conversion_measurement_hashed_phone(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_analytics_initialize_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_analytics_initialize_for_app(__arg_buffer, __arg_buffer_length);
    }
}