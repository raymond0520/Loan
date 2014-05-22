//
//  BaseSideDrawerViewController.m
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 hdk. All rights reserved.
//  

#import "BaseSideDrawerViewController.h"
#import "BaseUIData.h"
#import "CenterViewController.h"

@interface BaseSideDrawerViewController ()
{
}
@end

@implementation BaseSideDrawerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _beginHeight = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self initDatalist];
    
    NSAssert([self.sectionlist count] == [self.rowlist count], @"sectionlist异常");
    
    [self InitUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initDatalist
{
}

- (void)InitUI
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithRed:77.0/255.0
                                                     green:79.0/255.0
                                                      blue:80.0/255.0
                                                     alpha:1.0];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
}

- (void)setBeginHeight:(CGFloat)beginHeight
{
    _beginHeight = beginHeight;
    BaseUIData *uidata = [BaseUIData GetInstance];
    self.tableView.frame = CGRectMake(0, beginHeight, 280, uidata.screenheight - beginHeight);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.sectionlist count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSAssert([[self.rowlist objectAtIndex:section] isKindOfClass:[NSArray class]], @"datalist is two-dimensional");
    
    return [[self.rowlist objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:self.cellName];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:self.cellName];
    }
    
    if ([[self.rowlist objectAtIndex:indexPath.section] count] > 0) {
        cell = [self createCell:[[self.rowlist objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    }
    cell.selectionStyle  = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UITableViewCell *)createCell:(id)object
{
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sectionlist objectAtIndex:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self createViewForHeaderSection:section];
}

- (UIView*)createViewForHeaderSection:(NSInteger)section
{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self heightForHeaderInSection:section];
}

- (CGFloat)heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self heightForRow:indexPath];
}

- (CGFloat)heightForRow:(NSIndexPath *)indexPath
{
    return 45;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self respondsToSelector:@selector(didSelectIndexPath:)]) {
        [self didSelectIndexPath:indexPath];
    }
}

- (void)didSelectIndexPath:(NSIndexPath *)indexPath
{
}

@end
