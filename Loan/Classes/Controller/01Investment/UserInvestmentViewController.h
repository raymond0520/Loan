//
//  UserInvestmentViewController.h
//  Loan
//
//  Created by hdk-mac on 14-1-7.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseListMethod.h"
#import "UISortView.h"

@interface UserInvestmentViewController : BaseListMethod<UISortViewdelegate>

/**
 *  我的投资的借款类型，1为待回收借款，2为已回收借款，3为逾期借款
 */
@property (nonatomic, assign) int borrowType;

@end
