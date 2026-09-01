package ${YYAndroidPackageName};
import static com.gamemaker.ExtensionCore.ExtBridge.GMFirebaseMessagingBridge.*;
import java.lang.String;
import java.nio.ByteBuffer;

public class GMFirebaseMessagingInternal extends RunnerSocial {
    public double __EXT_NATIVE__GMFirebaseMessaging_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __EXT_JNI__GMFirebaseMessaging_invocation_handler(__ret_buffer, __ret_buffer_length);
    }
    public double __EXT_NATIVE__GMFirebaseMessaging_queue_buffer(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__GMFirebaseMessaging_queue_buffer(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_initialize()
    {
        return __EXT_JNI__firebase_messaging_initialize();
    }
    public double __EXT_NATIVE__firebase_messaging_terminate()
    {
        return __EXT_JNI__firebase_messaging_terminate();
    }
    public double __EXT_NATIVE__firebase_messaging_set_token_registration_on_init_enabled(double enabled)
    {
        return __EXT_JNI__firebase_messaging_set_token_registration_on_init_enabled(enabled);
    }
    public double __EXT_NATIVE__firebase_messaging_is_token_registration_on_init_enabled()
    {
        return __EXT_JNI__firebase_messaging_is_token_registration_on_init_enabled();
    }
    public double __EXT_NATIVE__firebase_messaging_delivery_metrics_export_to_big_query_enabled()
    {
        return __EXT_JNI__firebase_messaging_delivery_metrics_export_to_big_query_enabled();
    }
    public double __EXT_NATIVE__firebase_messaging_set_delivery_metrics_export_to_big_query(double enabled)
    {
        return __EXT_JNI__firebase_messaging_set_delivery_metrics_export_to_big_query(enabled);
    }
    public double __EXT_NATIVE__firebase_messaging_request_permission(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_request_permission(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_get_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_get_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_delete_token(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_delete_token(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_subscribe(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_subscribe(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_unsubscribe(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_unsubscribe(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_poll_message()
    {
        return __EXT_JNI__firebase_messaging_poll_message();
    }
    public double __EXT_NATIVE__firebase_messaging_poll_token()
    {
        return __EXT_JNI__firebase_messaging_poll_token();
    }
    public String __EXT_NATIVE__firebase_messaging_current_token()
    {
        return __EXT_JNI__firebase_messaging_current_token();
    }
    public String __EXT_NATIVE__firebase_messaging_message_from()
    {
        return __EXT_JNI__firebase_messaging_message_from();
    }
    public String __EXT_NATIVE__firebase_messaging_message_to()
    {
        return __EXT_JNI__firebase_messaging_message_to();
    }
    public String __EXT_NATIVE__firebase_messaging_message_collapse_key()
    {
        return __EXT_JNI__firebase_messaging_message_collapse_key();
    }
    public String __EXT_NATIVE__firebase_messaging_message_message_id()
    {
        return __EXT_JNI__firebase_messaging_message_message_id();
    }
    public String __EXT_NATIVE__firebase_messaging_message_message_type()
    {
        return __EXT_JNI__firebase_messaging_message_message_type();
    }
    public String __EXT_NATIVE__firebase_messaging_message_priority()
    {
        return __EXT_JNI__firebase_messaging_message_priority();
    }
    public String __EXT_NATIVE__firebase_messaging_message_original_priority()
    {
        return __EXT_JNI__firebase_messaging_message_original_priority();
    }
    public double __EXT_NATIVE__firebase_messaging_message_time_to_live()
    {
        return __EXT_JNI__firebase_messaging_message_time_to_live();
    }
    public double __EXT_NATIVE__firebase_messaging_message_sent_time()
    {
        return __EXT_JNI__firebase_messaging_message_sent_time();
    }
    public String __EXT_NATIVE__firebase_messaging_message_error()
    {
        return __EXT_JNI__firebase_messaging_message_error();
    }
    public String __EXT_NATIVE__firebase_messaging_message_error_description()
    {
        return __EXT_JNI__firebase_messaging_message_error_description();
    }
    public String __EXT_NATIVE__firebase_messaging_message_link()
    {
        return __EXT_JNI__firebase_messaging_message_link();
    }
    public double __EXT_NATIVE__firebase_messaging_message_notification_opened()
    {
        return __EXT_JNI__firebase_messaging_message_notification_opened();
    }
    public double __EXT_NATIVE__firebase_messaging_message_data_count()
    {
        return __EXT_JNI__firebase_messaging_message_data_count();
    }
    public String __EXT_NATIVE__firebase_messaging_message_data_key_at(double index)
    {
        return __EXT_JNI__firebase_messaging_message_data_key_at(index);
    }
    public String __EXT_NATIVE__firebase_messaging_message_get_data(String key)
    {
        return __EXT_JNI__firebase_messaging_message_get_data(key);
    }
    public double __EXT_NATIVE__firebase_messaging_message_raw_data_size()
    {
        return __EXT_JNI__firebase_messaging_message_raw_data_size();
    }
    public double __EXT_NATIVE__firebase_messaging_message_raw_data_copy(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_message_raw_data_copy(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_message_has_notification()
    {
        return __EXT_JNI__firebase_messaging_message_has_notification();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_title()
    {
        return __EXT_JNI__firebase_messaging_message_notification_title();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_body()
    {
        return __EXT_JNI__firebase_messaging_message_notification_body();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_icon()
    {
        return __EXT_JNI__firebase_messaging_message_notification_icon();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_sound()
    {
        return __EXT_JNI__firebase_messaging_message_notification_sound();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_badge()
    {
        return __EXT_JNI__firebase_messaging_message_notification_badge();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_tag()
    {
        return __EXT_JNI__firebase_messaging_message_notification_tag();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_color()
    {
        return __EXT_JNI__firebase_messaging_message_notification_color();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_click_action()
    {
        return __EXT_JNI__firebase_messaging_message_notification_click_action();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_body_loc_key()
    {
        return __EXT_JNI__firebase_messaging_message_notification_body_loc_key();
    }
    public double __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_count()
    {
        return __EXT_JNI__firebase_messaging_message_notification_body_loc_args_count();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_body_loc_args_at(double index)
    {
        return __EXT_JNI__firebase_messaging_message_notification_body_loc_args_at(index);
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_title_loc_key()
    {
        return __EXT_JNI__firebase_messaging_message_notification_title_loc_key();
    }
    public double __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_count()
    {
        return __EXT_JNI__firebase_messaging_message_notification_title_loc_args_count();
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_title_loc_args_at(double index)
    {
        return __EXT_JNI__firebase_messaging_message_notification_title_loc_args_at(index);
    }
    public String __EXT_NATIVE__firebase_messaging_message_notification_android_channel_id()
    {
        return __EXT_JNI__firebase_messaging_message_notification_android_channel_id();
    }
    public double __EXT_NATIVE__firebase_messaging_initialize_with_options(double suppress_notification_permission_prompt)
    {
        return __EXT_JNI__firebase_messaging_initialize_with_options(suppress_notification_permission_prompt);
    }
    public double __EXT_NATIVE__firebase_messaging_initialize_for_app(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_initialize_for_app(__arg_buffer, __arg_buffer_length);
    }
    public double __EXT_NATIVE__firebase_messaging_initialize_for_app_with_options(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        return __EXT_JNI__firebase_messaging_initialize_for_app_with_options(__arg_buffer, __arg_buffer_length);
    }
}