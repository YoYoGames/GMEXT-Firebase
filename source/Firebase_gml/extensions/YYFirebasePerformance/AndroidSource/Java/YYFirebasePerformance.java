package ${YYAndroidPackageName};

import android.content.Context;
import android.util.Log;

import com.google.firebase.FirebaseApp;
import com.google.firebase.perf.FirebasePerformance;
import com.google.firebase.perf.metrics.Trace;
import com.google.firebase.perf.metrics.HttpMetric;

import org.json.JSONObject;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * YYFirebasePerformance is a wrapper for Firebase Performance Monitoring.
 * It manages traces and HTTP metrics, providing a consistent API across iOS and Android.
 */
public class YYFirebasePerformance {
    private static final String TAG = "YYFirebasePerformance";
    private static YYFirebasePerformance performance;
    
	private final ConcurrentHashMap<String, Trace> traceMap = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<String, HttpMetric> httpMetricMap = new ConcurrentHashMap<>();

    // <editor-fold desc="Initialization">

    public YYFirebasePerformance() {
        // Get the performance singleton
		performance = FirebasePerformance.getInstance();
    }

	// </editor-fold>

	// <editor-fold desc="Setup">

    public void FirebasePerformance_Initialize() {
        Log.d(TAG, "FirebasePerformance_Initialize called");
        // Additional initialization logic can be added here if necessary
    }

	// </editor-fold>

    // <editor-fold desc="Public API Methods">

    public double FirebasePerformance_isPerformanceCollectionEnabled() {
        boolean isEnabled = performance.isPerformanceCollectionEnabled();
        Log.d(TAG, "FirebasePerformance_isPerformanceCollectionEnabled: " + (isEnabled ? "Enabled" : "Disabled"));
        return isEnabled ? 1.0 : 0.0;
    }


    public void FirebasePerformance_setPerformanceCollectionEnabled(double value) {
        boolean isEnabled = value >= 0.5;
        performance.setPerformanceCollectionEnabled(isEnabled);
        Log.d(TAG, "FirebasePerformance_setPerformanceCollectionEnabled: " + (isEnabled ? "Enabled" : "Disabled"));
    }

	// </editor-fold>

    // <editor-fold desc="Trace Methods">

    public void FirebasePerformance_Trace_Create(String name) {
        final String methodName = "FirebasePerformance_Trace_Create";
		
		if (isInvalidName(name, methodName)) return;

        Trace trace = performance.newTrace(name);
        traceMap.put(name, trace);
        Log.d(TAG, "FirebasePerformance_Trace_Create: Trace '" + name + "' created");
    }

