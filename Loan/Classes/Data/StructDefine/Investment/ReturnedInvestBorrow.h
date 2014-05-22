//
//  ReturnedInvestBorrow.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  我的投资中的已回收借款

#import "QQModel.h"

@interface ReturnedInvestBorrow : QQModel

/**
 *  已回收借款笔数
 */
@property (nonatomic, assign) int totalNums;
/**
 *  已回收总额
 */
@property (nonatomic, assign) float totalAmount;
/**
 *  已回收本金
 */
@property (nonatomic, assign) float principal;
/**
 *  已回收利息
 */
@property (nonatomic, assign) float interest;

/**
 *  已回收借款列表
 */
@property (nonatomic, strong) NSMutableArray *borrowList;

@end
