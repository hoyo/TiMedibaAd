/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */
#import "TiUIView.h"
#import "MasManagerViewController.h"

@interface NetHoyohoyoTimedibaadView : TiUIView<MasManagerViewControllerDelegate>
{
    MasManagerViewController *mas_;
    float y_;
}

@property (strong, retain) MasManagerViewController *mas;

-(void)willHide;
-(void)willShow;

@end
