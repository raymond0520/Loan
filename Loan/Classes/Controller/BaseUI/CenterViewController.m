//
//  CenterViewController.m
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 hdk. All rights reserved.
//

#import "CenterViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "BaseUIData.h"
#import "UIImage+Cut.h"
#import <QuartzCore/QuartzCore.h>
#import "GuideCell.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "InvestmentViewController.h"
#import "BaseData.h"
#import "AccountRechargeViewController.h"
#import "AccountWithdrawalViewController.h"
#import "UserCenterViewController.h"
#import "NewsViewController.h"
#import "CommunityViewController.h"
#import "NewsDetailViewController.h"
#import "RepayBorrowViewController.h"

#define RING_CLIP_VIEW         101
#define INVERSTMENT_BTN        102
#define AMOUNT_VIEW            103
#define TAG_BTN_RECHARGE       104
#define TAG_BTN_WITHDRAW       105
#define TAG_BTN_ACCOUNT        106
#define TAG_BTN_NEWS           107
#define TAG_BTN_COMMUNITY      108
#define TAG_BTN_REPAY          109

@interface CenterViewController ()

@end

@implementation CenterViewController

UILabel *_availableAmoutTitle;
UILabel *_availableAmoutLab;
UILabel *_remainOweTitle;
UILabel *_remainOweDollars;
UILabel *_remainOweRenminbi;
@synthesize tinyCircleImageView=_tinyCircleImageView;
@synthesize choosePicStyleView=_choosePicStyleView;
@synthesize entertainmentList=_entertainmentList;
@synthesize loginBtn=_loginBtn;
@synthesize instructionLab=_instructionLab;
@synthesize availableAmoutTitle=_availableAmoutTitle;
@synthesize availableAmoutLab=_availableAmoutLab;
@synthesize remainOweDollars=_remainOweDollars;
@synthesize remainOweTitle=_remainOweTitle;
@synthesize remainOweRenminbi=_remainOweRenminbi;
@synthesize announceList = _announceList;
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
    
    [self InitUI];
    [self initDatalist];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    BaseData *baseData=[BaseData GetInstance];
    UserInfo *userInfo=baseData.userInfo;
    if (userInfo.isLogin==YES) {
        self.loginBtn.hidden=YES;
        self.instructionLab.hidden=YES;
        UIView *amontView=[self.view viewWithTag:AMOUNT_VIEW];
        amontView.hidden=NO;
    }
}

- (void)InitUI
{
    [super InitUI];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //判断statusbar的高度，决定起始坐标的Y值
    CGFloat statusBarHeight = OSVersionIsAtLeastiOS7() ? 20 : 0;
    
    UIView *infoView=[[UIView alloc] initWithFrame:CGRectMake(0, statusBarHeight, 320, 230)];
    infoView.backgroundColor=[UIColor redColor];
    
    UIImageView *topBackgroundImg=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 230)];
    topBackgroundImg.image=[UIImage imageNamed:@"top_bg.png"];
    [infoView addSubview:topBackgroundImg];
    
    [self.view addSubview:infoView];
    
    
    BaseUIData *UIData=[BaseUIData GetInstance];
    
    UIButton *menuBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    menuBtn.frame=CGRectMake(6, 6,40 ,40);
    [menuBtn setImage:[UIImage imageNamed:@"title_ico_set.png"] forState:UIControlStateNormal];
    [menuBtn setImage:[UIImage imageNamed:@"ico_set_hover.png"] forState:UIControlStateHighlighted];
    [menuBtn setAdjustsImageWhenHighlighted:NO];
    [menuBtn addTarget:self
                action:@selector(popMenu:)
      forControlEvents:UIControlEventTouchUpInside];
    [infoView addSubview:menuBtn];
    
    UILabel *titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,7, 320, 44)];
    titleLabel.backgroundColor=[UIColor clearColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.font=[UIFont systemFontOfSize:18];
    titleLabel.text=@"我的玖玖贷";
    [infoView addSubview:titleLabel];
    
    UIButton *messageBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    messageBtn.frame=CGRectMake(275, 15,22 ,22);
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"title_ico_message.png"] forState:UIControlStateNormal];
    [messageBtn setAdjustsImageWhenHighlighted:NO];
    [messageBtn addTarget:self
                   action:@selector(showMessage:)
         forControlEvents:UIControlEventTouchUpInside];
