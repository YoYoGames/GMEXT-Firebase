
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.content.Context;
import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import com.google.firebase.perf.FirebasePerformance;
import com.google.firebase.perf.metrics.Trace;
import com.google.firebase.perf.metrics.HttpMetric;

import java.util.HashMap;

import org.json.JSONObject;
import org.json.JSONException;

import java.util.Map;

import android.util.Log;

public class YYFirebasePerformance
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	public static Activity activity = RunnerActivity.CurrentActivity;
	
	private HashMap<String,Trace> Map_Trace;
	private HashMap<String,HttpMetric> Map_Http;
	
	public YYFirebasePerformance()
	{
		Map_Trace = new HashMap();
		Map_Http = new HashMap();
	}
	
	public double FirebasePerformance_isPerformanceCollectionEnabled()
	{
		return FirebasePerformance.getInstance().isPerformanceCollectionEnabled()?1.0:0.0;
	}
	
	public void FirebasePerformance_setPerformanceCollectionEnabled(double value)
	{
		FirebasePerformance.getInstance().setPerformanceCollectionEnabled(value >= 0.5);
	}
	
	
	////////////////TRACE////////////////
	
	
	public void FirebasePerformance_Trace_Create(String name)
	{
		Trace mTrace = FirebasePerformance.getInstance().newTrace(name);
		Map_Trace.put(name,mTrace);
	}
	
	public void FirebasePerformance_Trace_Start(String name)
	{
		Map_Trace.get(name).start();
	}

	public void FirebasePerformance_Trace_Stop(String name)
	{
		Map_Trace.get(name).stop();
		Map_Trace.remove(name);
	}

	public void FirebasePerformance_Trace_Attribute_Remove(String name,String tribute)
	{
		Map_Trace.get(name).removeAttribute(tribute);
	}

	public void FirebasePerformance_Trace_Attribute_Put(String name,String attribute, String value)
	{
		Map_Trace.get(name).putAttribute(attribute,value);
	}

	public String FirebasePerformance_Trace_Attribute_GetAll(String name)
	{
		return MapToJSON(Map_Trace.get(name).getAttributes());
	}

	public String FirebasePerformance_Trace_Attribute_Get(String name,String attribute)
	{
		return Map_Trace.get(name).getAttribute(attribute);
	}
	
	public void FirebasePerformance_Trace_Metric_Put(String name,String metric, double value)
	{
		Map_Trace.get(name).putMetric(metric, (long)value);
	}
	
	public void FirebasePerformance_Trace_Metric_Increment(String name,String metric, double value)
	{
		Map_Trace.get(name).incrementMetric(metric,(long)value);
	}

	public double FirebasePerformance_Trace_Metric_GetLong(String name, String metric)
	{
		return (double) Map_Trace.get(name).getLongMetric(metric);
	}
	
	
	/////////////// HTTP METRIC
	
	
	public void FirebasePerformance_HttpMetric_Create(String name,String url,String method)
	{
		HttpMetric mHttpMetric = FirebasePerformance.getInstance().newHttpMetric(url,method);
		Map_Http.put(name,mHttpMetric);
	}
	
	public void FirebasePerformance_HttpMetric_Start(String name)
	{
		Map_Http.get(name).start();
	}

	public void FirebasePerformance_HttpMetric_Stop(String name)
	{
		Map_Http.get(name).stop();
		Map_Http.remove(name);
	}
	
	public String FirebasePerformance_HttpMetric_Attribute_Get(String name, String attribute)
	{
		return Map_Http.get(name).getAttribute(attribute);
	}
	
	public String FirebasePerformance_HttpMetric_Attribute_GetAll(String name)
	{
		return MapToJSON(Map_Http.get(name).getAttributes());
	}

	public void FirebasePerformance_HttpMetric_Attribute_Put(String name,String attribute, String value)
	{
		Map_Http.get(name).putAttribute(attribute,value);
	}

	public void FirebasePerformance_HttpMetric_Attribute_Remove(String name, String attribute)
	{
		Map_Http.get(name).removeAttribute(attribute);
	}

	public void FirebasePerformance_HttpMetric_SetHttpResponseCode(String name, double responseCode)
	{
		Map_Http.get(name).setHttpResponseCode((int) responseCode);
	}

	public void FirebasePerformance_HttpMetric_SetRequestPayloadSize(String name, double bytes)
	{
		Map_Http.get(name).setRequestPayloadSize((long)bytes);
	}

	public void FirebasePerformance_HttpMetric_SetResponseContentType(String name,String contentType)
	{
		Map_Http.get(name).setResponseContentType(contentType);
	}

	public void FirebasePerformance_HttpMetric_SetResponsePayloadSize(String name,double bytes)
	{
		Map_Http.get(name).setResponsePayloadSize((long)bytes);
	}


	public static String MapToJSON(Map map)
	{
		try
		{
			return (new JSONObject(map).toString());
		}
		catch(Exception e)
		{
			return "{}";
		}
	}
}


