//
//  AccountRechargeViewController.m
//  Loan
//
//  Created by hdk-mac on 14-1-9.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "AccountRechargeViewController.h"
#import "BaseData.h"
#import "CenterViewController.h"
#import "RechargeCell.h"
#import "RechargeRecordItem.h"

#define TAG_SORT_VIEW               0x10
#define TAG_SCROLL_VIEW             0x12
#define TAG_TXTFIELD_AMOUNT         0x13
#define TAG_LBL_SELECTED_BANK       0x14
#define TAG_PICKERVIEW              0x15
#define TAG_BTN_GET_SELECTED_BUTTON 0x16
#define TAG_BTN_MODE_SFT            0x17
#define TAG_BTN_MODE_BANK           0x18
#define TAG_VIEW_SELECTED_CONFIRM   0x19

@interface AccountRechargeViewController ()

@end

@implementation AccountRechargeViewController

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
    
    self.controllerTitle = @"账户充值";
    self.leftButton.hidden = NO;
    
    self.beginheight = NAVIGATION_HEADER + 35 + 60;
    self.footheight = 0;
    self.mTableView.backgroundColor = RGBCOLOR(228, 228, 228);
    self.EnableLoadMore = NO;
    self.EnableRefresh = NO;
    
    NSArray *sortArray = [NSArray arrayWithObjects:@"在线充值", @"充值记录", nil];
    UISortView *sortView = [[UISortView alloc] initWithFrame:CGRectMake(0, NAVIGATION_HEADER, 320, 35) element:sortArray];
    sortView.delegate = self;
    sortView.tag = TAG_SORT_VIEW;
    [self.view addSubview:sortView];
    
    //添加搜索栏
    UIView *viewSearch = [[UIView alloc] initWithFrame:CGRectMake(0, NAVIGATION_HEADER + 35, 320, 60)];
    viewSearch.backgroundColor = RGBCOLOR(228, 228, 228);
    self.viewSearch = viewSearch;
    
    UIImage *image = [UIImage imageNamed:@"bg_jag.png"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    UIImageView *imgviewSearch = [[UIImageView alloc] initWithImage:image];
    imgviewSearch.frame = CGRectMake(0, 0, CGRectGetWidth(viewSearch.frame), CGRectGetHeight(viewSearch.frame));
    [viewSearch addSubview:imgviewSearch];
    
    UITextField *txtFieldTimeEarly = [[UITextField alloc] initWithFrame:CGRectMake(12, 15, 87, 28)];
    txtFieldTimeEarly.tag = TAG_TXTFIELD_AMOUNT;
    txtFieldTimeEarly.delegate = self;
    txtFieldTimeEarly.backgroundColor = RGBCOLOR(246, 246, 246);
    txtFieldTimeEarly.borderStyle = UITextBorderStyleRoundedRect;
    txtFieldTimeEarly.clearButtonMode = UITextFieldViewModeAlways;
    txtFieldTimeEarly.textAlignment = NSTextAlignmentCenter;
    txtFieldTimeEarly.textColor = RGBCOLOR(51, 51, 51);
    txtFieldTimeEarly.font = [UIFont systemFontOfSize:14];
    txtFieldTimeEarly.placeholder = @"";
    txtFieldTimeEarly.returnKeyType = UIReturnKeyDone;
    txtFieldTimeEarly.keyboardType = UIKeyboardTypeASCIICapable;
    txtFieldTimeEarly.keyboardAppearance = UIKeyboardAppearanceDark;
    [viewSearch addSubview:txtFieldTimeEarly];
    
    UILabel *lblTo = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(txtFieldTimeEarly.frame) + 5,
                                                               22, 15, 15)];
    lblTo.backgroundColor = [UIColor clearColor];
    lblTo.textAlignment = NSTextAlignmentCenter;
    lblTo.textColor = RGBCOLOR(130, 130, 130);
    lblTo.font = [UIFont systemFontOfSize:14];
    lblTo.text = @"至";
    [viewSearch addSubview:lblTo];
    
    UITextField *txtFieldTimeLate = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lblTo.frame) + 5,
                                                                                  15, 87, 28)];
    txtFieldTimeLate.tag = TAG_TXTFIELD_AMOUNT;
    txtFieldTimeLate.delegate = self;
    txtFieldTimeLate.backgroundColor = RGBCOLOR(246, 246, 246);
    txtFieldTimeLate.borderStyle = UITextBorderStyleRoundedRect;
    txtFieldTimeLate.clearButtonMode = UITextFieldViewModeAlways;
    txtFieldTimeLate.textAlignment = NSTextAlignmentCenter;
    txtFieldTimeLate.textColor = RGBCOLOR(51, 51, 51);
    txtFieldTimeLate.font = [UIFont systemFontOfSize:14];
    txtFieldTimeLate.placeholder = @"";
    txtFieldTimeLate.returnKeyType = UIReturnKeyDone;
    txtFieldTimeLate.keyboardType = UIKeyboardTypeASCIICapable;
    txtFieldTimeLate.keyboardAppearance = UIKeyboardAppearanceDark;
    [viewSearch addSubview:txtFieldTimeLate];
    
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSearch.frame = CGRectMake(CGRectGetMaxX(txtFieldTimeLate.frame) + 12, 15, 58, 28);
    [btnSearch setBackgroundImage:[UIImage imageNamed:@"bg_btn_account.png"] forState:UIControlStateNormal];
    [btnSearch setTitle:@"查询" forState:UIControlStateNormal];
    btnSearch.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSearch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSearch addTarget:self
                  action:@selector(didBtnSearch:)
        forControlEvents:UIControlEventTouchUpInside];
    [viewSearch addSubview:btnSearch];
    
    [self setRechargeView];
}

