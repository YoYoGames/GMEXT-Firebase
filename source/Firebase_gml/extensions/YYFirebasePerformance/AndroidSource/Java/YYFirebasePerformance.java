package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.util.Log;

import com.google.firebase.perf.FirebasePerformance;
import com.google.firebase.perf.metrics.Trace;
import com.google.firebase.perf.metrics.HttpMetric;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;

public class YYFirebasePerformance {

    private static final String LOG_TAG = "YYFirebasePerformance";

    // Error Codes
    public static final double FIREBASE_PERFORMANCE_SUCCESS = 0.0;
    public static final double FIREBASE_PERFORMANCE_ERROR_NOT_FOUND = -1.0;
    public static final double FIREBASE_PERFORMANCE_ERROR_INVALID_NAME = -2.0;
    public static final double FIREBASE_PERFORMANCE_ERROR_CREATION_FAILED = -3.0;
    public static final double FIREBASE_PERFORMANCE_ERROR_INVALID_PARAMETERS = -4.0;
    public static final double FIREBASE_PERFORMANCE_ERROR_INVALID_URL = -5.0;
    public static final double FIREBASE_PERFORMANCE_ERROR_UNSUPPORTED = -6.0;

    private HashMap<String, Trace> traceMap;
    private HashMap<String, HttpMetric> httpMetricMap;
    private FirebasePerformance performance;

    public YYFirebasePerformance() {
        traceMap = new HashMap<>();
        httpMetricMap = new HashMap<>();
        performance = FirebasePerformance.getInstance();
    }

    // <editor-fold desc="Performance Collection Methods">

    public double FirebasePerformance_isPerformanceCollectionEnabled() {
        boolean isEnabled = performance.isPerformanceCollectionEnabled();
        return isEnabled ? 1.0 : 0.0;
    }

    public void FirebasePerformance_setPerformanceCollectionEnabled(double value) {
        boolean isEnabled = value >= 0.5;
        performance.setPerformanceCollectionEnabled(isEnabled);
    }

    // </editor-fold>

    // <editor-fold desc="Trace Methods">

    public double FirebasePerformance_Trace_Create(String name) {
        if (name == null || name.isEmpty()) {
            Log.e(LOG_TAG, "Invalid trace name.");
            return FIREBASE_PERFORMANCE_ERROR_INVALID_NAME;
        }
        Trace trace = performance.newTrace(name);
        if (trace != null) {
            traceMap.put(name, trace);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Failed to create trace: " + name);
            return FIREBASE_PERFORMANCE_ERROR_CREATION_FAILED;
        }
    }

    public double FirebasePerformance_Trace_Start(String name) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.start();
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_Trace_Stop(String name) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.stop();
            traceMap.remove(name);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_Trace_Metric_Put(String name, String metric, double value) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.putMetric(metric, (long) value);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_Trace_Metric_Increment(String name, String metric, double value) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.incrementMetric(metric, (long) value);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_Trace_Metric_GetLong(String name, String metric) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            long metricValue = trace.getLongMetric(metric);
            return (double) metricValue;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
            return 0.0;
        }
    }

    public double FirebasePerformance_Trace_Attribute_Put(String name, String attribute, String value) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.putAttribute(attribute, value);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_Trace_Attribute_Remove(String name, String attribute) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.removeAttribute(attribute);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public String FirebasePerformance_Trace_Attribute_Get(String name, String attribute) {
        Trace trace = traceMap.get(name);
        if (trace != null) {
            String value = trace.getAttribute(attribute);
            return value;
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
        }
        return "";
    }

    public String FirebasePerformance_Trace_Attribute_GetAll(String name) {
        final String methodName = "FirebasePerformance_Trace_Attribute_GetAll";

        Trace trace = traceMap.get(name);
        if (trace != null) {
            Map<String, String> attributes = trace.getAttributes();
            return convertMapToJson(attributes, methodName);
        } else {
            Log.e(LOG_TAG, "Trace not found: " + name);
        }
        return "{}";
    }

    // </editor-fold>

    // <editor-fold desc="HTTP Metric Methods">

    public double FirebasePerformance_HttpMetric_Create(String name, String url, String method) {
        if (name == null || name.isEmpty() || method == null || method.isEmpty()) {
            Log.e(LOG_TAG, "Invalid parameters for HTTP Metric creation.");
            return FIREBASE_PERFORMANCE_ERROR_INVALID_URL;
        }

        if (url == null || url.isEmpty()) {
            Log.e(LOG_TAG, "Invalid url for HTTP Metric creation.");
            return FIREBASE_PERFORMANCE_ERROR_INVALID_URL;
        }

        HttpMetric httpMetric = performance.newHttpMetric(url, method);
        if (httpMetric != null) {
            httpMetricMap.put(name, httpMetric);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "Failed to create HTTP Metric: " + name);
            return FIREBASE_PERFORMANCE_ERROR_CREATION_FAILED;
        }
    }

    public double FirebasePerformance_HttpMetric_Start(String name) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.start();
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_HttpMetric_Stop(String name) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.stop();
            httpMetricMap.remove(name);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_HttpMetric_SetHttpResponseCode(String name, double responseCode) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setHttpResponseCode((int) responseCode);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_HttpMetric_SetRequestPayloadSize(String name, double bytes) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setRequestPayloadSize((long) bytes);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_HttpMetric_SetResponseContentType(String name, String contentType) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setResponseContentType(contentType);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_HttpMetric_SetResponsePayloadSize(String name, double bytes) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setResponsePayloadSize((long) bytes);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_HttpMetric_Attribute_Put(String name, String attribute, String value) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.putAttribute(attribute, value);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public double FirebasePerformance_HttpMetric_Attribute_Remove(String name, String attribute) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.removeAttribute(attribute);
            return FIREBASE_PERFORMANCE_SUCCESS;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
            return FIREBASE_PERFORMANCE_ERROR_NOT_FOUND;
        }
    }

    public String FirebasePerformance_HttpMetric_Attribute_Get(String name, String attribute) {
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            String value = httpMetric.getAttribute(attribute);
            return value;
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
        }
        return "";
    }

    public String FirebasePerformance_HttpMetric_Attribute_GetAll(String name) {
        final String methodName = "FirebasePerformance_HttpMetric_Attribute_GetAll";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            Map<String, String> attributes = httpMetric.getAttributes();
            return convertMapToJson(attributes, methodName);
        } else {
            Log.e(LOG_TAG, "HTTP Metric not found: " + name);
        }
        return "{}";
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    public static String convertMapToJson(Map map, String methodName) {
        String json = "{}";
        try {
            json = new JSONObject(map).toString();
        } catch (Exception e) {
            Log.e(LOG_TAG, methodName + " :: Error converting map to JSON: " + e.getMessage());
        }
        return json;
    }

    // </editor-fold>
}
