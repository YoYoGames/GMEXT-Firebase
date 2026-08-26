// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};

import java.nio.ByteBuffer;
import java.util.*;
import ${YYAndroidPackageName}.GMExtWire;
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;
import ${YYAndroidPackageName}.enums.*;

public abstract class GMFirebasePerformanceInternal extends RunnerSocial implements GMFirebasePerformanceInterface {

    public double __EXT_NATIVE__firebase_performance_set_collection_enabled(double enabled)
    {
        firebase_performance_set_collection_enabled(enabled != 0);
        return 0;
    }

    public double __EXT_NATIVE__firebase_performance_is_collection_enabled()
    {
        boolean __result = firebase_performance_is_collection_enabled();
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_trace_start(String name)
    {
        double __result = firebase_performance_trace_start(name);
        return (double)__result;
    }

    public double __EXT_NATIVE__firebase_performance_trace_stop(double trace)
    {
        boolean __result = firebase_performance_trace_stop((double)trace);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_trace_put_attribute(double trace, String key, String value)
    {
        boolean __result = firebase_performance_trace_put_attribute((double)trace, key, value);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_trace_remove_attribute(double trace, String key)
    {
        boolean __result = firebase_performance_trace_remove_attribute((double)trace, key);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_trace_put_metric(double trace, String name, double value)
    {
        boolean __result = firebase_performance_trace_put_metric((double)trace, name, (double)value);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_trace_increment_metric(double trace, String name, double increment_by)
    {
        boolean __result = firebase_performance_trace_increment_metric((double)trace, name, (double)increment_by);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_start(ByteBuffer __arg_buffer, double __arg_buffer_length)
    {
        GMExtWire.order(__arg_buffer);

        // field: url, type: String
        String url = GMExtWire.readString(__arg_buffer);

        // field: method, type: enum FirebasePerformanceHttpMethod
        FirebasePerformanceHttpMethod method = FirebasePerformanceHttpMethod.from(GMExtWire.readI32(__arg_buffer));

        double __result = firebase_performance_http_metric_start(url, method);
        return (double)__result;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_set_response_code(double metric, double response_code)
    {
        boolean __result = firebase_performance_http_metric_set_response_code((double)metric, (int)response_code);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_set_request_payload_size(double metric, double bytes)
    {
        boolean __result = firebase_performance_http_metric_set_request_payload_size((double)metric, (double)bytes);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_set_response_payload_size(double metric, double bytes)
    {
        boolean __result = firebase_performance_http_metric_set_response_payload_size((double)metric, (double)bytes);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_set_response_content_type(double metric, String content_type)
    {
        boolean __result = firebase_performance_http_metric_set_response_content_type((double)metric, content_type);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_put_attribute(double metric, String key, String value)
    {
        boolean __result = firebase_performance_http_metric_put_attribute((double)metric, key, value);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_remove_attribute(double metric, String key)
    {
        boolean __result = firebase_performance_http_metric_remove_attribute((double)metric, key);
        return __result ? 1.0 : 0.0;
    }

    public double __EXT_NATIVE__firebase_performance_http_metric_stop(double metric)
    {
        boolean __result = firebase_performance_http_metric_stop((double)metric);
        return __result ? 1.0 : 0.0;
    }

}