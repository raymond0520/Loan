//
//  BaseUIData.h
//  Loan
//
//  Created by hdk-mac on 13-12-31.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseUIData : NSObject
{
    float _screenwidth;
    float _screenheight;
}

@property (nonatomic, assign) float screenwidth;
@property (nonatomic, assign) float screenheight;

+ (id)GetInstance;

@end
