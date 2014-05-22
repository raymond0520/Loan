//
//  WithdrawRecordItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-9.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "QQModel.h"

@interface WithdrawRecordItem : QQModel

/**
 *  序号
 */
@property (nonatomic, assign) int sequenceNumber;
/**
 *  提现时间
 */
@property (nonatomic, strong) NSString *performTime;
/**
 *  提现金额
 */
@property (nonatomic, assign) float sum;
/**
 *  提现手续费
 */
@property (nonatomic, assign) float factorage;
/**
 *  银行卡号
 */
@property (nonatomic, strong) NSString *bankCardID;
/**
 *  银行
 */
@property (nonatomic, strong) NSString *bankName;
/**
 *  状态
 */
@property (nonatomic, strong) NSString *state;
/**
 *  备注
 */
@property (nonatomic, strong) NSString *remark;

@end
