//
//  AccountRechargeViewController.h
//  Loan
//
//  Created by hdk-mac on 14-1-9.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseListMethod.h"
#import "UIViewController+MMDrawerController.h"
#import "UISortView.h"

@interface AccountRechargeViewController : BaseListMethod<UISortViewdelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIView *viewSearch;
@property (nonatomic, strong) UIScrollView *scrView;
@property (nonatomic, strong) NSMutableArray *bankList;

@end
