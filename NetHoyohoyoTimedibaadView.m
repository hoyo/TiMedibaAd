/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "NetHoyohoyoTimedibaadView.h"
#import "TiApp.h"

@implementation NetHoyohoyoTimedibaadView
@synthesize mas = mas_;

-(void)dealloc
{
    self.mas.delegate = nil;
    RELEASE_TO_NIL(self.mas);
    [super dealloc];
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (self.mas == nil)
    {
        self.mas = [[MasManagerViewController alloc] init];
        self.mas.delegate = self;
        [self addSubview:self.mas.view];
        self.mas.applicationView = self;
        if ([[UIScreen mainScreen] bounds].size.height == 568.0)
        {
            self.mas.metricsSize = kMasMVMSize_retina4full;
        }
        else
        {
            self.mas.metricsSize = kMasMVMSize_retina35full;
        }
        [self.mas setPosition:kMasMVPosition_bottom];
        self.mas.sID = [self.proxy valueForKey:@"sId"];
        [self.mas loadRequest];
    }
    
    CGFloat w = bounds.size.width;
    CGFloat y = bounds.size.height - 50.0f;
    self.mas.view.frame = CGRectMake(0, y, w, 50.0f);
}

-(void)willHide
{
    NSLog(@"disappeared");
    if (self.mas) {
        [self.mas pauseRefresh];
    }
}

-(void)willShow
{
    NSLog(@"appeared");
    if (self.mas) {
        [self.mas resumeRefresh];
    }
}

-(void)masManagerViewControllerReceiveAd:(MasManagerViewController *)masManagerViewController
{
    if ([self.proxy _hasListeners:@"receive"])
    {
        [self.proxy fireEvent:@"receive"];
    }
}

-(void)masManagerViewControllerFailedToReceiveAd:(MasManagerViewController *)masManagerViewController
{
    if ([self.proxy _hasListeners:@"error"])
    {
        [self.proxy fireEvent:@"error"];
    }
}

-(void)masBrowserViewControllerShow
{
    if (!y_) {
        y_ = self.frame.origin.y;
    }
    self.frame = CGRectMake(0, 0, self.bounds.size.width, [[UIScreen mainScreen] bounds].size.height);
    if ([self.proxy _hasListeners:@"openbrowser"])
    {
        [self.proxy fireEvent:@"openbrowser"];
    }
}

-(void)masBrowserViewControllerClose
{
    self.frame = CGRectMake(0, y_, self.bounds.size.width, 50.0f);
    if ([self.proxy _hasListeners:@"closebrowser"])
    {
        [self.proxy fireEvent:@"closebrowser"];
    }
}

-(void)masVideoViewAppear
{
    if ([self.proxy _hasListeners:@"appearvideo"])
    {
        [self.proxy fireEvent:@"appearvideo"];
    }
}

-(void)masVideoViewDisappear
{
    if ([self.proxy _hasListeners:@"disappearvideo"])
    {
        [self.proxy fireEvent:@"disappearvideo"];
    }
}

@end
