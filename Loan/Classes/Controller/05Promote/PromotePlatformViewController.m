//
//  PromotePlatformViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-10.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "PromotePlatformViewController.h"
#import "CenterViewController.h"

#define TAG_SCROLL_VIEW 0x10

@interface PromotePlatformViewController ()

@end

@implementation PromotePlatformViewController

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
    
    self.controllerTitle = @"推广有礼";
    self.leftButton.hidden = NO;
    
    UIScrollView *scrView = [[UIScrollView alloc] init];
    scrView.tag = TAG_SCROLL_VIEW;
    scrView.backgroundColor = RGBCOLOR(228, 228, 228);
    scrView.frame = CGRectMake(0, NAVIGATION_HEADER, 320, CGRectGetHeight(self.view.frame) - NAVIGATION_HEADER);
    scrView.contentSize = CGSizeMake(CGRectGetWidth(scrView.frame), CGRectGetHeight(scrView.frame));
    scrView.delegate = self;
    scrView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrView];
    
    UIImage *image = [UIImage imageNamed:@"bg_jag.png"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    UIImageView *imgviewStatistic = [[UIImageView alloc] initWithImage:image];
    imgviewStatistic.frame = CGRectMake(0, 0, 320, 65);
    [scrView addSubview:imgviewStatistic];

    NSString *strFont = @"字高度";
    CGSize fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];

    //推荐用户数
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(36, CGRectGetHeight(imgviewStatistic.frame)/2 - fontSize.height/2,
                                                              85, fontSize.height)];
    lbl1.backgroundColor = [UIColor clearColor];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.textColor = RGBCOLOR(51, 51, 51);
    lbl1.font = [UIFont systemFontOfSize:14];
    lbl1.text = @"推荐用户总数";
    [imgviewStatistic addSubview:lbl1];

    UILabel *lblPromotionNums = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl1.frame) + 3,
                                                                          CGRectGetMinY(lbl1.frame), 75, fontSize.height)];
    lblPromotionNums.backgroundColor = [UIColor clearColor];
    lblPromotionNums.textAlignment = NSTextAlignmentLeft;
    lblPromotionNums.textColor = RGBCOLOR(197, 2, 1);
    lblPromotionNums.font = [UIFont systemFontOfSize:14];
    lblPromotionNums.text = [NSString stringWithFormat:@"%d", 3];
    [imgviewStatistic addSubview:lblPromotionNums];
    
    //推广积分
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(180, CGRectGetHeight(imgviewStatistic.frame)/2 - fontSize.height/2,
                                                              85, fontSize.height)];
    lbl2.backgroundColor = [UIColor clearColor];
    lbl2.textAlignment = NSTextAlignmentLeft;
    lbl2.textColor = RGBCOLOR(51, 51, 51);
    lbl2.font = [UIFont systemFontOfSize:14];
    lbl2.text = @"获取推广积分";
    [imgviewStatistic addSubview:lbl2];
    
    UILabel *lblPoints = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl2.frame) + 3, CGRectGetMinY(lbl2.frame),
                                                                   75, fontSize.height)];
    lblPoints.backgroundColor = [UIColor clearColor];
    lblPoints.textAlignment = NSTextAlignmentLeft;
    lblPoints.textColor = RGBCOLOR(192, 2, 1);
    lblPoints.font = [UIFont systemFontOfSize:14];
    lblPoints.text = [NSString stringWithFormat:@"%d", 30];
    [imgviewStatistic addSubview:lblPoints];
    
    //推广描述
    NSString *strDescription = @"如果您喜欢玖玖贷，欢迎您邀请身边的同事，家人，朋友一起来体验玖玖贷。\n把链接通过电子邮件，微博，或其他各种方式分享给您的朋友。";
    CGSize sizeDescription = [strDescription sizeWithFont:[UIFont systemFontOfSize:14]
                                       constrainedToSize:CGSizeMake(296, 200)
                                           lineBreakMode:NSLineBreakByTruncatingTail];
    UILabel *lblDescription = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(imgviewStatistic.frame) + 20,
                                                              sizeDescription.width, sizeDescription.height)];
    lblDescription.backgroundColor = [UIColor clearColor];
    lblDescription.textAlignment = NSTextAlignmentLeft;
    lblDescription.textColor = RGBCOLOR(51, 51, 51);
    lblDescription.font = [UIFont systemFontOfSize:14];
    lblDescription.text = strDescription;
    lblDescription.numberOfLines = 0;
    lblDescription.lineBreakMode = NSLineBreakByTruncatingTail;
    [scrView addSubview:lblDescription];
    
    //推荐链接
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(lblDescription.frame) + 22,
                                                              100, fontSize.height)];
    lbl3.backgroundColor = [UIColor clearColor];
    lbl3.textAlignment = NSTextAlignmentLeft;
    lbl3.textColor = RGBCOLOR(130, 130, 130);
    lbl3.font = [UIFont systemFontOfSize:14];
    lbl3.text = @"推荐链接(URL):";
    [scrView addSubview:lbl3];
    
    NSString *strLinkURL = @"http://www.jojodai.com/Register.aspx?promoteId=c153f2f6-9330-4d70-88af-39c29428dc14";
    CGSize sizeLinURL = [strLinkURL sizeWithFont:[UIFont systemFontOfSize:14]
                                        constrainedToSize:CGSizeMake(296, 200)
                                            lineBreakMode:NSLineBreakByTruncatingTail];

    UILabel *lblLinkURL = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(lbl3.frame) + 8,
                                                              sizeLinURL.width, sizeLinURL.height)];
    lblLinkURL.backgroundColor = [UIColor clearColor];
    lblLinkURL.textAlignment = NSTextAlignmentLeft;
    lblLinkURL.textColor = RGBCOLOR(21, 116, 205);
    lblLinkURL.font = [UIFont systemFontOfSize:14];
    lblLinkURL.text = strLinkURL;
    lblLinkURL.numberOfLines = 0;
    lblLinkURL.lineBreakMode = NSLineBreakByTruncatingTail;
    [scrView addSubview:lblLinkURL];
    
    UIButton *btnShareCopy = [UIButton buttonWithType:UIButtonTypeCustom];
    btnShareCopy.frame = CGRectMake(12, CGRectGetMaxY(lblLinkURL.frame) + 9, 107, 28);
    [btnShareCopy setTitle:@"复制分享" forState:UIControlStateNormal];
    btnShareCopy.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnShareCopy setTitleColor:RGBCOLOR(255, 255, 255) forState:UIControlStateNormal];
    [btnShareCopy setBackgroundImage:[UIImage imageNamed:@"bg_btn_blue_share.png"] forState:UIControlStateNormal];
    [scrView addSubview:btnShareCopy];
    
    //推荐方式
    UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(btnShareCopy.frame) + 22,
                                                              63, fontSize.height)];
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.textAlignment = NSTextAlignmentLeft;
    lbl4.textColor = RGBCOLOR(130, 130, 130);
    lbl4.font = [UIFont systemFontOfSize:14];
    lbl4.text = @"推荐方式:";
    [scrView addSubview:lbl4];

    NSString *strPtromoteMode = @"所推广的用户成为有效用户（即在网站成功投资或借款一次）时计入积分";
    CGSize sizePtromoteMode = [strPtromoteMode sizeWithFont:[UIFont systemFontOfSize:14]
                                          constrainedToSize:CGSizeMake(296, 200)
                                              lineBreakMode:NSLineBreakByTruncatingTail];
    UILabel *lblPtromoteMode = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lbl4.frame) + 6,
                                                                        sizePtromoteMode.width, sizePtromoteMode.height)];
    lblPtromoteMode.backgroundColor = [UIColor clearColor];
    lblPtromoteMode.textAlignment = NSTextAlignmentLeft;
    lblPtromoteMode.textColor = RGBCOLOR(51, 51, 51);
    lblPtromoteMode.font = [UIFont systemFontOfSize:14];
    lblPtromoteMode.text = strPtromoteMode;
    lblPtromoteMode.numberOfLines = 0;
    lblPtromoteMode.lineBreakMode = NSLineBreakByTruncatingTail;
    [scrView addSubview:lblPtromoteMode];
    
    //获取的积分数
    UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lblPtromoteMode.frame) + 22,
                                                              63, fontSize.height)];
    lbl5.backgroundColor = [UIColor clearColor];
    lbl5.textAlignment = NSTextAlignmentLeft;
    lbl5.textColor = RGBCOLOR(130, 130, 130);
    lbl5.font = [UIFont systemFontOfSize:14];
    lbl5.text = @"获取积分:";
    [scrView addSubview:lbl5];
    
    UILabel *lblObtainedPoints = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lbl5.frame) + 6,
                                                              100, fontSize.height)];
    lblObtainedPoints.backgroundColor = [UIColor clearColor];
    lblObtainedPoints.textAlignment = NSTextAlignmentLeft;
    lblObtainedPoints.textColor = RGBCOLOR(51, 51, 51);
    lblObtainedPoints.font = [UIFont systemFontOfSize:14];
    lblObtainedPoints.text = [NSString stringWithFormat:@"%d分", 50];
    [scrView addSubview:lblObtainedPoints];
    
    //积分用途
    UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lblObtainedPoints.frame) + 22,
                                                              63, fontSize.height)];
    lbl6.backgroundColor = [UIColor clearColor];
    lbl6.textAlignment = NSTextAlignmentLeft;
    lbl6.textColor = RGBCOLOR(130, 130, 130);
    lbl6.font = [UIFont systemFontOfSize:14];
    lbl6.text = @"积分用途:";
    [scrView addSubview:lbl6];
    
    UILabel *lblPointsPurpose = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lbl6.frame) + 6,
                                                                           100, fontSize.height)];
    lblPointsPurpose.backgroundColor = [UIColor clearColor];
    lblPointsPurpose.textAlignment = NSTextAlignmentLeft;
    lblPointsPurpose.textColor = RGBCOLOR(51, 51, 51);
    lblPointsPurpose.font = [UIFont systemFontOfSize:14];
    lblPointsPurpose.text = @"兑换礼品";
    [scrView addSubview:lblPointsPurpose];
    
    scrView.contentSize = CGSizeMake(320, CGRectGetMaxY(lblPointsPurpose.frame) + 5);
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
