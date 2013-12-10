/**
 * Appcelerator Titanium Mobile
 * Copyright (c) 2009-2013年 by Appcelerator, Inc. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "NetHoyohoyoTimedibaadViewProxy.h"
#import "NetHoyohoyoTimedibaadView.h"
#import "TiUtils.h"

@implementation NetHoyohoyoTimedibaadViewProxy

-(void)willHide
{
    if (view)
    {
        [(NetHoyohoyoTimedibaadView*)view willHide];
    }
}

-(void)willShow
{
    if (view)
    {
        [(NetHoyohoyoTimedibaadView*)view willShow];
    }
}

@end
