//
//  PublishedBorrowing.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  已发布借款

#import "QQModel.h"

@interface PublishedBorrowing : QQModel<NSCoding>

/**
 *  编号
 */
@property (nonatomic, assign) int ID;
/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  金额
 */
@property (nonatomic, strong) NSString *amount;
/**
 *  利率
 */
@property (nonatomic, assign) float interestRating;
/**
 *  期限
 */
@property (nonatomic, strong) NSString *deadline;
/**
 *  完成度
 */
@property (nonatomic, assign) int process;
/**
 *  剩余时间
 */
@property (nonatomic, assign) int remainingTime;
/**
 *  状态
 */
@property (nonatomic, assign) int state;

@end
