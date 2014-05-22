//
//  InternalMessage.h
//  Loan
//
//  Created by hdk-mac on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//   站内信

#import "QQModel.h"

@interface InternalMessage : QQModel<NSCoding>

/**
 *  发件人
 */
@property (nonatomic, strong) NSString *sender;
/**
 *  主题
 */
@property (nonatomic, strong) NSString *subject;
/**
 *  发送时间
 */
@property (nonatomic, strong) NSString *sendTime;
/**
 *  内容
 */
@property (nonatomic, strong) NSString *content;
@end
