// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};

import java.nio.ByteBuffer;
import java.util.*;
import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;

public abstract class GMFirebaseInAppMessagingInternal extends RunnerSocial implements GMFirebaseInAppMessagingInterface {

    private final GMExtWire.DispatchQueue __dispatch_queue = new GMExtWire.DispatchQueue();
    public double __EXT_NATIVE__GMFirebaseInAppMessaging_invocation_handler(ByteBuffer __ret_buffer, double __ret_buffer_length)
    {
        return __dispatch_queue.fetch(__ret_buffer);
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_set_automatic_data_collection_enabled(double enabled)
    {
        firebase_in_app_messaging_set_automatic_data_collection_enabled(enabled != 0);
        return 0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_is_automatic_data_collection_enabled()
    {
        boolean __result = firebase_in_app_messaging_is_automatic_data_collection_enabled();
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_set_messages_suppressed(double suppressed)
    {
        firebase_in_app_messaging_set_messages_suppressed(suppressed != 0);
        return 0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_are_messages_suppressed()
    {
        boolean __result = firebase_in_app_messaging_are_messages_suppressed();
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_trigger_event(String event_name)
    {
        firebase_in_app_messaging_trigger_event(event_name);
        return 0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_set_impression_callback(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        firebase_in_app_messaging_set_impression_callback(callback);
        return 0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_set_click_callback(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        firebase_in_app_messaging_set_click_callback(callback);
        return 0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_set_dismiss_callback(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        firebase_in_app_messaging_set_dismiss_callback(callback);
        return 0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_set_display_error_callback(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: callback, type: Function
        GMFunction callback = GMExtWire.readGMFunction(__arg_buffer, __dispatch_queue);

        firebase_in_app_messaging_set_display_error_callback(callback);
        return 0;
    }

    public double __EXT_NATIVE__firebase_in_app_messaging_clear_callbacks()
    {
        firebase_in_app_messaging_clear_callbacks();
        return 0;
    }

}