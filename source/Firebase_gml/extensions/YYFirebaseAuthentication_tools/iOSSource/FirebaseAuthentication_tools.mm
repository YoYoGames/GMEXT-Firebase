
#import "FirebaseAuthentication_tools.h"

const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);
extern UIViewController *g_controller;
extern UIView *g_glView;
extern int g_DeviceWidth;
extern int g_DeviceHeight;

@implementation FirebaseAuthentication_tools

-(void) FirebaseAuthentication_Tools_WebView_Create:(NSString*) url
{
    CGFloat width = CGRectGetWidth(UIScreen.mainScreen.bounds);
    CGFloat height = CGRectGetHeight(UIScreen.mainScreen.bounds);
    CGRect mCGRectMake = CGRectMake(0,0, width, height);
    
    WKWebViewConfiguration *webConfiguration = [WKWebViewConfiguration new];
    self.webView = [[WKWebView alloc] initWithFrame:mCGRectMake configuration:webConfiguration];
    self.webView.UIDelegate = self;
    
    NSString *urlString = [[NSString stringWithFormat:@"%@", url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSURL *nsurl = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:nsurl];
    [self.webView loadRequest:request];
    [g_glView addSubview:self.webView];
    
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [g_glView addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:self.webView
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:g_controller.bottomLayoutGuide
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:0],
                               [NSLayoutConstraint constraintWithItem:self.webView
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:g_controller.view
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeLeft
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:g_controller.view
                                                             attribute:NSLayoutAttributeLeft
                                                            multiplier:1
                                                              constant:0],
                                 [NSLayoutConstraint constraintWithItem:self.webView
                                                              attribute:NSLayoutAttributeRight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:g_controller.view
                                                              attribute:NSLayoutAttributeRight
                                                             multiplier:1
                                                               constant:0]
                               ]];
							   
	[self WebView_closeButton_add];
}

-(void) FirebaseAuthentication_Tools_WebView_Delete
{
    if(self.webView == nil)
        return;
    
	[self WebView_closeButton_destroy];
	
    [self.webView removeFromSuperview];
    self.webView = nil;
}

-(void) WebView_closeButton_add
{
    UIImage *image = [UIImage imageNamed:@"games/webview/img_close.png"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    self.imageView.frame = CGRectMake(0, 0, 35, 35);
    
    UITapGestureRecognizer *singleFingerTap =
      [[UITapGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSingleTap:)];
    [self.imageView addGestureRecognizer:singleFingerTap];
    self.imageView.userInteractionEnabled = true;
    
    [g_glView addSubview:self.imageView];
}

-(void) WebView_closeButton_destroy
{
    if(self.imageView == nil)
        return;
    
    [self.imageView removeFromSuperview];
    self.imageView = nil;
}

-(void) WebView_closeButton_setAlpha:(double) alpha
{
    if(self.imageView == nil)
        return;
    
    self.imageView.alpha = alpha;
}

- (void)webViewDidClose:(WKWebView *)webView;
{
    int dsMapIndex = CreateDsMap(1,
                             "type", 0.0, "FirebaseAuthentication_Tools_WebView_onCloseWindow"
                             );
    CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
    self.webView = nil;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    int dsMapIndex = CreateDsMap(1,
                             "type", 0.0, "FirebaseAuthentication_Tools_WebView_onUserClose"
                             );
    CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
}

@end

