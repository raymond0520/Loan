//
//  PaidOffBorrowing.h
//  Loan
//
//  Created by hdk-mac on 14-1-3.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  已还清借款

#import "QQModel.h"

@interface PaidOffBorrowing : QQModel<NSCoding>

/**
 *  已还清借款笔数
 */
@property (nonatomic, assign) int totalNums;
/**
 *  已还总额
 */
@property (nonatomic, assign) float totalAmount;
/**
 *  已还本金
 */
@property (nonatomic, assign) float principal;
/**
 *  已还利息
 */
@property (nonatomic, assign) float interest;
/**
 *  已还罚息
 */
@property (nonatomic, assign) float defaultInterest;
/**
 *  已还借款列表，item为PaidOffBorrowingItem
 */
@property (nonatomic, strong) NSMutableArray *paidOffList;

@end
