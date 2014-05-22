//
//  PaidOffBorrowingItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-3.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "QQModel.h"

@interface PaidOffBorrowingItem : QQModel<NSCoding>

/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  借款金额
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
 *  已还总额
 */
@property (nonatomic, assign) float paidTotalAmount;
/**
 *  已还利息
 */
@property (nonatomic, assign) float paidInterest;
/**
 *  已还罚息
 */
@property (nonatomic, assign) float paidDefaultInterest;
/**
 *  还款日期
 */
@property (nonatomic, assign) float paidDate;
/**
 *  电子协议
 */
@property (nonatomic, strong) NSString *electronicProtocol;

@end
