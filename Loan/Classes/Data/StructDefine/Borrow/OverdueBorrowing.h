//
//  OverdueBorrowing.h
//  Loan
//
//  Created by hdk-mac on 14-1-3.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  逾期借款

#import "QQModel.h"

@interface OverdueBorrowing : QQModel<NSCoding>

/**
 *  逾期借款笔数
 */
@property (nonatomic, assign) int totalNums;
/**
 *  逾期本息
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
 *  逾期借款列表，item为OverdueBorrowingItem
 */
@property (nonatomic, strong) NSMutableArray *overdueList;

@end
