
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.enums.*;

import com.google.firebase.perf.FirebasePerformance;
import com.google.firebase.perf.metrics.HttpMetric;
import com.google.firebase.perf.metrics.Trace;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

import java.lang.String;
import java.nio.ByteBuffer;

public final class GMFirebasePerformance extends GMFirebasePerformanceInternal 
{
    private final AtomicLong nextHandle = new AtomicLong(1L);
    private final ConcurrentHashMap<Long, Trace> traces =
        new ConcurrentHashMap<>();
    private final ConcurrentHashMap<Long, HttpMetric> httpMetrics =
        new ConcurrentHashMap<>();

    private FirebasePerformance performance()
    {
        return FirebasePerformance.getInstance();
    }

    public void firebase_performance_set_collection_enabled(boolean enabled)
    {
        performance().setPerformanceCollectionEnabled(enabled);
    }

    public boolean firebase_performance_is_collection_enabled()
    {
        return performance().isPerformanceCollectionEnabled();
    }

    public double firebase_performance_trace_start(String name)
    {
        if (name == null || name.isEmpty())
            return 0.0;

        try
        {
            Trace trace = performance().newTrace(name);
            trace.start();

            long handle = nextHandle.getAndIncrement();
            traces.put(handle, trace);
            return (double)handle;
        }
        catch (Exception error)
        {
            return 0.0;
        }
    }

    public boolean firebase_performance_trace_stop(double trace)
    {
        Trace value = traces.remove(handle(trace));
        if (value == null)
            return false;

        value.stop();
        return true;
    }

    public boolean firebase_performance_trace_put_attribute(
        double trace,
        String key,
        String value)
    {
        Trace item = traces.get(handle(trace));
        if (item == null)
            return false;

        try
        {
            item.putAttribute(
                key != null ? key : "",
                value != null ? value : ""
            );
            return true;
        }
        catch (Exception error)
        {
            return false;
        }
    }

    public boolean firebase_performance_trace_remove_attribute(
        double trace,
        String key)
    {
        Trace item = traces.get(handle(trace));
        if (item == null)
            return false;

        try
        {
            item.removeAttribute(key != null ? key : "");
            return true;
        }
        catch (Exception error)
        {
            return false;
        }
    }

    public boolean firebase_performance_trace_put_metric(
        double trace,
        String name,
        double value)
    {
        Trace item = traces.get(handle(trace));
        if (item == null)
            return false;

        try
        {
            item.putMetric(
                name != null ? name : "",
                toLong(value)
            );
            return true;
        }
        catch (Exception error)
        {
            return false;
        }
    }

    public boolean firebase_performance_trace_increment_metric(
        double trace,
        String name,
        double increment_by)
    {
        Trace item = traces.get(handle(trace));
        if (item == null)
            return false;

        try
        {
            item.incrementMetric(
                name != null ? name : "",
                toLong(increment_by)
            );
            return true;
        }
        catch (Exception error)
        {
            return false;
        }
    }

    public double firebase_performance_http_metric_start(String url, FirebasePerformanceHttpMethod method)
    {
        if (url == null || url.isEmpty() || method == null)
            return 0.0;

        try
        {
            HttpMetric metric = performance().newHttpMetric(
                url,
                httpMethod(method)
            );

            metric.start();

            long handle = nextHandle.getAndIncrement();
            httpMetrics.put(handle, metric);
            return (double)handle;
        }
        catch (Exception error)
        {
            return 0.0;
        }
    }

    public boolean firebase_performance_http_metric_set_response_code(
        double metric,
        int response_code)
    {
        HttpMetric item = httpMetrics.get(handle(metric));
        if (item == null)
            return false;

        item.setHttpResponseCode(response_code);
        return true;
    }

    public boolean firebase_performance_http_metric_set_request_payload_size(
        double metric,
        double bytes)
    {
        HttpMetric item = httpMetrics.get(handle(metric));
        if (item == null)
            return false;

        item.setRequestPayloadSize(toNonNegativeLong(bytes));
        return true;
    }

    public boolean firebase_performance_http_metric_set_response_payload_size(
        double metric,
        double bytes)
    {
        HttpMetric item = httpMetrics.get(handle(metric));
        if (item == null)
            return false;

        item.setResponsePayloadSize(toNonNegativeLong(bytes));
        return true;
    }

    public boolean firebase_performance_http_metric_set_response_content_type(
        double metric,
        String content_type)
    {
        HttpMetric item = httpMetrics.get(handle(metric));
        if (item == null)
            return false;

        item.setResponseContentType(
            content_type != null ? content_type : ""
        );
        return true;
    }

    public boolean firebase_performance_http_metric_put_attribute(
        double metric,
        String key,
        String value)
    {
        HttpMetric item = httpMetrics.get(handle(metric));
        if (item == null)
            return false;

        try
        {
            item.putAttribute(
                key != null ? key : "",
                value != null ? value : ""
            );
            return true;
        }
        catch (Exception error)
        {
            return false;
        }
    }

    public boolean firebase_performance_http_metric_remove_attribute(
        double metric,
        String key)
    {
        HttpMetric item = httpMetrics.get(handle(metric));
        if (item == null)
            return false;

        try
        {
            item.removeAttribute(key != null ? key : "");
            return true;
        }
        catch (Exception error)
        {
            return false;
        }
    }

    public boolean firebase_performance_http_metric_stop(double metric)
    {
        HttpMetric item = httpMetrics.remove(handle(metric));
        if (item == null)
            return false;

        item.stop();
        return true;
    }

    private static long handle(double value)
    {
        if (value <= 0.0 || value > Long.MAX_VALUE)
            return 0L;

        return (long)value;
    }

    private static long toLong(double value)
    {
        if (value >= Long.MAX_VALUE)
            return Long.MAX_VALUE;
        if (value <= Long.MIN_VALUE)
            return Long.MIN_VALUE;
        return Math.round(value);
    }

    private static long toNonNegativeLong(double value)
    {
        if (value <= 0.0)
            return 0L;
        if (value >= Long.MAX_VALUE)
            return Long.MAX_VALUE;
        return Math.round(value);
    }

    private static String httpMethod(FirebasePerformanceHttpMethod method)
    {
        switch ((int)method.value())
        {
            case 0: return FirebasePerformance.HttpMethod.GET;
            case 1: return FirebasePerformance.HttpMethod.PUT;
            case 2: return FirebasePerformance.HttpMethod.POST;
            case 3: return FirebasePerformance.HttpMethod.DELETE;
            case 4: return FirebasePerformance.HttpMethod.HEAD;
            case 5: return FirebasePerformance.HttpMethod.PATCH;
            case 6: return FirebasePerformance.HttpMethod.OPTIONS;
            case 7: return FirebasePerformance.HttpMethod.TRACE;
            case 8: return FirebasePerformance.HttpMethod.CONNECT;
            default:
                throw new IllegalArgumentException(
                    "Unsupported Firebase Performance HTTP method."
                );
        }
    }
}
