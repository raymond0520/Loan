//
//  OverdueBorrowingItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-3.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  逾期借款列表中的一项

#import "QQModel.h"

@interface OverdueBorrowingItem : QQModel<NSCoding>

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
 *  应还本金
 */
@property (nonatomic, assign) float toPayPrincipal;
/**
 *  应还利息
 */
@property (nonatomic, assign) float toPayInterest;
/**
 *  应还罚息
 */
@property (nonatomic, assign) float toPayDefaultInterest;
/**
 *  应还日期
 */
@property (nonatomic, assign) float deadline;
/**
 *  逾期天数
 */
@property (nonatomic, assign) int overdueDays;
/**
 *  电子协议
 */
@property (nonatomic, strong) NSString *electronicProtocol;
/**
 *  操作
 */
@property (nonatomic, strong) NSString *perform;

@end
