/// @description /////////////////////////////////////////////////////////////
//url_encode(argument0);
//
//URL-Encodes a string according to RFC 1738
//Written by Insane
//http://gmc.yoyogames.com/index.php?showtopic=327587 
//Forum:
//https://help.yoyogames.com/hc/en-us/articles/216754718-Encoding-URLs
////////////////////////////////////////////////////////////////
function url_encode(orig) 
{
	var new_,char,tmp,ans;
	new_ = "";
	char = 0;
	tmp = 0;
	ans = 0;
	for (ps=1; ps<=string_length(orig); ps+=1)
	{
	    char = string_char_at(orig,ps);
	    char = ord(char);
	    if (char < 32) || (char > 126) || (char == 36) || (char == 38) || (char == 43) || (char == 44) || (char == 47) || (char == 58) || (char == 59) || (char == 61) || (char == 63) || (char == 64) || (char == 32) || (char == 34) || (char == 60) || (char == 62) || (char == 35) || (char == 37) || (char == 123) || (char == 125) || (char == 124) || (char == 92) || (char == 94) || (char == 126) || (char == 91) || (char == 93) || (char == 96)
		{
	        tmp = floor(char/16);
	        ans = char-tmp*16;
	        tmp = string(tmp);
	        if (tmp = "10") tmp = "A";
	        if (tmp = "11") tmp = "B";
	        if (tmp = "12") tmp = "C";
	        if (tmp = "13") tmp = "D";
	        if (tmp = "14") tmp = "E";
	        if (tmp = "15") tmp = "F";
	        ans = string(ans);
	        if (ans = "10") ans = "A";
	        if (ans = "11") ans = "B";
	        if (ans = "12") ans = "C";
	        if (ans = "13") ans = "D";
	        if (ans = "14") ans = "E";
	        if (ans = "15") ans = "F";
	        new_ = new_+"%"+tmp+ans;
		}
	    else
		{
	        new_ = new_+chr(char);
		}
	}
	return new_;
}
