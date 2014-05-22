//
//  CenterViewController.h
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 hdk. All rights reserved.
//

#import "BaseViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface CenterViewController : BaseViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>{
    UIImageView *_tinyCircleImageView;
    UIView *_choosePicStyleView;
    
    UITableView *_entertainmentList;
    UIButton *_loginBtn;
    UILabel *_instructionLab;
    
    UILabel *_availableAmoutTitle;
    UILabel *_availableAmoutLab;
    UILabel *_remainOweTitle;
    UILabel *_remainOweDollars;
    UILabel *_remainOweRenminbi;
    
    NSMutableArray *_announceList; //公告内容列表
}

@property (nonatomic, strong) UIImageView *tinyCircleImageView;
@property (nonatomic, strong) UIView *choosePicStyleView;
@property (nonatomic, strong) UITableView *entertainmentList;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UILabel *instructionLab;

@property (nonatomic, strong) UILabel *availableAmoutTitle;
@property (nonatomic, strong) UILabel *availableAmoutLab;
@property (nonatomic, strong) UILabel *remainOweTitle;
@property (nonatomic, strong) UILabel *remainOweDollars;
@property (nonatomic, strong) UILabel *remainOweRenminbi;

@property (nonatomic, strong) NSMutableArray *announceList;
@end
