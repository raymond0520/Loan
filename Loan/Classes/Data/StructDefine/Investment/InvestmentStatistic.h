//
//  InvestmentStatistic.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "QQModel.h"

@interface InvestmentStatistic : QQModel<NSCoding>

/**
 *  总投资金额
 */
@property (nonatomic, assign) float totalAmountOnInvest;
/**
 *  已回收本息
 */
@property (nonatomic, assign) float principalInterestsCollected;
/**
 *  待回收本息
 */
@property (nonatomic, assign) float principalInterestsOnCollecting;
/**
 *  总投资笔数
 */
@property (nonatomic, assign) int totalNumsOnInvest;
/**
 *  已回收笔数
 */
@property (nonatomic, assign) int numsCollected;
/**
 *  待回收笔数
 */
@property (nonatomic, assign) int numsOnCollecting;

@end
