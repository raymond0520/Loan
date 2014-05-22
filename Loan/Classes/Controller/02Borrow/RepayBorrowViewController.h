//
//  RepayBorrowViewController.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  偿还借款

#import "BaseListMethod.h"
#import "UISortView.h"

@interface RepayBorrowViewController : BaseListMethod<UISortViewdelegate>

/**
 *  我的偿还借款，1为待偿还借款，2为已还清借款，3为逾期借款
 */
@property (nonatomic, assign) int repayBorrowType;

@end