    public void FirebasePerformance_Trace_Start(String name) {
		final String methodName = "FirebasePerformance_Trace_Start";

        Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.start();
            Log.d(TAG, "FirebasePerformance_Trace_Start: Trace '" + name + "' started");
        } else {
            Log.e(TAG, "FirebasePerformance_Trace_Start: Trace '" + name + "' not found");
        }
    }

    public void FirebasePerformance_Trace_Stop(String name) {
        final String methodName = "FirebasePerformance_Trace_Stop";

		Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.stop();
            traceMap.remove(name);
            Log.d(TAG, "FirebasePerformance_Trace_Stop: Trace '" + name + "' stopped and removed");
        } else {
            Log.e(TAG, "FirebasePerformance_Trace_Stop: Trace '" + name + "' not found");
        }
    }

    public void FirebasePerformance_Trace_Attribute_Remove(String name, String attribute) {
        final String methodName = "FirebasePerformance_Trace_Attribute_GetAll";

		Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.removeAttribute(attribute);
            Log.d(TAG, "FirebasePerformance_Trace_Attribute_Remove: Attribute '" + attribute + "' removed from Trace '" + name + "'");
        } else {
            Log.e(TAG, "FirebasePerformance_Trace_Attribute_Remove: Trace '" + name + "' not found");
        }
    }

    public void FirebasePerformance_Trace_Attribute_Put(String name, String attribute, String value) {
        final String methodName = "FirebasePerformance_Trace_Attribute_GetAll";
		
		Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.putAttribute(attribute, value);
            Log.d(TAG, methodName + " :: Attribute '" + attribute + "' set to '" + value + "' for Trace '" + name + "'");
        } else {
            Log.e(TAG, methodName + " :: Trace '" + name + "' not found");
        }
    }

    public String FirebasePerformance_Trace_Attribute_GetAll(String name) {
		final String methodName = "FirebasePerformance_Trace_Attribute_GetAll";

        Trace trace = traceMap.get(name);
        if (trace != null) {
            String json = mapToJsonString(trace.getAttributes(), methodName);
            Log.d(TAG, methodName +" :: " + json);
            return json;
        } else {
            Log.e(TAG, methodName + " :: Trace '" + name + "' not found");
            return "{}";
        }
    }

    public String FirebasePerformance_Trace_Attribute_Get(String name, String attribute) {
        final String methodName = "FirebasePerformance_Trace_Attribute_Get";
		
		Trace trace = traceMap.get(name);
        if (trace != null) {
            String value = trace.getAttribute(attribute);
            Log.d(TAG, methodName + " :: Attribute '" + attribute + "' for Trace '" + name + "' is '" + value + "'");
            return value != null ? value : "";
        } else {
            Log.e(TAG, methodName + " :: Trace '" + name + "' not found");
            return "";
        }
    }

    public void FirebasePerformance_Trace_Metric_Put(String name, String metric, double value) {
        final String methodName = "FirebasePerformance_Trace_Metric_Put";
		
		Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.putMetric(metric, (long) value);
            Log.d(TAG, methodName + " :: Metric '" + metric + "' set to " + value + " for Trace '" + name + "'");
        } else {
            Log.e(TAG, methodName + " :: Trace '" + name + "' not found");
        }
    }

    public void FirebasePerformance_Trace_Metric_Increment(String name, String metric, double value) {
        final String methodName = "FirebasePerformance_Trace_Metric_Increment";
		
		Trace trace = traceMap.get(name);
        if (trace != null) {
            trace.incrementMetric(metric, (long) value);
            Log.d(TAG, methodName + " :: Metric '" + metric + "' incremented by " + value + " for Trace '" + name + "'");
        } else {
            Log.e(TAG, methodName + " :: Trace '" + name + "' not found");
        }
    }

    public double FirebasePerformance_Trace_Metric_GetLong(String name, String metric) {
        final String methodName = "FirebasePerformance_Trace_Metric_GetLong";
		
		Trace trace = traceMap.get(name);
        if (trace != null) {
            long metricValue = trace.getLongMetric(metric);
            Log.d(TAG, methodName + " :: Metric '" + metric + "' for Trace '" + name + "' is " + metricValue);
            return (double) metricValue;
        } else {
            Log.e(TAG, methodName + " :: Trace '" + name + "' not found");
            return 0.0;
        }
    }

    // </editor-fold>

    // <editor-fold desc="HTTP Metric Methods">

    public void FirebasePerformance_HttpMetric_Create(String name, String url, String method) {
		final String methodName = "FirebasePerformance_HttpMetric_Create";

        if (isInvalidHttpMetricParams(name, url, method, methodName)) return;

        try {
            HttpMetric httpMetric = performance.newHttpMetric(url, method);
            httpMetricMap.put(name, httpMetric);
            Log.d(TAG, methodName + " :: HTTP Metric '" + name + "' created for URL '" + url + "' with method '" + method + "'");
        } catch (IllegalArgumentException e) {
            Log.e(TAG, methodName + " :: Invalid URL or method - " + e.getMessage());
        }
    }

    public void FirebasePerformance_HttpMetric_Start(String name) {
		final String methodName = "FirebasePerformance_HttpMetric_Start";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.start();
            Log.d(TAG, methodName + " :: HTTP Metric '" + name + "' started");
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
        }
    }

    public void FirebasePerformance_HttpMetric_Stop(String name) {
		final String methodName = "FirebasePerformance_HttpMetric_Stop";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.stop();
            httpMetricMap.remove(name);
            Log.d(TAG, methodName + " :: HTTP Metric '" + name + "' stopped and removed");
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
        }
    }

    public String FirebasePerformance_HttpMetric_Attribute_Get(String name, String attribute) {
		final String methodName = "FirebasePerformance_HttpMetric_Attribute_Get";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            String value = httpMetric.getAttribute(attribute);
            Log.d(TAG, methodName + " :: Attribute '" + attribute + "' for HTTP Metric '" + name + "' is '" + value + "'");
            return value != null ? value : "";
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
            return "";
        }
    }

    public String FirebasePerformance_HttpMetric_Attribute_GetAll(String name) {
		final String methodName = "FirebasePerformance_HttpMetric_Attribute_GetAll";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            String json = mapToJsonString(httpMetric.getAttributes(), methodName);
            Log.d(TAG, methodName + " :: " + json);
            return json;
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
            return "{}";
        }
    }

    public void FirebasePerformance_HttpMetric_Attribute_Put(String name, String attribute, String value) {
		final String methodName = "FirebasePerformance_HttpMetric_Attribute_Put";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.putAttribute(attribute, value);
            Log.d(TAG, methodName + " :: Attribute '" + attribute + "' set to '" + value + "' for HTTP Metric '" + name + "'");
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
        }
    }

    public void FirebasePerformance_HttpMetric_Attribute_Remove(String name, String attribute) {
		final String methodName = "FirebasePerformance_HttpMetric_Attribute_Remove";
		
        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.removeAttribute(attribute);
            Log.d(TAG, methodName + " :: Attribute '" + attribute + "' removed from HTTP Metric '" + name + "'");
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
        }
    }

    public void FirebasePerformance_HttpMetric_SetHttpResponseCode(String name, double responseCode) {
		final String methodName = "FirebasePerformance_HttpMetric_SetHttpResponseCode";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setHttpResponseCode((int) responseCode);
            Log.d(TAG, methodName + " :: HTTP Metric '" + name + "' response code set to " + (int) responseCode);
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
        }
    }

    public void FirebasePerformance_HttpMetric_SetRequestPayloadSize(String name, double bytes) {
		final String methodName = "FirebasePerformance_HttpMetric_SetRequestPayloadSize";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setRequestPayloadSize((long) bytes);
            Log.d(TAG, methodName + " :: HTTP Metric '" + name + "' request payload size set to " + (long) bytes + " bytes");
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
        }
    }

    public void FirebasePerformance_HttpMetric_SetResponseContentType(String name, String contentType) {
		final String methodName = "FirebasePerformance_HttpMetric_SetResponseContentType";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setResponseContentType(contentType);
            Log.d(TAG, methodName + " :: HTTP Metric '" + name + "' response content type set to '" + contentType + "'");
        } else {
            Log.e(TAG, methodName + " :: HTTP Metric '" + name + "' not found");
        }
    }

    public void FirebasePerformance_HttpMetric_SetResponsePayloadSize(String name, double bytes) {
		final String methodName = "FirebasePerformance_HttpMetric_SetResponsePayloadSize";

        HttpMetric httpMetric = httpMetricMap.get(name);
        if (httpMetric != null) {
            httpMetric.setResponsePayloadSize((long) bytes);
            Log.d(TAG, methodName + "FirebasePerformance_HttpMetric_SetResponsePayloadSize: HTTP Metric '" + name + "' response payload size set to " + (long) bytes + " bytes");
        } else {
            Log.e(TAG, methodName + "FirebasePerformance_HttpMetric_SetResponsePayloadSize: HTTP Metric '" + name + "' not found");
        }
    }

    // </editor-fold>

    // <editor-fold desc="Helper Methods">

    private String mapToJsonString(Map<String, String> map, final String methodName) {
        try {
            return new JSONObject(map).toString();
        } catch (Exception e) {
            Log.e(TAG, methodName + " :: Error converting map to JSON - " + e.getMessage());
            return "{}";
        }
    }

    private boolean isInvalidName(String name, final String methodName) {
        if (name == null || name.isEmpty()) {
            Log.e(TAG, methodName + " :: Invalid trace name");
            return true;
        }
        return false;
    }

    private boolean isInvalidHttpMetricParams(String name, String url, String method, final String methodName) {
        if (name == null || name.isEmpty() || url == null || url.isEmpty() || method == null || method.isEmpty()) {
            Log.e(TAG, methodName + " :: Invalid parameters");
            return true;
        }
        return false;
    }

    // </editor-fold>
}
