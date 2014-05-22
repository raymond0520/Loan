//
//  RepayBorrowViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-8.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "RepayBorrowViewController.h"
#import "BaseData.h"
#import "CenterViewController.h"
#import "RepayBorrowCell.h"

#define TAG_SORT_VIEW     0x10
#define TAG_VIEW_SUMMARY  0x11
#define TAG_LBL_NUMS      0x12
#define TAG_LBL_3         0x13
#define TAG_LBL_4         0x14
#define TAG_LBL_AMOUNT    0x15
#define TAG_LBL_5         0x16
#define TAG_LBL_PRINCIPAL 0x17
#define TAG_LBL_6         0x18
#define TAG_LBL_INTEREST  0x19

@interface RepayBorrowViewController ()

@end

@implementation RepayBorrowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.repayBorrowType = 1;
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
    
    self.controllerTitle = @"偿还借款";
    self.leftButton.hidden = NO;
    
    self.EnableLoadMore = NO;
    self.EnableRefresh = NO;
    
    self.beginheight = NAVIGATION_HEADER + 123;
    self.footheight = 0;
    self.mTableView.backgroundColor = RGBCOLOR(228, 228, 228);
    
    NSArray * sortArray = [NSArray arrayWithObjects:@"回待偿还借款", @"已还清借款", @"逾期借款", nil];
    UISortView * sortView = [[UISortView alloc] initWithFrame:CGRectMake(0,NAVIGATION_HEADER, 320, 35) element:sortArray];
    sortView.delegate = self;
    sortView.tag = TAG_SORT_VIEW;
    [self.view addSubview:sortView];
    
    BaseData *data = [BaseData GetInstance];
    
    //摘要
    UIView *viewSummary = [[UIView alloc] initWithFrame:CGRectMake(0, NAVIGATION_HEADER + 35, 320, 88)];
    viewSummary.tag = TAG_VIEW_SUMMARY;
    viewSummary.backgroundColor = RGBCOLOR(228, 228, 228);
    [self.view addSubview:viewSummary];
    
    UIImage *image = [UIImage imageNamed:@"bg_jag.png"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    UIImageView *imgviewSummary = [[UIImageView alloc] initWithImage:image];
    imgviewSummary.frame = CGRectMake(0, 0, CGRectGetWidth(viewSummary.frame), CGRectGetHeight(viewSummary.frame));
    [viewSummary addSubview:imgviewSummary];
    
    NSString *strSize = @"字高度";
    CGSize fontSize = [strSize sizeWithFont:[UIFont systemFontOfSize:13]];
    
    //借款待回收笔数
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(16, 13, 13, fontSize.height)];
    lbl1.backgroundColor = [UIColor clearColor];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.textColor = RGBCOLOR(51, 51, 51);
    lbl1.font = [UIFont systemFontOfSize:13];
    lbl1.text = @"共";
    [viewSummary addSubview:lbl1];
    
    NSString *strNums = [NSString stringWithFormat:@"%d", data.toPayBorrow.totalNums];
    CGSize sizeNums = [strNums sizeWithFont:[UIFont systemFontOfSize:13]
                          constrainedToSize:CGSizeMake(100, 30)
                              lineBreakMode:NSLineBreakByTruncatingTail];
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl1.frame),
                                                              13, sizeNums.width, sizeNums.height)];
    lbl2.tag = TAG_LBL_NUMS;
    lbl2.backgroundColor = [UIColor clearColor];
    lbl2.textAlignment = NSTextAlignmentCenter;
    lbl2.textColor = RGBCOLOR(198, 2, 1);
    lbl2.font = [UIFont systemFontOfSize:13];
    lbl2.text = [NSString stringWithFormat:@"%d", data.toPayBorrow.totalNums];
    [viewSummary addSubview:lbl2];
    
    
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl2.frame),
                                                              13, 100, fontSize.height)];
    lbl3.tag = TAG_LBL_3;
    lbl3.backgroundColor = [UIColor clearColor];
    lbl3.textAlignment = NSTextAlignmentLeft;
    lbl3.textColor = RGBCOLOR(51, 51, 51);
    lbl3.font = [UIFont systemFontOfSize:13];
    lbl3.text = @"笔借款待偿还";
    [viewSummary addSubview:lbl3];
    
    //待回收总额
    UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(lbl1.frame) + 12,
                                                              65, fontSize.height)];
    lbl4.tag = TAG_LBL_4;
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.textAlignment = NSTextAlignmentLeft;
    lbl4.textColor = RGBCOLOR(136, 136, 136);
    lbl4.font = [UIFont systemFontOfSize:13];
    lbl4.text = @"待还总额";
    [viewSummary addSubview:lbl4];
    
    UILabel *lblAmount = [[UILabel alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(lbl4.frame) + 3,
                                                                   100, fontSize.height)];
    lblAmount.tag = TAG_LBL_AMOUNT;
    lblAmount.backgroundColor = [UIColor clearColor];
    lblAmount.textAlignment = NSTextAlignmentLeft;
    lblAmount.textColor = RGBCOLOR(198, 2, 1);
    lblAmount.font = [UIFont systemFontOfSize:13];
    lblAmount.text = [NSString stringWithFormat:@"¥%.2f", data.toPayBorrow.totalAmount];
    [viewSummary addSubview:lblAmount];
    
    //待回收本金
    UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(130, CGRectGetMaxY(lbl1.frame) + 12,
                                                              65, fontSize.height)];
    lbl5.tag = TAG_LBL_5;
    lbl5.backgroundColor = [UIColor clearColor];
    lbl5.textAlignment = NSTextAlignmentLeft;
    lbl5.textColor = RGBCOLOR(136, 136, 136);
    lbl5.font = [UIFont systemFontOfSize:13];
    lbl5.text = @"待还本金";
    [viewSummary addSubview:lbl5];
    
    UILabel *lblPrincipal = [[UILabel alloc] initWithFrame:CGRectMake(130, CGRectGetMaxY(lbl5.frame) + 3,
                                                                      100, fontSize.height)];
    lblPrincipal.tag = TAG_LBL_PRINCIPAL;
    lblPrincipal.backgroundColor = [UIColor clearColor];
    lblPrincipal.textAlignment = NSTextAlignmentLeft;
    lblPrincipal.textColor = RGBCOLOR(198, 2, 1);
    lblPrincipal.font = [UIFont systemFontOfSize:13];
    lblPrincipal.text = [NSString stringWithFormat:@"¥%.2f", data.toPayBorrow.principal];
    [viewSummary addSubview:lblPrincipal];
    
    //待回收利息
    UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(242, CGRectGetMaxY(lbl1.frame) + 12,
                                                              65, fontSize.height)];
    lbl6.tag = TAG_LBL_6;
    lbl6.backgroundColor = [UIColor clearColor];
    lbl6.textAlignment = NSTextAlignmentLeft;
    lbl6.textColor = RGBCOLOR(136, 136, 136);
    lbl6.font = [UIFont systemFontOfSize:13];
    lbl6.text = @"待还利息";
    [viewSummary addSubview:lbl6];
    
    UILabel *lblInterest = [[UILabel alloc] initWithFrame:CGRectMake(242, CGRectGetMaxY(lbl6.frame) + 3,
                                                                     100, fontSize.height)];
    lblInterest.tag = TAG_LBL_INTEREST;
    lblInterest.backgroundColor = [UIColor clearColor];
    lblInterest.textAlignment = NSTextAlignmentLeft;
    lblInterest.textColor = RGBCOLOR(198, 2, 1);
    lblInterest.font = [UIFont systemFontOfSize:13];
    lblInterest.text = [NSString stringWithFormat:@"¥%.2f", data.toPayBorrow.interest];
    [viewSummary addSubview:lblInterest];
    
}

