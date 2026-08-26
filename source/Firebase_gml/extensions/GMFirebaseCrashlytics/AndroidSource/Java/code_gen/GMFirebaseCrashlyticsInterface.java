// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;

public interface GMFirebaseCrashlyticsInterface {
    public void firebase_crashlytics_set_collection_enabled(boolean enabled);
    public boolean firebase_crashlytics_is_collection_enabled();
    public boolean firebase_crashlytics_did_crash_on_previous_execution();
    public void firebase_crashlytics_log(String message);
    public void firebase_crashlytics_set_user_id(String user_id);
    public void firebase_crashlytics_set_custom_key_string(String key, String value);
    public void firebase_crashlytics_set_custom_key_real(String key, double value);
    public void firebase_crashlytics_set_custom_key_bool(String key, boolean value);
    public void firebase_crashlytics_record_error(String domain, int code, String message);
    public void firebase_crashlytics_check_for_unsent_reports(GMFunction callback);
    public void firebase_crashlytics_send_unsent_reports();
    public void firebase_crashlytics_delete_unsent_reports();
    public void firebase_crashlytics_test_crash();
}