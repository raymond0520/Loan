//
//  NewsReportCell.h
//  Loan
//
//  Created by hdk-mac on 14-1-13.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsReportItem.h"

@interface NewsReportCell : UITableViewCell

@property (nonatomic, strong) NewsReportItem *feed;
@property (nonatomic, strong) UIImageView *newsImage;
@property (nonatomic, strong) UIImage *newsImg;

@end
