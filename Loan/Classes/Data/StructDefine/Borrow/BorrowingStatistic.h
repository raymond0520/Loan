//
//  BorrowingStatistic.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  借款统计

#import "QQModel.h"

@interface BorrowingStatistic : QQModel<NSCoding>

/**
 *  总借款额
 */
@property (nonatomic, assign) float totalBorrowing;
/**
 *  成功借款笔数
 */
@property (nonatomic, assign) int borrowedNums;
/**
 *  已还本息
 */
@property (nonatomic, assign) float paidPrincipalInterest;
/**
 *  已还清笔数
 */
@property (nonatomic, assign) int paidNums;
/**
 *  待还本息
 */
@property (nonatomic, assign) float toPayPrincipalInterest;
/**
 *  正在还款笔数
 */
@property (nonatomic, assign) int toPayNums;
/**
 *  平台垫付金额
 */
@property (nonatomic, assign) float advancedAmountByPlatform;
/**
 *  平台垫付笔数
 */
@property (nonatomic, assign) int advancedNumsByPlatform;

@end
