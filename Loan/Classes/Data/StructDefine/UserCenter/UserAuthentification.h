//
//  UserAuthentification.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//  用户信息认证

#import "QQModel.h"

@interface UserAuthentification : QQModel<NSCoding>

/**
 *  就业状态
 */
@property (nonatomic, strong) NSString *employmentStatus;
/**
 *  单位名称
 */
@property (nonatomic, strong) NSString *organizationName;
/**
 *  工作地所在省
 */
@property (nonatomic, strong) NSString *workingProvince;
/**
 *  工作地所在市或地区
 */
@property (nonatomic, strong) NSString *workingCity;
/**
 *  公司类别
 */
@property (nonatomic, strong) NSString *companyCategory;
/**
 *  公司行业
 */
@property (nonatomic, strong) NSString *companyIndustry;
/**
 *  公司规模
 */
@property (nonatomic, strong) NSString *companyScale;
/**
 *  职务
 */
@property (nonatomic, strong) NSString *duty;
/**
 *  月收入
 */
@property (nonatomic, strong) NSString *monthlyIncome;
/**
 *  年收入
 */
@property (nonatomic, strong) NSString *annualIncome;
/**
 *  工资发放方式
 */
@property (nonatomic, assign) int paySalaryWay;
/**
 *  在现单位工作年限
 */
@property (nonatomic, strong) NSString *workingYear;
/**
 *  公司地址
 */
@property (nonatomic, strong) NSString *companyAddress;
/**
 *  公司电话
 */
@property (nonatomic, strong) NSString *companyPhone;
/**
 *  证明人姓名
 */
@property (nonatomic, strong) NSString *voucherName;
/**
 *  证明人电话
 */
@property (nonatomic, strong) NSString *voucherPhone;
/**
 *  公司网址
 */
@property (nonatomic, strong) NSString *companyWebsite;
/**
 *  工作邮箱
 */
@property (nonatomic, strong) NSString *workingEmail;

@end
