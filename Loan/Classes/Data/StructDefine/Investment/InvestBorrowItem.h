//
//  InvestBorrowItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  我的投资借款列表的一项

#import "QQModel.h"

@interface InvestBorrowItem : QQModel

/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  借款人
 */
@property (nonatomic, strong) NSString *borrower;
/**
 *  投资金额
 */
@property (nonatomic, assign) float investAmount;
/**
 *  利率
 */
@property (nonatomic, assign) float interestRate;
/**
 *  应收日期
 */
@property (nonatomic, strong) NSString *receivableDate;
/**
 *  实收日期
 */
@property (nonatomic, strong) NSString *receivedDate;

@end
