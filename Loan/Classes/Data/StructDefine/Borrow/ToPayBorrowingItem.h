//
//  ToPayBorrowingItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-3.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  待偿还借款列表的一项

#import "QQModel.h"

@interface ToPayBorrowingItem : QQModel<NSCoding>

/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  借款总金额
 */
@property (nonatomic, assign) float borrowingAmount;
/**
 *  利率
 */
@property (nonatomic, assign) float interestRating;
/**
 *  第几期
 */
@property (nonatomic, assign) int period;
/**
 *  总期数
 */
@property (nonatomic, assign) int totalPeriods;
/**
 *  应还总额
 */
@property (nonatomic, assign) float toPayTotalAmount;
/**
 *  应还本金
 */
@property (nonatomic, assign) float toPayPrincipal;
/**
 *  应还利息
 */
@property (nonatomic, assign) float toPayInterest;
/**
 *  应还日期
 */
@property (nonatomic, assign) float deadline;
/**
 *  电子协议
 */
@property (nonatomic, strong) NSString *electronicProtocol;
/**
 *  操作
 */
@property (nonatomic, strong) NSString *perform;

@end
