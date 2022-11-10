
function FirebaseREST_RealTime_getWriteHTTPMethod(push)
{
	if(is_undefined(push))
		return "PUT"
	else
		return "POST"
}
