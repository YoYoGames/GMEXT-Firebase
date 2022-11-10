
var TraceName = "Trace_Test"
if(active)
{
	text = "Trace"
	FirebasePerformance_Trace_Stop(TraceName)
}
else
{
	text = "Stop"
	
	FirebasePerformance_Trace_Create(TraceName)
	FirebasePerformance_Trace_Attribute_Put(TraceName,"key1","value1")
	FirebasePerformance_Trace_Attribute_Put(TraceName,"key2","value2")
	show_debug_message(FirebasePerformance_Trace_Attribute_Get(TraceName,"key1"))
	show_debug_message(FirebasePerformance_Trace_Attribute_GetAll(TraceName))
	FirebasePerformance_Trace_Start(TraceName)
	FirebasePerformance_Trace_Metric_Put(TraceName,"key3",10)
	FirebasePerformance_Trace_Metric_Increment(TraceName,"key3",1)
	show_debug_message(FirebasePerformance_Trace_Metric_GetLong(TraceName,"key3"))
	
}

active = !active
