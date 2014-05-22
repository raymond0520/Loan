//
//  BaseListViewController.h
//  Loan
//
//  Created by hdk-mac on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseListLoadMore.h"
#import "EGORefreshTableHeaderView.h"

#define TAG_TABLEVIEW  0x01
#define TAG_HEADER_REFRESH_VIEW 0x02
#define HEIGHT_FOR_TRIGGER_TABLEVIEW_REFRESH 10

@interface BaseListViewController : BaseViewController<EGORefreshTableHeaderDelegate>
{
    UITableView    *     _mTableView;   //链表
    NSMutableArray *     _datalist;     //需要显示的数据
    
    BOOL                 _reloading;
    BOOL                 _ishasmore;
    BaseListLoadMore  * _loadMoreView;
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    
    BOOL                 _EnableRefresh; //标识是否需要刷新
    BOOL                 _EnableLoadMore;//标识是否需要加载更多
    float                _beginheight;
    float                _footheight;
    int                  _tablestyle;  //标示tableview 的类型  0 普通 1 组的形式
}

@property (nonatomic, retain) UITableView *  mTableView;
@property (nonatomic, retain) NSMutableArray * datalist;
@property (nonatomic, retain) BaseListLoadMore *  loadMoreView;
@property (nonatomic, retain) EGORefreshTableHeaderView * refreshHeaderView;
@property (nonatomic, assign) BOOL ishasmore;
@property (nonatomic, assign) BOOL EnableRefresh;
@property (nonatomic, assign) BOOL EnableLoadMore;
@property (nonatomic, assign) float beginheight;
@property (nonatomic, assign) float footheight;
@property (nonatomic, assign) int tablestyle;

- (void)LoadMoreEnd;   //没有更多数据
// 子类必须要实现此处方法
- (void)startRefreshData:(int)page;       // 请求数据
- (void)ReuqsetDataDone;

//本类实现方法
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
- (void)ReSetTableViewFrame;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

@end
