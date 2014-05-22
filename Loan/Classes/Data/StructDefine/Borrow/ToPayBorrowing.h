//
//  ToPayBorrowing.h
//  Loan
//
//  Created by hdk-mac on 14-1-3.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  待偿还借款

#import "QQModel.h"

@interface ToPayBorrowing : QQModel<NSCoding>

/**
 *  待偿还借款笔数
 */
@property (nonatomic, assign) int totalNums;
/**
 *  待还总额
 */
@property (nonatomic, assign) float totalAmount;
/**
 *  待还本金
 */
@property (nonatomic, assign) float principal;
/**
 *  待还利息
 */
@property (nonatomic, assign) float interest;

/**
 *  待偿还借款列表，item为ToPayBorrowingItem
 */
@property (nonatomic, strong) NSMutableArray *toPayBorrowingList;

@end
