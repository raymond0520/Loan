//
//  AccountStatistic.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  资金记录

#import "QQModel.h"

@interface AccountStatistic : QQModel<NSCoding>

/**
 *  账户总额
 */
@property (nonatomic, assign) float totalAccountAmount;
/**
 *  可用余额
 */
@property (nonatomic, assign) float availableBalance;
/**
 *  冻结金额
 */
@property (nonatomic, assign) float frozenAmount;
/**
 *  充值金额
 */
@property (nonatomic, assign) float rechargeAmount;
/**
 *  提现金额
 */
@property (nonatomic, assign) float withdrawalAmount;

@end