//创建充值页面
- (void)setRechargeView
{
    UIScrollView *scrView = [[UIScrollView alloc] init];
    scrView.tag = TAG_SCROLL_VIEW;
    scrView.backgroundColor = RGBCOLOR(228, 228, 228);
    scrView.frame = CGRectMake(0, NAVIGATION_HEADER + 35, 320, CGRectGetHeight(self.view.frame) - NAVIGATION_HEADER - 35);
    scrView.contentSize = CGSizeMake(CGRectGetWidth(scrView.frame), 460);
    scrView.delegate = self;
    scrView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrView];
    self.scrView = scrView;
    
    BaseData *data = [BaseData GetInstance];
    
    NSString *strFont = @"字高度";
    CGSize fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
    
    //用户名
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 50, fontSize.height)];
    lbl1.backgroundColor = [UIColor clearColor];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.textColor = RGBCOLOR(130, 130, 130);
    lbl1.font = [UIFont systemFontOfSize:14];
    lbl1.text = @"用户名:";
    [scrView addSubview:lbl1];
    
    UILabel *lblUserName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl1.frame) + 2,
                                                                     CGRectGetMinY(lbl1.frame), 200, fontSize.height)];
    lblUserName.backgroundColor = [UIColor clearColor];
    lblUserName.textAlignment = NSTextAlignmentLeft;
    lblUserName.textColor = RGBCOLOR(51, 51, 51);
    lblUserName.font = [UIFont systemFontOfSize:14];
    lblUserName.text = data.userInfo.userName;
    [scrView addSubview:lblUserName];
    
    //目前账户可用余额
    UILabel *lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lbl1.frame) + 20, 120, fontSize.height)];
    lbl2.backgroundColor = [UIColor clearColor];
    lbl2.textAlignment = NSTextAlignmentLeft;
    lbl2.textColor = RGBCOLOR(130, 130, 130);
    lbl2.font = [UIFont systemFontOfSize:14];
    lbl2.text = @"目前账户可用余额:";
    [scrView addSubview:lbl2];
    
    UILabel *lblAvailableBalance = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl2.frame) + 2,
                                                                             CGRectGetMinY(lbl2.frame), 120, fontSize.height)];
    lblAvailableBalance.backgroundColor = [UIColor clearColor];
    lblAvailableBalance.textAlignment = NSTextAlignmentLeft;
    lblAvailableBalance.textColor = RGBCOLOR(51, 51, 51);
    lblAvailableBalance.font = [UIFont systemFontOfSize:14];
    lblAvailableBalance.text = [NSString stringWithFormat:@"¥%.2f元", data.accountStatistic.availableBalance];
    [scrView addSubview:lblAvailableBalance];
    
    //充值金额
    UILabel *lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lbl2.frame) + 20, 62, fontSize.height)];
    lbl3.backgroundColor = [UIColor clearColor];
    lbl3.textAlignment = NSTextAlignmentLeft;
    lbl3.textColor = RGBCOLOR(130, 130, 130);
    lbl3.font = [UIFont systemFontOfSize:14];
    lbl3.text = @"充值金额:";
    [scrView addSubview:lbl3];
    
    UITextField *txtField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl3.frame) + 3,
                                                                          CGRectGetMidY(lbl3.frame) - 14, 100, 28)];
    txtField.tag = TAG_TXTFIELD_AMOUNT;
    txtField.delegate = self;
    txtField.backgroundColor = RGBCOLOR(246, 246, 246);
    txtField.borderStyle = UITextBorderStyleRoundedRect;
    txtField.clearButtonMode = UITextFieldViewModeAlways;
    txtField.textAlignment = NSTextAlignmentCenter;
    txtField.textColor = RGBCOLOR(51, 51, 51);
    txtField.font = [UIFont systemFontOfSize:14];
    txtField.placeholder = @"填写金额";
    txtField.returnKeyType = UIReturnKeyDone;
    txtField.keyboardType = UIKeyboardTypeASCIICapable;
    txtField.keyboardAppearance = UIKeyboardAppearanceDark;
    [scrView addSubview:txtField];
    
    UILabel *lblYuan = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(txtField.frame) + 5,
                                                                 CGRectGetMinY(lbl3.frame), 100, fontSize.height)];
    lblYuan.backgroundColor = [UIColor clearColor];
    lblYuan.textAlignment = NSTextAlignmentLeft;
    lblYuan.textColor = RGBCOLOR(51, 51, 51);
    lblYuan.font = [UIFont systemFontOfSize:14];
    lblYuan.text = @"元";
    [scrView addSubview:lblYuan];
    
    //实际到帐金额
    UILabel *lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(lbl3.frame) + 20, 89, fontSize.height)];
    lbl4.backgroundColor = [UIColor clearColor];
    lbl4.textAlignment = NSTextAlignmentLeft;
    lbl4.textColor = RGBCOLOR(130, 130, 130);
    lbl4.font = [UIFont systemFontOfSize:14];
    lbl4.text = @"实际到账金额:";
    [scrView addSubview:lbl4];
    
    UILabel *lblArrivalAmount = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lbl4.frame) + 3,
                                                                          CGRectGetMinY(lbl4.frame), 120, fontSize.height)];
    lblArrivalAmount.backgroundColor = [UIColor clearColor];
    lblArrivalAmount.textAlignment = NSTextAlignmentLeft;
    lblArrivalAmount.textColor = RGBCOLOR(51, 51, 51);
    lblArrivalAmount.font = [UIFont systemFontOfSize:14];
    lblArrivalAmount.text = [NSString stringWithFormat:@"¥%.2f元", 0.0];
    [scrView addSubview:lblArrivalAmount];
    
    //分割线
    UIImageView *imgviewLine1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_fund.png"]];
    imgviewLine1.frame = CGRectMake(0, CGRectGetMaxY(lbl4.frame) + 20, 320, 1);
    [scrView addSubview:imgviewLine1];
    
    //盛付通充值
    UIButton *btnSFTRecharge = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSFTRecharge.tag = TAG_BTN_MODE_SFT;
    btnSFTRecharge.frame = CGRectMake(12, CGRectGetMaxY(imgviewLine1.frame) + 15, 20, 20);
    [btnSFTRecharge setImage:[UIImage imageNamed:@"radio_normal.png"] forState:UIControlStateNormal];
    [btnSFTRecharge setImage:[UIImage imageNamed:@"radio_current_selected.png"] forState:UIControlStateSelected];
    [btnSFTRecharge addTarget:self
                       action:@selector(didSelectedRechargeMode:)
             forControlEvents:UIControlEventTouchUpInside];
    btnSFTRecharge.selected = YES;
    [scrView addSubview:btnSFTRecharge];
    
    UILabel *lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnSFTRecharge.frame) + 5,
                                                              CGRectGetMidY(btnSFTRecharge.frame) - fontSize.height/2,
                                                              100, fontSize.height)];
    lbl5.backgroundColor = [UIColor clearColor];
    lbl5.textAlignment = NSTextAlignmentLeft;
    lbl5.textColor = RGBCOLOR(51, 51, 51);
    lbl5.font = [UIFont systemFontOfSize:14];
    lbl5.text = @"盛付通充值";
    [scrView addSubview:lbl5];
    
    UIImageView *imgviewSFT = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic_sft.png"]];
    imgviewSFT.frame = CGRectMake(15, CGRectGetMaxY(btnSFTRecharge.frame) + 8, 82, 29);
    [scrView addSubview:imgviewSFT];
    
    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:12]];
    UILabel *lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgviewSFT.frame) + 5,
                                                              CGRectGetMidY(imgviewSFT.frame) - fontSize.height/2,
                                                              220, fontSize.height)];
    lbl6.backgroundColor = [UIColor clearColor];
    lbl6.textAlignment = NSTextAlignmentLeft;
    lbl6.textColor = RGBCOLOR(130, 130, 130);
    lbl6.font = [UIFont systemFontOfSize:12];
    lbl6.text = @"（可以使用盛付通账户余额进行充值）";
    [scrView addSubview:lbl6];
    
    //分割线
    UIImageView *imgviewLine2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_fund.png"]];
    imgviewLine2.frame = CGRectMake(0, CGRectGetMaxY(imgviewSFT.frame) + 20, 320, 1);
    [scrView addSubview:imgviewLine2];
    
    //银行卡充值
    UIButton *btnBankCard = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBankCard.tag = TAG_BTN_MODE_BANK;
    btnBankCard.frame = CGRectMake(12, CGRectGetMaxY(imgviewLine2.frame) + 15, 20, 20);
    [btnBankCard setImage:[UIImage imageNamed:@"radio_normal.png"] forState:UIControlStateNormal];
    [btnBankCard setImage:[UIImage imageNamed:@"radio_current_selected.png"] forState:UIControlStateSelected];
    [btnBankCard addTarget:self
                    action:@selector(didSelectedRechargeMode:)
          forControlEvents:UIControlEventTouchUpInside];
    [scrView addSubview:btnBankCard];
    
    fontSize = [strFont sizeWithFont:[UIFont systemFontOfSize:14]];
    
    UILabel *lbl7 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnBankCard.frame) + 5,
                                                              CGRectGetMidY(btnBankCard.frame) - fontSize.height/2,
                                                              100, fontSize.height)];
    lbl7.backgroundColor = [UIColor clearColor];
    lbl7.textAlignment = NSTextAlignmentLeft;
    lbl7.textColor = RGBCOLOR(51, 51, 51);
    lbl7.font = [UIFont systemFontOfSize:14];
    lbl7.text = @"银行卡充值";
    [scrView addSubview:lbl7];
    
    UILabel *lbl8 = [[UILabel alloc] initWithFrame:CGRectMake(12, CGRectGetMaxY(btnBankCard.frame) + 21,
                                                              63, fontSize.height)];
    lbl8.backgroundColor = [UIColor clearColor];
    lbl8.textAlignment = NSTextAlignmentLeft;
    lbl8.textColor = RGBCOLOR(130, 130, 130);
    lbl8.font = [UIFont systemFontOfSize:14];
    lbl8.text = @"选择银行:";
    [scrView addSubview:lbl8];
    
    UIButton *btnBankSelect = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBankSelect.backgroundColor = [UIColor clearColor];
    btnBankSelect.frame = CGRectMake(CGRectGetMaxX(lbl8.frame) + 5, CGRectGetMidY(lbl8.frame) - 14, 139, 28);
    [btnBankSelect setBackgroundImage:[UIImage imageNamed:@"bg_down_list.png"] forState:UIControlStateNormal];
    [btnBankSelect addTarget:self action:@selector(didSelectBankPressed:) forControlEvents:UIControlEventTouchUpInside];
    [scrView addSubview:btnBankSelect];
    
    CGSize sizeLblBank = [@"中国农业银行" sizeWithFont:[UIFont systemFontOfSize:15]
                         constrainedToSize:CGSizeMake(110, 30)
                             lineBreakMode:NSLineBreakByTruncatingTail];
    
    UILabel *lblSelectedBank = [[UILabel alloc] initWithFrame:CGRectMake(55 - sizeLblBank.width/2,
                                                                         14 - sizeLblBank.height/2,
                                                                         sizeLblBank.width, sizeLblBank.height)];
    lblSelectedBank.tag = TAG_LBL_SELECTED_BANK;
    lblSelectedBank.backgroundColor = [UIColor clearColor];
    lblSelectedBank.textAlignment = NSTextAlignmentCenter;
    lblSelectedBank.textColor = RGBCOLOR(51, 51, 51);
    lblSelectedBank.font = [UIFont systemFontOfSize:15];
    lblSelectedBank.text = @"中国农业银行";
    [btnBankSelect addSubview:lblSelectedBank];
    
    //分割线
    UIImageView *imgviewLine3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_separator_fund.png"]];
    imgviewLine3.frame = CGRectMake(0, CGRectGetMaxY(lbl8.frame) + 20, 320, 1);
    [scrView addSubview:imgviewLine3];
    
    //注意事项
    UIImageView *imgviewTips = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_tip_fund.png"]];
    imgviewTips.frame = CGRectMake(10, CGRectGetMaxY(imgviewLine3.frame) + 14, 300, 87);
    [scrView addSubview:imgviewTips];
    
    NSString *strTips = @"1.请注意您的银行卡充值限制，以免造成不便。\n2.如果充值金额没有到账，请和客服联系。\n3.玖玖贷禁止信用卡套现、虚假交易行为，一经发现，将予以处罚，包括但不限于：限制收款、冻结账户、永久停止服务，并可能影响相关信用记录。";
    CGSize sizeTips = [strTips sizeWithFont:[UIFont systemFontOfSize:12]
                          constrainedToSize:CGSizeMake(CGRectGetWidth(imgviewTips.frame) - 14, 87)
                              lineBreakMode:NSLineBreakByTruncatingTail];
    UILabel *lblTips = [[UILabel alloc] initWithFrame:CGRectMake(7, 7, CGRectGetWidth(imgviewTips.frame) - 14, sizeTips.height)];
    lblTips.backgroundColor = [UIColor clearColor];
    lblTips.textAlignment = NSTextAlignmentLeft;
    lblTips.textColor = RGBCOLOR(51, 51, 51);
    lblTips.font = [UIFont systemFontOfSize:12];
    lblTips.text = strTips;
    lblTips.numberOfLines = 0;
    lblTips.lineBreakMode = NSLineBreakByTruncatingTail;
    [imgviewTips addSubview:lblTips];
    
    scrView.contentSize = CGSizeMake(320, CGRectGetMaxY(imgviewTips.frame) + 5);

}

