//
//  BaseListLoadMore.h
//  Loan
//
//  Created by hdk-mac on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseListLoadMore : UIView
{
    UIActivityIndicatorView   * _activity;
    UILabel                   * _readmeLabel;
}

@property(nonatomic, retain) UIActivityIndicatorView *activity;
@property(nonatomic ,retain) UILabel *readmeLabel;

- (void)hideFooterView:(UITableView*)tableView animated:(BOOL)animated;
- (void)InitUI;

@end
