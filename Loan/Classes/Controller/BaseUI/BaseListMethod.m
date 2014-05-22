//
//  BaseListMethod.m
//  Loan
//
//  Created by hdk-mac on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseListMethod.h"

@interface BaseListMethod ()

@end

@implementation BaseListMethod

@synthesize cellname = _cellname;

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
    [self initDatalist]; //初始化数据，不能每次都去从DataCenter去获取吧
	[self BeforeControllerLoaded];//注册观察者或者设置代理
	[self InitUI];
	[self RequestRefreshNew];
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

#pragma mark -
#pragma mark 基类需要实现的函数
- (void)initDatalist
{
    // nothing
};
- (void)RequestRefreshNew
{
    // nothing
};
- (void)RequestLoadingMore
{
    // nothing
};
- (void)BeforeControllerLoaded
{
    // nothing
};
- (UITableViewCell * )CreateCell:(id)object
{
    return  nil;
}
- (void)didSelectRowAt:(int)row
{
    // nothing
}

#pragma mark -
#pragma mark 函数实现
- (void)InitUI  //主要参考AppCenterLimitFreeController的实现过程
{
    [super InitUI];
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
}

- (void)startRefreshData:(NSInteger)page
{
    //  [super startRefreshData:page];
    
	if (page == 0) { //刷新
        /*   if(_loadMoreView.frame.origin.y < 360)
         {
         _mTableView.tableFooterView.hidden= YES;
         }
         else {
         _mTableView.tableFooterView.hidden= NO;
         }*/
        
		[self RequestRefreshNew];
        self.ishasmore = YES;
	}
	else {  //加载更多
		[self RequestLoadingMore];
	}
}

#pragma mark -
#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSArray *array = self.datalist;
    
    if (array == nil || [array count] == 0) {
        return  1;
    }
	return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.datalist;
    
    if ([array count] == 0 || array == nil ) {
        UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:@"emptyCell"];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"emptyCell"];
            cell.selectionStyle = UITableViewCellEditingStyleNone;
            UIImage * easeImage = [UIImage imageNamed:@""] ;//LOAD_DEFEAULT_USE_POOL_NO_CACHE(@"detail/logo_220.png");
            UIImageView * imageView = [[UIImageView alloc] initWithImage:easeImage];
            imageView.frame = CGRectMake( 160-110/2,194/2 +25, 110, 110);
            [cell addSubview:imageView];
        }
        return  cell;
    }
    
	//static NSString *CellIdentifier = self.cellname;
    UITableViewCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:self.cellname];
	
    id feed = nil;
	if (indexPath.row < [array count]) {
		feed = [array objectAtIndex:indexPath.row];
	}
    
    if(cell == nil) {
        cell = [self CreateCell:feed];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    else {
        [self SetValueCell:cell value:feed];
    }
    
	return cell;
}

- (void)SetValueCell:(UITableViewCell *)cell value:(id)object
{
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *array = self.datalist ;
    
    if (array == nil || [array count] < indexPath.row) {
        return;
    }
    
    [self didSelectRowAt:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self setTableViewHeight:indexPath.row];
}

- (int)setTableViewHeight:(int)row
{
    return 75;
}

#pragma mark -
#pragma mark ScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    BaseUIData * uidata = [BaseUIData GetInstance];
    
    if (scrollView.tag == TAG_TABLEVIEW) {
        CGSize size = scrollView.contentSize;
        
        if (size.height + _beginheight < uidata.screenheight - TABFOOT_HEADER ) {
            _mTableView.tableFooterView.hidden = YES;
            return;
        }
        
        CGRect cellInViewRect = [_mTableView convertRect:_mTableView.tableFooterView.frame toView:self.view];
        if (cellInViewRect.origin.y <= uidata.screenheight -_footheight ) {
            //           if(_ishasmore &&_mTableView.tableFooterView.hidden ==NO&& _EnableLoadMore == YES)
            if (_ishasmore ) {
                _mTableView.tableFooterView.hidden = NO;
                [self RequestLoadingMore];
            }
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [super scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    
    if (!decelerate) {
        CGRect cellInViewRect = [_mTableView convertRect:_mTableView.tableFooterView.frame toView:self.view];
        
        if (cellInViewRect.origin.y <= 369) {
            if (_ishasmore) {
                _mTableView.tableFooterView.hidden = NO;
                [_loadMoreView.activity startAnimating];
                [self RequestLoadingMore];
            }
        }
    }
}

//- (void)ResponseAction:(ResData*)result //收到回报后的响应
//{
//    TipsView * tips = [TipsView shareTipsView];
//    [self ReuqsetDataDone];
//    
//    if (result.nNetWork != (int)NET_SUCCESS) { //网络出错
//        [tips showTips:@"您的网络不给力" tip2:@"请检查配置重试"];
//    }
//    else if (result.Rcode != 0) {
//        // nothing
//    }
//    else {  //请求成功
//        // nothing
//    }
//    [_mTableView reloadData];
//    [self adjustFootView];
//}

//- (void)ResponseListAction:(ResData*)result
//{
//    [self ReuqsetDataDone];
//    TipsView * tips = [TipsView shareTipsView];
//    NSString* start = (NSString*)result.otherobject;
//    
//    if ([ start isEqualToString:@"0"]) { //刷新
//        if(result.nNetWork != (int)NET_SUCCESS) { //网络出错
//            
//            [tips showTips:@"您的网络不给力" tip2:@"请检查配置重试"];
//        }
//        else if(result.Rcode == 0) { //成功
//            self.datalist = (NSMutableArray*)result.object;
//        }
//        else if(result.Rcode  ==1) { //没有数据
//            self.datalist = nil;
//        }
//        [_mTableView reloadData];
//    }
//    else //加载更多
//    {
//        if(result.nNetWork != (int)NET_SUCCESS) { //网络出错
//            [tips showTips:@"您的网络不给力" tip2:@"请检查配置重试"];
//            CGPoint  point = _mTableView.contentOffset;
//            [_mTableView setContentOffset:CGPointMake(point.x, point.y-FOOTVIEW_HEADER)];
//        }
//        else if(result.Rcode == 0 ) { //成功
//            NSMutableArray * array = (NSMutableArray*)result.object;
//            for(int i = 0 ; i < [array count];i++) {
//                [self.datalist addObject:[array objectAtIndex:i]];
//            }
//            [_mTableView reloadData];
//        }
//        else if(result.Rcode  ==1) { //没有数据
//            self.ishasmore = NO;
//        }
//    }
//    [self adjustFootView];
//}

- (void)adjustFootView
{
    float offset  = 0 ;
    
    if (_mTableView.tableHeaderView != nil) {
        offset += _mTableView.tableHeaderView.frame.size.height;
    }
    
    if (_mTableView.tableFooterView != nil) {
        offset += _mTableView.tableFooterView.frame.size.height;
    }
    
    BaseUIData * uidata = [BaseUIData GetInstance];
    CGSize size = _mTableView.contentSize;//如果一个页面能把所有列表显示出来，则隐藏tableFooterView
    
    if (size.height + _beginheight - offset < uidata.screenheight - _footheight ) {
        _mTableView.tableFooterView.hidden = YES;
        _ishasmore = NO;
    }
    else {
        _mTableView.tableFooterView.hidden = NO;
    }
}

@end