//    [infoView addSubview:messageBtn];
    
    UIImageView *headerImgView=[[UIImageView alloc] initWithFrame:CGRectMake(13,56, 82, 82)];
    headerImgView.image=[UIImage imageNamed:@"pic_user.png"];
    [infoView addSubview:headerImgView];
    
    //用shape layer显示园图形来制造白色环形边框
    CAShapeLayer *ringMaskLayer = [CAShapeLayer layer];
    ringMaskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    UIBezierPath *ringLayerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, 81, 81)];
    ringMaskLayer.path = ringLayerPath.CGPath;
    ringMaskLayer.fillColor = [UIColor whiteColor].CGColor;
    
    // use another view for clipping so that when the image size changes, the masking layer does not need to be repositioned
    UIView *ringclipingView = [[UIView alloc] initWithFrame:CGRectMake(13,56, 82, 82)];
    ringclipingView.tag=RING_CLIP_VIEW;
    ringclipingView.layer.mask = ringMaskLayer;
    ringclipingView.clipsToBounds = YES;
    [infoView addSubview:ringclipingView];
    ringclipingView.hidden=YES;
    
    UIImageView *ringImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 82, 82)];
    ringImgView.backgroundColor = [UIColor whiteColor];
    [ringclipingView addSubview:ringImgView];
    
    //用shape layer显示园图形照片
    CAShapeLayer *tinyMaskLayer = [CAShapeLayer layer];
    tinyMaskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    UIBezierPath *tinyLayerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, 75, 75)];
    tinyMaskLayer.path = tinyLayerPath.CGPath;
    tinyMaskLayer.fillColor = [UIColor lightGrayColor].CGColor;
    
    // use another view for clipping so that when the image size changes, the masking layer does not need to be repositioned
    UIView *clipingView = [[UIView alloc] initWithFrame:CGRectMake(15,58, 76, 76)];
    clipingView.layer.mask = tinyMaskLayer;
    clipingView.clipsToBounds = YES;
    [infoView addSubview:clipingView];
    
    self.tinyCircleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 76, 76)];
    //_layerMaskedCircleImageView.backgroundColor = [UIColor clearColor];
    [clipingView addSubview:_tinyCircleImageView];
    
    //输入照片按钮
    UIButton *pictureBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    pictureBtn.backgroundColor=[UIColor clearColor];
    pictureBtn.frame=CGRectMake(10,53, 76, 76);
    [pictureBtn addTarget:self
                   action:@selector(inputPicture:)
         forControlEvents:UIControlEventTouchUpInside];
    [infoView addSubview:pictureBtn];
    
    //登陆按钮
    _loginBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBtn.backgroundColor=[UIColor clearColor];
    [_loginBtn setBackgroundImage:[UIImage imageNamed:@"top_ico_lock.png"] forState:UIControlStateNormal];
    _loginBtn.frame=CGRectMake(131,62, 65, 65);
    [_loginBtn addTarget:self
                 action:@selector(login:)
       forControlEvents:UIControlEventTouchUpInside];
    [infoView addSubview:_loginBtn];
    
    _instructionLab=[[UILabel alloc] initWithFrame:CGRectMake(100,134, 134, 25)];
    _instructionLab.backgroundColor=[UIColor clearColor];
    _instructionLab.textAlignment=NSTextAlignmentCenter;
    _instructionLab.textColor=[UIColor whiteColor];
    _instructionLab.font=[UIFont systemFontOfSize:13];
    _instructionLab.text=@"点击登录查看详细信息";
    [infoView addSubview:_instructionLab];
    
    UIView *segmentView = [[UIView alloc] initWithFrame:CGRectMake(15, 167, 295, 51)];
    [infoView addSubview:segmentView];
    
    UIImageView *segmentImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 295, 52)];
    segmentImgView.image=[UIImage imageNamed:@"list_bg.png"];
    [segmentView addSubview:segmentImgView];
    
    UIButton *segBtn1= [UIButton buttonWithType:UIButtonTypeCustom];
    segBtn1.tag = TAG_BTN_RECHARGE;
    segBtn1.backgroundColor=[UIColor clearColor];
    [segBtn1 setBackgroundImage:[UIImage imageNamed:@"ico_cz.png"] forState:UIControlStateNormal];
    segBtn1.frame=CGRectMake(36,4, 31, 24);
    [segBtn1 addTarget:self
                action:@selector(segmentBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [segmentView addSubview:segBtn1];
    
    UILabel *segLabel1=[[UILabel alloc] initWithFrame:CGRectMake(3,28, 95, 25)];
    segLabel1.backgroundColor=[UIColor clearColor];
    segLabel1.textAlignment=NSTextAlignmentCenter;
    segLabel1.textColor=RGBACOLOR(68, 68, 68, 1);
    segLabel1.font=[UIFont systemFontOfSize:13];
    segLabel1.text=@"充值";
    [segmentImgView addSubview:segLabel1];
    
    UIButton *segBtn2= [UIButton buttonWithType:UIButtonTypeCustom];
    segBtn2.tag = TAG_BTN_WITHDRAW;
    segBtn2.backgroundColor=[UIColor clearColor];
    [segBtn2 setBackgroundImage:[UIImage imageNamed:@"ico_tx.png"] forState:UIControlStateNormal];
    segBtn2.frame=CGRectMake(127,4, 31, 24);
    [segBtn2 addTarget:self
                action:@selector(segmentBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [segmentView addSubview:segBtn2];
    
    UILabel *segLabel2=[[UILabel alloc] initWithFrame:CGRectMake(95,28, 95, 25)];
    segLabel2.backgroundColor=[UIColor clearColor];
    segLabel2.textAlignment=NSTextAlignmentCenter;
    segLabel2.textColor=RGBACOLOR(68, 68, 68, 1);;
    segLabel2.font=[UIFont systemFontOfSize:13];
    segLabel2.text=@"提现";
    [segmentImgView addSubview:segLabel2];
    
    UIButton *segBtn3= [UIButton buttonWithType:UIButtonTypeCustom];
    segBtn3.tag = TAG_BTN_REPAY;
    segBtn3.backgroundColor=[UIColor clearColor];
    [segBtn3 setBackgroundImage:[UIImage imageNamed:@"ico_jk.png"] forState:UIControlStateNormal];
    segBtn3.frame=CGRectMake(227,4, 31, 24);
    [segBtn3 addTarget:self
                action:@selector(segmentBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [segmentView addSubview:segBtn3];
    
    UILabel *segLabel3=[[UILabel alloc] initWithFrame:CGRectMake(194,28, 95, 25)];
    segLabel3.backgroundColor=[UIColor clearColor];
    segLabel3.textAlignment=NSTextAlignmentCenter;
    segLabel3.textColor=RGBACOLOR(68, 68, 68, 1);
    segLabel3.font=[UIFont systemFontOfSize:13];
    segLabel3.text=@"偿还借款";
    [segmentImgView addSubview:segLabel3];
    
    _entertainmentList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _entertainmentList.backgroundColor=[UIColor clearColor];
    _entertainmentList.dataSource = self;
    _entertainmentList.delegate = self;
    _entertainmentList.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _entertainmentList.allowsSelection = YES;
    _entertainmentList.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _entertainmentList.showsVerticalScrollIndicator=NO;
    [self.view addSubview:self.entertainmentList];
    
    UIView *bottomBar=[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame) - 60, 320, 60)];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 60)];
    imgView.image=[UIImage imageNamed:@"bg_bottom_menu.png"];
    [bottomBar addSubview:imgView];
    [self.view addSubview:bottomBar];
    
    //调整公告栏列表的frame
    self.entertainmentList.frame =  CGRectMake(0, CGRectGetMaxY(infoView.frame), 320, CGRectGetMinY(bottomBar.frame) - CGRectGetMaxY(infoView.frame) + 10);
    
    UIImageView *imgViewIcon1=[[UIImageView alloc]initWithFrame:CGRectMake(19, 19, 22, 22)];
    imgViewIcon1.image=[UIImage imageNamed:@"tab_menu_tz.png"];
    [bottomBar addSubview:imgViewIcon1];
    
    UILabel *itemLabel1=[[UILabel alloc] initWithFrame:CGRectMake(0, 42, 60, 11)];
    itemLabel1.backgroundColor=[UIColor clearColor];
    itemLabel1.textAlignment=NSTextAlignmentCenter;
    itemLabel1.textColor=RGBACOLOR(228, 228, 228, 1);
    itemLabel1.font=[UIFont systemFontOfSize:10];
    itemLabel1.text=@"我要投资";
    [bottomBar addSubview:itemLabel1];
    
    UIButton *tabBtn1= [UIButton buttonWithType:UIButtonTypeCustom];
    tabBtn1.tag=INVERSTMENT_BTN;
    tabBtn1.backgroundColor=[UIColor clearColor];
    tabBtn1.frame=CGRectMake(0,10, 63, 50);
    [tabBtn1 addTarget:self
                action:@selector(tabBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:tabBtn1];
    
    UIImageView *imgViewIcon2=[[UIImageView alloc]initWithFrame:CGRectMake(82, 19, 22, 22)];
    imgViewIcon2.image=[UIImage imageNamed:@"tab_menu_jk.png"];
    [bottomBar addSubview:imgViewIcon2];
    
    
    UILabel *itemLabel2=[[UILabel alloc] initWithFrame:CGRectMake(62, 43, 60, 11)];
    itemLabel2.backgroundColor=[UIColor clearColor];
    itemLabel2.textAlignment=NSTextAlignmentCenter;
    itemLabel2.textColor=RGBACOLOR(228, 228, 228, 1);
    itemLabel2.font=[UIFont systemFontOfSize:10];
    itemLabel2.text=@"我要借款";
    [bottomBar addSubview:itemLabel2];

    UIButton *tabBtn2= [UIButton buttonWithType:UIButtonTypeCustom];
    tabBtn2.tag=2;
    tabBtn2.backgroundColor=[UIColor clearColor];
    tabBtn2.frame=CGRectMake(60,10, 63, 50);
    [tabBtn2 addTarget:self
                action:@selector(tabBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:tabBtn2];
    
    UIImageView *imgViewIcon3=[[UIImageView alloc]initWithFrame:CGRectMake(143, 12, 30, 30)];
    imgViewIcon3.image=[UIImage imageNamed:@"bottom_ico_zh.png"];
    [bottomBar addSubview:imgViewIcon3];
    
    UILabel *itemLabel3=[[UILabel alloc] initWithFrame:CGRectMake(124, 43, 70, 14)];
    itemLabel3.backgroundColor=[UIColor clearColor];
    itemLabel3.textAlignment=NSTextAlignmentCenter;
    itemLabel3.textColor=RGBACOLOR(228, 228, 228, 1);
    itemLabel3.font=[UIFont systemFontOfSize:10];
    itemLabel3.text=@"账户";
    [bottomBar addSubview:itemLabel3];
    
    UIButton *tabBtn3= [UIButton buttonWithType:UIButtonTypeCustom];
    tabBtn3.tag = TAG_BTN_ACCOUNT;
    tabBtn3.backgroundColor=[UIColor clearColor];
    tabBtn3.frame=CGRectMake(123,0, 70, 60);
    [tabBtn3 addTarget:self
                action:@selector(tabBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:tabBtn3];
    
    UIImageView *imgViewIcon4=[[UIImageView alloc]initWithFrame:CGRectMake(216, 19, 22, 22)];
    imgViewIcon4.image=[UIImage imageNamed:@"tab_menu_zx.png"];
    [bottomBar addSubview:imgViewIcon4];
    
    UILabel *itemLabel4=[[UILabel alloc] initWithFrame:CGRectMake(197, 43, 60, 11)];
    itemLabel4.backgroundColor=[UIColor clearColor];
    itemLabel4.textAlignment=NSTextAlignmentCenter;
    itemLabel4.textColor=RGBACOLOR(228, 228, 228, 1);
    itemLabel4.font=[UIFont systemFontOfSize:10];
    itemLabel4.text=@"资讯";
    [bottomBar addSubview:itemLabel4];
    
    UIButton *tabBtn4= [UIButton buttonWithType:UIButtonTypeCustom];
    tabBtn4.tag = TAG_BTN_NEWS;
    tabBtn4.backgroundColor=[UIColor clearColor];
    tabBtn4.frame=CGRectMake(193,10, 63, 50);
    [tabBtn4 addTarget:self
                action:@selector(tabBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:tabBtn4];
    
    UIImageView *imgViewIcon5=[[UIImageView alloc]initWithFrame:CGRectMake(279, 19, 22, 22)];
    imgViewIcon5.image=[UIImage imageNamed:@"tab_menu_sq.png"];
    [bottomBar addSubview:imgViewIcon5];
    
    UILabel *itemLabel5=[[UILabel alloc] initWithFrame:CGRectMake(260, 43, 60, 11)];
    itemLabel5.backgroundColor=[UIColor clearColor];
    itemLabel5.textAlignment=NSTextAlignmentCenter;
    itemLabel5.textColor=RGBACOLOR(228, 228, 228, 1);
    itemLabel5.font=[UIFont systemFontOfSize:10];
    itemLabel5.text=@"会员社区";
    [bottomBar addSubview:itemLabel5];
    
    UIButton *tabBtn5= [UIButton buttonWithType:UIButtonTypeCustom];
    tabBtn5.tag = TAG_BTN_COMMUNITY;
    tabBtn5.backgroundColor=[UIColor clearColor];
    tabBtn5.frame=CGRectMake(260,10, 60, 50);
    [tabBtn5 addTarget:self
                action:@selector(tabBtnPressed:)
      forControlEvents:UIControlEventTouchUpInside];
    [bottomBar addSubview:tabBtn5];
    
    //额度和当期剩余应还
    {
        BaseData *data = [BaseData GetInstance];
        
        UIView *amountView=[[UIView alloc]initWithFrame:CGRectMake(107, 81, 180, 81)];
        amountView.backgroundColor=[UIColor clearColor];
        amountView.tag=AMOUNT_VIEW;
        amountView.hidden=YES;
        [self.view addSubview:amountView];
        
        UIButton *btnDetail = [UIButton buttonWithType:UIButtonTypeCustom];
        btnDetail.frame = CGRectMake(0, 0, 180, 81);
        btnDetail.backgroundColor = [UIColor clearColor];
        [btnDetail addTarget:self action:@selector(didAccountDetailPressed:) forControlEvents:UIControlEventTouchUpInside];
        [amountView addSubview:btnDetail];
        
        _availableAmoutTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 33)];
        _availableAmoutTitle.numberOfLines=2;
        _availableAmoutTitle.backgroundColor=[UIColor clearColor];
        _availableAmoutTitle.textAlignment=NSTextAlignmentCenter;
        //_availableAmoutTitle.textColor=RGBACOLOR(228, 228, 228, 1);
        _availableAmoutTitle.textColor=[UIColor whiteColor];
        _availableAmoutTitle.font=[UIFont systemFontOfSize:13];
        _availableAmoutTitle.text=@"账户总额";
        [btnDetail addSubview:_availableAmoutTitle];
        
        _availableAmoutLab=[[UILabel alloc] initWithFrame:CGRectMake(33, 5, 120, 23)];
        _availableAmoutLab.backgroundColor=[UIColor clearColor];
        _availableAmoutLab.textAlignment=NSTextAlignmentLeft;
        _availableAmoutLab.textColor=[UIColor whiteColor];
        _availableAmoutLab.font=[UIFont systemFontOfSize:18];
        _availableAmoutLab.text=[NSString stringWithFormat:@"¥%.2f", data.accountStatistic.totalAccountAmount];
        [btnDetail addSubview:_availableAmoutLab];
        
        _remainOweTitle=[[UILabel alloc] initWithFrame:CGRectMake(0, 38, 29, 47)];
        _remainOweTitle.numberOfLines=3;
        _remainOweTitle.backgroundColor=[UIColor clearColor];
        _remainOweTitle.textAlignment=NSTextAlignmentCenter;
        _remainOweTitle.textColor=[UIColor whiteColor];
        _remainOweTitle.font=[UIFont systemFontOfSize:13];
        _remainOweTitle.text=@"可用余额";
        [btnDetail addSubview:_remainOweTitle];
        
        _remainOweRenminbi=[[UILabel alloc] initWithFrame:CGRectMake(33, 55, 120, 14)];
        _remainOweRenminbi.backgroundColor=[UIColor clearColor];
        _remainOweRenminbi.textAlignment=NSTextAlignmentLeft;
        _remainOweRenminbi.textColor=[UIColor whiteColor];
        _remainOweRenminbi.font=[UIFont systemFontOfSize:13];
        _remainOweRenminbi.text=[NSString stringWithFormat:@"¥%.2f", data.accountStatistic.availableBalance];
        [btnDetail addSubview:_remainOweRenminbi];
        
        UIImage * imageArrow = [UIImage imageNamed:@"ico_arrow_right_gray.png"];
        imageArrow = [imageArrow stretchableImageWithLeftCapWidth:imageArrow.size.width/2
                                                     topCapHeight:imageArrow.size.height/2];
        UIImageView *imgviewArrow = [[UIImageView alloc] initWithImage:imageArrow];
        imgviewArrow.frame = CGRectMake(160, CGRectGetMidY(btnDetail.frame) - 8, 8, 16);
        [btnDetail addSubview:imgviewArrow];
        
    }
    
    //选取照片模块
    {
        _choosePicStyleView=[[UIView alloc] initWithFrame:CGRectMake(0, UIData.screenheight, 320,UIData.screenheight)];
        _choosePicStyleView.backgroundColor=[UIColor clearColor];
//        _choosePicStyleView.alpha=0.5;
        
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapGesture.numberOfTapsRequired=1;
        [_choosePicStyleView addGestureRecognizer:tapGesture];
        
        UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, UIData.screenheight)];
        bgview.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
        [_choosePicStyleView addSubview:bgview];
        
//        UIImageView *windowView=[[UIImageView alloc] initWithFrame:CGRectMake(8, UIData.screenheight-16-180-2, 304, 132)];
//        windowView.backgroundColor=[UIColor whiteColor];
//        windowView.image=[UIImage imageNamed:@"pop_bg.png"];
//        [_choosePicStyleView addSubview:windowView];
        
        //系统版本问题，这里根据系统版本设置heightoffset值，以决定actionSheet的最顶端Y值
        CGFloat heightOffset = OSVersionIsAtLeastiOS7() ? 20 : 0;
        
        UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        cancelBtn.backgroundColor=[UIColor whiteColor];
        cancelBtn.frame=CGRectMake(8, UIData.screenheight - 8 - 45 - heightOffset, 304, 45);
        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"cacle_bg.png"] forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:RGBACOLOR(0, 122, 255, 1) forState:UIControlStateNormal];
        cancelBtn.titleLabel.font=[UIFont systemFontOfSize:21];
        [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
        [_choosePicStyleView addSubview:cancelBtn];
        
        UIButton *restoreDefaultBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        restoreDefaultBtn.backgroundColor=[UIColor whiteColor];
        [restoreDefaultBtn setBackgroundImage:[UIImage imageNamed:@"cacle_bg.png"] forState:UIControlStateNormal];
        restoreDefaultBtn.frame=CGRectMake(8, CGRectGetMinY(cancelBtn.frame) - 8 - 45, 304, 45);
        [restoreDefaultBtn setTitle:@"恢复默认" forState:UIControlStateNormal];
        [restoreDefaultBtn setTitleColor:RGBACOLOR(8, 122, 255, 1) forState:UIControlStateNormal];
        restoreDefaultBtn.titleLabel.font=[UIFont systemFontOfSize:21];
        [restoreDefaultBtn addTarget:self action:@selector(restoreDefualtPictrue:) forControlEvents:UIControlEventTouchUpInside];
        [_choosePicStyleView addSubview:restoreDefaultBtn];

        UIButton *photoLibraryBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        photoLibraryBtn.backgroundColor=[UIColor whiteColor];
        [photoLibraryBtn setBackgroundImage:[UIImage imageNamed:@"cacle_bg.png"] forState:UIControlStateNormal];
        photoLibraryBtn.frame=CGRectMake(8, CGRectGetMinY(restoreDefaultBtn.frame) - 1 - 45, 304, 45);
        [photoLibraryBtn setTitle:@"选取照片" forState:UIControlStateNormal];
        [photoLibraryBtn setTitleColor:RGBACOLOR(0, 122, 255, 1) forState:UIControlStateNormal];
        photoLibraryBtn.titleLabel.font=[UIFont systemFontOfSize:21];
        [photoLibraryBtn addTarget:self action:@selector(openPhotoLibrary:) forControlEvents:UIControlEventTouchUpInside];
        [_choosePicStyleView addSubview:photoLibraryBtn];

        UIButton *takePicBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        takePicBtn.backgroundColor=[UIColor whiteColor];
        [takePicBtn setBackgroundImage:[UIImage imageNamed:@"cacle_bg.png"] forState:UIControlStateNormal];
        takePicBtn.frame=CGRectMake(8, CGRectGetMinY(photoLibraryBtn.frame) - 1 - 45, 304, 45);
        [takePicBtn setTitle:@"拍照" forState:UIControlStateNormal];
        [takePicBtn setTitleColor:RGBACOLOR(0, 122, 255, 1) forState:UIControlStateNormal];
        takePicBtn.titleLabel.font=[UIFont systemFontOfSize:21];
        [takePicBtn addTarget:self action:@selector(takePicture:) forControlEvents:UIControlEventTouchUpInside];
        [_choosePicStyleView addSubview:takePicBtn];
    }
}

