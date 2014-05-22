//
//  NewsReportItem.h
//  Loan
//
//  Created by hdk-mac on 14-1-13.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "QQModel.h"

@interface NewsReportItem : QQModel

/**
 *  标题
 */
@property (nonatomic, strong) NSString *title;
/**
 *  发布时间
 */
@property (nonatomic, strong) NSString *publishTime;
/**
 *  内容
 */
@property (nonatomic, strong) NSString *content;
/**
 *  相关图片
 */
@property (nonatomic, strong) NSString *image;

@end
