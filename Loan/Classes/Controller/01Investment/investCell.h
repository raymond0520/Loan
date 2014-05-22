//
//  investCell.h
//  Loan
//
//  Created by conquer on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InvestmentItem.h"
@class KDGoalBar;

@interface investCell : UITableViewCell{
    InvestmentItem *_investItem;
    KDGoalBar *_gbSchedule;            // 方案进度
}

@property(nonatomic,retain)InvestmentItem *investItem;
@property(nonatomic, retain) KDGoalBar *gbSchedule;
@end
