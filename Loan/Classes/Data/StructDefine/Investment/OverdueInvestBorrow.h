//
//  OverdueInvestBorrow.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  我的投资中的逾期借款

#import "QQModel.h"

@interface OverdueInvestBorrow : QQModel

/**
 *  逾期借款笔数
 */
@property (nonatomic, assign) int totalNums;
/**
 *  逾期本金
 */
@property (nonatomic, assign) float principalInterest;
/**
 *  逾期本金
 */
@property (nonatomic, assign) float principal;
/**
 *  逾期利息
 */
@property (nonatomic, assign) float interest;

/**
 *  逾期借款列表
 */
@property (nonatomic, strong) NSMutableArray *borrowList;

@end
