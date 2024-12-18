
import Foundation

import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit




class YYFacebookShareDialog: SharingDelegate
{
    
    
    func sharer(_ sharer: any FBSDKShareKit.Sharing, didCompleteWithResults results: [String : Any]) {
        
        let dsmap = FacebookExtension2.objc_dsMapCreate();
        FacebookExtension2.objc_dsMapAddString(dsmap, _key: "type", _value: "fb_dialog");
        FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "success");
        FacebookExtension2.objc_dsMapAdd(dsmap, _key: "requestId", _value: Int32(getRequestId()));
        FacebookExtension2.objc_createSocialAsyncEvent(withDSMap: dsmap);
    }
    
    func sharer(_ sharer: any FBSDKShareKit.Sharing, didFailWithError error: any Error) {
        
    }
    
    func sharerDidCancel(_ sharer: any FBSDKShareKit.Sharing) {
        
    }
    
    
    var mRequestId = 0;
    func getRequestId() -> Int
    {
        return mRequestId;
    }
}

@objc public class YYFacebook:NSObject
{
    
    
    // App Events (re-defined from extension macros)
    static let FacebookExtension2_EVENT_ACHIEVED_LEVEL:Int =         101;
    static let FacebookExtension2_EVENT_ADDED_PAYMENT_INFO:Int =     102;
    static let FacebookExtension2_EVENT_ADDED_TO_CART:Int =             103;
    static let FacebookExtension2_EVENT_ADDED_TO_WISHLIST:Int =         104;
    static let FacebookExtension2_EVENT_COMPLETED_REGISTRATION:Int = 105;
    static let FacebookExtension2_EVENT_COMPLETED_TUTORIAL:Int =     106;
    static let FacebookExtension2_EVENT_INITIATED_CHECKOUT:Int =     107;
    static let FacebookExtension2_EVENT_RATED:Int =                     109;
    static let FacebookExtension2_EVENT_SEARCHED:Int =                 110;
    static let FacebookExtension2_EVENT_SPENT_CREDITS:Int =             111;
    static let FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT =     112;
    static let FacebookExtension2_EVENT_VIEWED_CONTENT =         113;
    
    // App event parameters (re-defined from extension macros)
    static let FacebookExtension2_PARAM_CONTENT_ID:Int =             1003;
    static let FacebookExtension2_PARAM_CONTENT_TYPE =             1004;
    static let FacebookExtension2_PARAM_CURRENCY =                 1005;
    static let FacebookExtension2_PARAM_DESCRIPTION =             1006;
    static let FacebookExtension2_PARAM_LEVEL =                     1007;
    static let FacebookExtension2_PARAM_MAX_RATING_VALUE =         1008;
    static let FacebookExtension2_PARAM_NUM_ITEMS =                 1009;
    static let FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE = 1010;
    static let FacebookExtension2_PARAM_REGISTRATION_METHOD =     1011;
    static let FacebookExtension2_PARAM_SEARCH_STRING =             1012;
    static let FacebookExtension2_PARAM_SUCCESS =                 1013;
    
    // Login types
    static let FacebookExtension2_LOGIN_TYPE_NATIVE =             10001;
    static let FacebookExtension2_LOGIN_TYPE_BROWSER =             10002;
    static let FacebookExtension2_LOGIN_TYPE_SYSTEM_ACCOUNT =     10003;
    static let FacebookExtension2_LOGIN_TYPE_WEB_VIEW =             10004;
    
    @objc public func basicaddition(a: Double, b: Double) -> Double
    {
        
        
        //ShareDialog
        //SharingDelegate
        
        return a+b;
    }
    
    
    var mRequestIdCounter:Int = 1;
    var mIsReady:Int = 0;
    
    var mLoginManager = LoginManager();
    
    let mRequestId:Int = 0;

    
    @objc public func fb_logout()
    {
        mLoginManager.logOut();
        fb_set_status(_status: "IDLE");
    }

