//
//  GuideCell.m
//  Loan
//
//  Created by conquer on 13-12-31.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import "GuideCell.h"

@implementation GuideCell

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

- (void)setFeedAnnouce:(NewsReportItem *)feedAnnouce
{
    if (_feedAnnouce != feedAnnouce) {
        _feedAnnouce = feedAnnouce;
        
        [self setNeedsDisplay];
    }
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGRect rect1=CGRectMake(290, 25, 8, 16);
    UIImage * arrowImage = [UIImage imageNamed:@"arrow_right.png"];
    arrowImage = [arrowImage stretchableImageWithLeftCapWidth:arrowImage.size.width/2
                                                 topCapHeight:arrowImage.size.height/2];
	[arrowImage drawInRect:rect1];
    
    CGRect rect2 = CGRectMake(15, 26, 275, 20);
    
    UIColor *color=RGBACOLOR(71, 71, 71, 1);
    [color set];
    [self.feedAnnouce.title drawInRect:rect2
                              withFont:[UIFont systemFontOfSize:14]
                         lineBreakMode:NSLineBreakByTruncatingTail
                             alignment:NSTextAlignmentLeft];

}

@end