#pragma mark -
#pragma mark button pressed
- (void)didSelectedRechargeMode:(id)sender
{
    UIButton *btnMode = (UIButton *)sender;
    
    if (btnMode.tag == TAG_BTN_MODE_SFT) {
        btnMode.selected = YES;
        
        UIButton *btnBank = (UIButton *)[self.view viewWithTag:TAG_BTN_MODE_BANK];
        btnBank.selected = NO;
    }
    else{
        btnMode.selected = YES;
        
        UIButton *btnSFT = (UIButton *)[self.view viewWithTag:TAG_BTN_MODE_SFT];
        btnSFT.selected = NO;
    }
}

- (void)didSelectBankPressed:(id)sender
{
    self.bankList = [[NSMutableArray alloc] initWithObjects:@"中国银行", @"中国工商银行", @"中国建设银行", @"中国农业银行", @"招商银行",
                     @"交通银行", @"华夏银行", @"广州发展银行", @"上海浦发银行", @"汉口银行", nil];

    UIPickerView *pickerview = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.scrView.frame) - 216,
                                                                              320, 216)];
    pickerview.tag = TAG_PICKERVIEW;
    pickerview.backgroundColor = RGBCOLOR(239, 239, 239);
    pickerview.dataSource = self;
    pickerview.delegate = self;
    pickerview.showsSelectionIndicator = YES;
    [pickerview selectRow:floor([self.bankList count]/2) inComponent:0 animated:YES];
    [self.scrView addSubview:pickerview];
    [pickerview reloadAllComponents];
    
    UIView *viewSelectedConfrim = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(pickerview.frame) - 33, 320, 33)];
    viewSelectedConfrim.tag = TAG_VIEW_SELECTED_CONFIRM;
    viewSelectedConfrim.backgroundColor = [UIColor blueColor];
    [self.scrView addSubview:viewSelectedConfrim];
    
    UIImageView *imgviewSelectedConfirm = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_white_title_bank_selected.png"]];
    imgviewSelectedConfirm.frame = CGRectMake(0, 0, 320, 33);
    [viewSelectedConfrim addSubview:imgviewSelectedConfirm];
    
    UIButton *btnGetSelectedBank = [UIButton buttonWithType:UIButtonTypeCustom];
    btnGetSelectedBank.tag = TAG_BTN_GET_SELECTED_BUTTON;
    btnGetSelectedBank.backgroundColor = [UIColor clearColor];
    btnGetSelectedBank.frame = CGRectMake(CGRectGetMaxX(viewSelectedConfrim.frame) - 67,
                                          CGRectGetHeight(viewSelectedConfrim.frame)/2 - 14, 57, 28);
    [btnGetSelectedBank setTitle:@"确定" forState:UIControlStateNormal];
    [btnGetSelectedBank setTitleColor:RGBCOLOR(239, 239, 239) forState:UIControlStateNormal];
    btnGetSelectedBank.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnGetSelectedBank setBackgroundImage:[UIImage imageNamed:@"bg_btn_account.png"] forState:UIControlStateNormal];
    [btnGetSelectedBank addTarget:self
                           action:@selector(didGetSelectBankPressed:)
                 forControlEvents:UIControlEventTouchUpInside];
    [viewSelectedConfrim addSubview:btnGetSelectedBank];

}

