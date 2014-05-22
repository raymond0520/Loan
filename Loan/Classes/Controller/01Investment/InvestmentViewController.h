//
//  InvestmentViewController.h
//  Loan
//
//  Created by conquer on 14-1-6.
//  Copyright (c) 2014年 jysh. All rights reserved.
//

#import "BaseViewController.h"
#import "UISortView.h"
#import "BaseListMethod.h"

@interface InvestmentViewController : BaseViewController<UISortViewdelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *_investTable;
}

@property (nonatomic, strong) UITableView *investTable;
@property (nonatomic, strong) NSMutableArray *datalist;
@property (nonatomic, strong) NSMutableArray *datalist1;
@property (nonatomic, strong) NSMutableArray *datalist2;
@property (nonatomic, strong) NSMutableArray *datalist3;
@property (nonatomic, strong) NSMutableArray *datalist4;
@property (nonatomic, strong) NSMutableArray *datalist5;

@end
