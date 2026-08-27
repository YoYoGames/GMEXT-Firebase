// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;

public interface GMFirebaseInAppMessagingInterface {
    public void firebase_in_app_messaging_set_automatic_data_collection_enabled(boolean enabled);
    public boolean firebase_in_app_messaging_is_automatic_data_collection_enabled();
    public void firebase_in_app_messaging_set_messages_suppressed(boolean suppressed);
    public boolean firebase_in_app_messaging_are_messages_suppressed();
    public void firebase_in_app_messaging_trigger_event(String event_name);
    public void firebase_in_app_messaging_set_impression_callback(GMFunction callback);
    public void firebase_in_app_messaging_set_click_callback(GMFunction callback);
    public void firebase_in_app_messaging_set_dismiss_callback(GMFunction callback);
    public void firebase_in_app_messaging_set_display_error_callback(GMFunction callback);
    public void firebase_in_app_messaging_clear_callbacks();
}