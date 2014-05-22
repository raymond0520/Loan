//
//  InvestmentItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  投资列表的一项

#import "QQModel.h"
#import "InvestmentDetail.h"

@interface InvestmentItem : QQModel

/**
 *  编号
 */
@property (nonatomic, strong) NSString *ID;
/**
 *  借款用途
 */
@property (nonatomic, strong) NSString *purpose;
/**
 *  借款金额
 */
@property (nonatomic, assign) float borrowingAmount;
/**
 *  起投金额
 */
@property (nonatomic, assign) float lowInvestmentAmount;
/**
 *  投资年利率
 */
@property (nonatomic, assign) float annualInterestRate;
/**
 *  期限,单位：月
 */
@property (nonatomic, assign) int deadline;
/**
 *  进度
 */
@property (nonatomic, assign) float progress;
/**
 *  玖玖贷类型
 */
@property (nonatomic, strong) NSString * jojoType;

/**
 *  投资详情
 */
@property (nonatomic, strong) InvestmentDetail *detail;

@end
