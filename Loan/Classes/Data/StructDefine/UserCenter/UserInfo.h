//
//  UserInfo.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  用户资料

#import "QQModel.h"

@interface UserInfo : QQModel<NSCoding>
{
}

/**
 *  头像url
 */
@property (nonatomic, strong) NSString *imageURL;

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
/**
 *  注册时间
 */
@property (nonatomic, strong) NSString *registerDate;
/**
 *  现居地
 */
@property (nonatomic, strong) NSString *address;
/**
 *  信用等级
 */
@property (nonatomic, strong) NSString *creditRating;
/**
 *  信用额度
 */
@property (nonatomic, assign) float creditLimit;
/**
 *  可用信用额度
 */
@property (nonatomic, assign) float availableCreditLine;
/**
 *  借款信用额度
 */
@property (nonatomic, assign) float borrowCreditLine;
/**
 *  会员身份
 */
@property (nonatomic, strong) NSString *vipState;
/**
 *  可用积分
 */
@property (nonatomic, assign) int availablePoints;
/**
 *  未读信件数
 */
@property (nonatomic, assign) int toReadEmailNums;
/**
 *  好友关注数
 */
@property (nonatomic, assign) int attentionNums;

@property (nonatomic, assign) BOOL isLogin;

@end
