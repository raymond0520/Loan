//
//  BaseListMethod.h
//  Loan
//
//  Created by hdk-mac on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseListViewController.h"

@interface BaseListMethod : BaseListViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSString * _cellname;
}

//定义一些基类需要重新定义的函数
@property(nonatomic, retain)NSString  * cellname;

//初始化软件列表
-(void)initDatalist;
//刷新时的请求
-(void)RequestRefreshNew;
//加载更多时请求
-(void)RequestLoadingMore;
//用于在viewDidLoaded时注册的一些观察者或者设置分类对象SoftCategory的delegate
-(void)BeforeControllerLoaded;
//具体的基类去重新定义
-(UITableViewCell * )CreateCell:(id)object;
//具体的基类重写
-(void)didSelectRowAt:(int)row;
-(int)setTableViewHeight:(int)row;
-(void)SetValueCell:(UITableViewCell*)cell value:(id)object;
//此类需要实现的函数
-(void)InitUI;
////收到回报后的响应
//-(void)ResponseListAction:(ResData*)code;
////那些没有加载更多的相应
//-(void)ResponseAction:(ResData *)code ;
//调整footView
-(void)adjustFootView;
@end
