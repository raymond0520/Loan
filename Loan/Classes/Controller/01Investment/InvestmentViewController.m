//
//  InvestmentViewController.m
//  Loan
//
//  Created by conquer on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "InvestmentViewController.h"
#import "UISortView.h"
#import "investCell.h"
#import "BaseUIData.h"
#import "BaseData.h"
#import "BorrowDetailViewController.h"

#define TAG_SORT_VIEW   0x10

@interface InvestmentViewController ()

@end

@implementation InvestmentViewController
@synthesize investTable=_investTable;

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
    [self initDatalist];
    [self InitUI];
}

- (void)initDatalist
{
    BaseData *data = [BaseData GetInstance];
    self.datalist1 = data.investmentList;
    self.datalist = self.datalist1;
}
-(void)InitUI{
    [super InitUI];
    
    self.controllerTitle = @"我要投资";
    
    self.leftButton.hidden = NO;
    //[self.leftButton setBackgroundImage:[UIImage imageNamed:@"chevron-thin-left.png"] forState:UIControlStateNormal];
    [self.leftButton addTarget:self
                        action:@selector(backToHome:)
              forControlEvents:UIControlEventTouchUpInside];
    
    NSArray * sortArray = [NSArray arrayWithObjects:@"全部",@"玖玖丰",@"玖玖利",@"玖玖赢",@"最近",nil];
    UISortView * sortView = [[UISortView alloc] initWithFrame:CGRectMake(0,NAVIGATION_HEADER, 320, 35) element:sortArray];
    sortView.delegate =self;
    sortView.tag = TAG_SORT_VIEW;
    [self.view addSubview:sortView];
    
    BaseUIData *UIData=[BaseUIData GetInstance];
    
    _investTable = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVIGATION_HEADER + 35,
                                                                 320, UIData.screenheight - NAVIGATION_HEADER - 35)
                                                style:UITableViewStylePlain];
    _investTable.backgroundColor=RGBCOLOR(228, 228, 228);
    _investTable.dataSource = self;
    _investTable.delegate = self;
    _investTable.separatorStyle = UITableViewCellAccessoryNone;
    _investTable.allowsSelection = YES;
    _investTable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _investTable.showsVerticalScrollIndicator=NO;
    [self.view addSubview:self.investTable];

}

-(void)backToHome:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark UISortView delegate
- (void)SelectedButtonClick
{
    BaseData *data = [BaseData GetInstance];

    UISortView * selectedview = (UISortView*)[self.view viewWithTag:TAG_SORT_VIEW];
    switch (selectedview.selectedIndex) {
        case 1:
        {
            if (self.datalist1 == nil) {
                self.datalist1 = data.investmentList;
            }
            self.datalist = self.datalist1;
            break;
        }
        case 2:
        {
            if (self.datalist2 == nil) {
                self.datalist2 = data.investmentList;
            }
            self.datalist = self.datalist2;
            break;
        }
        case 3:
        {
            if (self.datalist3 == nil) {
                self.datalist3 = data.investmentList;
            }
            self.datalist = self.datalist3;
            break;
        }
        case 4:
        {
            if (self.datalist4 == nil) {
                self.datalist4 = data.investmentList;
            }
            self.datalist = self.datalist4;
            break;
        }
        case 5:
        {
            if (self.datalist5 == nil) {
                self.datalist5 = data.investmentList;
            }
            self.datalist = self.datalist5;
            break;
        }
        default:
            break;
    }
    
    [self.investTable reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    investCell* cell =[[investCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    cell.investItem=[self.datalist objectAtIndex:indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 86;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BorrowDetailViewController *borrowDetail=[[BorrowDetailViewController alloc]init];
    borrowDetail.investItem = (InvestmentItem *)[self.datalist objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:borrowDetail animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
