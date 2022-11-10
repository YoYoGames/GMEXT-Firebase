
var httpMetric = "HttpMetric_Test"

if(active)
{
	text = "Http Metric"
	FirebasePerformance_HttpMetric_Stop(httpMetric)
}
else
{
	text = "Stop"
	
	FirebasePerformance_HttpMetric_Create(httpMetric,"yoyogames.com","GET")
	
	FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key1","value1")
	FirebasePerformance_HttpMetric_Attribute_Put(httpMetric,"key2","value2")
	show_debug_message(FirebasePerformance_HttpMetric_Attribute_Get(httpMetric,"key1"))
	
	
	FirebasePerformance_HttpMetric_SetRequestPayloadSize(httpMetric,100)
	FirebasePerformance_HttpMetric_SetResponseContentType(httpMetric,"text/html")//, application/json, etc...
	FirebasePerformance_HttpMetric_SetResponsePayloadSize(httpMetric,100)
	FirebasePerformance_HttpMetric_SetHttpResponseCode(httpMetric,200)
	
	FirebasePerformance_HttpMetric_Start(httpMetric)
}

active = !active
