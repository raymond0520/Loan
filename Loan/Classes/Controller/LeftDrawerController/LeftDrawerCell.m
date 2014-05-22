//
//  LeftDrawerCell.m
//  Loan
//
//  Created by hdk-mac on 13-12-31.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import "LeftDrawerCell.h"

@implementation LeftDrawerCell

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

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    _Highlighted = highlighted;
    [self setNeedsDisplay];
}

- (void)setCelltext:(NSString *)celltext
{
    _celltext = celltext;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIImage *imgBG;
    if (self.Highlighted) {
        imgBG = [UIImage imageNamed:@"bg_cell_highlighted.png"];
    }
    else
    {
        imgBG = [UIImage imageNamed:@"bg_cell.png"];
    }
    CGRect rect1 = CGRectMake(0, 0, rect.size.width, rect.size.height - 2);
    [imgBG drawInRect:rect1];
    
    UIColor *color = [UIColor colorWithRed:204 green:204 blue:204 alpha:1];
    [color set];
    
    CGSize size = [self.celltext sizeWithFont:[UIFont systemFontOfSize:14]
                            constrainedToSize:CGSizeMake(150, 45)
                                lineBreakMode:NSLineBreakByTruncatingTail];
    CGRect rect2 = CGRectMake(25, rect.size.height/2 - size.height/2, size.width, size.height);
    [self.celltext drawInRect:rect2
                     withFont:[UIFont systemFontOfSize:14]
                lineBreakMode:NSLineBreakByTruncatingTail];
    
    UIImage *imgSeparator = [UIImage imageNamed:@"line_black_cell_separator.png"];
    CGRect rect3 = CGRectMake(0, rect.size.height - 2, rect.size.width, 2);
    [imgSeparator drawInRect:rect3];
}
@end
