//
//  InvestmentStatisticViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-10.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "InvestmentStatisticViewController.h"
#import "CenterViewController.h"
#import "BaseData.h"

#define TAG_SCROLL_VIEW 0x10

@interface InvestmentStatisticViewController ()

@end

@implementation InvestmentStatisticViewController

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
    
    self.controllerTitle = @"投资统计";
    
    UIScrollView *scrView = [[UIScrollView alloc] init];
    scrView.tag = TAG_SCROLL_VIEW;
    scrView.backgroundColor = RGBCOLOR(228, 228, 228);
    scrView.frame = CGRectMake(0, NAVIGATION_HEADER, 320, CGRectGetHeight(self.view.frame) - NAVIGATION_HEADER);
    scrView.contentSize = CGSizeMake(CGRectGetWidth(scrView.frame), CGRectGetHeight(scrView.frame));
    scrView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrView];
    
    BaseData *data = [[BaseData alloc] init];
    
    UIImageView *imgviewTitle1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_title_gray_invest.png"]];
    imgviewTitle1.frame = CGRectMake(6, 18, 308, 29);
    [scrView addSubview:imgviewTitle1];
    
    NSString *strFont = @"字高度";
    CGSize fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];

    //收益统计
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(imgviewTitle1.frame)/2 - fontSize.height/2,
                                                              60, fontSize.height)];
    lbl1.backgroundColor = [UIColor clearColor];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.textColor = RGBCOLOR(51, 51, 51);
    lbl1.font = [UIFont systemFontOfSize:14];
    lbl1.text = @"收益统计";
    [imgviewTitle1 addSubview:lbl1];

    UIImageView *imgviewContent = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_content_white_invest.png"]];
    imgviewContent.frame = CGRectMake(6, CGRectGetMaxY(imgviewTitle1.frame), 308, 135);
    [scrView addSubview:imgviewContent];

    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:13]];
    
    //已赚利息
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 52, fontSize.height)];
    lbl2.backgroundColor = [UIColor clearColor];
    lbl2.textAlignment = NSTextAlignmentLeft;
    lbl2.textColor = RGBCOLOR(90, 90, 90);
    lbl2.font = [UIFont systemFontOfSize:13];
    lbl2.text = @"已赚利息";
    [imgviewContent addSubview:lbl2];
    
    UILabel *lblInterestEarned = [[UILabel alloc] initWithFrame:CGRectMake(85, CGRectGetMinY(lbl2.frame), 65, fontSize.height)];
    lblInterestEarned.backgroundColor = [UIColor clearColor];
    lblInterestEarned.textAlignment = NSTextAlignmentLeft;
    lblInterestEarned.textColor = RGBCOLOR(237, 32, 31);
    lblInterestEarned.font = [UIFont systemFontOfSize:13];
    lblInterestEarned.text = [NSString stringWithFormat:@"¥%.2f", data.incomeStatistic.interestsEarned];
    [imgviewContent addSubview:lblInterestEarned];
    
    //待赚利息
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(155, CGRectGetMinY(lbl2.frame), 52, fontSize.height)];
    lbl3.backgroundColor = [UIColor clearColor];
    lbl3.textAlignment = NSTextAlignmentLeft;
    lbl3.textColor = RGBCOLOR(90, 90, 90);
    lbl3.font = [UIFont systemFontOfSize:13];
    lbl3.text = @"待赚利息";
    [imgviewContent addSubview:lbl3];
    
    UILabel *lblInterestToBeEarned = [[UILabel alloc] initWithFrame:CGRectMake(230, CGRectGetMinY(lbl2.frame),
                                                                               65, fontSize.height)];
    lblInterestToBeEarned.backgroundColor = [UIColor clearColor];
    lblInterestToBeEarned.textAlignment = NSTextAlignmentLeft;
    lblInterestToBeEarned.textColor = RGBCOLOR(237, 32, 31);
    lblInterestToBeEarned.font = [UIFont systemFontOfSize:13];
    lblInterestToBeEarned.text = [NSString stringWithFormat:@"¥%.2f", data.incomeStatistic.interestsToBeEarned];
    [imgviewContent addSubview:lblInterestToBeEarned];

    //分割线
    UIImageView *imgviewDottedLine1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_dotted_invest.png"]];
    imgviewDottedLine1.frame = CGRectMake(12, CGRectGetMaxY(lbl2.frame) + 12, 284, 1);
    [imgviewContent addSubview:imgviewDottedLine1];
    
    //已赚利息的投资管理费
    UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imgviewDottedLine1.frame) + 12,
                                                              65, fontSize.height)];
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.textAlignment = NSTextAlignmentLeft;
    lbl4.textColor = RGBCOLOR(90, 90, 90);
    lbl4.font = [UIFont systemFontOfSize:13];
    lbl4.text = @"投资管理费";
    [imgviewContent addSubview:lbl4];
    
    UILabel *lblHasCostManageFee = [[UILabel alloc] initWithFrame:CGRectMake(85, CGRectGetMinY(lbl4.frame), 65, fontSize.height)];
    lblHasCostManageFee.backgroundColor = [UIColor clearColor];
    lblHasCostManageFee.textAlignment = NSTextAlignmentLeft;
    lblHasCostManageFee.textColor = RGBCOLOR(237, 32, 31);
    lblHasCostManageFee.font = [UIFont systemFontOfSize:13];
    lblHasCostManageFee.text = [NSString stringWithFormat:@"¥%.2f", data.incomeStatistic.hasCostInvestManageFee];
    [imgviewContent addSubview:lblHasCostManageFee];
    
    //待赚利息的投资管理费
    UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(155, CGRectGetMinY(lbl4.frame), 65, fontSize.height)];
    lbl5.backgroundColor = [UIColor clearColor];
    lbl5.textAlignment = NSTextAlignmentLeft;
    lbl5.textColor = RGBCOLOR(90, 90, 90);
    lbl5.font = [UIFont systemFontOfSize:13];
    lbl5.text = @"投资管理费";
    [imgviewContent addSubview:lbl5];
    
    UILabel *lblOnCostManageFee = [[UILabel alloc] initWithFrame:CGRectMake(230, CGRectGetMinY(lbl4.frame),
                                                                            65, fontSize.height)];
    lblOnCostManageFee.backgroundColor = [UIColor clearColor];
    lblOnCostManageFee.textAlignment = NSTextAlignmentLeft;
    lblOnCostManageFee.textColor = RGBCOLOR(237, 32, 31);
    lblOnCostManageFee.font = [UIFont systemFontOfSize:13];
    lblOnCostManageFee.text = [NSString stringWithFormat:@"¥%.2f", data.incomeStatistic.onCostOfInvestManageFee];
    [imgviewContent addSubview:lblOnCostManageFee];

    //分割线
    UIImageView *imgviewDottedLine2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_dotted_invest.png"]];
    imgviewDottedLine2.frame = CGRectMake(12, CGRectGetMaxY(lbl4.frame) + 12, 284, 1);
    [imgviewContent addSubview:imgviewDottedLine2];
    
    //实际收益
    UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imgviewDottedLine2.frame) + 12,
                                                              52, fontSize.height)];
    lbl6.backgroundColor = [UIColor clearColor];
    lbl6.textAlignment = NSTextAlignmentLeft;
    lbl6.textColor = RGBCOLOR(90, 90, 90);
    lbl6.font = [UIFont systemFontOfSize:13];
    lbl6.text = @"实际收益";
    [imgviewContent addSubview:lbl6];
    
    UILabel *lblRealYield = [[UILabel alloc] initWithFrame:CGRectMake(85, CGRectGetMinY(lbl6.frame), 65, fontSize.height)];
    lblRealYield.backgroundColor = [UIColor clearColor];
    lblRealYield.textAlignment = NSTextAlignmentLeft;
    lblRealYield.textColor = RGBCOLOR(237, 32, 31);
    lblRealYield.font = [UIFont systemFontOfSize:13];
    lblRealYield.text = [NSString stringWithFormat:@"¥%.2f", data.incomeStatistic.realYield];
    [imgviewContent addSubview:lblRealYield];
    
    //预计收益
    UILabel *lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(155, CGRectGetMinY(lbl6.frame), 52, fontSize.height)];
    lbl7.backgroundColor = [UIColor clearColor];
    lbl7.textAlignment = NSTextAlignmentLeft;
    lbl7.textColor = RGBCOLOR(90, 90, 90);
    lbl7.font = [UIFont systemFontOfSize:13];
    lbl7.text = @"预计收益";
    [imgviewContent addSubview:lbl7];
    
    UILabel *lblProjectedIncome = [[UILabel alloc] initWithFrame:CGRectMake(230, CGRectGetMinY(lbl6.frame),
                                                                            65, fontSize.height)];
    lblProjectedIncome.backgroundColor = [UIColor clearColor];
    lblProjectedIncome.textAlignment = NSTextAlignmentLeft;
    lblProjectedIncome.textColor = RGBCOLOR(237, 32, 31);
    lblProjectedIncome.font = [UIFont systemFontOfSize:13];
    lblProjectedIncome.text = [NSString stringWithFormat:@"¥%.2f", data.incomeStatistic.projectedIncome];
    [imgviewContent addSubview:lblProjectedIncome];
    
    UIImageView *imgviewTitle2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_title_gray_invest.png"]];
    imgviewTitle2.frame = CGRectMake(6, CGRectGetMaxY(imgviewContent.frame) + 20, 308, 29);
    [scrView addSubview:imgviewTitle2];
    
    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
    
    //投资统计
    UILabel *lbl8 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(imgviewTitle2.frame)/2 - fontSize.height/2,
                                                              60, fontSize.height)];
    lbl8.backgroundColor = [UIColor clearColor];
    lbl8.textAlignment = NSTextAlignmentLeft;
    lbl8.textColor = RGBCOLOR(51, 51, 51);
    lbl8.font = [UIFont systemFontOfSize:14];
    lbl8.text = @"投资统计";
    [imgviewTitle2 addSubview:lbl8];
    
    UIImageView *imgviewContent2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_content_white_invest.png"]];
    imgviewContent2.frame = CGRectMake(6, CGRectGetMaxY(imgviewTitle2.frame), 308, 135);
    [scrView addSubview:imgviewContent2];
    
    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:13]];
    
    //总投资金额
    UILabel *lbl9 = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 65, fontSize.height)];
    lbl9.backgroundColor = [UIColor clearColor];
    lbl9.textAlignment = NSTextAlignmentLeft;
    lbl9.textColor = RGBCOLOR(90, 90, 90);
    lbl9.font = [UIFont systemFontOfSize:13];
    lbl9.text = @"投资总金额";
    [imgviewContent2 addSubview:lbl9];
    
    UILabel *lblTotalAmount = [[UILabel alloc] initWithFrame:CGRectMake(85, CGRectGetMinY(lbl9.frame), 75, fontSize.height)];
    lblTotalAmount.backgroundColor = [UIColor clearColor];
    lblTotalAmount.textAlignment = NSTextAlignmentLeft;
    lblTotalAmount.textColor = RGBCOLOR(237, 32, 31);
    lblTotalAmount.font = [UIFont systemFontOfSize:13];
    lblTotalAmount.text = [NSString stringWithFormat:@"¥%.2f", data.investStatistic.totalAmountOnInvest];
    [imgviewContent2 addSubview:lblTotalAmount];
    
    //总投资笔数
    UILabel *lbl10 = [[UILabel alloc] initWithFrame:CGRectMake(165, CGRectGetMinY(lbl9.frame), 65, fontSize.height)];
    lbl10.backgroundColor = [UIColor clearColor];
    lbl10.textAlignment = NSTextAlignmentLeft;
    lbl10.textColor = RGBCOLOR(90, 90, 90);
    lbl10.font = [UIFont systemFontOfSize:13];
    lbl10.text = @"总投资笔数";
    [imgviewContent2 addSubview:lbl10];
    
    UILabel *lblTotalNums = [[UILabel alloc] initWithFrame:CGRectMake(245, CGRectGetMinY(lbl9.frame),
                                                                      65, fontSize.height)];
    lblTotalNums.backgroundColor = [UIColor clearColor];
    lblTotalNums.textAlignment = NSTextAlignmentLeft;
    lblTotalNums.textColor = RGBCOLOR(237, 32, 31);
    lblTotalNums.font = [UIFont systemFontOfSize:13];
    lblTotalNums.text = [NSString stringWithFormat:@"%d笔", data.investStatistic.totalNumsOnInvest];
    [imgviewContent2 addSubview:lblTotalNums];
    
    //分割线
    UIImageView *imgviewDottedLine3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_dotted_invest.png"]];
    imgviewDottedLine3.frame = CGRectMake(12, CGRectGetMaxY(lbl9.frame) + 12, 284, 1);
    [imgviewContent2 addSubview:imgviewDottedLine3];
    
    //已回收本息
    UILabel *lbl11 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imgviewDottedLine3.frame) + 12,
                                                               65, fontSize.height)];
    lbl11.backgroundColor = [UIColor clearColor];
    lbl11.textAlignment = NSTextAlignmentLeft;
    lbl11.textColor = RGBCOLOR(90, 90, 90);
    lbl11.font = [UIFont systemFontOfSize:13];
    lbl11.text = @"已回收本息";
    [imgviewContent2 addSubview:lbl11];
    
    UILabel *lblPrincipalInterests = [[UILabel alloc] initWithFrame:CGRectMake(85, CGRectGetMinY(lbl11.frame),
                                                                               75, fontSize.height)];
    lblPrincipalInterests.backgroundColor = [UIColor clearColor];
    lblPrincipalInterests.textAlignment = NSTextAlignmentLeft;
    lblPrincipalInterests.textColor = RGBCOLOR(237, 32, 31);
    lblPrincipalInterests.font = [UIFont systemFontOfSize:13];
    lblPrincipalInterests.text = [NSString stringWithFormat:@"¥%.2f", data.investStatistic.principalInterestsCollected];
    [imgviewContent2 addSubview:lblPrincipalInterests];
    
    //已回收笔数
    UILabel *lbl12 = [[UILabel alloc] initWithFrame:CGRectMake(165, CGRectGetMinY(lbl11.frame), 65, fontSize.height)];
    lbl12.backgroundColor = [UIColor clearColor];
    lbl12.textAlignment = NSTextAlignmentLeft;
    lbl12.textColor = RGBCOLOR(90, 90, 90);
    lbl12.font = [UIFont systemFontOfSize:13];
    lbl12.text = @"已回收笔数";
    [imgviewContent2 addSubview:lbl12];
    
    UILabel *lblNumsCollected = [[UILabel alloc] initWithFrame:CGRectMake(245, CGRectGetMinY(lbl11.frame),
                                                                            65, fontSize.height)];
    lblNumsCollected.backgroundColor = [UIColor clearColor];
    lblNumsCollected.textAlignment = NSTextAlignmentLeft;
    lblNumsCollected.textColor = RGBCOLOR(237, 32, 31);
    lblNumsCollected.font = [UIFont systemFontOfSize:13];
    lblNumsCollected.text = [NSString stringWithFormat:@"%d笔", data.investStatistic.numsCollected];
    [imgviewContent2 addSubview:lblNumsCollected];
    
    //分割线
    UIImageView *imgviewDottedLine4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_dotted_invest.png"]];
    imgviewDottedLine4.frame = CGRectMake(12, CGRectGetMaxY(lbl11.frame) + 12, 284, 1);
    [imgviewContent2 addSubview:imgviewDottedLine4];
    
    //待回收本息
    UILabel *lbl13 = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imgviewDottedLine4.frame) + 12,
                                                               65, fontSize.height)];
    lbl13.backgroundColor = [UIColor clearColor];
    lbl13.textAlignment = NSTextAlignmentLeft;
    lbl13.textColor = RGBCOLOR(90, 90, 90);
    lbl13.font = [UIFont systemFontOfSize:13];
    lbl13.text = @"待回收本息";
    [imgviewContent2 addSubview:lbl13];
    
    UILabel *lblPrincipalInterestsOnCollecting = [[UILabel alloc] initWithFrame:CGRectMake(85, CGRectGetMinY(lbl13.frame), 75, fontSize.height)];
    lblPrincipalInterestsOnCollecting.backgroundColor = [UIColor clearColor];
    lblPrincipalInterestsOnCollecting.textAlignment = NSTextAlignmentLeft;
    lblPrincipalInterestsOnCollecting.textColor = RGBCOLOR(237, 32, 31);
    lblPrincipalInterestsOnCollecting.font = [UIFont systemFontOfSize:13];
    lblPrincipalInterestsOnCollecting.text = [NSString stringWithFormat:@"¥%.2f", data.investStatistic.principalInterestsOnCollecting];
    [imgviewContent2 addSubview:lblPrincipalInterestsOnCollecting];
    
    //待回收笔数
    UILabel *lbl14 = [[UILabel alloc] initWithFrame:CGRectMake(165, CGRectGetMinY(lbl13.frame), 65, fontSize.height)];
    lbl14.backgroundColor = [UIColor clearColor];
    lbl14.textAlignment = NSTextAlignmentLeft;
    lbl14.textColor = RGBCOLOR(90, 90, 90);
    lbl14.font = [UIFont systemFontOfSize:13];
    lbl14.text = @"待回收笔数";
    [imgviewContent2 addSubview:lbl14];
    
    UILabel *lblNumsOnCollecting = [[UILabel alloc] initWithFrame:CGRectMake(245, CGRectGetMinY(lbl13.frame),
                                                                            65, fontSize.height)];
    lblNumsOnCollecting.backgroundColor = [UIColor clearColor];
    lblNumsOnCollecting.textAlignment = NSTextAlignmentLeft;
    lblNumsOnCollecting.textColor = RGBCOLOR(237, 32, 31);
    lblNumsOnCollecting.font = [UIFont systemFontOfSize:13];
    lblNumsOnCollecting.text = [NSString stringWithFormat:@"%d笔", data.investStatistic.numsOnCollecting];
    [imgviewContent2 addSubview:lblNumsOnCollecting];

}

#pragma mark -
#pragma mark leftbutton press
- (void)leftButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    CenterViewController *center = [[CenterViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:center];
    [self.mm_drawerController setCenterViewController:nav
                                   withCloseAnimation:NO
                                           completion:nil];
}
@end
