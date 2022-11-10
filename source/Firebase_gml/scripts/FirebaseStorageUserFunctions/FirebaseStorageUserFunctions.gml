
#macro FirebaseStorage_Library_useSDK (os_type == os_android or os_type == os_ios or os_browser != browser_not_a_browser)

function FirebaseStorage_Cancel(ind)
{
	if(FirebaseStorage_Library_useSDK)
		return SDKFirebaseStorage_Cancel(ind)
}

function FirebaseStorage_Download(localfilename,firebasePath,bucket = "")
{
	if(FirebaseStorage_Library_useSDK)
	if(os_browser == browser_not_a_browser)
		return SDKFirebaseStorage_Download(localfilename,firebasePath,bucket)
	else
		return SDKFirebaseStorage_Download(localfilename,firebasePath,game_display_name,bucket)
}

function FirebaseStorage_Upload(localPath,firebasePath,bucket = "")
{
	if(FirebaseStorage_Library_useSDK)
	if(os_browser == browser_not_a_browser)
		return SDKFirebaseStorage_Upload(localPath,firebasePath,bucket)
	else
		return SDKFirebaseStorage_Upload(localPath,firebasePath,game_display_name,bucket)
}

function FirebaseStorage_Delete(firebasePath,bucket = "")
{
	if(FirebaseStorage_Library_useSDK)
		return SDKFirebaseStorage_Delete(firebasePath,bucket)
}

function FirebaseStorage_GetURL(firebasePath,bucket = "")
{
	if(FirebaseStorage_Library_useSDK)
		return SDKFirebaseStorage_GetURL(firebasePath,bucket)
}

function FirebaseStorage_List(firebasePath,maxResults,pageToken = "",bucket = "")
{
	if(FirebaseStorage_Library_useSDK)
		return SDKFirebaseStorage_List(firebasePath,maxResults,pageToken,bucket)
}

function FirebaseStorage_ListAll(firebasePath,bucket = "")
{
	if(FirebaseStorage_Library_useSDK)
		return SDKFirebaseStorage_ListAll(firebasePath,bucket)
}
