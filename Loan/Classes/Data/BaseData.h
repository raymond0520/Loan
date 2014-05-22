//
//  BaseData.h
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import "QQModel.h"
#import "UserInfo.h"
#import "AccountStatistic.h"
#import "ReturningInvestBorrow.h"
#import "ReturnedInvestBorrow.h"
#import "OverdueInvestBorrow.h"
#import "ToPayBorrowing.h"
#import "PaidOffBorrowing.h"
#import "OverdueBorrowing.h"
#import "InvestmentStatistic.h"
#import "IncomeStatistic.h"

@interface BaseData : QQModel<NSCoding>{
   
}

@property (nonatomic, strong) NSMutableArray        *investmentList; //投资列表
@property (nonatomic, strong) UserInfo              *userInfo; //用户信息
@property (nonatomic, strong) AccountStatistic      *accountStatistic; //账户统计
@property (nonatomic, strong) ReturningInvestBorrow *returningInvestBorrow; //待还借款
@property (nonatomic, strong) ReturnedInvestBorrow  *returnedInvestBorrow; //已还借款
@property (nonatomic, strong) OverdueInvestBorrow   *overdueInvestBorrow; //逾期借款
@property (nonatomic, strong) ToPayBorrowing        *toPayBorrow; //待支付借款
@property (nonatomic, strong) PaidOffBorrowing      *paidOffBorrow; //已付清借款
@property (nonatomic, strong) OverdueBorrowing      *overdueBorrow; //逾期借款
@property (nonatomic, strong) NSMutableArray        *rechargeList; //充值记录列表
@property (nonatomic, strong) NSMutableArray        *withdrawList; //提现记录列表
@property (nonatomic, strong) InvestmentStatistic   *investStatistic; //投资统计
@property (nonatomic, strong) IncomeStatistic       *incomeStatistic; //收益统计
@property (nonatomic, strong) NSMutableArray        *mediaReportList; //媒体报道列表
@property (nonatomic, strong) NSMutableArray        *latestAnnounceList; //最新公告列表

+ (id)GetInstance;

@end
