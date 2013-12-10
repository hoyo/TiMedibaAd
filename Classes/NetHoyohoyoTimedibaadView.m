/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "NetHoyohoyoTimedibaadView.h"
#import "TiApp.h"

@implementation NetHoyohoyoTimedibaadView

-(void)dealloc
{
    masIconad_.delegate = nil;
    mas_.delegate = nil;
    RELEASE_TO_NIL(masIconad_);
    RELEASE_TO_NIL(mas_);
    [super dealloc];
}

-(void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds
{
    if (self.mas == nil)
    {
        if ([TiUtils boolValue:[self.proxy valueForKey:@"isIconAd"]])
        {
            masIconad_ = [[MasIconadManagerViewController alloc] init];
            masIconad_.delegate = self;
            [self addSubview:masIconad_.view];
            masIconad_.adOrigin = CGPointMake(0, 0);
            masIconad_.textVisible = 1;
            masIconad_.iconCount = 4;
            masIconad_.sID = [self.proxy valueForKey:@"sId"];
            [masIconad_ loadRequest];
            self.mas = masIconad_;
        }
        else
        {
            mas_ = [[MasManagerViewController alloc] init];
            mas_.delegate = self;
            [self addSubview:mas_.view];
            mas_.applicationView = self;
            if ([[UIScreen mainScreen] bounds].size.height == 568.0)
            {
                mas_.metricsSize = kMasMVMSize_retina4full;
            }
            else
            {
                mas_.metricsSize = kMasMVMSize_retina35full;
            }
            [mas_ setPosition:kMasMVPosition_none];
            mas_.sID = [self.proxy valueForKey:@"sId"];
            [mas_ loadRequest];
            self.mas = mas_;
        }
    }
    
    CGFloat w = bounds.size.width;
    CGFloat y = bounds.size.height - 50.0f;
    self.mas.view.frame = CGRectMake(0, y, w, 50.0f);
}

-(void)willHide
{
    NSLog(@"disappeared");
    if (self.mas)
    {
        if ([self.proxy valueForKey:@"isIconAd"])
        {
            [masIconad_ pauseRefresh];
        }
        else
        {
            [mas_ pauseRefresh];
        }
    }
}

-(void)willShow
{
    NSLog(@"appeared");
    if (self.mas)
    {
        if ([self.proxy valueForKey:@"isIconAd"])
        {
            [masIconad_ resumeRefresh];
        }
        else
        {
            [mas_ resumeRefresh];
        }
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
    if (!y_)
    {
        y_ = self.frame.origin.y;
    }
    int top = 20;
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1)
    {
        top = 0;
    }

    self.frame = CGRectMake(0, top, self.bounds.size.width, [[UIScreen mainScreen] bounds].size.height);
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
