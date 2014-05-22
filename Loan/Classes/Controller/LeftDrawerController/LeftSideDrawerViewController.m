//
//  LeftSideDrawerViewController.m
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 hdk. All rights reserved.
//

#import "LeftSideDrawerViewController.h"
#import "CenterViewController.h"
#import "LeftDrawerCell.h"
#import "BaseData.h"
#import "UserCenterViewController.h"
#import "UserInvestmentViewController.h"
#import "InvestmentViewController.h"
#import "RepayBorrowViewController.h"
#import "AccountRechargeViewController.h"
#import "AccountWithdrawalViewController.h"
#import "PromotePlatformViewController.h"
#import "InvestmentStatisticViewController.h"
#import "LoginViewController.h"
#import "NewsViewController.h"
#import "CommunityViewController.h"

@interface LeftSideDrawerViewController ()

@end

@implementation LeftSideDrawerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)InitUI
{
    [super InitUI];
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.beginHeight = 63;
    
    //判断statusbar的高度
    CGFloat statusBarHeight = OSVersionIsAtLeastiOS7() ? 20 : 0;
    
    UIView *topview = [[UIView alloc] initWithFrame:CGRectMake(0, statusBarHeight, 280, 43)];
    [self.view addSubview:topview];
    
    UIImageView *imgBGTopView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_title@2x.png"]];
    imgBGTopView.frame = CGRectMake(0, 0, 280, CGRectGetHeight(topview.frame) - 2);
    [topview addSubview:imgBGTopView];
    
    UIImageView *icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon@2x.png"]];
    icon.frame = CGRectMake(12, CGRectGetHeight(topview.frame)/2 - 15, 30, 30);
    [topview addSubview:icon];
    
//    UIImageView *imgVerticalSeparator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_black_vertical.png"]];
//    imgVerticalSeparator.frame = CGRectMake(235, 0, 1, CGRectGetHeight(topview.frame) - 2);
//    [topview addSubview:imgVerticalSeparator];
//    
//    UIButton *btnSetting = [UIButton buttonWithType:UIButtonTypeCustom];
//    btnSetting.frame = CGRectMake(245, CGRectGetHeight(topview.frame)/2 - 12, 24, 24);
//    [btnSetting setImage:[UIImage imageNamed:@"ico_settings.png"]
//                forState:UIControlStateNormal];
//    [topview addSubview:btnSetting];
    
    UIImageView *imgSeparator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_black_cell_separator.png"]];
    imgSeparator.frame = CGRectMake(0, CGRectGetHeight(topview.frame) - 1, 280, 2);
    [topview addSubview:imgSeparator];
}

- (void)initDatalist
{
    self.sectionlist = [NSMutableArray arrayWithObjects:@"我的账户", @"投资管理", @"借款管理", @"资金管理", @"资讯", @"会员社区", @"推广管理", nil];
    
    self.rowlist = [NSMutableArray arrayWithObjects:[NSArray arrayWithObjects:@"个人中心", nil],
                                                    [NSArray arrayWithObjects:@"我要投资", @"我的投资", @"投资统计", nil],
                                                    [NSArray arrayWithObjects:@"偿还借款", nil],
                                                    [NSArray arrayWithObjects:@"账户充值", @"账户提现", nil],
                                                    [NSArray arrayWithObjects:@"资讯", nil],
                                                    [NSArray arrayWithObjects:@"社区", nil],
                                                    [NSArray arrayWithObjects:@"推广有礼", nil],
                                                     nil];
    
    self.cellName = @"cell_leftside";
}

- (CGFloat)heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)heightForRow:(NSIndexPath *)indexPath
{
    return 45;
}

- (UIView *)createViewForHeaderSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    
    UIImageView *imgBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_section_header@2x.png"]];
    imgBg.frame = CGRectMake(0, 0, 280, 28);
    [view addSubview:imgBg];
    
    UIImageView *icoSection = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_zd.png"]];
    icoSection.frame = CGRectMake(10, 4, 16, 20);
    [view addSubview:icoSection];
    
    CGSize size = [[self.sectionlist objectAtIndex:section] sizeWithFont:[UIFont systemFontOfSize:14]
                                                       constrainedToSize:CGSizeMake(150, 30)
                                                           lineBreakMode:NSLineBreakByTruncatingTail];
    UILabel *lblHeadTitle = [[UILabel alloc] init];
    lblHeadTitle.backgroundColor = [UIColor clearColor];
    lblHeadTitle.frame = CGRectMake(38, 15 - size.height/2, 150, size.height);
    lblHeadTitle.font = [UIFont systemFontOfSize:14];
    lblHeadTitle.textColor = RGBACOLOR(128, 128, 128, 1);
    lblHeadTitle.textAlignment = NSTextAlignmentLeft;
    lblHeadTitle.text = [self.sectionlist objectAtIndex:section];
    [view addSubview:lblHeadTitle];
    
    UIImageView *imgSeparator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_black_cell_separator.png"]];
    imgSeparator.frame = CGRectMake(0, 28, 280, 2);
    [view addSubview:imgSeparator];
    
    return view;
}

