//
//  NewsReportCell.m
//  Loan
//
//  Created by hdk-mac on 14-1-13.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "NewsReportCell.h"

@implementation NewsReportCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initUI
{
    self.newsImage = [[UIImageView alloc] initWithFrame:CGRectMake(12, 10, 60, 60)];
    self.newsImage.image = [UIImage imageNamed:@"top_bg.png"];
    [self addSubview:self.newsImage];
}

- (void)setFeed:(NewsReportItem *)feed
{
    if (_feed != feed) {
        _feed = feed;
        
        if (_feed.image != nil) {
            
        }
        self.newsImage.image = self.newsImg;
        
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
    
    UIColor *color = RGBCOLOR(0, 0, 0);
    [color set];
    
    //标题
    CGSize drawSize = [self.feed.title sizeWithFont:[UIFont systemFontOfSize:14]
                                  constrainedToSize:CGSizeMake(230, 34)
                                      lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect1 = CGRectMake(80, 8, drawSize.width, drawSize.height);
    [self.feed.title drawInRect:rect1
                       withFont:[UIFont systemFontOfSize:14]
                  lineBreakMode:NSLineBreakByTruncatingTail
                      alignment:NSTextAlignmentLeft];
    
    //内容
    color = RGBCOLOR(85, 85, 85);
    [color set];
    
    drawSize = [self.feed.content sizeWithFont:[UIFont systemFontOfSize:12]
                             constrainedToSize:CGSizeMake(220, 30)
                                 lineBreakMode:NSLineBreakByTruncatingTail];
    [self.feed.content drawInRect:CGRectMake(80, CGRectGetMaxY(rect1) + 1, drawSize.width, 72 - CGRectGetMaxY(rect1))
                         withFont:[UIFont systemFontOfSize:12]
                    lineBreakMode:NSLineBreakByTruncatingTail
                        alignment:NSTextAlignmentLeft];
}

@end
