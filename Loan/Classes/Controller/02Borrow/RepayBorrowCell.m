//
//  RepayBorrowCell.m
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "RepayBorrowCell.h"

@implementation RepayBorrowCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.repayBorrowType = 0;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFeed:(RepayBorrowItem *)feed
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
	UIImage *image = [UIImage imageNamed:@"bg_cell_userinvest.png"];
    
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
    
    //标题
    CGSize drawSize = [self.feed.title sizeWithFont:[UIFont systemFontOfSize:13]
                                  constrainedToSize:CGSizeMake(300, 30)
                                      lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect1 = CGRectMake(10, 10, drawSize.width, drawSize.height);
    [self.feed.title drawInRect:rect1
                       withFont:[UIFont systemFontOfSize:13]
                  lineBreakMode:NSLineBreakByTruncatingTail
                      alignment:NSTextAlignmentLeft];
    
    //借款金额
    color = RGBCOLOR(130, 130, 130);
    [color set];
    
    drawSize = [@"借款金额" sizeWithFont:[UIFont systemFontOfSize:12]
                   constrainedToSize:CGSizeMake(300, 30)
                       lineBreakMode:NSLineBreakByTruncatingTail];
    [@"借款金额" drawInRect:CGRectMake(10, CGRectGetMaxY(rect1) + 13, drawSize.width, drawSize.height)
               withFont:[UIFont systemFontOfSize:12]
          lineBreakMode:NSLineBreakByTruncatingTail
              alignment:NSTextAlignmentLeft];
    
    color = RGBCOLOR(51, 51, 51);
    [color set];
    
    drawSize = [[NSString stringWithFormat:@"¥%.2f", self.feed.borrowingAmount] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                           constrainedToSize:CGSizeMake(300, 30)
                                                                               lineBreakMode:NSLineBreakByTruncatingTail];
    [[NSString stringWithFormat:@"¥%.2f", self.feed.borrowingAmount] drawInRect:CGRectMake(10, CGRectGetMaxY(rect1) + 35,
                                                                                           drawSize.width, drawSize.height)
                                                                       withFont:[UIFont systemFontOfSize:13]
                                                                  lineBreakMode:NSLineBreakByTruncatingTail
                                                                      alignment:NSTextAlignmentLeft];
    
    //利率
    color = RGBCOLOR(130, 130, 130);
    [color set];
    
    drawSize = [@"利率" sizeWithFont:[UIFont systemFontOfSize:12]
                 constrainedToSize:CGSizeMake(300, 30)
                     lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect2 = CGRectMake(100, CGRectGetMaxY(rect1) + 13, drawSize.width, drawSize.height);
    [@"利率" drawInRect:rect2
             withFont:[UIFont systemFontOfSize:12]
        lineBreakMode:NSLineBreakByTruncatingTail
            alignment:NSTextAlignmentLeft];
    
    color = RGBCOLOR(51, 51, 51);
    [color set];
    
    drawSize = [[NSString stringWithFormat:@"%.0f%%", self.feed.interestRating] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                           constrainedToSize:CGSizeMake(300, 30)
                                                                               lineBreakMode:NSLineBreakByTruncatingTail];
    [[NSString stringWithFormat:@"%.0f%%", self.feed.interestRating] drawInRect:CGRectMake(CGRectGetMidX(rect2) - drawSize.width/2,
                                                                                           CGRectGetMaxY(rect1) + 35,
                                                                                           drawSize.width, drawSize.height)
                                                                       withFont:[UIFont systemFontOfSize:13]
                                                                  lineBreakMode:NSLineBreakByTruncatingTail
                                                                      alignment:NSTextAlignmentLeft];
    
    //第几期
    color = RGBCOLOR(130, 130, 130);
    [color set];
    
    drawSize = [@"第几期" sizeWithFont:[UIFont systemFontOfSize:12]
                 constrainedToSize:CGSizeMake(300, 30)
                     lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect3 = CGRectMake(150, CGRectGetMaxY(rect1) + 13, drawSize.width, drawSize.height);
    [@"第几期" drawInRect:rect3
             withFont:[UIFont systemFontOfSize:12]
        lineBreakMode:NSLineBreakByTruncatingTail
            alignment:NSTextAlignmentLeft];
    
    color = RGBCOLOR(51, 51, 51);
    [color set];
    
    drawSize = [[NSString stringWithFormat:@"%d", self.feed.period] sizeWithFont:[UIFont systemFontOfSize:13]
                                                                           constrainedToSize:CGSizeMake(300, 30)
                                                                               lineBreakMode:NSLineBreakByTruncatingTail];
    [[NSString stringWithFormat:@"%d", self.feed.period] drawInRect:CGRectMake(CGRectGetMidX(rect3) - drawSize.width/2,
                                                                               CGRectGetMaxY(rect1) + 35,
                                                                               drawSize.width, drawSize.height)
                                                                       withFont:[UIFont systemFontOfSize:13]
                                                                  lineBreakMode:NSLineBreakByTruncatingTail
                                                                      alignment:NSTextAlignmentLeft];

    
    //应还日期/还款日期
    NSString *strDateType;
    NSString *strDate;
    if (self.repayBorrowType == 1) {
        strDateType = @"应还日期";
        strDate = self.feed.toPayDate;
    }
    else if (self.repayBorrowType == 2){
        strDateType = @"还款日期";
        strDate = self.feed.paidDate;
    }
    else if (self.repayBorrowType == 3){
        strDateType = @"应还日期";
        strDate = self.feed.toPayDate;
    }
    
    color = RGBCOLOR(130, 130, 130);
    [color set];
    
    drawSize = [strDateType sizeWithFont:[UIFont systemFontOfSize:12]
                       constrainedToSize:CGSizeMake(300, 30)
                           lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect5 = CGRectMake(220, CGRectGetMaxY(rect1) + 13, drawSize.width, drawSize.height);
    [strDateType drawInRect:rect5
                   withFont:[UIFont systemFontOfSize:12]
              lineBreakMode:NSLineBreakByTruncatingTail
                  alignment:NSTextAlignmentLeft];
    
    color = RGBCOLOR(51, 51, 51);
    [color set];
    
    drawSize = [strDate sizeWithFont:[UIFont systemFontOfSize:13]
                   constrainedToSize:CGSizeMake(300, 30)
                       lineBreakMode:NSLineBreakByTruncatingTail];
    [strDate drawInRect:CGRectMake(CGRectGetMidX(rect5) - drawSize.width/2, CGRectGetMaxY(rect1) + 35,
                                   drawSize.width, drawSize.height)
               withFont:[UIFont systemFontOfSize:13]
          lineBreakMode:NSLineBreakByTruncatingTail
              alignment:NSTextAlignmentLeft];
    
}

@end
