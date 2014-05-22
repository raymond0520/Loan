//
//  CommunityViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-14.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "CommunityViewController.h"

#define TAG_SCROLL_VIEW      0x10
#define TAG_BTN_REQUIRE_READ 0x11
#define TAG_BTN_NEWBIE       0x12
#define TAG_BTN_INVEST_SHARE 0x13
#define TAG_BTN_DISCUSS      0x14
#define TAG_BTN_EVENT        0x15
@interface CommunityViewController ()

@end

@implementation CommunityViewController

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
    
    self.controllerTitle = @"社区";
    self.leftButton.hidden = NO;
    
    UIScrollView *scrView = [[UIScrollView alloc] init];
    scrView.tag = TAG_SCROLL_VIEW;
    scrView.backgroundColor = RGBCOLOR(228, 228, 228);
    scrView.frame = CGRectMake(0, NAVIGATION_HEADER, 320, CGRectGetHeight(self.view.frame) - NAVIGATION_HEADER);
    scrView.contentSize = CGSizeMake(CGRectGetWidth(scrView.frame), 460);
    scrView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrView];
    
    NSString *strFont = @"字高度";
    CGSize fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:13]];
    
    //图标
    UIImage *icoCommunity = [UIImage imageNamed:@"ico_community.png"];
    icoCommunity = [icoCommunity stretchableImageWithLeftCapWidth:icoCommunity.size.width/2
                                                     topCapHeight:icoCommunity.size.height/2];
    
    //箭头
    UIImage *imgArrow = [UIImage imageNamed:@"arrow_right_community.png"];
    imgArrow = [imgArrow stretchableImageWithLeftCapWidth:imgArrow.size.width/2
                                             topCapHeight:imgArrow.size.height/2];
    
    //会员中心
    UIView *viewMemberCenter = [[UIView alloc] initWithFrame:CGRectMake(0, 29, 320, 114)];
    [scrView addSubview:viewMemberCenter];
    {
        
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(8, 29/2 - fontSize.height/2, 100, fontSize.height)];
        lblTitle.backgroundColor = [UIColor clearColor];
        lblTitle.textAlignment = NSTextAlignmentLeft;
        lblTitle.textColor = RGBCOLOR(51, 51, 51);
        lblTitle.font = [UIFont systemFontOfSize:13];
        lblTitle.text = @"会员中心";
        [scrView addSubview:lblTitle];
        
        UIImageView *imgviewCellBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_white_community.png"]];
        imgviewCellBG.frame = CGRectMake(0, 0, 320, CGRectGetHeight(viewMemberCenter.frame));
        
        //会员必读
        UIButton *btnRequireRead = [UIButton buttonWithType:UIButtonTypeCustom];
        btnRequireRead.tag = TAG_BTN_REQUIRE_READ;
        btnRequireRead.frame = CGRectMake(0, 0, 320, 57);
        btnRequireRead.backgroundColor = [UIColor clearColor];
        [btnRequireRead setImage:[UIImage imageNamed:@"bg_white_community.png"]
                        forState:UIControlStateNormal];
        [btnRequireRead addTarget:self
                           action:@selector(didCellPressed:)
                 forControlEvents:UIControlEventTouchUpInside];
        [viewMemberCenter addSubview:btnRequireRead];
        
        UIImageView *imgviewIcon1 = [[UIImageView alloc] initWithImage:icoCommunity];
        imgviewIcon1.frame = CGRectMake(10, 10, 40, 35);
        [btnRequireRead addSubview:imgviewIcon1];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
        
        UILabel *lblRequireRead = [[UILabel alloc] initWithFrame:CGRectMake(55, 7, 100, fontSize.height)];
        lblRequireRead.backgroundColor = [UIColor clearColor];
        lblRequireRead.textAlignment = NSTextAlignmentLeft;
        lblRequireRead.textColor = RGBCOLOR(51, 51, 51);
        lblRequireRead.font = [UIFont systemFontOfSize:14];
        lblRequireRead.text = @"会员必读";
        [viewMemberCenter addSubview:lblRequireRead];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:12]];
        
        UILabel *lblSummary1 = [[UILabel alloc] initWithFrame:CGRectMake(55, 32, 200, fontSize.height)];
        lblSummary1.backgroundColor = [UIColor clearColor];
        lblSummary1.textAlignment = NSTextAlignmentLeft;
        lblSummary1.textColor = RGBCOLOR(134, 134, 134);
        lblSummary1.font = [UIFont systemFontOfSize:12];
        lblSummary1.text = @"文明发言，发帖必读";
        [viewMemberCenter addSubview:lblSummary1];
        
        UIImageView *imgviewArrow1 = [[UIImageView alloc] initWithImage:imgArrow];
        imgviewArrow1.frame = CGRectMake(292, 57/2 - 8, 8, 16);
        [viewMemberCenter addSubview:imgviewArrow1];
        
        //新手专区
        UIButton *btnNewbie = [UIButton buttonWithType:UIButtonTypeCustom];
        btnNewbie.tag = TAG_BTN_NEWBIE;
        btnNewbie.frame = CGRectMake(0, CGRectGetMaxY(btnRequireRead.frame) - 1, 320, 57);
        [btnNewbie setImage:[UIImage imageNamed:@"bg_white_community.png"]
                        forState:UIControlStateNormal];
        [btnNewbie addTarget:self
                      action:@selector(didCellPressed:)
            forControlEvents:UIControlEventTouchUpInside];
        [viewMemberCenter addSubview:btnNewbie];
        
        UIImageView *imgviewIcon2 = [[UIImageView alloc] initWithImage:icoCommunity];
        imgviewIcon2.frame = CGRectMake(10, 10, 40, 35);
        [btnNewbie addSubview:imgviewIcon2];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
        
        UILabel *lblNewbie = [[UILabel alloc] initWithFrame:CGRectMake(55, 7 + 57, 100, fontSize.height)];
        lblNewbie.backgroundColor = [UIColor clearColor];
        lblNewbie.textAlignment = NSTextAlignmentLeft;
        lblNewbie.textColor = RGBCOLOR(51, 51, 51);
        lblNewbie.font = [UIFont systemFontOfSize:14];
        lblNewbie.text = @"新手专区";
        [viewMemberCenter addSubview:lblNewbie];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:12]];
        
        UILabel *lblSummary2 = [[UILabel alloc] initWithFrame:CGRectMake(55, 32 + 57, 200, fontSize.height)];
        lblSummary2.backgroundColor = [UIColor clearColor];
        lblSummary2.textAlignment = NSTextAlignmentLeft;
        lblSummary2.textColor = RGBCOLOR(134, 134, 134);
        lblSummary2.font = [UIFont systemFontOfSize:12];
        lblSummary2.text = @"公告、通知、规则、帮助";
        [viewMemberCenter addSubview:lblSummary2];
        
        //箭头
        UIImageView *imgviewArrow2 = [[UIImageView alloc] initWithImage:imgArrow];
        imgviewArrow2.frame = CGRectMake(292, 57/2 - 8 + 57, 8, 16);
        [viewMemberCenter addSubview:imgviewArrow2];

    }

    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:13]];
    
    //网贷之家
    UIView *viewNetLoanHome = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(viewMemberCenter.frame) + 29, 320, 114)];
    [scrView addSubview:viewNetLoanHome];
    {
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(8,
                                                                  CGRectGetMaxY(viewMemberCenter.frame) + 29/2 - fontSize.height/2,
                                                                  100, fontSize.height)];
        lblTitle.backgroundColor = [UIColor clearColor];
        lblTitle.textAlignment = NSTextAlignmentLeft;
        lblTitle.textColor = RGBCOLOR(51, 51, 51);
        lblTitle.font = [UIFont systemFontOfSize:13];
        lblTitle.text = @"网贷之家";
        [scrView addSubview:lblTitle];
        
        //投资分享
        UIButton *btnShare = [UIButton buttonWithType:UIButtonTypeCustom];
        btnShare.tag = TAG_BTN_INVEST_SHARE;
        btnShare.frame = CGRectMake(0, 0, 320, 57);
        [btnShare setImage:[UIImage imageNamed:@"bg_white_community.png"]
                  forState:UIControlStateNormal];
        [btnShare addTarget:self
                           action:@selector(didCellPressed:)
                 forControlEvents:UIControlEventTouchUpInside];
        [viewNetLoanHome addSubview:btnShare];
        
        UIImageView *imgviewIcon1 = [[UIImageView alloc] initWithImage:icoCommunity];
        imgviewIcon1.frame = CGRectMake(10, 10, 40, 35);
        [btnShare addSubview:imgviewIcon1];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
        
        UILabel *lblShare = [[UILabel alloc] initWithFrame:CGRectMake(55, 7, 100, fontSize.height)];
        lblShare.backgroundColor = [UIColor clearColor];
        lblShare.textAlignment = NSTextAlignmentLeft;
        lblShare.textColor = RGBCOLOR(51, 51, 51);
        lblShare.font = [UIFont systemFontOfSize:14];
        lblShare.text = @"投资分享";
        [viewNetLoanHome addSubview:lblShare];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:12]];
        
        UILabel *lblSummary1 = [[UILabel alloc] initWithFrame:CGRectMake(55, 32, 200, fontSize.height)];
        lblSummary1.backgroundColor = [UIColor clearColor];
        lblSummary1.textAlignment = NSTextAlignmentLeft;
        lblSummary1.textColor = RGBCOLOR(134, 134, 134);
        lblSummary1.font = [UIFont systemFontOfSize:12];
        lblSummary1.text = @"让你的财富滚起来～";
        [viewNetLoanHome addSubview:lblSummary1];
        
        //箭头
        UIImageView *imgviewArrow1 = [[UIImageView alloc] initWithImage:imgArrow];
        imgviewArrow1.frame = CGRectMake(292, 57/2 - 8, 8, 16);
        [viewNetLoanHome addSubview:imgviewArrow1];
        
        //借款讨论
        UIButton *btnDiscuss = [UIButton buttonWithType:UIButtonTypeCustom];
        btnDiscuss.tag = TAG_BTN_DISCUSS;
        btnDiscuss.frame = CGRectMake(0, CGRectGetMaxY(btnShare.frame) - 1, 320, 57);
        [btnDiscuss setImage:[UIImage imageNamed:@"bg_white_community.png"]
                  forState:UIControlStateNormal];
        [btnDiscuss addTarget:self
                      action:@selector(didCellPressed:)
            forControlEvents:UIControlEventTouchUpInside];
        [viewNetLoanHome addSubview:btnDiscuss];
        
        UIImageView *imgviewIcon2 = [[UIImageView alloc] initWithImage:icoCommunity];
        imgviewIcon2.frame = CGRectMake(10, 10, 40, 35);
        [btnDiscuss addSubview:imgviewIcon2];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
        
        UILabel *lblDiscuss = [[UILabel alloc] initWithFrame:CGRectMake(55, 7 + 57, 100, fontSize.height)];
        lblDiscuss.backgroundColor = [UIColor clearColor];
        lblDiscuss.textAlignment = NSTextAlignmentLeft;
        lblDiscuss.textColor = RGBCOLOR(51, 51, 51);
        lblDiscuss.font = [UIFont systemFontOfSize:14];
        lblDiscuss.text = @"借款讨论";
        [viewNetLoanHome addSubview:lblDiscuss];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:12]];
        
        UILabel *lblSummary2 = [[UILabel alloc] initWithFrame:CGRectMake(55, 32 + 57, 200, fontSize.height)];
        lblSummary2.backgroundColor = [UIColor clearColor];
        lblSummary2.textAlignment = NSTextAlignmentLeft;
        lblSummary2.textColor = RGBCOLOR(134, 134, 134);
        lblSummary2.font = [UIFont systemFontOfSize:12];
        lblSummary2.text = @"谈钱伤感情，讲讲“借钱的那些事～”";
        [viewNetLoanHome addSubview:lblSummary2];
        
        //箭头
        UIImageView *imgviewArrow2 = [[UIImageView alloc] initWithImage:imgArrow];
        imgviewArrow2.frame = CGRectMake(292, 57/2 - 8 + 57, 8, 16);
        [viewNetLoanHome addSubview:imgviewArrow2];
    }
    
    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:13]];
    
    //活动专区
    UIView *viewEventArea = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(viewNetLoanHome.frame) + 29, 320, 57)];
    [scrView addSubview:viewEventArea];
    {
        UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(8,
                                                                  CGRectGetMaxY(viewNetLoanHome.frame) + 29/2 - fontSize.height/2,
                                                                  100, fontSize.height)];
        lblTitle.backgroundColor = [UIColor clearColor];
        lblTitle.textAlignment = NSTextAlignmentLeft;
        lblTitle.textColor = RGBCOLOR(51, 51, 51);
        lblTitle.font = [UIFont systemFontOfSize:13];
        lblTitle.text = @"活动专区";
        [scrView addSubview:lblTitle];
        
        //玖玖贷活动季
        UIButton *btnEvent = [UIButton buttonWithType:UIButtonTypeCustom];
        btnEvent.tag = TAG_BTN_EVENT;
        btnEvent.frame = CGRectMake(0, 0, 320, 57);
        [btnEvent setImage:[UIImage imageNamed:@"bg_white_community.png"]
                  forState:UIControlStateNormal];
        [btnEvent addTarget:self
                     action:@selector(didCellPressed:)
           forControlEvents:UIControlEventTouchUpInside];
        [viewEventArea addSubview:btnEvent];
        
        UIImageView *imgviewIcon = [[UIImageView alloc] initWithImage:icoCommunity];
        imgviewIcon.frame = CGRectMake(10, 10, 40, 35);
        [btnEvent addSubview:imgviewIcon];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
        
        UILabel *lblEvent = [[UILabel alloc] initWithFrame:CGRectMake(55, 7, 100, fontSize.height)];
        lblEvent.backgroundColor = [UIColor clearColor];
        lblEvent.textAlignment = NSTextAlignmentLeft;
        lblEvent.textColor = RGBCOLOR(51, 51, 51);
        lblEvent.font = [UIFont systemFontOfSize:14];
        lblEvent.text = @"玖玖贷活动季";
        [viewEventArea addSubview:lblEvent];
        
        fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:12]];
        
        UILabel *lblSummary = [[UILabel alloc] initWithFrame:CGRectMake(55, 32, 200, fontSize.height)];
        lblSummary.backgroundColor = [UIColor clearColor];
        lblSummary.textAlignment = NSTextAlignmentLeft;
        lblSummary.textColor = RGBCOLOR(134, 134, 134);
        lblSummary.font = [UIFont systemFontOfSize:12];
        lblSummary.text = @"关注这里，惊喜来敲门～";
        [viewEventArea addSubview:lblSummary];
        
        //箭头
        UIImageView *imgviewArrow1 = [[UIImageView alloc] initWithImage:imgArrow];
        imgviewArrow1.frame = CGRectMake(292, 57/2 - 8, 8, 16);
        [viewEventArea addSubview:imgviewArrow1];
    }

}

#pragma mark -
#pragma mark 点击cell交互
- (void)didCellPressed:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    switch (btn.tag) {
        case TAG_BTN_REQUIRE_READ:
        {
            break;
        }
        default:
            break;
    }
}

#pragma mark -
#pragma mark back to home
- (void)leftButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