    var mLoginStatus:String = "";
    @objc public func fb_status() -> String
    {
        return mLoginStatus;
    }

    @objc public func fb_set_status(_status:String)
    {
        NSLog("Setting login status to %@\n", _status);
        mLoginStatus = _status;
    }

    @objc public func fb_accesstoken() -> String
    {
            return AccessToken.current?.tokenString ?? "";
    }

    @objc public func fb_user_id() -> String
    {
        if (AccessToken.current == nil)
        {
            return "";
        }
        
        return AccessToken.current?.userID ?? "";
    }
    
    
    @objc public func fb_ready() -> Int
    {
        return mIsReady;
    }

    @objc public func fb_init()
    {
        mIsReady = 1;
        
        //NSLog("fb_init: Access token %@", AccessToken.current ?? "");
        if (AccessToken.current != nil)        {
            // NSLog("fb_init: session already open");
            fb_set_status(_status: "AUTHORISED");
        }
        else
        {
            // NSLog("fb_init: no session open");
            fb_set_status(_status:"IDLE");
        }
    }

    @objc public func onResume()
    {

        AppEvents.shared.activateApp();
    }

    @objc public func onOpenURL(url:NSURL, sourceApplication:String, annotation:Any) -> Bool
    {
        
        let _b = ApplicationDelegate.shared.application(UIApplication.shared, open: url as URL, sourceApplication: sourceApplication, annotation: annotation);
        

        return _b;
    }
    
    
    
    

    @objc public func fb_check_permission(permission: String) -> Bool
    {
        if (AccessToken.current != nil){
            if (AccessToken.current!.hasGranted(permission: permission))
            {
                return true;
            }
        }
        else
        {
            NSLog("Facebook User must be logged in to query permissions");
        }
        
        return false;
    }


    @objc public func fb_request_publish_permissions(_permissions: NSArray,mUIViewController: UIViewController) -> Double
    {
        let currentRequestId = getRequestId();
        
        mLoginManager.logIn(permissions: _permissions as! [String], from: mUIViewController, handler: getHandlerForLoginRequest(_requestId: currentRequestId));
      
        return Double(currentRequestId);
    }

    @objc public func fb_request_read_permissions(_permissions: NSArray,uicontroller:UIViewController) -> Double
    {
        let currentRequestId = getRequestId();

        mLoginManager.logIn(permissions: _permissions as! [String], from: uicontroller, handler: getHandlerForLoginRequest(_requestId: currentRequestId));

        return Double(currentRequestId);
    }

    @objc public func fb_request_permissions(_permissions:NSArray, _bPublish:(Bool),mUIViewController:UIViewController) -> Double
    {
        //session must be open: think we are fine since we login if necessary...
        let requestId: Double;
        if(_bPublish)
        {
            requestId = fb_request_publish_permissions(_permissions: _permissions, mUIViewController: mUIViewController);
        }
        else
        {
            requestId = fb_request_read_permissions(_permissions: _permissions, uicontroller: mUIViewController);
        }

        return requestId;
    }

    //TODO

    @objc public func fb_refresh_accesstoken() -> Double
    {
        let currentRequestId = getRequestId();
        if (AccessToken.current != nil)
        {
            AccessToken.refreshCurrentAccessToken { result, res, error in
                
                
                
                
                
                let dsmap = FacebookExtension2.objc_dsMapCreate();
                FacebookExtension2.objc_dsMapAddString(dsmap, _key: "type", _value: "fb_refresh_accesstoken");
                FacebookExtension2.objc_dsMapAdd(dsmap, _key: "requestId", _value: Int32(currentRequestId));

                
                if((error) != nil)
                {
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "error");
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: "exception", _value: error?.localizedDescription);
                    self.fb_set_status(_status: "FAILED");
                }
                else
                {
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "success");
                    self.fb_set_status(_status: "AUTHORISED");
                }
                
