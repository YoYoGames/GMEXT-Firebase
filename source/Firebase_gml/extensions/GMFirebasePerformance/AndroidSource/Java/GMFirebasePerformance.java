
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.enums.*;

import android.util.Log;

import com.google.firebase.perf.FirebasePerformance;
import com.google.firebase.perf.metrics.HttpMetric;
import com.google.firebase.perf.metrics.Trace;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

import java.lang.String;
import java.nio.ByteBuffer;

public final class GMFirebasePerformance extends GMFirebasePerformanceInternal
{
    private static final String TAG = "GMFirebasePerformance";

    private static volatile boolean loggedNotInitialized = false;

    private final AtomicLong nextHandle = new AtomicLong(1L);
    private final ConcurrentHashMap<Long, Trace> traces =
        new ConcurrentHashMap<>();
    private final ConcurrentHashMap<Long, HttpMetric> httpMetrics =
        new ConcurrentHashMap<>();

    // Null when there is no default FirebaseApp: setters no-op, getters return
    // false, starts return 0. Mirrors the iOS helper.
    private FirebasePerformance performance()
    {
        try
        {
            return FirebasePerformance.getInstance();
        }
        catch (RuntimeException error)
        {
            if (!loggedNotInitialized)
            {
                loggedNotInitialized = true;
                Log.e(TAG, "Firebase default app not initialized; is GMFirebase in the project?", error);
            }
            return null;
        }
    }

    public void firebase_performance_set_collection_enabled(boolean enabled)
    {
        FirebasePerformance instance = performance();
        if (instance == null)
            return;

        instance.setPerformanceCollectionEnabled(enabled);
    }

    public boolean firebase_performance_is_collection_enabled()
    {
        FirebasePerformance instance = performance();
        if (instance == null)
            return false;

        return instance.isPerformanceCollectionEnabled();
    }

    public double firebase_performance_trace_start(String name)
    {
        if (name == null || name.isEmpty())
            return 0.0;

        FirebasePerformance instance = performance();
        if (instance == null)
            return 0.0;

        try
        {
            Trace trace = instance.newTrace(name);
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

    // The SDK validates attribute and metric writes itself and only logs a
    // rejection (too many attributes, a long key, a stopped trace), so the
    // result is read back through the public getters. Keys are trimmed first
    // because the SDK stores them trimmed and looks them up as given.
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
            String k = trimmed(key);
            String v = trimmed(value);

            item.putAttribute(k, v);
            return v.equals(item.getAttribute(k));
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
            String k = trimmed(key);

            item.removeAttribute(k);
            return item.getAttribute(k) == null;
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
            String n = trimmed(name);
            long v = toLong(value);

            item.putMetric(n, v);
            return item.getLongMetric(n) == v;
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
            String n = trimmed(name);
            long by = toLong(increment_by);
            long before = item.getLongMetric(n);

            item.incrementMetric(n, by);
            return item.getLongMetric(n) == before + by;
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

        FirebasePerformance instance = performance();
        if (instance == null)
            return 0.0;

        try
        {
            HttpMetric metric = instance.newHttpMetric(
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
            String k = trimmed(key);
            String v = trimmed(value);

            item.putAttribute(k, v);
            return v.equals(item.getAttribute(k));
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
            String k = trimmed(key);

            item.removeAttribute(k);
            return item.getAttribute(k) == null;
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

    private static String trimmed(String value)
    {
        return value != null ? value.trim() : "";
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
