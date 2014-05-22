//
//  UserInfoDetail.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  用户详细资料

#import "QQModel.h"

@interface UserInfoDetail : QQModel<NSCoding>

/**
 *  用户头像
 */
@property (nonatomic, strong) NSString *imageUrl;
/**
 *  邮箱
 */
@property (nonatomic, strong) NSString *email;
/**
 *  性别
 */
@property (nonatomic, assign) BOOL gender;
/**
 *  出生日期
 */
@property (nonatomic, strong) NSString *birthday;
/**
 *  QQ
 */
@property (nonatomic, strong) NSString *QQ;
/**
 *  受教育程度
 */
@property (nonatomic, strong) NSString *educationState;
/**
 *  毕业院校
 */
@property (nonatomic, strong) NSString *graduatedSchool;
/**
 *  专业
 */
@property (nonatomic, strong) NSString *major;
/**
 *  入学年份
 */
@property (nonatomic, strong) NSString *admissionYear;
/**
 *  毕业年份
 */
@property (nonatomic, strong) NSString *graduatedYear;
/**
 *  是否有社保
 */
@property (nonatomic, assign) BOOL hasSocialInsurance;
/**
 *  是否有配偶
 */
@property (nonatomic, assign) BOOL hasMate;
/**
 *  是否有子女
 */
@property (nonatomic, assign) BOOL hasChild;
/**
 *  是否有房
 */
@property (nonatomic, assign) BOOL hasHouse;
/**
 *  是否有房贷
 */
@property (nonatomic, assign) BOOL hasMortgage;
/**
 *  是否有车
 */
@property (nonatomic, assign) BOOL hasCar;
/**
 *  是否有车贷
 */
@property (nonatomic, assign) BOOL hasAutoLoan;
/**
 *  籍贯所在省或直辖市
 */
@property (nonatomic, strong) NSString *nativeProvince;
/**
 *  籍贯所在市或地区
 */
@property (nonatomic, strong) NSString *nativeCity;
/**
 *  户口所在地所在省或直辖市
 */
@property (nonatomic, strong) NSString *permanentProvince;
/**
 *  户口所在地所在市或地区
 */
@property (nonatomic, strong) NSString *permanentCity;
/**
 *  现居地所在省或直辖市
 */
@property (nonatomic, strong) NSString *livingProvince;
/**
 *  现居地所在市或地区
 */
@property (nonatomic, strong) NSString *livingCity;
/**
 *  住宅地址
 */
@property (nonatomic, strong) NSString *address;
/**
 *  住宅号码
 */
@property (nonatomic, strong) NSString *phoneCode;

@end
