#import "MasIconadConstants.h"
#import "MasIconadBrowserViewController.h"

@interface MasIconadManagerViewController : UIViewController<UIWebViewDelegate, MasIconadBrowserViewControllerDelegate> {
	id delegate_;
    UIWebView *adWebView_;
	NSString *sID_;
    NSTimer *retryTimer;
    NSString *baseURL_;
	BOOL firstLoaded_;
    NSURL *currentURL_;
    int retryCount_;
    MasIconadBrowserViewController *masBrowserViewController_;
    UIView *applicationView_;
    CGPoint adOrigin_;
    int iconCount_;
    int textVisible_;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) UIWebView *adWebView;
@property (nonatomic, retain) NSString *sID;
@property (nonatomic, retain) NSString *baseURL;
@property (nonatomic, retain) NSURL *currentURL;
@property (nonatomic, retain) MasIconadBrowserViewController *masBrowserViewController;
@property (nonatomic, retain) UIView *applicationView;
@property (nonatomic) CGPoint adOrigin;
@property (nonatomic) int iconCount;
@property (nonatomic) int textVisible;
- (void)loadRequest;
- (void)pauseRefresh;
- (void)resumeRefresh;
- (void)setBackGround:(UIColor*)color opaque:(BOOL)opaque;
@end

@protocol MasIconadManagerViewControllerDelegate

@optional
- (void)masIconadManagerViewControllerReceiveAd:(MasIconadManagerViewController *)masManagerViewController;
- (void)masIconadManagerViewControllerFailedToReceiveAd:(MasIconadManagerViewController *)masManagerViewController;
- (void)masIconadBrowserViewControllerShow;
- (void)masIconadBrowserViewControllerClose;
@end
