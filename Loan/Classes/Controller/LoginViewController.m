//
//  LoginViewController.m
//  Loan
//
//  Created by conquer on 14-1-2.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "LoginViewController.h"
#import "BaseUIData.h"
#import "BaseData.h"
#import "UserInfo.h"
#import "CenterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self InitUI];
}

-(void)InitUI{
    //登录视图
    [super InitUI];
    
    self.controllerTitle=@"账户登录";
    
    self.leftButton.hidden = NO;
    [self.leftButton addTarget:self
                        action:@selector(backToHome:)
              forControlEvents:UIControlEventTouchUpInside];
    
    UIView *viewBG = [[UIView alloc] initWithFrame:CGRectMake(0, NAVIGATION_HEADER - 1, 320, CGRectGetHeight(self.view.frame))];
    viewBG.backgroundColor = RGBCOLOR(228, 228, 228);
    [self.view addSubview:viewBG];
    
    UIView *backgroundLoginView=[[UIView alloc]initWithFrame:CGRectMake(10, NAVIGATION_HEADER + 20, 300, 250)];
    backgroundLoginView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:backgroundLoginView];
    
    BaseData *data = [BaseData GetInstance];
    
    UIImageView *loginImgView=[[UIImageView alloc] initWithFrame:CGRectMake(0,0, 300, 250)];
    loginImgView.image=[UIImage imageNamed:@"login_bg.png"];
    [backgroundLoginView addSubview:loginImgView];
    
    UILabel *cardNumTitle=[[UILabel alloc] initWithFrame:CGRectMake(12, 17, 300, 23)];
    cardNumTitle.backgroundColor=[UIColor clearColor];
    cardNumTitle.textAlignment=NSTextAlignmentLeft;
    //cardNumTitle.textColor=RGBACOLOR(228, 228, 228, 1);
    cardNumTitle.textColor=RGBACOLOR(51, 51, 51, 1);
    cardNumTitle.font=[UIFont systemFontOfSize:16];
    cardNumTitle.text=@"用户名/手机/邮箱";
    [backgroundLoginView addSubview:cardNumTitle];
    
    UIImageView *CardFieldImgView=[[UIImageView alloc] initWithFrame:CGRectMake(12, 45, 273, 38)];
    CardFieldImgView.image=[UIImage imageNamed:@"textbox_bg.png"];
    [backgroundLoginView addSubview:CardFieldImgView];
    
    UITextField * creditCardField=[[UITextField alloc] initWithFrame:CGRectMake(12, 51, 273, 38)];
    creditCardField.delegate=self;
    creditCardField.placeholder=@"请输入用户名/手机/邮箱";
    creditCardField.textColor=RGBACOLOR(158, 158, 158, 1);
    creditCardField.font=[UIFont systemFontOfSize:17];
    creditCardField.textAlignment=NSTextAlignmentLeft;
    creditCardField.keyboardType=UIKeyboardTypeDefault;
    creditCardField.returnKeyType=UIReturnKeyDone;
    creditCardField.backgroundColor=[UIColor clearColor];
    creditCardField.borderStyle=UITextBorderStyleNone;
    creditCardField.text = data.userInfo.userName;
    [backgroundLoginView addSubview:creditCardField];
    
    UILabel *codeTitle=[[UILabel alloc] initWithFrame:CGRectMake(12, 100, 300, 23)];
    codeTitle.backgroundColor=[UIColor clearColor];
    codeTitle.textAlignment=NSTextAlignmentLeft;
    //codeTitle.textColor=RGBACOLOR(228, 228, 228, 1);
    codeTitle.textColor=RGBACOLOR(51, 51, 51, 1);
    codeTitle.font=[UIFont systemFontOfSize:16];
    codeTitle.text=@"密码";
    [backgroundLoginView addSubview:codeTitle];
    
    UIImageView *codeImgView=[[UIImageView alloc] initWithFrame:CGRectMake(12, 126, 273, 38)];
    codeImgView.image=[UIImage imageNamed:@"textbox_bg.png"];
    [backgroundLoginView addSubview:codeImgView];
    
    UITextField * secretCodeField=[[UITextField alloc] initWithFrame:CGRectMake(12, 132, 273, 38)];
    secretCodeField.delegate=self;
    secretCodeField.placeholder=@"请输入密码";
    secretCodeField.textAlignment=NSTextAlignmentLeft;
    secretCodeField.textColor=RGBACOLOR(158, 158, 158, 1);
    secretCodeField.font=[UIFont systemFontOfSize:17];
    secretCodeField.keyboardType=UIKeyboardTypeDefault;
    secretCodeField.backgroundColor=[UIColor clearColor];
    secretCodeField.borderStyle=UITextBorderStyleNone;
    secretCodeField.secureTextEntry = YES;
    secretCodeField.text = data.userInfo.password;
    [backgroundLoginView addSubview:secretCodeField];
    
    UIButton *doneBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [doneBtn setBackgroundImage:[UIImage imageNamed:@"loginbtn_bg.png"] forState:UIControlStateNormal];
    [doneBtn setTitle:@"登录" forState:UIControlStateNormal];
    [doneBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    doneBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    doneBtn.frame=CGRectMake(12,186, 273, 38);
    [doneBtn addTarget:self
                action:@selector(submitCardInfo:)
      forControlEvents:UIControlEventTouchUpInside];
    [backgroundLoginView addSubview:doneBtn];
}

-(void)submitCardInfo:(id)sender{
    BaseData *baseData = [BaseData GetInstance];
    UserInfo *userInfo = baseData.userInfo;
    userInfo.isLogin = YES;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)backToHome:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 键盘
- (void)handleKeyboardWillHide:(NSNotification *)notification
{
    if (doneInKeyboardButton.superview)
    {
        [doneInKeyboardButton removeFromSuperview];
    }
}

- (void)handleKeyboardDidShow:(NSNotification *)notification
{
    if (doneInKeyboardButton == nil)
    {
        doneInKeyboardButton =[UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
        if(screenHeight==568.0f){//爱疯5
            doneInKeyboardButton.frame = CGRectMake(0, 568 - 53, 106, 53);
        }else{//3.5寸
            doneInKeyboardButton.frame = CGRectMake(0, 480 - 53, 106, 53);
        }
        
        doneInKeyboardButton.adjustsImageWhenHighlighted = NO;
        //图片直接抠腾讯财付通里面的= =!
        [doneInKeyboardButton setImage:[UIImage imageNamed:@"btn_done_up@2x.png"] forState:UIControlStateNormal];
        [doneInKeyboardButton setImage:[UIImage imageNamed:@"btn_done_down@2x.png"] forState:UIControlStateHighlighted];
        [doneInKeyboardButton addTarget:self action:@selector(finishAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
    
    if (doneInKeyboardButton.superview == nil)
    {
        [tempWindow addSubview:doneInKeyboardButton];    // 注意这里直接加到window上
    }
    
}

-(void)finishAction{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];//关闭键盘
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
