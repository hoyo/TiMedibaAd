//
//  MasVideoViewController.h
//  New_medibaadTest
//
//  Created by    on 12/08/16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MPMoviePlayerController.h>

@interface MasVideoViewController : UIViewController
{
    id delegate_;
    NSURL *movieURL_;
    UIImageView *imgClose_;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSURL *movieURL;
@property(nonatomic,retain) UIImageView* imgClose;

- (id)initWithUrl:(NSString *)url;
-(void)dismiss;
-(void)finishedCloseAnimation;
- (void)done;

@end

@protocol MasVideoViewControllerDelegate

@optional 

- (void)showViewMasVideoViewController;
- (void)closeViewMasVideoViewController;

@end
