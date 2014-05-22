//
//  OverdueStatistic.h
//  Loan
//
//  Created by hdk-mac on 14-1-3.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  逾期统计

#import "QQModel.h"

@interface OverdueStatistic : QQModel<NSCoding>

/**
 *  待还逾期本息
 */
@property (nonatomic, assign) float toPayOverduePrincipalInterest;
/**
 *  已还逾期本息
 */
@property (nonatomic, assign) float paidOverduePrincipalInterest;
/**
 *  逾期次数
 */
@property (nonatomic, assign) int overdueNums;
/**
 *  严重逾期次数
 */
@property (nonatomic, assign) int seriouslyOverdueNums;
/**
 *  待付逾期费用
 */
@property (nonatomic, assign) float toPayOverdueCost;

@end
