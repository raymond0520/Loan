//
//  ReturningInvestBorrow.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  我的投资的待回收借款

#import "QQModel.h"

@interface ReturningInvestBorrow : QQModel

/**
 *  待回收借款笔数
 */
@property (nonatomic, assign) int totalNums;
/**
 *  待回收总额
 */
@property (nonatomic, assign) float totalAmount;
/**
 *  待回收本金
 */
@property (nonatomic, assign) float principal;
/**
 *  待回收利息
 */
@property (nonatomic, assign) float interest;

/**
 *  回收中借款列表
 */
@property (nonatomic, strong) NSMutableArray *borrowList;

@end
