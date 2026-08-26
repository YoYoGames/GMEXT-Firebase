// ##### extgen :: Auto-generated file do not edit!! #####

package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.GMExtWire.GMFunction;
import ${YYAndroidPackageName}.GMExtWire.GMValue;
import ${YYAndroidPackageName}.enums.*;

public interface GMFirebasePerformanceInterface {
    public void firebase_performance_set_collection_enabled(boolean enabled);
    public boolean firebase_performance_is_collection_enabled();
    public double firebase_performance_trace_start(String name);
    public boolean firebase_performance_trace_stop(double trace);
    public boolean firebase_performance_trace_put_attribute(double trace, String key, String value);
    public boolean firebase_performance_trace_remove_attribute(double trace, String key);
    public boolean firebase_performance_trace_put_metric(double trace, String name, double value);
    public boolean firebase_performance_trace_increment_metric(double trace, String name, double increment_by);
    public double firebase_performance_http_metric_start(String url, FirebasePerformanceHttpMethod method);
    public boolean firebase_performance_http_metric_set_response_code(double metric, int response_code);
    public boolean firebase_performance_http_metric_set_request_payload_size(double metric, double bytes);
    public boolean firebase_performance_http_metric_set_response_payload_size(double metric, double bytes);
    public boolean firebase_performance_http_metric_set_response_content_type(double metric, String content_type);
    public boolean firebase_performance_http_metric_put_attribute(double metric, String key, String value);
    public boolean firebase_performance_http_metric_remove_attribute(double metric, String key);
    public boolean firebase_performance_http_metric_stop(double metric);
}