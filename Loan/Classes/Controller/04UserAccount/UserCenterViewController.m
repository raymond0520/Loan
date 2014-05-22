//
//  UserCenterViewController.m
//  Loan
//
//  Created by hdk-mac on 13-12-31.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import "UserCenterViewController.h"
#import "CenterViewController.h"
#import "BaseData.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

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
    [self InitUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)InitUI
{
    [super InitUI];
    
    self.leftButton.hidden = NO;
    
    self.controllerTitle = @"个人中心";
    
    UIScrollView *scrView = [[UIScrollView alloc] init];
    scrView.backgroundColor = RGBCOLOR(228, 228, 228);
    scrView.frame = CGRectMake(0, NAVIGATION_HEADER, 320, self.view.frame.size.height - NAVIGATION_HEADER);
    scrView.contentSize = CGSizeMake(CGRectGetWidth(scrView.frame), CGRectGetHeight(scrView.frame));
    scrView.delegate = self;
    scrView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrView];
    
    BaseData *data = [BaseData GetInstance];
    
    UIView *viewUserInfo = [[UIView alloc] initWithFrame:CGRectMake(7, 7, 306, 219)];
    viewUserInfo.backgroundColor = [UIColor clearColor];
    [scrView addSubview:viewUserInfo];
    
    UIImageView *imgviewUserInfo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_top_usercenter.png"]];
    imgviewUserInfo.frame = CGRectMake(0, 0, CGRectGetWidth(viewUserInfo.frame), CGRectGetHeight(viewUserInfo.frame));
    [viewUserInfo addSubview:imgviewUserInfo];
    
    NSString *strFont = @"字高度";
    CGSize fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:15]];
    
    //用户名
    UILabel *lblUserName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, fontSize.height)];
    lblUserName.backgroundColor = [UIColor clearColor];
    lblUserName.textAlignment = NSTextAlignmentLeft;
    lblUserName.textColor = RGBCOLOR(235, 51, 51);
    lblUserName.font = [UIFont systemFontOfSize:15];
    lblUserName.text = data.userInfo.userName;
    [viewUserInfo addSubview:lblUserName];
    
    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:12]];
    
    //信用等级
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                              lblUserName.frame.origin.y + lblUserName.frame.size.height + 10,
                                                              100, fontSize.height)];
    lbl1.backgroundColor = [UIColor clearColor];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.textColor = RGBCOLOR(116, 116, 116);
    lbl1.font = [UIFont systemFontOfSize:12];
    lbl1.text = @"信用等级:";
    [viewUserInfo addSubview:lbl1];
    
    //总积分
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(180,
                                                              lblUserName.frame.origin.y + lblUserName.frame.size.height + 10,
                                                              45, fontSize.height)];
    lbl2.backgroundColor = [UIColor clearColor];
    lbl2.textAlignment = NSTextAlignmentLeft;
    lbl2.textColor = RGBCOLOR(116, 116, 116);
    lbl2.font = [UIFont systemFontOfSize:12];
    lbl2.text = @"总积分:";
    [viewUserInfo addSubview:lbl2];
    
    UILabel *lblPoints = [[UILabel alloc] initWithFrame:CGRectMake(lbl2.frame.origin.x + lbl2.frame.size.width,
                                                                   lblUserName.frame.origin.y + lblUserName.frame.size.height + 10, 60, fontSize.height)];
    lblPoints.backgroundColor = [UIColor clearColor];
    lblPoints.textAlignment = NSTextAlignmentLeft;
    lblPoints.textColor = RGBCOLOR(235, 51, 51);
    lblPoints.font = [UIFont systemFontOfSize:12];
    lblPoints.text = [NSString stringWithFormat:@"%d分", data.userInfo.availablePoints];
    [viewUserInfo addSubview:lblPoints];
    
    //安全认证情况
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                              lblPoints.frame.origin.y + lblPoints.frame.size.height + 10,
                                                              80, fontSize.height)];
    lbl3.backgroundColor = [UIColor clearColor];
    lbl3.textAlignment = NSTextAlignmentLeft;
    lbl3.textColor = RGBCOLOR(116, 116, 116);
    lbl3.font = [UIFont systemFontOfSize:12];
    lbl3.text = @"安全认证情况:";
    [viewUserInfo addSubview:lbl3];
    
    //会员身份
    UILabel *lbl4 = [[UILabel alloc ] initWithFrame:CGRectMake(10,
                                                               lbl3.frame.origin.y + lbl3.frame.size.height + 10,
                                                               57, fontSize.height)];
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.textAlignment = NSTextAlignmentLeft;
    lbl4.textColor = RGBCOLOR(116, 116, 116);
    lbl4.font = [UIFont systemFontOfSize:12];
    lbl4.text = @"会员身份:";
    [viewUserInfo addSubview:lbl4];
    
    UILabel *lblVIPStatus = [[UILabel alloc] initWithFrame:CGRectMake(lbl4.frame.origin.x + lbl4.frame.size.width,
                                                                      lbl3.frame.origin.y + lbl3.frame.size.height + 10,
                                                                      100, fontSize.height)];
    lblVIPStatus.backgroundColor = [UIColor clearColor];
    lblVIPStatus.textAlignment = NSTextAlignmentLeft;
    lblVIPStatus.textColor = RGBCOLOR(116, 116, 116);
    lblVIPStatus.font = [UIFont systemFontOfSize:12];
    lblVIPStatus.text = data.userInfo.vipState;
    [viewUserInfo addSubview:lblVIPStatus];
    
    //系统消息
    UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                              lbl4.frame.origin.y + lbl4.frame.size.height + 10,
                                                              57, fontSize.height)];
    lbl5.backgroundColor = [UIColor clearColor];
    lbl5.textAlignment = NSTextAlignmentLeft;
    lbl5.textColor = RGBCOLOR(116, 116, 116);
    lbl5.font = [UIFont systemFontOfSize:12];
    lbl5.text = @"系统消息:";
    [viewUserInfo addSubview:lbl5];
    
    UILabel *lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(lbl5.frame.origin.x + lbl5.frame.size.width,
                                                                    lbl4.frame.origin.y + lbl4.frame.size.height + 10,
                                                                    100, fontSize.height)];
    lblMessage.backgroundColor = [UIColor clearColor];
    lblMessage.textAlignment = NSTextAlignmentLeft;
    lblMessage.textColor = RGBCOLOR(116, 116, 116);
    lblMessage.font = [UIFont systemFontOfSize:12];
    lblMessage.text = [NSString stringWithFormat:@"%d 封未读信件", data.userInfo.toReadEmailNums];
    [viewUserInfo addSubview:lblMessage];
    
    //好友关注
    UILabel *lblAttention = [[UILabel alloc] initWithFrame:CGRectMake(180,
                                                                      lbl4.frame.origin.y + lbl4.frame.size.height + 10,
                                                                      180, fontSize.height)];
    lblAttention.backgroundColor = [UIColor clearColor];
    lblAttention.textAlignment = NSTextAlignmentLeft;
    lblAttention.textColor = RGBCOLOR(116, 116, 116);
    lblAttention.font = [UIFont systemFontOfSize:12];
    lblAttention.text = [NSString stringWithFormat:@"%d 个好友关注", data.userInfo.attentionNums];
    [viewUserInfo addSubview:lblAttention];

    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:15]];
    
    //可用信用额度
    UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                              viewUserInfo.frame.size.height - 63 - fontSize.height/2,
                                                              99, fontSize.height)];
    lbl6.backgroundColor = [UIColor clearColor];
    lbl6.textAlignment = NSTextAlignmentLeft;
    lbl6.textColor = RGBCOLOR(116, 116, 116);
    lbl6.font = [UIFont systemFontOfSize:15];
    lbl6.text = @"可用信用额度:";
    [viewUserInfo addSubview:lbl6];
    
    UILabel *lblAvailableCreditLine = [[UILabel alloc] initWithFrame:CGRectMake(lbl6.frame.origin.x + lbl6.frame.size.width,
                                                                                viewUserInfo.frame.size.height - 63 - fontSize.height/2,
                                                                                100, fontSize.height)];
    lblAvailableCreditLine.backgroundColor = [UIColor clearColor];
    lblAvailableCreditLine.textAlignment = NSTextAlignmentLeft;
    lblAvailableCreditLine.textColor = RGBCOLOR(51, 51, 51);
    lblAvailableCreditLine.font = [UIFont systemFontOfSize:15];
    lblAvailableCreditLine.text = [NSString stringWithFormat:@"¥%0.2f", data.userInfo.availableCreditLine];
    [viewUserInfo addSubview:lblAvailableCreditLine];
    
    //分割线
    UIImageView *imgviewSeparator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_usercenter.png"]];
    imgviewSeparator.frame = CGRectMake(0, viewUserInfo.frame.size.height - 42, viewUserInfo.frame.size.width, 1);
    [viewUserInfo addSubview:imgviewSeparator];
    
    //借款信用额度
    UILabel *lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                              viewUserInfo.frame.size.height - 21 - fontSize.height/2,
                                                              100, fontSize.height)];
    lbl7.backgroundColor = [UIColor clearColor];
    lbl7.textAlignment = NSTextAlignmentLeft;
    lbl7.textColor = RGBCOLOR(102, 102, 102);
    lbl7.font = [UIFont systemFontOfSize:15];
    lbl7.text = @"借款信用额度:";
    [viewUserInfo addSubview:lbl7];
    
    UILabel *lblBorrowCreditLine = [[UILabel alloc] initWithFrame:CGRectMake(lbl7.frame.size.width + lbl7.frame.origin.x,
                                                                             viewUserInfo.frame.size.height - 21 - fontSize.height/2,
                                                                             100, fontSize.height)];
    lblBorrowCreditLine.backgroundColor = [UIColor clearColor];
    lblBorrowCreditLine.textAlignment = NSTextAlignmentLeft;
    lblBorrowCreditLine.textColor = RGBCOLOR(51, 51, 51);
    lblBorrowCreditLine.font = [UIFont systemFontOfSize:15];
    lblBorrowCreditLine.text = [NSString stringWithFormat:@"¥%.2f", data.userInfo.borrowCreditLine];
    [viewUserInfo addSubview:lblBorrowCreditLine];
    
    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:15]];
    
    //账户统计
    UIView *viewAccountStatistic = [[UIView alloc] initWithFrame:CGRectMake(7,
                                                                            CGRectGetMaxY(viewUserInfo.frame) + 7, 306, 156)];
    viewAccountStatistic.backgroundColor = [UIColor clearColor];
    [scrView addSubview:viewAccountStatistic];
    
    UIImageView *imgviewAccountStatistic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_bottom_usercenter.png"]];
    imgviewAccountStatistic.frame = CGRectMake(0, 0, 306, 156);
    [viewAccountStatistic addSubview:imgviewAccountStatistic];
    
    UILabel *lblAccountStatistic = [[UILabel alloc] initWithFrame:CGRectMake(10, 21 - fontSize.height/2, 80, fontSize.height)];
    lblAccountStatistic.backgroundColor = [UIColor clearColor];
    lblAccountStatistic.textAlignment = NSTextAlignmentLeft;
    lblAccountStatistic.textColor = RGBCOLOR(51, 51, 51);
    lblAccountStatistic.font = [UIFont systemFontOfSize:15];
    lblAccountStatistic.text = @"账户统计";
    [viewAccountStatistic addSubview:lblAccountStatistic];
    
    //资金记录
    UIButton *btnFund = [UIButton buttonWithType:UIButtonTypeCustom];
    btnFund.frame = CGRectMake(viewAccountStatistic.frame.size.width - 70, 8, 57, 28);
    [btnFund setBackgroundImage:[UIImage imageNamed:@"bg_btn_account.png"] forState:UIControlStateNormal];
    [btnFund setTitle:@"资金记录" forState:UIControlStateNormal];
    btnFund.titleLabel.font = [UIFont systemFontOfSize:12];
    [btnFund setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnFund addTarget:self
                action:@selector(didBtnFundPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [viewAccountStatistic addSubview:btnFund];
    
    //账户总额
    UILabel *lbl8 = [[UILabel alloc] initWithFrame:CGRectMake(10, 61 - fontSize.height/2, 80, fontSize.height)];
    lbl8.backgroundColor = [UIColor clearColor];
    lbl8.textAlignment = NSTextAlignmentLeft;
    lbl8.textColor = RGBCOLOR(116, 116, 116);
    lbl8.font = [UIFont systemFontOfSize:15];
    lbl8.text = @"账户总额";
    [viewAccountStatistic addSubview:lbl8];
    
    UILabel *lblTotalAccount = [[UILabel alloc] initWithFrame:CGRectMake(viewAccountStatistic.frame.size.width - 120,
                                                                         61 - fontSize.height/2, 100, fontSize.height)];
    lblTotalAccount.backgroundColor = [UIColor clearColor];
    lblTotalAccount.textAlignment = NSTextAlignmentRight;
    lblTotalAccount.textColor = RGBCOLOR(51, 51, 51);
    lblTotalAccount.font = [UIFont systemFontOfSize:15];
    lblTotalAccount.text = [NSString stringWithFormat:@"%.2f", data.accountStatistic.totalAccountAmount];
    [viewAccountStatistic addSubview:lblTotalAccount];
    
    //分割线
    UIImageView *imgviewSeparator1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_usercenter.png"]];
    imgviewSeparator1.frame = CGRectMake(0, 80, viewAccountStatistic.frame.size.width, 1);
    [viewAccountStatistic addSubview:imgviewSeparator1];

    //可用余额
    UILabel *lbl9 = [[UILabel alloc] initWithFrame:CGRectMake(10, 99 - fontSize.height/2, 80, fontSize.height)];
    lbl9.backgroundColor = [UIColor clearColor];
    lbl9.textAlignment = NSTextAlignmentLeft;
    lbl9.textColor = RGBCOLOR(116, 116, 116);
    lbl9.font = [UIFont systemFontOfSize:15];
    lbl9.text = @"可用余额";
    [viewAccountStatistic addSubview:lbl9];
    
    UILabel *lblAvailableBalance = [[UILabel alloc] initWithFrame:CGRectMake(viewAccountStatistic.frame.size.width - 120,
                                                                             99 - fontSize.height/2, 100, fontSize.height)];
    lblAvailableBalance.backgroundColor = [UIColor clearColor];
    lblAvailableBalance.textAlignment = NSTextAlignmentRight;
    lblAvailableBalance.textColor = RGBCOLOR(51, 51, 51);
    lblAvailableBalance.font = [UIFont systemFontOfSize:15];
    lblAvailableBalance.text = [NSString stringWithFormat:@"%.2f", data.accountStatistic.availableBalance];
    [viewAccountStatistic addSubview:lblAvailableBalance];
    
    //分割线
    UIImageView *imgviewSeparator2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_usercenter.png"]];
    imgviewSeparator2.frame = CGRectMake(0, 118, viewAccountStatistic.frame.size.width, 1);
    [viewAccountStatistic addSubview:imgviewSeparator2];
    
    //冻结金额
    UILabel *lbl10 = [[UILabel alloc] initWithFrame:CGRectMake(10, 137 - fontSize.height/2, 80, fontSize.height)];
    lbl10.backgroundColor = [UIColor clearColor];
    lbl10.textAlignment = NSTextAlignmentLeft;
    lbl10.textColor = RGBCOLOR(116, 116, 116);
    lbl10.font = [UIFont systemFontOfSize:15];
    lbl10.text = @"冻结余额";
    [viewAccountStatistic addSubview:lbl10];
    
    UILabel *lblFrozenAmount = [[UILabel alloc] initWithFrame:CGRectMake(viewAccountStatistic.frame.size.width - 120,
                                                                         137 - fontSize.height/2, 100, fontSize.height)];
    lblFrozenAmount.backgroundColor = [UIColor clearColor];
    lblFrozenAmount.textAlignment = NSTextAlignmentRight;
    lblFrozenAmount.textColor = RGBCOLOR(51, 51, 51);
    lblFrozenAmount.font = [UIFont systemFontOfSize:15];
    lblFrozenAmount.text = [NSString stringWithFormat:@"%.2f", data.accountStatistic.frozenAmount];
    [viewAccountStatistic addSubview:lblFrozenAmount];
}

- (void)didBtnFundPressed:(id)sener
{
}

- (void)leftButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    CenterViewController *center = [[CenterViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:center];
    
    [self.mm_drawerController
     setCenterViewController:nav
     withCloseAnimation:NO
     completion:nil];
    
}

@end
