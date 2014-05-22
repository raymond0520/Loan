//
//  InvestmentDetail.h
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "QQModel.h"

@interface InvestmentDetail : QQModel

/**
 *  还款方式
 */
@property (nonatomic, strong) NSString *repayMode;
/**
 *  担保机构
 */
@property (nonatomic, strong) NSString *guaranteeAgency;
/**
 *  反担保方式
 */
@property (nonatomic, strong) NSString *counterGuaranteeWay;
/**
 *  产品已发布时间
 */
@property (nonatomic, assign) int publishedTime;
/**
 *  还能投标人数
 */
@property (nonatomic, assign) int surplusBidNums;
/**
 *  借款人用户名
 */
@property (nonatomic, strong) NSString *borrowerName;
/**
 *  会员等级
 */
@property (nonatomic, strong) NSString *vipStatus;
/**
 *  所在地
 */
@property (nonatomic, strong) NSString *site;
/**
 *  成功流转份数
 */
@property (nonatomic, assign) int flowCopies;
/**
 *  如约回购份数
 */
@property (nonatomic, assign) int repurchase;
/**
 *  逾期违约次数
 */
@property (nonatomic, assign) int overdueDefault;
/**
 *  借款人相关资料
 */
@property (nonatomic, strong) NSString *borrowerInformation;
/**
 *  借款人资金用途
 */
@property (nonatomic, strong) NSString *fundPurpose;

@end
