//
//  InvestBorrowCell.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InvestBorrowItem.h"

@interface InvestBorrowCell : UITableViewCell

/**
 *  我的投资的借款类型，1为待回收借款，2为已回收借款，3为逾期借款
 */
@property (nonatomic, assign) int borrowType;
/**
 *  feed
 */
@property (nonatomic, strong) InvestBorrowItem *feed;

@end
