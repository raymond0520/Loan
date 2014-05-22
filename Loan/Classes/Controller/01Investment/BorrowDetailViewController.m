//
//  BorrowDetailViewController.m
//  Loan
//
//  Created by conquer on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BorrowDetailViewController.h"
#import "KDGoalBar.h"

#define TAG_SCROLL_VIEW             0x10

@interface BorrowDetailViewController ()

@end

@implementation BorrowDetailViewController

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
    
    self.controllerTitle = @"借款详情";
    self.leftButton.hidden = NO;
    
    UIScrollView *scrView = [[UIScrollView alloc] init];
    scrView.tag = TAG_SCROLL_VIEW;
    scrView.backgroundColor = RGBCOLOR(228, 228, 228);
    scrView.frame = CGRectMake(0, NAVIGATION_HEADER, 320, CGRectGetHeight(self.view.frame) - NAVIGATION_HEADER);
    scrView.contentSize = CGSizeMake(CGRectGetWidth(scrView.frame), 460);
    scrView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrView];
    
    UIImage *image = [UIImage imageNamed:@"bg_jag.png"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    UIImageView *imgviewSummary = [[UIImageView alloc] initWithImage:image];
    imgviewSummary.frame = CGRectMake(0, 0, CGRectGetWidth(scrView.frame), 115);
    [scrView addSubview:imgviewSummary];
    
    CGSize lblSize;
    
    //summary
    {
        lblSize = [self.investItem.purpose sizeWithFont:[UIFont systemFontOfSize:14]
                                      constrainedToSize:CGSizeMake(300, 30)
                                          lineBreakMode:NSLineBreakByTruncatingTail];
        //用户名
        UILabel *lblPurpose = [[UILabel alloc] initWithFrame:CGRectMake(14, 14 - lblSize.height/2, lblSize.width, lblSize.height)];
        lblPurpose.backgroundColor = [UIColor clearColor];
        lblPurpose.textAlignment = NSTextAlignmentLeft;
        lblPurpose.textColor = RGBCOLOR(51, 51, 51);
        lblPurpose.font = [UIFont systemFontOfSize:14];
        lblPurpose.text = self.investItem.purpose;
        [imgviewSummary addSubview:lblPurpose];
                
        lblSize = [[NSString stringWithFormat:@"编号:%@", self.investItem.ID] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                       constrainedToSize:CGSizeMake(300, 30)
                                                                           lineBreakMode:NSLineBreakByTruncatingTail];
        //编号
        UILabel *lblNO = [[UILabel alloc] initWithFrame:CGRectMake(320 - 8 - lblSize.width, 14 - lblSize.height/2, lblSize.width, lblSize.height)];
        lblNO.backgroundColor = [UIColor clearColor];
        lblNO.textAlignment = NSTextAlignmentLeft;
        lblNO.textColor = RGBCOLOR(108, 108, 108);
        lblNO.font = [UIFont systemFontOfSize:13];
        lblNO.text = [NSString stringWithFormat:@"编号:%@", self.investItem.ID];
        [imgviewSummary addSubview:lblNO];
        
        UIImageView *imgviewSeparatorLine1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_cell.png"]];
        imgviewSeparatorLine1.frame = CGRectMake(0, 28, 320, 1);
        [imgviewSummary addSubview:imgviewSeparatorLine1];
        
        //方案进度
        KDGoalBar *gbSchedule = [[KDGoalBar alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(imgviewSeparatorLine1.frame) + 5, 50, 50)];
        [gbSchedule setPercent:self.investItem.progress Percent1:0 animated:NO];
        [imgviewSummary addSubview:gbSchedule];
        
        UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(23, 86, 24, 15)];
        lbl1.backgroundColor = [UIColor clearColor];
        lbl1.textAlignment = NSTextAlignmentLeft;
        lbl1.textColor = RGBCOLOR(51, 51, 51);
        lbl1.font = [UIFont systemFontOfSize:12];
        lbl1.text = @"进度";
        [imgviewSummary addSubview:lbl1];
        
        //借款金额
        UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(65, 39, 56, 16)];
        lbl2.backgroundColor = [UIColor clearColor];
        lbl2.textAlignment = NSTextAlignmentLeft;
        lbl2.textColor = RGBCOLOR(108, 108, 108);
        lbl2.font = [UIFont systemFontOfSize:13];
        lbl2.text = @"借款金额:";
        [imgviewSummary addSubview:lbl2];
        
        lblSize = [[NSString stringWithFormat:@"¥%.2f", self.investItem.borrowingAmount] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                    constrainedToSize:CGSizeMake(300, 30)
                                                                                        lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblBorrowSum = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl2.frame) + 2, CGRectGetMinY(lbl2.frame),
                                                                          lblSize.width, lblSize.height)];
        lblBorrowSum.backgroundColor = [UIColor clearColor];
        lblBorrowSum.textAlignment = NSTextAlignmentLeft;
        lblBorrowSum.textColor = RGBCOLOR(215, 4, 2);
        lblBorrowSum.font = [UIFont systemFontOfSize:13];
        lblBorrowSum.text = [NSString stringWithFormat:@"¥%.2f", self.investItem.borrowingAmount];
        [imgviewSummary addSubview:lblBorrowSum];
        
        //起投金额
        UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(220, 39, 56, 16)];
        lbl3.backgroundColor = [UIColor clearColor];
        lbl3.textAlignment = NSTextAlignmentLeft;
        lbl3.textColor = RGBCOLOR(108, 108, 108);
        lbl3.font = [UIFont systemFontOfSize:13];
        lbl3.text = @"起投金额:";
        [imgviewSummary addSubview:lbl3];
        
        lblSize = [[NSString stringWithFormat:@"¥%.0f", self.investItem.lowInvestmentAmount] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                        constrainedToSize:CGSizeMake(300, 30)
                                                                                            lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblLowInvestmentAmount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl3.frame) + 2,
                                                                                    CGRectGetMinY(lbl3.frame),
                                                                                    lblSize.width, lblSize.height)];
        lblLowInvestmentAmount.backgroundColor = [UIColor clearColor];
        lblLowInvestmentAmount.textAlignment = NSTextAlignmentLeft;
        lblLowInvestmentAmount.textColor = RGBCOLOR(215, 4, 2);
        lblLowInvestmentAmount.font = [UIFont systemFontOfSize:13];
        lblLowInvestmentAmount.text = [NSString stringWithFormat:@"¥%.0f", self.investItem.lowInvestmentAmount];
        [imgviewSummary addSubview:lblLowInvestmentAmount];
        
        //年化利率
        UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(65, 63, 56, 16)];
        lbl4.backgroundColor = [UIColor clearColor];
        lbl4.textAlignment = NSTextAlignmentLeft;
        lbl4.textColor = RGBCOLOR(108, 108, 108);
        lbl4.font = [UIFont systemFontOfSize:13];
        lbl4.text = @"年化利率:";
        [imgviewSummary addSubview:lbl4];
        
        lblSize = [[NSString stringWithFormat:@"%.0f%%", self.investItem.annualInterestRate] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                       constrainedToSize:CGSizeMake(300, 30)
                                                                                           lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblAnnualRate = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl4.frame) + 2, CGRectGetMinY(lbl4.frame),
                                                                           lblSize.width, lblSize.height)];
        lblAnnualRate.backgroundColor = [UIColor clearColor];
        lblAnnualRate.textAlignment = NSTextAlignmentLeft;
        lblAnnualRate.textColor = RGBCOLOR(215, 4, 2);
        lblAnnualRate.font = [UIFont systemFontOfSize:13];
        lblAnnualRate.text = [NSString stringWithFormat:@"%.0f%%", self.investItem.annualInterestRate];
        [imgviewSummary addSubview:lblAnnualRate];
        
        //期限
        UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(220, 63, 30, 16)];
        lbl5.backgroundColor = [UIColor clearColor];
        lbl5.textAlignment = NSTextAlignmentLeft;
        lbl5.textColor = RGBCOLOR(108, 108, 108);
        lbl5.font = [UIFont systemFontOfSize:13];
        lbl5.text = @"期限:";
        [imgviewSummary addSubview:lbl5];
    
        lblSize = [[NSString stringWithFormat:@"%d个月", self.investItem.deadline] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                             constrainedToSize:CGSizeMake(300, 30)
                                                                                 lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblDeadline = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl5.frame) + 2, CGRectGetMinY(lbl5.frame),
                                                                         lblSize.width, lblSize.height)];
        lblDeadline.backgroundColor = [UIColor clearColor];
        lblDeadline.textAlignment = NSTextAlignmentLeft;
        lblDeadline.textColor = RGBCOLOR(215, 4, 2);
        lblDeadline.font = [UIFont systemFontOfSize:13];
        lblDeadline.text = [NSString stringWithFormat:@"%d个月", self.investItem.deadline];
        [imgviewSummary addSubview:lblDeadline];
        
        //还款方式
        UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(65, 87, 56, 16)];
        lbl6.backgroundColor = [UIColor clearColor];
        lbl6.textAlignment = NSTextAlignmentLeft;
        lbl6.textColor = RGBCOLOR(108, 108, 108);
        lbl6.font = [UIFont systemFontOfSize:13];
        lbl6.text = @"还款方式:";
        [imgviewSummary addSubview:lbl6];
        
        lblSize = [self.investItem.detail.repayMode sizeWithFont:[UIFont systemFontOfSize:13]
                                               constrainedToSize:CGSizeMake(300, 30)
                                                   lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblRepayMode = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl6.frame) + 2, CGRectGetMinY(lbl6.frame),
                                                                          lblSize.width, lblSize.height)];
        lblRepayMode.backgroundColor = [UIColor clearColor];
        lblRepayMode.textAlignment = NSTextAlignmentLeft;
        lblRepayMode.textColor = RGBCOLOR(51, 51, 51);
        lblRepayMode.font = [UIFont systemFontOfSize:13];
        lblRepayMode.text = self.investItem.detail.repayMode;
        [imgviewSummary addSubview:lblRepayMode];
    }
    
    UIView *viewDetail = [[UIView alloc] initWithFrame:CGRectMake(0, 115, 320, 105)];
    viewDetail.backgroundColor = [UIColor clearColor];
    [scrView addSubview:viewDetail];
    
    //detail
    {
        //担保机构
        UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(7, 10, 52, 16)];
        lbl1.backgroundColor = [UIColor clearColor];
        lbl1.textAlignment = NSTextAlignmentLeft;
        lbl1.textColor = RGBCOLOR(108, 108, 108);
        lbl1.font = [UIFont systemFontOfSize:13];
        lbl1.text = @"担保机构";
        [viewDetail addSubview:lbl1];
        
        lblSize = [self.investItem.detail.guaranteeAgency sizeWithFont:[UIFont systemFontOfSize:13]
                                                     constrainedToSize:CGSizeMake(300, 30)
                                                         lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblGuaranteeAgency = [[UILabel alloc] initWithFrame:CGRectMake(95, 10, lblSize.width, lblSize.height)];
        lblGuaranteeAgency.backgroundColor = [UIColor clearColor];
        lblGuaranteeAgency.textAlignment = NSTextAlignmentLeft;
        lblGuaranteeAgency.textColor = RGBCOLOR(51, 51, 51);
        lblGuaranteeAgency.font = [UIFont systemFontOfSize:13];
        lblGuaranteeAgency.text = self.investItem.detail.guaranteeAgency;
        [viewDetail addSubview:lblGuaranteeAgency];
        
        //反担保方式
        UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(7, 34, 65, 16)];
        lbl2.backgroundColor = [UIColor clearColor];
        lbl2.textAlignment = NSTextAlignmentLeft;
        lbl2.textColor = RGBCOLOR(108, 108, 108);
        lbl2.font = [UIFont systemFontOfSize:13];
        lbl2.text = @"反担保方式";
        [viewDetail addSubview:lbl2];
        
        lblSize = [self.investItem.detail.counterGuaranteeWay sizeWithFont:[UIFont systemFontOfSize:13]
                                                     constrainedToSize:CGSizeMake(300, 30)
                                                         lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblCounterGuaranteeWay = [[UILabel alloc] initWithFrame:CGRectMake(95, 34, lblSize.width, lblSize.height)];
        lblCounterGuaranteeWay.backgroundColor = [UIColor clearColor];
        lblCounterGuaranteeWay.textAlignment = NSTextAlignmentLeft;
        lblCounterGuaranteeWay.textColor = RGBCOLOR(51, 51, 51);
        lblCounterGuaranteeWay.font = [UIFont systemFontOfSize:13];
        lblCounterGuaranteeWay.text = self.investItem.detail.counterGuaranteeWay;
        [viewDetail addSubview:lblCounterGuaranteeWay];
        
        //该产品已发布天数
        UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(7, 58, 78, 16)];
        lbl3.backgroundColor = [UIColor clearColor];
        lbl3.textAlignment = NSTextAlignmentLeft;
        lbl3.textColor = RGBCOLOR(108, 108, 108);
        lbl3.font = [UIFont systemFontOfSize:13];
        lbl3.text = @"该产品已发布";
        [viewDetail addSubview:lbl3];
        
        lblSize = [[NSString stringWithFormat:@"%d", self.investItem.detail.publishedTime] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                      constrainedToSize:CGSizeMake(300, 30)
                                                                                          lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblPublishedTime = [[UILabel alloc] initWithFrame:CGRectMake(95, 58, lblSize.width, lblSize.height)];
        lblPublishedTime.backgroundColor = [UIColor clearColor];
        lblPublishedTime.textAlignment = NSTextAlignmentLeft;
        lblPublishedTime.textColor = RGBCOLOR(215, 4, 2);
        lblPublishedTime.font = [UIFont systemFontOfSize:13];
        lblPublishedTime.text = [NSString stringWithFormat:@"%d", self.investItem.detail.publishedTime];
        [viewDetail addSubview:lblPublishedTime];
        
        UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblPublishedTime.frame), CGRectGetMinY(lbl3.frame),
                                                                              lblSize.width, 16)];
        lbl4.backgroundColor = [UIColor clearColor];
        lbl4.textAlignment = NSTextAlignmentLeft;
        lbl4.textColor = RGBCOLOR(51, 51, 51);
        lbl4.font = [UIFont systemFontOfSize:13];
        lbl4.text = @"天";
        [viewDetail addSubview:lbl4];
        
        //还能投标人数
        UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(7, 82, 78, 16)];
        lbl5.backgroundColor = [UIColor clearColor];
        lbl5.textAlignment = NSTextAlignmentLeft;
        lbl5.textColor = RGBCOLOR(108, 108, 108);
        lbl5.font = [UIFont systemFontOfSize:13];
        lbl5.text = @"还能投标人数";
        [viewDetail addSubview:lbl5];
        
        lblSize = [[NSString stringWithFormat:@"%d", self.investItem.detail.surplusBidNums] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                       constrainedToSize:CGSizeMake(300, 30)
                                                                                           lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblSurplusBidNums = [[UILabel alloc] initWithFrame:CGRectMake(95, 82, lblSize.width, lblSize.height)];
        lblSurplusBidNums.backgroundColor = [UIColor clearColor];
        lblSurplusBidNums.textAlignment = NSTextAlignmentLeft;
        lblSurplusBidNums.textColor = RGBCOLOR(215, 4, 2);
        lblSurplusBidNums.font = [UIFont systemFontOfSize:13];
        lblSurplusBidNums.text = [NSString stringWithFormat:@"%d", self.investItem.detail.surplusBidNums];
        [viewDetail addSubview:lblSurplusBidNums];
        
        UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblSurplusBidNums.frame), 82, 20, 16)];
        lbl6.backgroundColor = [UIColor clearColor];
        lbl6.textAlignment = NSTextAlignmentLeft;
        lbl6.textColor = RGBCOLOR(51, 51, 51);
        lbl6.font = [UIFont systemFontOfSize:13];
        lbl6.text = @"人";
        [viewDetail addSubview:lbl6];

        UIImageView *imgviewSeparatorLine2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_cell.png"]];
        imgviewSeparatorLine2.frame = CGRectMake(0, CGRectGetHeight(viewDetail.frame), 320, 1);
        [viewDetail addSubview:imgviewSeparatorLine2];
    }
    
    UIView *viewArchive = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(viewDetail.frame), 320, 109)];
    viewArchive.backgroundColor = [UIColor clearColor];
    [scrView addSubview:viewArchive];
    
    UIImageView *imgviewBottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_white_unfold.png"]];
    imgviewBottom.frame = CGRectMake(0, 0, CGRectGetWidth(viewArchive.frame), CGRectGetHeight(viewArchive.frame));
    [viewArchive addSubview:imgviewBottom];
    
    //借款人档案
    {
        lblSize = [@"借款人档案" sizeWithFont:[UIFont systemFontOfSize:13]
                            constrainedToSize:CGSizeMake(300, 30)
                                lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(7, 7, 65, 16)];
        lbl1.backgroundColor = [UIColor clearColor];
        lbl1.textAlignment = NSTextAlignmentLeft;
        lbl1.textColor = RGBCOLOR(51, 51, 51);
        lbl1.font = [UIFont systemFontOfSize:13];
        lbl1.text = @"借款人档案";
        [viewArchive addSubview:lbl1];
        
        UIImageView *imgviewSeparatorLine3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_cell.png"]];
        imgviewSeparatorLine3.frame = CGRectMake(8, 28, 304, 1);
        [viewArchive addSubview:imgviewSeparatorLine3];
        
        //借款人用户名
        UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(8, 39, 40, 15)];
        lbl2.backgroundColor = [UIColor clearColor];
        lbl2.textAlignment = NSTextAlignmentLeft;
        lbl2.textColor = RGBCOLOR(108, 108, 108);
        lbl2.font = [UIFont systemFontOfSize:12];
        lbl2.text = @"用户名:";
        [viewArchive addSubview:lbl2];
        
        lblSize = [self.investItem.detail.borrowerName sizeWithFont:[UIFont systemFontOfSize:13]
                                                  constrainedToSize:CGSizeMake(300, 30)
                                                      lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblBorrowerName = [[UILabel alloc] initWithFrame:CGRectMake(50, 38, lblSize.width, lblSize.height)];
        lblBorrowerName.backgroundColor = [UIColor clearColor];
        lblBorrowerName.textAlignment = NSTextAlignmentLeft;
        lblBorrowerName.textColor = RGBCOLOR(51, 51, 51);
        lblBorrowerName.font = [UIFont systemFontOfSize:13];
        lblBorrowerName.text = self.investItem.detail.borrowerName;
        [viewArchive addSubview:lblBorrowerName];
        
        //成功流转
        UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(200, 39, 56, 15)];
        lbl3.backgroundColor = [UIColor clearColor];
        lbl3.textAlignment = NSTextAlignmentLeft;
        lbl3.textColor = RGBCOLOR(108, 108, 108);
        lbl3.font = [UIFont systemFontOfSize:12];
        lbl3.text = @"成功流转:";
        [viewArchive addSubview:lbl3];
        
        lblSize = [[NSString stringWithFormat:@"%d", self.investItem.detail.flowCopies] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                   constrainedToSize:CGSizeMake(300, 30)
                                                                                       lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblFlowCopies = [[UILabel alloc] initWithFrame:CGRectMake(258, 38, lblSize.width, lblSize.height)];
        lblFlowCopies.backgroundColor = [UIColor clearColor];
        lblFlowCopies.textAlignment = NSTextAlignmentLeft;
        lblFlowCopies.textColor = RGBCOLOR(215, 4, 2);
        lblFlowCopies.font = [UIFont systemFontOfSize:13];
        lblFlowCopies.text = [NSString stringWithFormat:@"%d", self.investItem.detail.flowCopies];
        [viewArchive addSubview:lblFlowCopies];
        
        //会员等级
        UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(8, 62, 56, 15)];
        lbl4.backgroundColor = [UIColor clearColor];
        lbl4.textAlignment = NSTextAlignmentLeft;
        lbl4.textColor = RGBCOLOR(108, 108, 108);
        lbl4.font = [UIFont systemFontOfSize:12];
        lbl4.text = @"会员等级:";
        [viewArchive addSubview:lbl4];
        
        lblSize = [self.investItem.detail.vipStatus sizeWithFont:[UIFont systemFontOfSize:13]
                                               constrainedToSize:CGSizeMake(300, 30)
                                                   lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblVipStatus = [[UILabel alloc] initWithFrame:CGRectMake(65, 61, lblSize.width, lblSize.height)];
        lblVipStatus.backgroundColor = [UIColor clearColor];
        lblVipStatus.textAlignment = NSTextAlignmentLeft;
        lblVipStatus.textColor = RGBCOLOR(51, 51, 51);
        lblVipStatus.font = [UIFont systemFontOfSize:13];
        lblVipStatus.text = self.investItem.detail.vipStatus;
        [viewArchive addSubview:lblVipStatus];
        
        //如约回购
        UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(200, 62, 56, 15)];
        lbl5.backgroundColor = [UIColor clearColor];
        lbl5.textAlignment = NSTextAlignmentLeft;
        lbl5.textColor = RGBCOLOR(108, 108, 108);
        lbl5.font = [UIFont systemFontOfSize:12];
        lbl5.text = @"如约回购:";
        [viewArchive addSubview:lbl5];
        
        lblSize = [[NSString stringWithFormat:@"%d", self.investItem.detail.repurchase] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                   constrainedToSize:CGSizeMake(300, 30)
                                                                                       lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblRepurchase = [[UILabel alloc] initWithFrame:CGRectMake(258, 61, lblSize.width, lblSize.height)];
        lblRepurchase.backgroundColor = [UIColor clearColor];
        lblRepurchase.textAlignment = NSTextAlignmentLeft;
        lblRepurchase.textColor = RGBCOLOR(215, 4, 2);
        lblRepurchase.font = [UIFont systemFontOfSize:13];
        lblRepurchase.text = [NSString stringWithFormat:@"%d", self.investItem.detail.repurchase];
        [viewArchive addSubview:lblRepurchase];
        
        //所在地
        UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(8, 85, 40, 15)];
        lbl6.backgroundColor = [UIColor clearColor];
        lbl6.textAlignment = NSTextAlignmentLeft;
        lbl6.textColor = RGBCOLOR(108, 108, 108);
        lbl6.font = [UIFont systemFontOfSize:12];
        lbl6.text = @"所在地:";
        [viewArchive addSubview:lbl6];
        
        lblSize = [self.investItem.detail.site sizeWithFont:[UIFont systemFontOfSize:13]
                                               constrainedToSize:CGSizeMake(300, 30)
                                                   lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblSite = [[UILabel alloc] initWithFrame:CGRectMake(50, 84, lblSize.width, lblSize.height)];
        lblSite.backgroundColor = [UIColor clearColor];
        lblSite.textAlignment = NSTextAlignmentLeft;
        lblSite.textColor = RGBCOLOR(51, 51, 51);
        lblSite.font = [UIFont systemFontOfSize:13];
        lblSite.text = self.investItem.detail.site;
        [viewArchive addSubview:lblSite];
        
        //逾期回购
        UILabel *lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(200, 85, 56, 15)];
        lbl7.backgroundColor = [UIColor clearColor];
        lbl7.textAlignment = NSTextAlignmentLeft;
        lbl7.textColor = RGBCOLOR(108, 108, 108);
        lbl7.font = [UIFont systemFontOfSize:12];
        lbl7.text = @"逾期违约:";
        [viewArchive addSubview:lbl7];
        
        lblSize = [[NSString stringWithFormat:@"%d", self.investItem.detail.overdueDefault] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                       constrainedToSize:CGSizeMake(300, 30)
                                                                                           lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblOverdueDefault = [[UILabel alloc] initWithFrame:CGRectMake(258, 84, lblSize.width, lblSize.height)];
        lblOverdueDefault.backgroundColor = [UIColor clearColor];
        lblOverdueDefault.textAlignment = NSTextAlignmentLeft;
        lblOverdueDefault.textColor = RGBCOLOR(215, 4, 2);
        lblOverdueDefault.font = [UIFont systemFontOfSize:13];
        lblOverdueDefault.text = [NSString stringWithFormat:@"%d", self.investItem.detail.overdueDefault];
        [viewArchive addSubview:lblOverdueDefault];
    }
    
    //底部投标按钮
    {
        UIView *viewBottom = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 80,
                                                                     320, 80)];
        viewBottom.backgroundColor = [UIColor clearColor];
        [self.view addSubview:viewBottom];
        
        UIImageView *imgviewBottom = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_bottom_white_invest.png"]];
        imgviewBottom.frame = CGRectMake(0, 0, CGRectGetWidth(viewBottom.frame), CGRectGetHeight(viewBottom.frame));
        [viewBottom addSubview:imgviewBottom];
        
        UIImageView *imgviewSeparatorLine4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_cell.png"]];
        imgviewSeparatorLine4.frame = CGRectMake(0, 0, 320, 1);
        [viewBottom addSubview:imgviewSeparatorLine4];
        
        UIView *viewPlusMinus = [[UIView alloc] initWithFrame:CGRectMake(0, 1, 320, 36)];
        viewPlusMinus.backgroundColor = RGBCOLOR(221, 221, 221);
        [viewBottom addSubview:viewPlusMinus];
        
        UIButton *btnMinus = [UIButton buttonWithType:UIButtonTypeCustom];
        btnMinus.frame = CGRectMake(10, 3, 27, 27);
        [btnMinus setBackgroundImage:[UIImage imageNamed:@"bg_btn_addbox"] forState:UIControlStateNormal];
        [btnMinus setTitle:@"⎯" forState:UIControlStateNormal];
        btnMinus.titleLabel.font = [UIFont systemFontOfSize:12];
        [btnMinus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnMinus addTarget:self
                   action:@selector(didBtnMinusPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        [viewBottom addSubview:btnMinus];
        
        UIImageView *imgviewDynamicNum = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_input_num.png"]];
        imgviewDynamicNum.frame = CGRectMake(CGRectGetMaxX(btnMinus.frame), CGRectGetMidY(btnMinus.frame) - 12, 62, 24);
        [viewBottom addSubview:imgviewDynamicNum];
        
        UILabel *lblDynamicNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(imgviewDynamicNum.frame),
                                                                           CGRectGetHeight(imgviewDynamicNum.frame))];
        lblDynamicNum.backgroundColor = [UIColor clearColor];
        lblDynamicNum.textAlignment = NSTextAlignmentCenter;
        lblDynamicNum.textColor = RGBCOLOR(51, 51, 51);
        lblDynamicNum.font = [UIFont systemFontOfSize:15];
        lblDynamicNum.text = @"0";
        [imgviewDynamicNum addSubview:lblDynamicNum];
        
        UIButton *btnPlus = [UIButton buttonWithType:UIButtonTypeCustom];
        btnPlus.frame = CGRectMake(CGRectGetMaxX(imgviewDynamicNum.frame), 3, 27, 27);
        [btnPlus setBackgroundImage:[UIImage imageNamed:@"bg_btn_addbox"] forState:UIControlStateNormal];
        [btnPlus setTitle:@"+" forState:UIControlStateNormal];
        btnPlus.titleLabel.font = [UIFont systemFontOfSize:14];
        [btnPlus setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnPlus addTarget:self
                     action:@selector(didBtnPlusPressed:)
           forControlEvents:UIControlEventTouchUpInside];
        [viewBottom addSubview:btnPlus];
        
        //已出售份数
        lblSize = [@"已出售份数:" sizeWithFont:[UIFont systemFontOfSize:13]
                           constrainedToSize:CGSizeMake(300, 30)
                               lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblSaled = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnPlus.frame) + 10,
                                                                      CGRectGetMidY(btnPlus.frame) - lblSize.height/2,
                                                                      lblSize.width, lblSize.height)];
        lblSaled.backgroundColor = [UIColor clearColor];
        lblSaled.textAlignment = NSTextAlignmentLeft;
        lblSaled.textColor = RGBCOLOR(145, 145, 145);
        lblSaled.font = [UIFont systemFontOfSize:13];
        lblSaled.text = @"已出售份数:";
        [viewBottom addSubview:lblSaled];
        
        lblSize = [[NSString stringWithFormat:@"%d", 0] sizeWithFont:[UIFont systemFontOfSize:13]
                                                   constrainedToSize:CGSizeMake(300, 30)
                                                       lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblSaledNums = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblSaled.frame) + 2,
                                                                          CGRectGetMinY(lblSaled.frame),
                                                                          lblSize.width, lblSize.height)];
        lblSaledNums.backgroundColor = [UIColor clearColor];
        lblSaledNums.textAlignment = NSTextAlignmentLeft;
        lblSaledNums.textColor = RGBCOLOR(215, 4, 2);
        lblSaledNums.font = [UIFont systemFontOfSize:13];
        lblSaledNums.text = [NSString stringWithFormat:@"%d", 0];
        [viewBottom addSubview:lblSaledNums];
        
        //剩余份数
        lblSize = [@"剩余份数:" sizeWithFont:[UIFont systemFontOfSize:13]
                        constrainedToSize:CGSizeMake(300, 30)
                            lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblSurplus = [[UILabel alloc] initWithFrame:CGRectMake(230, CGRectGetMinY(lblSaled.frame),
                                                                      lblSize.width, lblSize.height)];
        lblSurplus.backgroundColor = [UIColor clearColor];
        lblSurplus.textAlignment = NSTextAlignmentLeft;
        lblSurplus.textColor = RGBCOLOR(145, 145, 145);
        lblSurplus.font = [UIFont systemFontOfSize:13];
        lblSurplus.text = @"剩余份数:";
        [viewBottom addSubview:lblSurplus];
        
        lblSize = [[NSString stringWithFormat:@"%d", 0] sizeWithFont:[UIFont systemFontOfSize:13]
                                                   constrainedToSize:CGSizeMake(300, 30)
                                                       lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblSurplusNums = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblSurplus.frame) + 2,
                                                                          CGRectGetMinY(lblSurplus.frame),
                                                                          lblSize.width, lblSize.height)];
        lblSurplusNums.backgroundColor = [UIColor clearColor];
        lblSurplusNums.textAlignment = NSTextAlignmentLeft;
        lblSurplusNums.textColor = RGBCOLOR(215, 4, 2);
        lblSurplusNums.font = [UIFont systemFontOfSize:13];
        lblSurplusNums.text = [NSString stringWithFormat:@"%d", 0];
        [viewBottom addSubview:lblSurplusNums];
        
        //您的可投标金额
        lblSize = [@"您的可投标金额为:" sizeWithFont:[UIFont systemFontOfSize:13]
                       constrainedToSize:CGSizeMake(300, 30)
                           lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(8, 40, lblSize.width, lblSize.height)];
        lbl1.backgroundColor = [UIColor clearColor];
        lbl1.textAlignment = NSTextAlignmentLeft;
        lbl1.textColor = RGBCOLOR(51, 51, 51);
        lbl1.font = [UIFont systemFontOfSize:13];
        lbl1.text = @"您的可投标金额为:";
        [viewBottom addSubview:lbl1];
        
        lblSize = [[NSString stringWithFormat:@"%.0f", 0.0] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                                   constrainedToSize:CGSizeMake(300, 30)
                                                                                       lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblBidNums = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl1.frame) + 2, CGRectGetMinY(lbl1.frame),
                                                                        lblSize.width, lblSize.height)];
        lblBidNums.backgroundColor = [UIColor clearColor];
        lblBidNums.textAlignment = NSTextAlignmentLeft;
        lblBidNums.textColor = RGBCOLOR(215, 4, 2);
        lblBidNums.font = [UIFont systemFontOfSize:13];
        lblBidNums.text = [NSString stringWithFormat:@"%d", self.investItem.detail.repurchase];
        [viewBottom addSubview:lblBidNums];
        
        UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblBidNums.frame), CGRectGetMinY(lbl1.frame),
                                                                  30, lblSize.height)];
        lbl2.backgroundColor = [UIColor clearColor];
        lbl2.textAlignment = NSTextAlignmentLeft;
        lbl2.textColor = RGBCOLOR(51, 51, 51);
        lbl2.font = [UIFont systemFontOfSize:13];
        lbl2.text = @"元";
        [viewBottom addSubview:lbl2];
        
        //最多可认购
        lblSize = [@"最多可认购:" sizeWithFont:[UIFont systemFontOfSize:13]
                           constrainedToSize:CGSizeMake(300, 30)
                               lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(8, CGRectGetMaxY(lbl1.frame) + 2, lblSize.width, lblSize.height)];
        lbl3.backgroundColor = [UIColor clearColor];
        lbl3.textAlignment = NSTextAlignmentLeft;
        lbl3.textColor = RGBCOLOR(51, 51, 51);
        lbl3.font = [UIFont systemFontOfSize:13];
        lbl3.text = @"最多可认购:";
        [viewBottom addSubview:lbl3];
        
        lblSize = [[NSString stringWithFormat:@"%d", 0] sizeWithFont:[UIFont systemFontOfSize:13]
                                                       constrainedToSize:CGSizeMake(300, 30)
                                                           lineBreakMode:NSLineBreakByTruncatingTail];
        UILabel *lblPurchaseNums = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl3.frame) + 2, CGRectGetMinY(lbl3.frame),
                                                                        lblSize.width, lblSize.height)];
        lblPurchaseNums.backgroundColor = [UIColor clearColor];
        lblPurchaseNums.textAlignment = NSTextAlignmentLeft;
        lblPurchaseNums.textColor = RGBCOLOR(215, 4, 2);
        lblPurchaseNums.font = [UIFont systemFontOfSize:13];
        lblPurchaseNums.text = [NSString stringWithFormat:@"%d", 0];
        [viewBottom addSubview:lblPurchaseNums];
        
        UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblPurchaseNums.frame), CGRectGetMinY(lbl3.frame),
                                                                  30, lblSize.height)];
        lbl4.backgroundColor = [UIColor clearColor];
        lbl4.textAlignment = NSTextAlignmentLeft;
        lbl4.textColor = RGBCOLOR(51, 51, 51);
        lbl4.font = [UIFont systemFontOfSize:13];
        lbl4.text = @"份";
        [viewBottom addSubview:lbl4];
        
        UIButton *btnBid = [UIButton buttonWithType:UIButtonTypeCustom];
        btnBid.frame = CGRectMake(250, CGRectGetHeight(viewBottom.frame) - 36, 60, 30);
        [btnBid setBackgroundImage:[UIImage imageNamed:@"bg_btn_account.png"] forState:UIControlStateNormal];
        [btnBid setTitle:@"投标" forState:UIControlStateNormal];
        btnBid.titleLabel.font = [UIFont systemFontOfSize:16];
        [btnBid setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnBid addTarget:self
                    action:@selector(didBtnBidPressed:)
          forControlEvents:UIControlEventTouchUpInside];
        [viewBottom addSubview:btnBid];
    }
}

#pragma mark -
#pragma mark 按钮交互
- (void)didBtnBidPressed:(id)sender
{
    
}

- (void)didBtnMinusPressed:(id)sender
{
    
}

- (void)didBtnPlusPressed:(id)sender
{
    
}

#pragma mark -
#pragma mark back to home
- (void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
