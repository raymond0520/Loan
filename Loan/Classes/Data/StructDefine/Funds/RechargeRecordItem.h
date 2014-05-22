//
//  RechargeRecordItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-9.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "QQModel.h"

@interface RechargeRecordItem : QQModel<NSCoding>

/**
 *  序号
 */
@property (nonatomic, assign) int sequenceNumber;
/**
 *  订单号
 */
@property (nonatomic, strong) NSString *orderNumber;
/**
 *  充值方式
 */
@property (nonatomic, strong) NSString *rechargeMode;
/**
 *  充值金额
 */
@property (nonatomic, assign) float rechargeSum;
/**
 *  交易时间
 */
@property (nonatomic, strong) NSString *tradeTime;
/**
 *  状态
 */
@property (nonatomic, strong) NSString *state;
/**
 *  备注
 */
@property (nonatomic, strong) NSString *remark;

@end
