//
//  RepayBorrowCell.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepayBorrowItem.h"

@interface RepayBorrowCell : UITableViewCell

/**
 *  我的偿还借款类型，1为待偿还借款，2为已还清借款，3为逾期借款
 */
@property (nonatomic, assign) int repayBorrowType;

@property (nonatomic, strong) RepayBorrowItem *feed;

@end
