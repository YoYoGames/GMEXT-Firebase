function FirebaseREST_URL_nextInfo(url) 
{
	if(string_count("?",url))
	    url+="&" 
	else 
	    url+="?"

	return(url)
}
