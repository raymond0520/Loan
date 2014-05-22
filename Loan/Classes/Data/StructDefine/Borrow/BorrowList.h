//
//  BorrowList.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  借款列表的项

#import "QQModel.h"

@interface BorrowList : QQModel<NSCoding>

/**
 *  借款用途
 */
@property (nonatomic, strong) NSString *purpose;
/**
 *  借款金额
 */
@property (nonatomic, assign) int borrowingAmount;
/**
 *  起投金额
 */
@property (nonatomic, assign) int lowInvestmentAmount;
/**
 *  投资年利率
 */
@property (nonatomic, assign) float annualInterestRate;
/**
 *  期限,单位：月
 */
@property (nonatomic, assign) int deadline;
/**
 *  进度
 */
@property (nonatomic, assign) float progress;


@end
