package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.view.View;
import android.webkit.WebView;
import android.webkit.WebChromeClient;
import android.webkit.WebViewClient;
import android.view.Window;
import android.widget.ImageView;
import android.graphics.Bitmap;
import java.io.InputStream;
import android.graphics.BitmapFactory;

import android.graphics.Color;
import android.view.ViewGroup;
import android.view.Gravity;
import android.widget.RelativeLayout;
import android.app.Activity;

import android.util.Log;

//https://developer.android.com/reference/android/webkit/WebView
public class FirebaseAuthentication_tools
{
	private static final int EVENT_OTHER_SOCIAL = 70;
	private static Activity activity;
	private static WebView webView;
	private static ImageView imageView;
	
	public FirebaseAuthentication_tools() 
	{
		activity = RunnerActivity.CurrentActivity;
	}
	
	
	public void FirebaseAuthentication_Tools_WebView_Create(final String url)
	{
		activity.runOnUiThread(new Runnable() 
		{
	        @Override
	        public void run() 
			{
	            webView = new WebView(activity);
				
				//js on by default
				webView.getSettings().setJavaScriptEnabled(true);
				webView.addJavascriptInterface(activity, "webview");
				
				//https://developer.android.com/reference/android/webkit/WebViewClient?hl=en
				webView.setWebViewClient(new WebViewClient()
				{
					public void onPageFinished(WebView view, String url)
					{
						//maybe in future i add more callbacks
						//Log.d("yoyo", "WEBVIEW: Page Finished");
						
					}
				});
				
				//https://developer.android.com/reference/android/webkit/WebChromeClient#onCreateWindow(android.webkit.WebView,%20boolean,%20boolean,%20android.os.Message)
				webView.setWebChromeClient(new WebChromeClient()
				{
					public void onCloseWindow(Window w)
					{
						int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_Tools_WebView_onCloseWindow");
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
						webView = null;
					}
				});
				
				webView.loadUrl(url);
				
				 
				final ViewGroup rootView = activity.findViewById(android.R.id.content);
				rootView.addView(webView);
	        }
	    });
		
		WebView_closeButton_add();
	}
	
	public void FirebaseAuthentication_Tools_WebView_Delete()
	{
		if(webView == null)
			return;
		
		WebView_closeButton_destroy();
		
		activity.runOnUiThread(new Runnable() 
		{
	        @Override
	        public void run() 
			{	
				ViewGroup rootView = activity.findViewById(android.R.id.content);
				rootView.removeView(webView);
				webView.destroy();
				webView = null;
			}
		});
	}
	
	public void WebView_closeButton_add()
	{
		activity.runOnUiThread(new Runnable() 
		{
	        @Override
	        public void run() 
			{
				try
				{
					RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.WRAP_CONTENT,RelativeLayout.LayoutParams.WRAP_CONTENT);
					
					imageView = new ImageView(activity); // initialize ImageView
					imageView.setLayoutParams(layoutParams);
					
					
					String path_ = "WebView/img_close.png";
					path_ = path_.toLowerCase();
					InputStream mInputStream = activity.getAssets().open(path_); // Deafault
					Bitmap bitmap = BitmapFactory.decodeStream(mInputStream);
					imageView.setImageBitmap(bitmap);
					
					imageView.setOnClickListener(new View.OnClickListener() 
					{
						@Override
						public void onClick(View view) 
						{
							int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
							RunnerJNILib.DsMapAddString(dsMapIndex,"type","FirebaseAuthentication_Tools_WebView_onUserClose");
							RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
						}
					});
					
					ViewGroup rootView = activity.findViewById(android.R.id.content);
					rootView.addView(imageView);
				}
				catch (Exception e)
				{
					return;
				}
			}
		});
	}
	
	public void WebView_closeButton_destroy()
	{
		if(imageView == null)
			return;
		
		activity.runOnUiThread(new Runnable() 
		{
	        @Override
	        public void run() 
			{
				ViewGroup rootView = activity.findViewById(android.R.id.content);
				rootView.removeView(imageView);
				imageView = null;
			}
		});
	}
	
	public void WebView_closeButton_setAlpha(double alpha)
	{
		if(imageView == null)
			return;
		
		imageView.setImageAlpha((int)(alpha*255));
	}
}


