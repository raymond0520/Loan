//
//  AppDelegate.m
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftSideDrawerViewController.h"
#import "CenterViewController.h"
#import "BaseUIData.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    BaseUIData * UIData = [BaseUIData GetInstance];
    if(IS_IPHONE_5) {
        if (OSVersionIsAtLeastiOS7()) {
            UIData.screenheight= 568;
        }
        else{
            UIData.screenheight= 548;
        }
    }else
    {
        if (OSVersionIsAtLeastiOS7()) {
            UIData.screenheight = 480;
        }
        else{
            UIData.screenheight= 460;
        }
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // self.window.frame = CGRectMake(0, 0, UIData.screenwidth, UIData.screenheight+20);
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 25)];
    view.backgroundColor =[UIColor whiteColor];
    [_window addSubview:view];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
    application.applicationSupportsShakeToEdit = YES;
    // Override point for customization after application launch.
    UIViewController * leftSideDrawerViewController = [[LeftSideDrawerViewController alloc] init];
    
    UIViewController * centerViewController = [[CenterViewController alloc] init];
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:centerViewController
                                                            leftDrawerViewController:leftSideDrawerViewController];
//    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [self.drawerController setMaximumLeftDrawerWidth:280];
   
    [self.drawerController setShowsStatusBarBackgroundView:NO];
    
    //self.drawerController.view.frame = CGRectMake(0, 20, UIData.screenwidth, UIData.screenheight);
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:self.drawerController];
//    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
    navigationController.navigationBarHidden=YES;
    [self.window setRootViewController:navigationController];
    //[_window addSubview:self.drawerController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