- (void)didGetSelectBankPressed:(id)sender
{
    UIPickerView *pickerView = (UIPickerView *)[self.scrView viewWithTag:TAG_PICKERVIEW];
    CGSize sizeLblBank = [[self.bankList objectAtIndex:[pickerView selectedRowInComponent:0]] sizeWithFont:[UIFont systemFontOfSize:15]
                                                                                         constrainedToSize:CGSizeMake(100, 30)
                                                                                             lineBreakMode:NSLineBreakByTruncatingTail];
    UILabel *lblSelectedBank = (UILabel *)[self.scrView viewWithTag:TAG_LBL_SELECTED_BANK];
    lblSelectedBank.frame = CGRectMake(55 - sizeLblBank.width/2,
                                       14 - sizeLblBank.height/2,
                                       sizeLblBank.width, sizeLblBank.height);
    lblSelectedBank.text = [self.bankList objectAtIndex:[pickerView selectedRowInComponent:0]];
    [pickerView removeFromSuperview];
    
    UIView *viewSelectedConfrim = (UIView *)[self.view viewWithTag:TAG_VIEW_SELECTED_CONFIRM];
    [viewSelectedConfrim removeFromSuperview];
}
#pragma mark -
#pragma mark UIPickerView datasource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.bankList count];
}
#pragma mark -
#pragma mark UIPickerView delegate
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.bankList objectAtIndex:row];
}

