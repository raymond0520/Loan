//
//  BaseListViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseListViewController.h"

@interface BaseListViewController ()

@end

@implementation BaseListViewController
@synthesize mTableView = _mTableView;
@synthesize datalist = _datalist;
@synthesize refreshHeaderView = _refreshHeaderView;
@synthesize loadMoreView = _loadMoreView;
@synthesize ishasmore = _ishasmore;
@synthesize EnableRefresh = _EnableRefresh;
@synthesize EnableLoadMore = _EnableLoadMore;
@synthesize beginheight = _beginheight;
@synthesize footheight = _footheight;
@synthesize tablestyle = _tablestyle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _reloading = NO;
    _ishasmore = YES;
    _EnableRefresh = YES;
    _EnableLoadMore = YES;
    _beginheight = NAVIGATION_HEADER;
    _footheight = TABFOOT_HEADER;
    _tablestyle = 1;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setFootheight:(float)footheight
{
    if (_footheight != footheight) {
        _footheight = footheight;
        [self ReSetTableViewFrame];
    }
}

- (void)setBeginheight:(float)beginheight
{
    if (_beginheight != beginheight) {
        _beginheight = beginheight;
        [self ReSetTableViewFrame];
    }
}

#pragma mark-
#pragma define user methods
- (void)ReSetTableViewFrame
{
    BaseUIData * uidata = [BaseUIData GetInstance];
    CGRect rc = CGRectMake(0, _beginheight, 320, uidata.screenheight-_beginheight-_footheight );
    _mTableView.frame = rc;
}

- (void)InitUI
{
    [super InitUI];
    
    BaseUIData * uidata = [BaseUIData GetInstance];
    UITableViewStyle  style1 = (_tablestyle ==1 ? UITableViewStylePlain :UITableViewStyleGrouped);
    CGRect rc = CGRectMake(0, _beginheight, 320, uidata.screenheight-_beginheight-_footheight);
	_mTableView = [[UITableView alloc] initWithFrame:rc style:style1];
	_mTableView.tag = TAG_TABLEVIEW;
    _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mTableView.backgroundColor = [UIColor clearColor];
	[self.view addSubview:_mTableView];
    
    if (_EnableRefresh == YES) {
        _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - _mTableView.bounds.size.height, 320.0f, _mTableView.bounds.size.height )];
        _refreshHeaderView.tag =TAG_HEADER_REFRESH_VIEW;
        _refreshHeaderView.delegate = self;
        _refreshHeaderView.backgroundColor = [UIColor clearColor];
        [_mTableView addSubview:_refreshHeaderView];
    }
    else {
        // nothing
    }
    
    if (_EnableLoadMore == YES) {
        rc = CGRectMake(0, 0, 320, FOOTVIEW_HEADER);
        _loadMoreView = [[BaseListLoadMore alloc] initWithFrame:rc];
        _mTableView.tableFooterView =_loadMoreView;
    }
    [self doneLoadingTableViewData];
}

- (void)startRefreshData:(int)page
{
}

- (void)setEnableLoadMore:(BOOL)EnableLoadMore
{
    _EnableLoadMore = EnableLoadMore;
    
    if (EnableLoadMore == NO) {
        [_loadMoreView removeFromSuperview];
        _mTableView.tableFooterView = nil;
    }
}

- (void)setEnableRefresh:(BOOL)EnableRefresh
{
    _EnableRefresh = EnableRefresh;
    
    if (EnableRefresh == NO) {
        _refreshHeaderView.hidden =YES;
    }
    else {
        _refreshHeaderView.hidden =NO;
    }
}

- (void)ReuqsetDataDone
{
    [self doneLoadingTableViewData];
}

- (void)LoadMoreEnd
{
    self.ishasmore = NO;
}

- (void)setIshasmore:(BOOL)ishasmore
{
    BaseUIData * uidata = [BaseUIData GetInstance];
    if (ishasmore) {  //如果还有更多,还原
        [UIView beginAnimations:@"testAnimation" context:NULL];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationRepeatCount:1];
        CGRect rc = CGRectMake(0, _beginheight, 320, uidata.screenheight-_beginheight-_footheight);
        _mTableView.frame = rc;
        [UIView commitAnimations];
        [_loadMoreView.activity startAnimating]; //开始转
        _loadMoreView.readmeLabel.text = @"正在加载中....";
    }
    else {
        
        [_loadMoreView.activity stopAnimating]; //开始转
        _loadMoreView.readmeLabel.text = @"全部加载完毕";
        [UIView beginAnimations:@"testAnimation" context:NULL];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationRepeatCount:1];
        CGRect rc = CGRectMake(0, _beginheight, 320, uidata.screenheight-_beginheight-_footheight + FOOTVIEW_HEADER);
        _mTableView.frame = rc ;
        [UIView commitAnimations];
    }
    _ishasmore = ishasmore;
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource
{
    
    [self startRefreshData:0];
	_reloading = YES;
}

- (void)doneLoadingTableViewData
{
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:_mTableView];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_EnableRefresh == NO) {
        return;
    }
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_EnableRefresh == NO) {
        return;
    }
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
	[self reloadTableViewDataSource];
    
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:5.0];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
	return _reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
	return [NSDate date]; // should return date data source was last changed
}

@end
