//
//  WithdrawCell.m
//  Loan
//
//  Created by hdk-mac on 14-1-9.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "WithdrawCell.h"

@implementation WithdrawCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFeed:(WithdrawRecordItem *)feed
{
    if (_feed != feed) {
        _feed = feed;
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //背景图
	UIImage * image = [UIImage imageNamed:@"bg_cell_userinvest.png"];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2
                                       topCapHeight:image.size.height/2];
	[image drawInRect:CGRectMake(0, 0, rect.size.width, rect.size.height - 1)];
    
    //分割线
    UIImage *imageLine = [UIImage imageNamed:@"line_separator_cell.png"];
    imageLine = [imageLine stretchableImageWithLeftCapWidth:imageLine.size.width/2
                                               topCapHeight:imageLine.size.height/2];
	[imageLine drawInRect:CGRectMake(0, rect.size.height - 1, rect.size.width, 1)];
    
    //箭头
    UIImage *imageArrow = [UIImage imageNamed:@"ico_arrow_right_gray.png"];
    imageArrow = [imageArrow stretchableImageWithLeftCapWidth:imageArrow.size.width/2
                                                 topCapHeight:imageArrow.size.height/2];
	[imageArrow drawInRect:CGRectMake(299, 37, 8, 16)];
    
    UIColor *color = RGBCOLOR(51, 51, 51);
    [color set];
    
    //交易银行
    CGSize drawSize = [self.feed.bankName sizeWithFont:[UIFont systemFontOfSize:13]
                                     constrainedToSize:CGSizeMake(300, 30)
                                         lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect1 = CGRectMake(12, 16, drawSize.width, drawSize.height);
    [self.feed.bankName drawInRect:rect1
                              withFont:[UIFont systemFontOfSize:13]
                         lineBreakMode:NSLineBreakByTruncatingTail
                             alignment:NSTextAlignmentLeft];
    
    color = RGBCOLOR(135, 135, 135);
    [color set];
    
    //交易时间
    drawSize = [self.feed.performTime sizeWithFont:[UIFont systemFontOfSize:11]
                                 constrainedToSize:CGSizeMake(300, 30)
                                     lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect2 = CGRectMake(12, CGRectGetMaxY(rect1) + 5, drawSize.width, drawSize.height);
    [self.feed.performTime drawInRect:rect2
                             withFont:[UIFont systemFontOfSize:11]
                        lineBreakMode:NSLineBreakByTruncatingTail
                            alignment:NSTextAlignmentLeft];
    
    color = RGBCOLOR(226, 16, 16);
    [color set];
    
    //交易金额
    drawSize = [[NSString stringWithFormat:@"¥%.2f", self.feed.sum] sizeWithFont:[UIFont systemFontOfSize:15]
                                                               constrainedToSize:CGSizeMake(300, 30)
                                                                   lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect3 = CGRectMake(285 - drawSize.width, 15, drawSize.width, drawSize.height);
    [[NSString stringWithFormat:@"¥%.2f", self.feed.sum] drawInRect:rect3
                                                           withFont:[UIFont systemFontOfSize:15]
                                                      lineBreakMode:NSLineBreakByTruncatingTail
                                                          alignment:NSTextAlignmentLeft];
    
    color = RGBCOLOR(135, 135, 135);
    [color set];
    
    //交易状态
    drawSize = [self.feed.state sizeWithFont:[UIFont systemFontOfSize:11]
                           constrainedToSize:CGSizeMake(300, 30)
                               lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect4 = CGRectMake(285 - drawSize.width, CGRectGetMaxY(rect3) + 1, drawSize.width, drawSize.height);
    [self.feed.state drawInRect:rect4
                       withFont:[UIFont systemFontOfSize:11]
                  lineBreakMode:NSLineBreakByTruncatingTail
                      alignment:NSTextAlignmentLeft];
}

@end