- (void)didAccountDetailPressed:(id)sender
{
    UserCenterViewController *userCenter = [[UserCenterViewController alloc] init];
    [self.mm_drawerController presentViewController:userCenter animated:YES completion:nil];
}

//选项卡按钮响应
-(void)tabBtnPressed:(id)sender{
    UIButton *btn=(UIButton *)sender;
    
    switch (btn.tag) {
        case INVERSTMENT_BTN:{
            InvestmentViewController *invest=[[InvestmentViewController alloc]init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:invest];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
    
            break;
        }
        case 2:
        {
            InvestmentViewController *invest=[[InvestmentViewController alloc]init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:invest];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            
            break;
        }
        case TAG_BTN_ACCOUNT:
        {
            BaseData *data = [BaseData GetInstance];
            if (data.userInfo.isLogin) {
                UserCenterViewController *userCenter = [[UserCenterViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:userCenter];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            }
            else{
                LoginViewController *loginView = [[LoginViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginView];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            }
            
            break;
        }
        case TAG_BTN_NEWS:
        {
            NewsViewController *news = [[NewsViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:news];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            
            break;
        }
        case TAG_BTN_COMMUNITY:
        {
            CommunityViewController *community = [[CommunityViewController alloc] init];
            
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:community];
            
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];

            break;
        }
        default:
            break;
    }
}

//充值/提现/借款按钮响应
-(void)segmentBtnPressed:(id)sender{
    UIButton *button = (UIButton *)sender;
    
    switch (button.tag) {
        case TAG_BTN_RECHARGE:
        {
            BaseData *data = [BaseData GetInstance];
            if (data.userInfo.isLogin) {
                AccountRechargeViewController *recharge = [[AccountRechargeViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:recharge];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            }
            else{
                LoginViewController *loginView = [[LoginViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginView];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            }
            
            break;
        }
        case TAG_BTN_WITHDRAW:
        {
            BaseData *data = [BaseData GetInstance];
            if (data.userInfo.isLogin) {
                AccountWithdrawalViewController *withdraw = [[AccountWithdrawalViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:withdraw];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            }
            else{
                LoginViewController *loginView = [[LoginViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginView];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            }
            
            break;
        }
        case TAG_BTN_REPAY:
        {
            BaseData *data = [BaseData GetInstance];
            if (data.userInfo.isLogin) {
                RepayBorrowViewController *repay = [[RepayBorrowViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:repay];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            }
            else{
                LoginViewController *loginView = [[LoginViewController alloc] init];
                
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginView];
                
                [self.mm_drawerController presentViewController:nav animated:YES completion:nil];

            }
            
            break;
        }
        default:
            break;
    }
}

//登陆
-(void)login:(id)sender{
    LoginViewController *loginView=[[LoginViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:loginView];
    
    [self.mm_drawerController presentViewController:nav animated:YES completion:nil];

}

-(void)showMessage:(id)sender{
    
}

//选取照片界面的方法
-(void)inputPicture:(id)sender{
    AppDelegate*appDelegate=[[UIApplication sharedApplication] delegate];
    UILayoutContainerView *navcController=(UILayoutContainerView *)[appDelegate.window.subviews objectAtIndex:1];
    [appDelegate.window insertSubview:_choosePicStyleView aboveSubview:(UIView *)navcController];

    UIView*chooseView=(UIView *)[appDelegate.window.subviews objectAtIndex:2];
    CGRect frame=chooseView.frame;
    frame.origin.y=20;
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         chooseView.frame=frame;
                         
                     }
                     completion:nil];
}

-(void)cancel:(id)sender{
    BaseUIData *UIData=[BaseUIData GetInstance];
    AppDelegate*appDelegate=[[UIApplication sharedApplication] delegate];
    UIView*chooseView=(UIView *)[appDelegate.window.subviews objectAtIndex:2];
    CGRect frame=chooseView.frame;
    frame.origin.y=UIData.screenheight+20;
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         chooseView.frame=frame;
                         
                     }
                     completion:nil];
}


//触碰透明背景图手势
-(void)tap:(UITapGestureRecognizer*)gesture{
    BaseUIData *UIData=[BaseUIData GetInstance];
    AppDelegate*appDelegate=[[UIApplication sharedApplication] delegate];
    UIView*chooseView=(UIView *)[appDelegate.window.subviews objectAtIndex:2];
    CGRect frame=chooseView.frame;
    frame.origin.y=UIData.screenheight+20;
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         chooseView.frame=frame;
                         
                     }
                     completion:nil];
}

