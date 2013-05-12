#import "MasConstants.h"
#import "MasBrowserViewController.h"
#import "MasVideoViewController.h"
#import <MessageUI/MFMessageComposeViewController.h>
#import <MediaPlayer/MPMoviePlayerController.h>
#import <EventKit/EKEvent.h>
#import <EventKitUI/EKEventEditViewController.h>

typedef enum {
    kMasMVPosition_none = 0,
    kMasMVPosition_top,
	kMasMVPosition_bottom
} MasManagerViewPosition;

typedef enum {
    kMasMVMSize_none = 0,
    kMasMVMSize_freeform,
    kMasMVMSize_retina35full,
    kMasMVMSize_retina4full
} MasManagerViewMetricsSize;

@interface MasManagerViewController : UIViewController<UIWebViewDelegate, MasBrowserViewControllerDelegate, MFMessageComposeViewControllerDelegate, MasVideoViewControllerDelegate> {
	id delegate_;
    UIWebView *adWebView_;
	NSString *sID_;
	MasViewRefreshAnimationType viewRefreshAnimationType_;
	MasManagerViewPosition position_;
	BOOL startShowAd_;
    NSTimer *retryTimer;
    NSString *baseURL_;
	BOOL firstLoaded_;
    NSURL *currentURL_;
    int retryCount_;
    MasVideoViewController *masVideoViewController_;
    MasBrowserViewController *masBrowserViewController_;
    UIView *applicationView_;
    MasManagerViewMetricsSize metricsSize_;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) UIWebView *adWebView;
@property (nonatomic, retain) NSString *sID;
@property (nonatomic) MasManagerViewPosition position;
@property (nonatomic, retain) NSString *baseURL;
@property (nonatomic, retain) NSURL *currentURL;
@property (nonatomic, retain) MasVideoViewController *masVideoViewController;
@property (nonatomic, retain) MasBrowserViewController *masBrowserViewController;
@property (nonatomic, retain) UIView *applicationView;
@property (nonatomic) MasManagerViewMetricsSize metricsSize;
- (void)loadRequest;
- (void)showAdView;
- (void)willRotateToInterfaceOrientation;
- (void)didRotateFromInterfaceOrientation;
- (void)refreshPosition:(BOOL)animation;
- (void)pauseRefresh;
- (void)resumeRefresh;
@end

@protocol MasManagerViewControllerDelegate

@optional
- (void)masManagerViewControllerReceiveAd:(MasManagerViewController *)masManagerViewController;
- (void)masManagerViewControllerFailedToReceiveAd:(MasManagerViewController *)masManagerViewController;
- (void)masVideoViewAppear;
- (void)masVideoViewDisappear;
- (void)masBrowserViewControllerShow;
- (void)masBrowserViewControllerClose;
@end
