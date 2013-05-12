#import <UIKit/UIKit.h>

@interface MasBrowserViewController : UIViewController<UIWebViewDelegate> {
	id delegate_;
	NSURL *url_;
    UINavigationBar *navigationBar_;
	UINavigationItem* item_;
	UIWebView *webView_;
    NSArray *optout_;
    
    // アプトアウト用
}
@property (nonatomic, assign) id delegate;
@property(nonatomic,retain) NSURL *url;
@property(nonatomic,retain) UINavigationBar *navigationBar;
@property(nonatomic,retain) UINavigationItem* item;
@property(nonatomic,retain) UIWebView *webView;
@property(nonatomic,retain) NSArray *optout;

-(void)done;
-(void)back;
-(void)dismiss;

- (id)initWithUrl:(NSString *)url;
- (id)initWithOptout:(NSString *)url optout:(NSArray*)optout;
- (void)setCookie;
@end

@protocol MasBrowserViewControllerDelegate

- (void)showViewMasBrowserViewController;
- (void)closeViewMasBrowserViewController;

@end