-(void)takePicture:(id)sender{
    BaseUIData *baseData=[BaseUIData GetInstance];
    CGRect frame=self.choosePicStyleView.frame;
    frame.origin.y=baseData.screenheight;
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.choosePicStyleView.frame=frame;
                     }
                     completion:nil];
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *ipc=[[UIImagePickerController alloc]init];
        ipc.allowsEditing=YES;
        ipc.delegate=self;
        ipc.sourceType=UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:ipc animated:YES completion:nil];
    }else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"温馨提示"
                              message:@"您的当前设备没有摄像头，不能拍照"
                              delegate:nil
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil];
        [alert show];
    }
    
}

-(void)openPhotoLibrary:(id)sender{
    BaseUIData *baseData=[BaseUIData GetInstance];
    CGRect frame=self.choosePicStyleView.frame;
    frame.origin.y=baseData.screenheight;
    [UIView animateWithDuration:0.3
                          delay:0.05
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.choosePicStyleView.frame=frame;
                     }
                     completion:nil];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
		UIImagePickerController *imagePickerController=[[UIImagePickerController alloc] init];
		imagePickerController.mediaTypes = [NSArray arrayWithObject:(NSString*)kUTTypeImage];
		imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
		imagePickerController.allowsEditing = YES;
		imagePickerController.delegate = self;
		imagePickerController.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
		//currentPickerController = imagePickerController;
		[self presentViewController:imagePickerController animated:YES completion:nil];
	}
}

-(void)restoreDefualtPictrue:(id)sender{
    
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // 处理静态照片
    //这个条件实质上是为了判断mediaType与 kUTTypeImage是否相等
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
        //editedImag,originalImage均属于自动释放的变量，凡不是copy,retain,alloc的变量均是自动释放的变量
        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
        if (editedImage) {
            imageToSave = editedImage;
        }
        else {
            imageToSave = originalImage;
        }
        
    }
    UIImage *imgBig = [imageToSave clipImageWithScaleWithsize:CGSizeMake(82, 82)];
    self.tinyCircleImageView.image=imgBig;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initDatalist
{
    BaseData *data = [BaseData GetInstance];
    
    self.announceList = data.latestAnnounceList;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.announceList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    GuideCell *cell = (GuideCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell =[[GuideCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //    cell =[[GuideCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.feedAnnouce = [self.announceList objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 63;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *detailView = [[NewsDetailViewController alloc] init];
    detailView.newsItem = (NewsReportItem *)[self.announceList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailView animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)popMenu:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

@end
