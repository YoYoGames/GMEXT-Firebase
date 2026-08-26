// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};

import java.nio.ByteBuffer;
import java.util.*;
import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;

public abstract class GMFirebaseCrashlyticsInternal extends RunnerSocial implements GMFirebaseCrashlyticsInterface {

    private final GMExtWire.DispatchQueue __dispatch_queue = new GMExtWire.DispatchQueue();
    public double __EXT_NATIVE__GMFirebaseCrashlytics_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __dispatch_queue.fetch(__ret_buffer);
    }

    public double __EXT_NATIVE__firebase_crashlytics_set_collection_enabled(double enabled)
    {
        firebase_crashlytics_set_collection_enabled(enabled != 0);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_is_collection_enabled()
    {
        boolean __result = firebase_crashlytics_is_collection_enabled();
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_did_crash_on_previous_execution()
    {
        boolean __result = firebase_crashlytics_did_crash_on_previous_execution();
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_log(String message)
    {
        firebase_crashlytics_log(message);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_set_user_id(String user_id)
    {
        firebase_crashlytics_set_user_id(user_id);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_set_custom_key_string(String key, String value)
    {
        firebase_crashlytics_set_custom_key_string(key, value);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_set_custom_key_real(String key, double value)
    {
        firebase_crashlytics_set_custom_key_real(key, (double)value);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_set_custom_key_bool(String key, double value)
    {
        firebase_crashlytics_set_custom_key_bool(key, value != 0);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_record_error(String domain, double code, String message)
    {
        firebase_crashlytics_record_error(domain, (int)code, message);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_check_for_unsent_reports(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        firebase_crashlytics_check_for_unsent_reports(callback);
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_send_unsent_reports()
    {
        firebase_crashlytics_send_unsent_reports();
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_delete_unsent_reports()
    {
        firebase_crashlytics_delete_unsent_reports();
        return 0;
    }

    public double __EXT_NATIVE__firebase_crashlytics_test_crash()
    {
        firebase_crashlytics_test_crash();
        return 0;
    }

}