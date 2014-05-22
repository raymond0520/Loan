//
//  NewsViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-13.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "NewsViewController.h"
#import "BaseData.h"
#import "NewsReportCell.h"
#import "NewsReportItem.h"
#import "NewsDetailViewController.h"

#define TAG_SORT_VIEW     0x10

@interface NewsViewController ()

@end

@implementation NewsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)InitUI
{
    [super InitUI];
    
    self.view.backgroundColor = RGBCOLOR(228, 228, 228);
    
    self.controllerTitle = @"资讯";
    self.leftButton.hidden = NO;
    
    self.EnableLoadMore = NO;
    self.EnableRefresh = NO;
    
    self.beginheight = NAVIGATION_HEADER + 35;
    self.footheight = 0;
    
    NSArray * sortArray = [NSArray arrayWithObjects:@"媒体报道", @"最新公告", nil];
    UISortView * sortView = [[UISortView alloc] initWithFrame:CGRectMake(0,NAVIGATION_HEADER, 320, 35) element:sortArray];
    sortView.delegate = self;
    sortView.tag = TAG_SORT_VIEW;
    [self.view addSubview:sortView];

}

- (void)initDatalist
{
    BaseData *data = [BaseData GetInstance];
    
    self.cellname = @"cell_mediaReport";
    self.datalist = data.mediaReportList;
}

#pragma mark -
#pragma mark UITableView data source
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
    
    NewsReportCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:self.cellname];
	
    id feed = nil;
	if (indexPath.row < [array count]) {
		feed = [array objectAtIndex:indexPath.row];
	}
    if (cell == nil) {
        cell = [[NewsReportCell alloc] initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:self.cellname];
        cell.newsImg = [UIImage imageNamed:[NSString stringWithFormat:@"news%d.png", indexPath.row + 1]];
        
        cell.feed = (NewsReportItem *)feed;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
	return cell;
}


//- (UITableViewCell *)CreateCell:(id)object
//{
//    NewsReportCell *cell = [[NewsReportCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                                   reuseIdentifier:self.cellname];
//    cell.feed = (NewsReportItem *)object;
//    cell.newsImg = [UIImage imageNamed:@"news%d.png", row];
//    return cell;
//}

- (int)setTableViewHeight:(int)row
{
    return 80;
}

#pragma mark -
#pragma mark table view delegate
- (void)didSelectRowAt:(int)row
{
    NewsDetailViewController *detailView = [[NewsDetailViewController alloc] init];
    detailView.newsItem = (NewsReportItem *)[self.datalist objectAtIndex:row];
    [self.navigationController pushViewController:detailView animated:YES];
}

#pragma mark -
#pragma mark UISortView delegate
- (void)SelectedButtonClick
{
    UISortView *selectedview = (UISortView*)[self.view viewWithTag:TAG_SORT_VIEW];
    BaseData *data = [BaseData GetInstance];
    switch (selectedview.selectedIndex) {
        case 1:
        {
            self.cellname = @"cell_mediaReport";
            self.datalist = data.mediaReportList;
            break;
        }
        case 2:
        {
            self.cellname = @"cell_latestAnnounce";
            self.datalist = data.latestAnnounceList;
            break;
        }
        default:
            break;
    }
    [self.mTableView reloadData];
}

#pragma mark -
#pragma mark back to home
- (void)leftButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
