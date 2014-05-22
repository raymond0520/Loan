//
//  ContactInfo.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  联系人信息

#import "QQModel.h"

@interface ContactInfo : QQModel<NSCoding>

/**
 *  直属联系人姓名
 */
@property (nonatomic, strong) NSString *directContactName;
/**
 *  直属联系人关系
 */
@property (nonatomic, strong) NSString *directContactRelation;
/**
 *  直属联系人手机
 */
@property (nonatomic, strong) NSString *directContactPhone;
/**
 *  其他联系人姓名
 */
@property (nonatomic, strong) NSString *otherContactName;
/**
 *  其他联系人关系
 */
@property (nonatomic, strong) NSString *otherContactRelation;
/**
 *  其他联系人手机
 */
@property (nonatomic, strong) NSString *otherContactPhone;

@end
