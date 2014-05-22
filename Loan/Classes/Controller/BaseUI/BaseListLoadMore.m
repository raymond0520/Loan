//
//  BaseListLoadMore.m
//  Loan
//
//  Created by hdk-mac on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseListLoadMore.h"

@implementation BaseListLoadMore

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self InitUI];
    }
    return self;
}

- (void)InitUI
{
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activity.frame = CGRectMake(100, 20, 19, 19);
    [self addSubview:_activity];
    
    _readmeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 23, 320, 16)];
    _readmeLabel.backgroundColor = [UIColor clearColor];
    _readmeLabel.textColor = [UIColor colorWithRed:0x7a/255.0f green:0x7a/255.0f blue:0x7a/255.0f alpha:1.0f];
    _readmeLabel.font = [UIFont boldSystemFontOfSize:13];
    _readmeLabel.text = @"正在加载...";
    _readmeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_readmeLabel];
}

- (void)hideFooterView:(UITableView*)tableView animated:(BOOL)animated
{
    if (animated) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3f];
        tableView.contentOffset = CGPointMake(0, tableView.contentSize.height-tableView.frame.size.height-self.frame.size.height);
        [UIView commitAnimations];
        
        [self performSelector:@selector(resetTableviewHeight:) withObject:tableView afterDelay:0.3f];
    }
    else {
        [self resetTableviewHeight:tableView];
    }
}

- (void)resetTableviewHeight:(UITableView *)tableView
{
    CGRect frame = tableView.frame;
    frame.size.height += self.frame.size.height;
    tableView.frame = frame;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