- (UITableViewCell *)createCell:(id)object
{
    LeftDrawerCell *cell = [[LeftDrawerCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                 reuseIdentifier:self.cellName];
    cell.celltext = object;
    
    return cell;
}

- (void)didSelectIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    
    BaseData *data = [BaseData GetInstance];

    LoginViewController *loginView = [[LoginViewController alloc] init];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        //个人中心
        if (data.userInfo.isLogin) {
            UserCenterViewController *userCenter = [[UserCenterViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:userCenter];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
        else{
            UINavigationController *navLgoin = [[UINavigationController alloc] initWithRootViewController:loginView];
            
            [self.mm_drawerController presentViewController:navLgoin animated:YES completion:nil];
        }
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
        //我要投资
        InvestmentViewController *invest = [[InvestmentViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:invest];
        
        [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
    }
    else if (indexPath.section == 1 && indexPath.row == 1) {
        //我的投资
        if (data.userInfo.isLogin) {
            UserInvestmentViewController *userInvest = [[UserInvestmentViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:userInvest];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
        else{
            UINavigationController *navLgoin = [[UINavigationController alloc] initWithRootViewController:loginView];
            
            [self.mm_drawerController presentViewController:navLgoin animated:YES completion:nil];
        }
    }
    else if (indexPath.section == 1 && indexPath.row == 2) {
        //投资统计
        if (data.userInfo.isLogin) {
            InvestmentStatisticViewController *investStatistic = [[InvestmentStatisticViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:investStatistic];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
        else{
            UINavigationController *navLgoin = [[UINavigationController alloc] initWithRootViewController:loginView];
            
            [self.mm_drawerController presentViewController:navLgoin animated:YES completion:nil];
        }
    }
    else if (indexPath.section == 2 && indexPath.row == 0){
        //偿还借款
        if (data.userInfo.isLogin) {
            RepayBorrowViewController *repayBorrow = [[RepayBorrowViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:repayBorrow];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
        else{
            UINavigationController *navLgoin = [[UINavigationController alloc] initWithRootViewController:loginView];
            
            [self.mm_drawerController presentViewController:navLgoin animated:YES completion:nil];
        }
    }
    else if (indexPath.section == 3 && indexPath.row == 0){
        //账户充值
        if (data.userInfo.isLogin) {
            AccountRechargeViewController *recharge = [[AccountRechargeViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:recharge];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
        else{
            UINavigationController *navLgoin = [[UINavigationController alloc] initWithRootViewController:loginView];
            
            [self.mm_drawerController presentViewController:navLgoin animated:YES completion:nil];
        }
    }
    else if (indexPath.section == 3 && indexPath.row == 1){
        //账户提现
        if (data.userInfo.isLogin) {
            AccountWithdrawalViewController *withdraw = [[AccountWithdrawalViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:withdraw];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
        else{
            UINavigationController *navLgoin = [[UINavigationController alloc] initWithRootViewController:loginView];
            
            [self.mm_drawerController presentViewController:navLgoin animated:YES completion:nil];
        }
    }
    else if (indexPath.section == 4 && indexPath.row == 0){
        //资讯
        NewsViewController *news = [[NewsViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:news];
        
        [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
    }
    else if (indexPath.section == 5 && indexPath.row == 0){
        //会员社区
        CommunityViewController *community = [[CommunityViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:community];
        
        [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
    }
    else if (indexPath.section == 6 && indexPath.row == 0){
        //推广有礼
        if (data.userInfo.isLogin) {
            PromotePlatformViewController *promote = [[PromotePlatformViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:promote];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
        else{
            UINavigationController *navLgoin = [[UINavigationController alloc] initWithRootViewController:loginView];
            
            [self.mm_drawerController presentViewController:navLgoin animated:YES completion:nil];
        }
    }
}
@end