- (void)initDatalist
{
    BaseData *data = [BaseData GetInstance];
    self.datalist = data.toPayBorrow.toPayBorrowingList;
}

#pragma mark -
#pragma mark UITableView data source
- (UITableViewCell *)CreateCell:(id)object
{
    RepayBorrowCell *cell = [[RepayBorrowCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:@"cell_repayBorrow"];
    cell.repayBorrowType = self.repayBorrowType;
    cell.feed = (RepayBorrowItem *)object;
    return cell;
}

- (int)setTableViewHeight:(int)row
{
    return 90;
}

#pragma mark -
#pragma mark UISortView delegate
- (void)SelectedButtonClick
{
    BaseData *data = [BaseData GetInstance];
    UIView *viewSummary = (UIView *)[self.view viewWithTag:TAG_VIEW_SUMMARY];
    
    UISortView * selectedview = (UISortView*)[self.view viewWithTag:TAG_SORT_VIEW];
    switch (selectedview.selectedIndex) {
        case 1:
        {
            UILabel *lblNums = (UILabel *)[viewSummary viewWithTag:TAG_LBL_NUMS];
            lblNums.text = [NSString stringWithFormat:@"%d", data.toPayBorrow.totalNums];
            
            NSString *strNums = [NSString stringWithFormat:@"%d", data.toPayBorrow.totalNums];
            CGSize sizeNums = [strNums sizeWithFont:[UIFont systemFontOfSize:13]
                                  constrainedToSize:CGSizeMake(100, 30)
                                      lineBreakMode:NSLineBreakByTruncatingTail];
            lblNums.frame = CGRectMake(CGRectGetMinX(lblNums.frame), CGRectGetMinY(lblNums.frame),
                                       sizeNums.width, sizeNums.height);
            
            UILabel *lbl3 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_3];
            lbl3.text = @"借款待偿还";
            lbl3.frame = CGRectMake(CGRectGetMaxX(lblNums.frame), CGRectGetMinY(lblNums.frame),
                                       CGRectGetWidth(lbl3.frame), CGRectGetHeight(lbl3.frame));
            
            UILabel *lbl4 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_4];
            lbl4.text = @"待还总额";
            
            UILabel *lblAmount = (UILabel *)[viewSummary viewWithTag:TAG_LBL_AMOUNT];
            lblAmount.text = [NSString stringWithFormat:@"¥%.2f", data.toPayBorrow.totalAmount];
            
            UILabel *lbl5 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_5];
            lbl5.text = @"待还本金";
            
            UILabel *lblPrincipal = (UILabel *)[viewSummary viewWithTag:TAG_LBL_PRINCIPAL];
            lblPrincipal.text = [NSString stringWithFormat:@"¥%.2f", data.toPayBorrow.principal];
            
            UILabel *lbl6 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_6];
            lbl6.text = @"待还利息";
            
            UILabel *lblInterest = (UILabel *)[viewSummary viewWithTag:TAG_LBL_INTEREST];
            lblInterest.text = [NSString stringWithFormat:@"¥%.2f", data.toPayBorrow.interest];
            
            self.repayBorrowType = 1;
            self.datalist = data.toPayBorrow.toPayBorrowingList;
            [self.mTableView reloadData];
            
            break;
        }
        case 2:
        {
            UILabel *lblNums = (UILabel *)[viewSummary viewWithTag:TAG_LBL_NUMS];
            lblNums.text = [NSString stringWithFormat:@"%d", data.paidOffBorrow.totalNums];
            
            NSString *strNums = [NSString stringWithFormat:@"%d", data.paidOffBorrow.totalNums];
            CGSize sizeNums = [strNums sizeWithFont:[UIFont systemFontOfSize:13]
                                  constrainedToSize:CGSizeMake(100, 30)
                                      lineBreakMode:NSLineBreakByTruncatingTail];
            lblNums.frame = CGRectMake(CGRectGetMinX(lblNums.frame), CGRectGetMinY(lblNums.frame),
                                       sizeNums.width, sizeNums.height);

            
            UILabel *lbl3 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_3];
            lbl3.text = @"借款已还清";
            lbl3.frame = CGRectMake(CGRectGetMaxX(lblNums.frame), CGRectGetMinY(lblNums.frame),
                                    CGRectGetWidth(lbl3.frame), CGRectGetHeight(lbl3.frame));
            
            UILabel *lbl4 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_4];
            lbl4.text = @"已还总额";
            
            UILabel *lblAmount = (UILabel *)[viewSummary viewWithTag:TAG_LBL_AMOUNT];
            lblAmount.text = [NSString stringWithFormat:@"¥%.2f", data.paidOffBorrow.totalAmount];
            
            UILabel *lbl5 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_5];
            lbl5.text = @"已还本金";
            
            UILabel *lblPrincipal = (UILabel *)[viewSummary viewWithTag:TAG_LBL_PRINCIPAL];
            lblPrincipal.text = [NSString stringWithFormat:@"¥%.2f", data.paidOffBorrow.principal];
            
            UILabel *lbl6 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_6];
            lbl6.text = @"已还利息";
            
            UILabel *lblInterest = (UILabel *)[viewSummary viewWithTag:TAG_LBL_INTEREST];
            lblInterest.text = [NSString stringWithFormat:@"¥%.2f", data.paidOffBorrow.interest];
            
            self.repayBorrowType = 2;
            self.datalist = data.paidOffBorrow.paidOffList;
            [self.mTableView reloadData];
            
            break;
        }
        case 3:
        {
            UILabel *lblNums = (UILabel *)[viewSummary viewWithTag:TAG_LBL_NUMS];
            lblNums.text = [NSString stringWithFormat:@"%d", data.overdueBorrow.totalNums];
            
            NSString *strNums = [NSString stringWithFormat:@"%d", data.overdueBorrow.totalNums];
            CGSize sizeNums = [strNums sizeWithFont:[UIFont systemFontOfSize:13]
                                  constrainedToSize:CGSizeMake(100, 30)
                                      lineBreakMode:NSLineBreakByTruncatingTail];
            lblNums.frame = CGRectMake(CGRectGetMinX(lblNums.frame), CGRectGetMinY(lblNums.frame),
                                       sizeNums.width, sizeNums.height);
            
            UILabel *lbl3 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_3];
            lbl3.text = @"借款已逾期";
            lbl3.frame = CGRectMake(CGRectGetMaxX(lblNums.frame), CGRectGetMinY(lblNums.frame),
                                    CGRectGetWidth(lbl3.frame), CGRectGetHeight(lbl3.frame));
            
            UILabel *lbl4 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_4];
            lbl4.text = @"逾期本息";
            
            UILabel *lblAmount = (UILabel *)[viewSummary viewWithTag:TAG_LBL_AMOUNT];
            lblAmount.text = [NSString stringWithFormat:@"¥%.2f", data.overdueBorrow.principalInterest];
            
            UILabel *lbl5 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_5];
            lbl5.text = @"逾期本金";
            
            UILabel *lblPrincipal = (UILabel *)[viewSummary viewWithTag:TAG_LBL_PRINCIPAL];
            lblPrincipal.text = [NSString stringWithFormat:@"¥%.2f", data.overdueBorrow.principal];
            
            UILabel *lbl6 = (UILabel *)[viewSummary viewWithTag:TAG_LBL_6];
            lbl6.text = @"逾期利息";
            
            UILabel *lblInterest = (UILabel *)[viewSummary viewWithTag:TAG_LBL_INTEREST];
            lblInterest.text = [NSString stringWithFormat:@"¥%.2f", data.overdueBorrow.interest];
            
            self.repayBorrowType = 3;
            self.datalist = data.overdueBorrow.overdueList;
            [self.mTableView reloadData];
            
            break;
        }
        default:
            break;
    }
}

#pragma mark -
#pragma mark back to home
- (void)leftButtonClick:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    CenterViewController *center = [[CenterViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:center];
    
    [self.mm_drawerController setCenterViewController:nav
                                   withCloseAnimation:NO
                                           completion:nil];
}

@end
