//
//  BaseUIData.m
//  Loan
//
//  Created by hdk-mac on 13-12-31.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import "BaseUIData.h"

static BaseUIData * g_UIData = nil;

@implementation BaseUIData

@synthesize screenwidth = _screenwidth;
@synthesize screenheight = _screenheight;

+ (id)GetInstance
{
    @synchronized(self)
    {
        if(g_UIData == nil)
        {
            g_UIData = [[BaseUIData alloc] init];
        }
    }
    return g_UIData;
}

-(id)init
{
    if(self = [super init])
    {
        _screenwidth = 320;
        _screenheight = 480;
    }
    
    return self;
}

@end
