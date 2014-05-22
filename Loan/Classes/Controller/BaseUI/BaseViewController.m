//
//  BaseViewController.m
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 hdk. All rights reserved.
//

#import "BaseViewController.h"

@implementation NavigationView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
	if(self) {
        // nothing
    }
	return self;
}

- (void)drawRect:(CGRect)rect
{
    //CGRect rect1 = CGRectMake(rect.origin.x, rect.origin.y-20, rect.size.width, rect.size.height+20);
    UIImage * image;
    if (OSVersionIsAtLeastiOS7()) {
        image = [UIImage imageNamed:@"bg_top_head_ios7.png"];
    }
    else{
        image = [UIImage imageNamed:@"bg_top_head.png"];
    }
    UIImage * strImg = [image stretchableImageWithLeftCapWidth:image.size.width/2  topCapHeight:image.size.height/2];
	[strImg drawInRect:rect];
}

@end

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize leftButton      = _leftButton;
@synthesize rightButton     = _rightButton;
@synthesize controllerTitle = _controllerTitle;
@synthesize navigationView  = _navigationView;
@synthesize titlelabel      = _titlelabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if (OSVersionIsAtLeastiOS7()) {
            NAVIGATION_HEADER = 64;
        }
        else{
            NAVIGATION_HEADER = 44;
        }
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

#pragma mark- 基类初始化methods
- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)InitUI
{
    //将navigationController隐藏起来
    self.navigationController.navigationBarHidden =YES;
    
    _navigationView = [[NavigationView alloc] initWithFrame:CGRectMake(0, 0, 320, NAVIGATION_HEADER + 1)];
    [self.view addSubview:_navigationView];
    
    // 设置左按钮
//    MSFImagePool * pool = [MSFImagePool defaultPool];
	self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftButton setImage:[UIImage imageNamed:@"bg_btn_back.png"] forState:UIControlStateNormal];
    [self.leftButton setImage:[UIImage imageNamed:@"bg_btn_back_hover.png"] forState:UIControlStateHighlighted];
    if (OSVersionIsAtLeastiOS7()){
        _leftButton.frame = CGRectMake(2, 20, 44, 44);
    }
    else{
        _leftButton.frame = CGRectMake(2, 0, 44, 44);
    }
	[_leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_leftButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [_leftButton setTitleColor:RGBACOLOR(255, 255, 255, 1) forState:UIControlStateNormal];
    [_leftButton setContentEdgeInsets:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
	[_navigationView addSubview:_leftButton];
    
    // 设置右按钮
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgRightBtnBg = [UIImage imageNamed:@"cancel_button_on.png"];
    imgRightBtnBg = [imgRightBtnBg stretchableImageWithLeftCapWidth:imgRightBtnBg.size.width/2
                                                       topCapHeight:imgRightBtnBg.size.height/2];
    [self.rightButton setBackgroundImage:imgRightBtnBg forState:UIControlStateNormal];
	_rightButton.frame = CGRectMake(245, 7, 70, 30);
	[_rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_rightButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [_rightButton setTitle:@"" forState:UIControlStateNormal];
    [_rightButton setTitleColor:RGBACOLOR(255, 255, 255, 1) forState:UIControlStateNormal];
    [_rightButton setContentEdgeInsets:UIEdgeInsetsMake(-2,0, 0, 0)];
    
    [_navigationView addSubview:_rightButton];
    
    _rightButton.hidden = YES; //默认为隐藏
    _leftButton.hidden = YES;
    
    _titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(56, 0, 320-56*2, 44)];
    if (OSVersionIsAtLeastiOS7()){
        _titlelabel.frame = CGRectMake(56, 20, 320 - 56*2, 44);
    }
    else{
        _titlelabel.frame = CGRectMake(56, 0, 320 - 56*2, 44);
    }
    _titlelabel.backgroundColor = [UIColor clearColor];
	_titlelabel.textColor = RGBACOLOR(255, 255, 255, 1);
	_titlelabel.textAlignment = NSTextAlignmentCenter;
    _titlelabel.font = [UIFont boldSystemFontOfSize:20];
    [_titlelabel setText:_controllerTitle];
    [self.view addSubview:_titlelabel];
}

- (void)setControllerTitle:(NSString *)controllerTitle
{
    _controllerTitle = controllerTitle;
    _titlelabel.text = controllerTitle;
}

- (void)leftButtonClick:(id)sender
{
    
}

- (void)rightButtonClick:(id)sender
{
    
}

@end