                FacebookExtension2.objc_createSocialAsyncEvent(withDSMap: dsmap);

            }
        }
        else
        {
            let dsmap = FacebookExtension2.objc_dsMapCreate();
            FacebookExtension2.objc_dsMapAddString(dsmap, _key: "type", _value: "fb_refresh_accesstoken");

            FacebookExtension2.objc_dsMapAdd(dsmap, _key: "requestId", _value: Int32(currentRequestId));
            FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "error");
            FacebookExtension2.objc_dsMapAddString(dsmap, _key: "exception", _value: "User must be logged in before access token can be refreshed.");
            FacebookExtension2.objc_createSocialAsyncEvent(withDSMap: dsmap);

            self.fb_set_status(_status: "IDLE");
        }

        
        return Double(currentRequestId);
    }

    @objc public func fb_send_event(_eventId:(Double), _eventValue:(Double), _eventParamsDsList:(NSArray)) -> Double
    {
        // Parse event type
        var eventTypeParsed:AppEvents.Name;
        switch(Int(_eventId))
        {
        case YYFacebook.FacebookExtension2_EVENT_ACHIEVED_LEVEL:             
                eventTypeParsed = (AppEvents.Name.achievedLevel);
            break;
        case YYFacebook.FacebookExtension2_EVENT_ADDED_PAYMENT_INFO:
                eventTypeParsed = (AppEvents.Name.addedPaymentInfo);
            break;
        case YYFacebook.FacebookExtension2_EVENT_ADDED_TO_CART:             
                eventTypeParsed = (AppEvents.Name.addedToCart);
            break;
        case YYFacebook.FacebookExtension2_EVENT_ADDED_TO_WISHLIST:         
                eventTypeParsed = (AppEvents.Name.addedToWishlist);
            break;
        case YYFacebook.FacebookExtension2_EVENT_COMPLETED_REGISTRATION:     
                eventTypeParsed = (AppEvents.Name.completedRegistration);
            break;
        case YYFacebook.FacebookExtension2_EVENT_COMPLETED_TUTORIAL:         
                eventTypeParsed = (AppEvents.Name.completedTutorial);
            break;
        case YYFacebook.FacebookExtension2_EVENT_INITIATED_CHECKOUT:         
                eventTypeParsed = (AppEvents.Name.initiatedCheckout);
            break;
        case YYFacebook.FacebookExtension2_EVENT_RATED:                     
                eventTypeParsed = (AppEvents.Name.rated);
            break;
        case YYFacebook.FacebookExtension2_EVENT_SEARCHED:
                eventTypeParsed = (AppEvents.Name.searched);
            break;
        case YYFacebook.FacebookExtension2_EVENT_SPENT_CREDITS:             
                eventTypeParsed = (AppEvents.Name.spentCredits);
            break;
        case YYFacebook.FacebookExtension2_EVENT_UNLOCKED_ACHIEVEMENT:     
                eventTypeParsed = (AppEvents.Name.unlockedAchievement);
            break;
        case YYFacebook.FacebookExtension2_EVENT_VIEWED_CONTENT:             
                eventTypeParsed = (AppEvents.Name.viewedContent);
            break;
            
            default:
                NSLog("Invalid event type passed to fb_send_event data: %d", Int(_eventId));
                return 0.0;
        }
        
        // Parse parameters
        let dictionary = NSMutableDictionary();
        //if (_eventParamsDsList >= 0.0)
        //{
            // Check if the list contains key/value pairs
            let len = _eventParamsDsList.count; //dsListGetSize((int)_eventParamsDsList);
            if(len >= 2 && len % 2 == 0)
            {
                var i = -2;
                while(true)//for (let i = 0; i < len; i += 2)
                {
                    i += 2;
                    
                    if(i >= len)
                    {break;}
                    
                    // Parse ds list key as double
                    let paramKey = _eventParamsDsList.object(at: i) as! Int; //(int)(dsListGetValueDouble((int)_eventParamsDsList, i));
                    var paramKeyParsed: String = "";
                    
                    
                    // Parse param key
                    switch(Int(paramKey))
                    {
                    case YYFacebook.FacebookExtension2_PARAM_CONTENT_ID:
                        paramKeyParsed = AppEvents.ParameterName.contentID.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_CONTENT_TYPE:
                        paramKeyParsed = AppEvents.ParameterName.contentType.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_CURRENCY:
                        paramKeyParsed = AppEvents.ParameterName.currency.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_DESCRIPTION:
                        paramKeyParsed = AppEvents.ParameterName.description.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_LEVEL:
                        paramKeyParsed = AppEvents.ParameterName.level.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_MAX_RATING_VALUE:
                        paramKeyParsed = AppEvents.ParameterName.maxRatingValue.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_NUM_ITEMS:
                        paramKeyParsed = AppEvents.ParameterName.numItems.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_PAYMENT_INFO_AVAILABLE:
                        paramKeyParsed = AppEvents.ParameterName.paymentInfoAvailable.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_REGISTRATION_METHOD:
                        paramKeyParsed = AppEvents.ParameterName.registrationMethod.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_SEARCH_STRING:
                        paramKeyParsed = AppEvents.ParameterName.searchString.rawValue;
                        break;
                    case YYFacebook.FacebookExtension2_PARAM_SUCCESS:
                        paramKeyParsed = AppEvents.ParameterName.success.rawValue;
                        break;
                        
                        default: //NSLog("Invalid parameter passed to fb_send_event data: %d", paramKey);
                        break;
                    }
                    
                    if(paramKeyParsed != "")
                    {
                        let fake_str = "";
                        // Parse param value
                        if(_eventParamsDsList.object(at: i+1) is String)
                        {
                            dictionary.setObject(_eventParamsDsList.object(at: i+1), forKey: paramKeyParsed as NSCopying);

                        }
                        else
                        {
                            dictionary.setObject(_eventParamsDsList.object(at: i+1) as! Int, forKey: paramKeyParsed as NSCopying);
                        }
                    }
                }
            }
        //}
        
        AppEvents.shared.logEvent(eventTypeParsed, valueToSum: _eventValue, parameters: dictionary as? [AppEvents.ParameterName : Any])
        
        return 1.0;
        
    }

    @objc public func getRequestId() -> Int
    {
        mRequestIdCounter += 1;
        
        
        
        return mRequestIdCounter;
    }
    
    
    @objc public func onLaunch(launchOptions: NSDictionary)
    {
        ApplicationDelegate.shared.application( UIApplication.shared, didFinishLaunchingWithOptions: launchOptions as? [UIApplication.LaunchOptionsKey : Any]);
        
        Profile.enableUpdatesOnAccessTokenChange(true);
    }


    ////////////////////////////
    // fb_login
    ////////////////////////////
    @objc public func fb_login(_permissions: NSArray,mviewcontroller:UIViewController) -> Double
    {
        
        // Check if we're alredy logged in
        if(AccessToken.current != nil)
        {
            NSLog("fb_login: session already open");
            fb_set_status(_status: "AUTHORISED");
            return 0;
        }
        
        // Start login process
        fb_set_status(_status: "PROCESSING");
        let currentRequestId = getRequestId();
        //mLoginManager.loginBehavior = eType;

        mLoginManager.logIn(permissions: _permissions as! [String], from: mviewcontroller,handler: getHandlerForLoginRequest(_requestId: currentRequestId));
        
        return Double(currentRequestId);
    }


    ////////////////////////////
    // fb_dialog
    ////////////////////////////
    @objc public func fb_dialog(_link: String,uicontrol:UIViewController) -> (Double)
    {
        
        // Set up object
        let  properties = NSMutableDictionary();
        properties.setObject("object", forKey: "og:type" as NSCopying)
        
        let content = ShareLinkContent();
        content.contentURL = URL.init(string: _link);
        
        
        // Show share dialog
        let dialog = YYFacebookShareDialog();
        dialog.mRequestId = getRequestId();
        
        //dialog.doit(uiview: uicontrol, sharingContent: content)
        
        let mShareDialog = ShareDialog(viewController: uicontrol, content: content, delegate: dialog);
        mShareDialog.show();
        
        //dialog.show();

        
        return Double(dialog.getRequestId());
    }
    
    
    func getHandlerForLoginRequest(_requestId:Int) -> LoginManagerLoginResultBlock
    {
        
        return { result, error in
            
            let dsmap = FacebookExtension2.objc_dsMapCreate();
            FacebookExtension2.objc_dsMapAddString(dsmap, _key: "type", _value: "facebook_login_result");
            FacebookExtension2.objc_dsMapAdd(dsmap, _key: "requestId", _value: Int32(_requestId));
            
            
            if let error = error
            {
                //print("Encountered Erorr: \(error)")
                
                FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "error");
                FacebookExtension2.objc_dsMapAddString(dsmap, _key: "exception", _value: error.localizedDescription);
                self.fb_set_status(_status: "FAILED");
                
            }
            else
            if let result = result, result.isCancelled
            {
                print("Cancelled")
                FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "cancelled");
                self.fb_set_status(_status: "IDLE");
            }
            else
            {
                print("Logged In")
                FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "success");
                
                for perm in result!.grantedPermissions
                {
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: perm, _value: "granted");

                }
                
                for perm in result!.declinedPermissions
                {
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: perm, _value: "declined");
                }
                
                self.fb_set_status(_status: "AUTHORISED");
            }
            
            FacebookExtension2.objc_createSocialAsyncEvent(withDSMap: dsmap);
        }
    }
    
    
    
    //graphRequest:nsGraphPath httpMethod:nsHttpMethod params:params dsMap:_dsMapIndex ];
    @objc public func fb_graph_request(_graphPath:String, httpMethod:String, arrayParams:NSDictionary) -> Double
    {
        if (AccessToken.current == nil)
        {
            NSLog("facebook graph request error: user not logged in");
            return -1;
        }
        
        //NSMutableDictionary* arrayParams = [self dsListToDictionary:_params];
        let currentRequestId = getRequestId();

        //OR-if we want to set graph API version...
        //FBRequest *request = [FBRequest requestWithGraphPath:_graphPath parameters:_params HTTPMethod:_httpMethod];


        let request = GraphRequest.init(graphPath: _graphPath, parameters: arrayParams as! [String : Any], httpMethod: HTTPMethod(rawValue: httpMethod));
        
            
        request.start(){ connection, result, error in
            
            do
            {
                let dsmap = FacebookExtension2.objc_dsMapCreate();
                FacebookExtension2.objc_dsMapAddString(dsmap, _key: "type", _value: "fb_graph_request");
                FacebookExtension2.objc_dsMapAdd(dsmap, _key: "requestId", _value: Int32(currentRequestId));
                
                if(error == nil)
                {
                    //NSLog("graphRequest Result: %@", result);
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "success");
                    
                    
                    if(result is String)
                    {
                        //print(result)
                        FacebookExtension2.objc_dsMapAddString(dsmap, _key: "response_text", _value: result as! String);
                    }
                    else
                    {
                        let jsonData = try JSONSerialization.data(withJSONObject: result, options: [])
                        
                        // Convert JSON data to a string for printing or further use
                        if let jsonString = String(data: jsonData, encoding: .utf8)
                        {
                            //print(jsonString)
                            FacebookExtension2.objc_dsMapAddString(dsmap, _key: "response_text", _value: jsonString);
                            
                        }
                        else
                        {
                            //nothing :)
                        }
                    }
                }
                else
                {
                    //NSLog("error %@", error.description);
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: "status", _value: "error");
                    FacebookExtension2.objc_dsMapAddString(dsmap, _key: "exception", _value: "User must be logged in before access token can be refreshed.");
                }
                
                FacebookExtension2.objc_createSocialAsyncEvent(withDSMap: dsmap);
                
            }
            catch
            {
                print("JSONSerialization error:", error)
            }

        }
    
        return Double(currentRequestId);
    }
}