#pragma mark -
#pragma mark tableview data source
- (int)setTableViewHeight:(int)row
{
    return 60;
}

- (UITableViewCell *)CreateCell:(id)object
{
    RechargeCell *cell = [[RechargeCell alloc] initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:@"cell_recharge"];
    cell.feed = (RechargeRecordItem *)object;
    return cell;
}

#pragma mark -
#pragma mark UISortView delegate
- (void)SelectedButtonClick
{
    UISortView * selectedview = (UISortView*)[self.view viewWithTag:TAG_SORT_VIEW];
    switch (selectedview.selectedIndex) {
        case 1:{
            [self.view addSubview:self.scrView];
            
            [self.viewSearch removeFromSuperview];
            
            [self.mTableView removeFromSuperview];
            
            self.controllerTitle = [selectedview.titlearray objectAtIndex:selectedview.selectedIndex - 1];
            
            break;
        }
        case 2:{
            UIScrollView *scrView = (UIScrollView *)[self.view viewWithTag:TAG_SCROLL_VIEW];
            UIPickerView *pickerView = (UIPickerView *)[self.scrView viewWithTag:TAG_PICKERVIEW];
            UIView *viewSelectedConfrim = (UIView *)[self.view viewWithTag:TAG_VIEW_SELECTED_CONFIRM];
            [pickerView removeFromSuperview];
            [viewSelectedConfrim removeFromSuperview];
            [scrView removeFromSuperview];
            
            [self.view addSubview:self.viewSearch];
            
            [self.view addSubview:self.mTableView];
            
            BaseData *data = [BaseData GetInstance];
            self.datalist = data.rechargeList;
            
            [self.mTableView reloadData];
            
            self.controllerTitle = [selectedview.titlearray objectAtIndex:selectedview.selectedIndex - 1];
            
            break;
        }
    }
}

#pragma mark -
#pragma mark 查询按钮交互
- (void)didBtnSearch:(id)sender
{
    
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
{
    UITextField *txtField = (UITextField *)[self.view viewWithTag:TAG_TXTFIELD_AMOUNT];
    if (txtField.isFirstResponder) {
        [txtField resignFirstResponder];
    }
    return YES;
}

@end
