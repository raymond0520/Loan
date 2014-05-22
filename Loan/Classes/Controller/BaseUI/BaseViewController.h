//
//  BaseViewController.h
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 hdk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseUIData.h"
#import <Foundation/Foundation.h>


#define  TABFOOT_HEADER    50
#define  FOOTVIEW_HEADER   40

@interface NavigationView:UIView
{
}
@end

@interface BaseViewController : UIViewController
{
    int NAVIGATION_HEADER;  //NavigationView高度

    UIButton  *   _leftButton ;    //左边的按钮
    UIButton  *   _rightButton;    //右边的按钮
    UILabel   *   _titlelabel;
    
    NSString  *   _controllerTitle;//controller的title
    NavigationView    *   _navigationView;
}

@property (nonatomic ,strong) UIButton       * leftButton;
@property (nonatomic, strong) UIButton       * rightButton;
@property (nonatomic, strong) UILabel        * titlelabel;
@property (nonatomic, strong) NSString       * controllerTitle;
@property (nonatomic, strong) NavigationView * navigationView;

- (id)init;
- (void)InitUI;
- (void)leftButtonClick:(id)sender;
- (void)rightButtonClick:(id)sender;

@end
