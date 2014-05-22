//
//  BaseSideDrawerViewController.h
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 hdk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MMDrawerController.h"

@interface BaseSideDrawerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    
}

/**
 *  tableview
 */
@property (nonatomic, strong) UITableView *tableView;

/**
 *  tableview的所在坐标的Y值
 */
@property (nonatomic, assign) CGFloat beginHeight;

/**
 *  cell identifier
 */
@property (nonatomic, strong) NSString *cellName;

/**
 *  tableview 的datasource，一维数组, 子类添加数据
 */
@property (nonatomic, strong) NSMutableArray *sectionlist;

/**
 *  tableview 的datasource，二维数组，行数保证和sectionlist数量相等，子类添加数据
 */
@property (nonatomic, strong) NSMutableArray *rowlist;

////////////////////////////////////////////////////////////////////////////////////

/**
 *  初始化UI
 */
- (void)InitUI;

/**
 *  datasource,子类实现
 */
- (void)initDatalist;

- (CGFloat)heightForHeaderInSection:(NSInteger)section;

- (CGFloat)heightForRow:(NSIndexPath *)indexPath;

/**
 *  为section创建headerview
 *
 *  @param section section
 *
 *  @return view
 */
- (UIView *)createViewForHeaderSection:(NSInteger)section;

/**
 *  创建cell,子类实现
 *
 *  @param object feed
 *
 *  @return uitableviewcell
 */
- (UITableViewCell *)createCell:(id)object;

/**
 *  tableviewcell选择，子类实现
 *
 *  @param indexPath
 */
- (void)didSelectIndexPath:(NSIndexPath *)indexPath;

@end
