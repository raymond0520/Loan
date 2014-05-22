//
//  NewsDetailViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-14.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "NewsDetailViewController.h"

#define TAG_SCROLL_VIEW 0x10

@interface NewsDetailViewController ()

@end

@implementation NewsDetailViewController

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
    
    self.controllerTitle = @"最新公告";
    self.leftButton.hidden = NO;
    
    UIScrollView *scrView = [[UIScrollView alloc] init];
    scrView.tag = TAG_SCROLL_VIEW;
    scrView.backgroundColor = RGBCOLOR(228, 228, 228);
    scrView.frame = CGRectMake(0, NAVIGATION_HEADER, 320, CGRectGetHeight(self.view.frame) - NAVIGATION_HEADER);
    scrView.contentSize = CGSizeMake(CGRectGetWidth(scrView.frame), CGRectGetHeight(scrView.frame));
    scrView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrView];
    
    CGSize sizeTitle = [self.newsItem.title sizeWithFont:[UIFont systemFontOfSize:16]
                                       constrainedToSize:CGSizeMake(240, 100)
                                           lineBreakMode:NSLineBreakByTruncatingTail];
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(40, 10,
                                                                  240, sizeTitle.height)];
    lblTitle.backgroundColor = [UIColor clearColor];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.textColor = RGBCOLOR(0, 0, 0);
    lblTitle.font = [UIFont systemFontOfSize:16];
    lblTitle.numberOfLines = 0;
    lblTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    lblTitle.text = self.newsItem.title;
    [scrView addSubview:lblTitle];

    NSString *strPublishTime = [NSString stringWithFormat:@"发布时间：%@", self.newsItem.publishTime];
    
    CGSize sizeTime = [strPublishTime sizeWithFont:[UIFont systemFontOfSize:12]
                                 constrainedToSize:CGSizeMake(320, 100)
                                     lineBreakMode:NSLineBreakByTruncatingTail];

    UILabel *lblPublishTime = [[UILabel alloc] initWithFrame:CGRectMake(160 - sizeTime.width/2, CGRectGetMaxY(lblTitle.frame) + 3,
                                                                        sizeTime.width, sizeTime.height)];
    lblPublishTime.backgroundColor = [UIColor clearColor];
    lblPublishTime.textAlignment = NSTextAlignmentLeft;
    lblPublishTime.textColor = RGBCOLOR(130, 130, 130);
    lblPublishTime.font = [UIFont systemFontOfSize:12];
    lblPublishTime.text = strPublishTime;
    [scrView addSubview:lblPublishTime];
    
    CGSize sizeContent = [self.newsItem.content sizeWithFont:[UIFont systemFontOfSize:14]
                                           constrainedToSize:CGSizeMake(300, 1000)
                                               lineBreakMode:NSLineBreakByTruncatingTail];
    
    UILabel *lblContent = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(lblPublishTime.frame) + 15,
                                                                    sizeContent.width, sizeContent.height)];
    lblContent.backgroundColor = [UIColor clearColor];
    lblContent.textAlignment = NSTextAlignmentLeft;
    lblContent.textColor = RGBCOLOR(51, 51, 51);
    lblContent.font = [UIFont systemFontOfSize:14];
    lblContent.text = self.newsItem.content;
    lblContent.numberOfLines = 0;
    lblContent.lineBreakMode = NSLineBreakByTruncatingTail;
    [scrView addSubview:lblContent];
    
    scrView.contentSize = CGSizeMake(320, CGRectGetMaxY(lblContent.frame) + 8);
}

#pragma mark -
#pragma mark back
- (void)leftButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
