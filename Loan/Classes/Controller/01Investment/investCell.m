//
//  investCell.m
//  Loan
//
//  Created by conquer on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "investCell.h"
#import "KDGoalBar.h"

@implementation investCell
@synthesize investItem=_investItem;
@synthesize gbSchedule = _gbSchedule;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor clearColor];
        //方案进度
        KDGoalBar *gbScheduleTmp = [[KDGoalBar alloc]initWithFrame:CGRectMake(9, 10, 50, 50)];
        [gbScheduleTmp setPercent:0 Percent1:0 animated:NO];
        
        self.gbSchedule = gbScheduleTmp;
        [self addSubview:self.gbSchedule];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -
#pragma mark drawRect
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGRect rect1 = CGRectMake(rect.origin.x + 5
                              , rect.origin.y + 6
                              , rect.size.width - 10
                              , rect.size.height - 6);
	UIImage * image = nil;
    image = [UIImage imageNamed:@"tz_listbg.png"];
    
    UIImage *image1 = [image stretchableImageWithLeftCapWidth:image.size.width/2
                                                 topCapHeight:image.size.height/2];
	[image1 drawInRect:rect1];
    
	if (self.highlighted) {
		[[UIColor whiteColor] set];
	}
    
    CGRect rect2=CGRectMake(198, 15, 18, 15);
    UIImage * arrowImage = nil;
    arrowImage = [UIImage imageNamed:@"ico_bao.png"];
    arrowImage = [arrowImage stretchableImageWithLeftCapWidth:arrowImage.size.width/2
                                                 topCapHeight:arrowImage.size.height/2];
	[arrowImage drawInRect:rect2];
    
    [@"进度" drawInRect:CGRectMake(18, 64, 32, 15) withFont:[UIFont systemFontOfSize:13] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    UIColor *color=RGBACOLOR(123, 123, 123, 1);
    [color set];
    
    CGSize size;
    
    [@"借款金额" drawInRect:CGRectMake(63, 42, 47, 13) withFont:[UIFont systemFontOfSize:11] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    [@"起投金额" drawInRect:CGRectMake(138, 42, 47, 13) withFont:[UIFont systemFontOfSize:11] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    [@"年利率" drawInRect:CGRectMake(214, 42, 35, 13) withFont:[UIFont systemFontOfSize:11] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    [@"期限" drawInRect:CGRectMake(273, 42, 22, 13) withFont:[UIFont systemFontOfSize:11] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    color=RGBACOLOR(51, 51, 51, 1);
    [color set];
    
    size = [self.investItem.purpose sizeWithFont:[UIFont systemFontOfSize:13]
                               constrainedToSize:CGSizeMake(200, 30)
                                   lineBreakMode:NSLineBreakByTruncatingTail];
    [self.investItem.purpose drawInRect:CGRectMake(64, 16, size.width, size.height) withFont:[UIFont systemFontOfSize:13] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    NSString *borrowAmountStr=[NSString stringWithFormat:@"¥%.0f",self.investItem.borrowingAmount];
    size = [borrowAmountStr sizeWithFont:[UIFont systemFontOfSize:13]
                       constrainedToSize:CGSizeMake(200, 30)
                           lineBreakMode:NSLineBreakByTruncatingTail];
    [borrowAmountStr drawInRect:CGRectMake(63, 63, size.width, size.height) withFont:[UIFont systemFontOfSize:13] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    NSString *lowInvestAmountStr=[NSString stringWithFormat:@"¥%.0f",self.investItem.lowInvestmentAmount];
    size = [lowInvestAmountStr sizeWithFont:[UIFont systemFontOfSize:13]
                          constrainedToSize:CGSizeMake(200, 30)
                              lineBreakMode:NSLineBreakByTruncatingTail];
    [lowInvestAmountStr drawInRect:CGRectMake(138, 63, size.width, size.height) withFont:[UIFont systemFontOfSize:13] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
     NSString *annualRateStr=[NSString stringWithFormat:@"%.2f%%",self.investItem.annualInterestRate];
    [annualRateStr drawInRect:CGRectMake(208, 63, 48, 13) withFont:[UIFont systemFontOfSize:13] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    
    NSString *deadlineStr=[NSString stringWithFormat:@"%d个月",self.investItem.deadline];
    [deadlineStr drawInRect:CGRectMake(265, 63, 41, 13) withFont:[UIFont systemFontOfSize:13] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
}

-(void)layoutSubviews{
    UIButton *bidBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [bidBtn setBackgroundImage:[UIImage imageNamed:@"listbtn_bg.png"] forState:UIControlStateNormal];
    [bidBtn setTitle:@"投标" forState:UIControlStateNormal];
    [bidBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    bidBtn.titleLabel.font=[UIFont systemFontOfSize:13];
    bidBtn.frame=CGRectMake(257,11, 49, 26);
    [bidBtn addTarget:self
                action:@selector(bid:)
      forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:bidBtn];
    
    UIButton *jiujiuBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [jiujiuBtn setBackgroundImage:[UIImage imageNamed:@"jjf_txtbg.png"] forState:UIControlStateNormal];
    [jiujiuBtn setTitle:@"玖玖丰" forState:UIControlStateNormal];
    [jiujiuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    jiujiuBtn.titleLabel.font=[UIFont systemFontOfSize:10];
    jiujiuBtn.frame=CGRectMake(160, 16, 36, 14);
    [jiujiuBtn addTarget:self
               action:@selector(jiujiuBtnClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:jiujiuBtn];
    
//    // 计算总份数: 总金额 / 每份金额
//    int nAllCopies = [self.order.btbonus floatValue] / [self.order.bteachbonus floatValue];
//    // 计算方案进度: 卖出份数 / 总份数
//    int nSurplus = nAllCopies - [self.order.remainingcopies intValue];  // 剩余份数
//    float fPercentage = (float)nSurplus / (float)nAllCopies;            // 剩余份数除以总份数
//    int nSchedule = fPercentage * 100;                                  // 进度
    int nSchedule = self.investItem.progress;
    int nMinCopies =0;
    // 圆环进度条，包含进度和保底
    [self.gbSchedule setPercent:nSchedule Percent1:nMinCopies animated:NO];
}

-(void)bid:(id)sender{
    
}

-(void)jiujiuBtnClicked:(id)sender{
    
}



@end
