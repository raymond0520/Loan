//
//  IncomeStatistic.h
//  Loan
//
//  Created by hdk-mac on 14-1-10.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "QQModel.h"

@interface IncomeStatistic : QQModel<NSCoding>

/**
 *  已赚利息
 */
@property (nonatomic, assign) float interestsEarned;
/**
 *  已赚利息的投资管理费
 */
@property (nonatomic, assign) float hasCostInvestManageFee;
/**
 *  实际收益
 */
@property (nonatomic, assign) float realYield;
/**
 *  待赚利息
 */
@property (nonatomic, assign) float interestsToBeEarned;
/**
 *  待赚利息的投资管理费
 */
@property (nonatomic, assign) float onCostOfInvestManageFee;
/**
 *  预计收益
 */
@property (nonatomic, assign) float projectedIncome;

@end
