//
//  BaseData.m
//  Loan
//
//  Created by hdk-mac on 13-12-30.
//  Copyright (c) 2013年 jysh. All rights reserved.
//

#import "BaseData.h"
#import "InvestmentItem.h"
#import "InvestBorrowItem.h"
#import "ToPayBorrowingItem.h"
#import "RepayBorrowItem.h"
#import "InvestmentDetail.h"
#import "RechargeRecordItem.h"
#import "WithdrawRecordItem.h"
#import "NewsReportItem.h"

static BaseData *g_Data = nil;

@implementation BaseData

+ (id)GetInstance
{
    @synchronized(self) {
        if (g_Data == nil) {
            g_Data = [[BaseData alloc] init];
        }
    }
    return g_Data;
}

- (NSMutableArray *)investmentList
{
    NSArray *tmpDatalist1 = [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"扩大经营", @"3", nil],
                             [NSArray arrayWithObjects:@"3个月续借", @"3", nil],
                             [NSArray arrayWithObjects:@"一个月短期周转", @"1", nil],
                             [NSArray arrayWithObjects:@"一个月短期借款", @"1", nil],
                             [NSArray arrayWithObjects:@"经营周转续借", @"3", nil],
                             [NSArray arrayWithObjects:@"短期周转", @"3", nil],
                             [NSArray arrayWithObjects:@"扩大经营", @"1", nil],
                             [NSArray arrayWithObjects:@"购置设备", @"1", nil],
                             [NSArray arrayWithObjects:@"宾馆扩张", @"1", nil],
                             [NSArray arrayWithObjects:@"经营周转", @"1", nil], nil];
    NSArray *tmpDatalist2 = [NSArray arrayWithObjects:@"200000", @"500000", @"30000", @"70000", @"50000", @"100000", nil];
    NSArray *tmpDatalist3 = [NSArray arrayWithObjects:@"500", @"200", @"100", nil];
    NSArray *tmpDatalist4 = [NSArray arrayWithObjects:@"17", @"12", @"18", @"20", nil];
    NSArray *tmpDatalist5 = [NSArray arrayWithObjects:@"45", @"32", @"100", @"57", @"91", nil];
    
    //投资列表
    NSMutableArray *investmentList = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        InvestmentItem *item = [[InvestmentItem alloc] init];
        item.ID = @"201312190001";
        
        int nRand = rand()%[tmpDatalist1 count];
        item.purpose = [[tmpDatalist1 objectAtIndex:nRand] objectAtIndex:0];
        item.deadline = [[[tmpDatalist1 objectAtIndex:nRand] objectAtIndex:1] integerValue];
        nRand = rand()%[tmpDatalist2 count];
        item.borrowingAmount = [[tmpDatalist2 objectAtIndex:nRand] floatValue];
        nRand = rand()%[tmpDatalist3 count];
        item.lowInvestmentAmount = [[tmpDatalist3 objectAtIndex:nRand] floatValue];
        nRand = rand()%[tmpDatalist4 count];
        item.annualInterestRate = [[tmpDatalist4 objectAtIndex:nRand] floatValue];
        nRand = rand()%[tmpDatalist5 count];
        item.progress = [[tmpDatalist5 objectAtIndex:nRand] floatValue];
        item.jojoType=@"玖玖丰";
        
        //详情
        item.detail = [[InvestmentDetail alloc] init];
        item.detail.repayMode = @"每月付息，到期还本";
        item.detail.guaranteeAgency = @"湖北融森投资担保有限公司";
        item.detail.counterGuaranteeWay = @"房屋抵押";
        item.detail.publishedTime = 19;
        item.detail.surplusBidNums = 17;
        item.detail.borrowerName = @"湖北某置业有限公司";
        item.detail.vipStatus = @"VIP会员";
        item.detail.site = @"湖北省枣阳市";
        item.detail.flowCopies = 4126;
        item.detail.repurchase = 0;
        item.detail.overdueDefault = 0;
        //            item.detail.borrowerInformation = @"";
        item.detail.fundPurpose = @"补充项目资金，续借10万，一个月归还，用于公司经营周转。";
        
        [investmentList addObject:item];
    }
    return investmentList;
}

- (id)init
{
    self = [super init];
    if (self) {
        //个人信息
        _userInfo = [[UserInfo alloc] init];
        self.userInfo.userName = @"jojodai";
        self.userInfo.password = @"123456";
        self.userInfo.registerDate = @"2014-01-02";
        self.userInfo.creditLimit = 0;
        self.userInfo.vipState = @"普通会员";
        self.userInfo.availablePoints = 5;
        self.userInfo.availableCreditLine = 4671;
        self.userInfo.borrowCreditLine = 100000;
        self.userInfo.toReadEmailNums = 3;
        self.userInfo.attentionNums = 7;
        
        //账户统计
        _accountStatistic = [[AccountStatistic alloc] init];
        self.accountStatistic.totalAccountAmount = 500000;
        self.accountStatistic.availableBalance = 370000;
        self.accountStatistic.frozenAmount = 0;
        
//        NSArray *tmpDatalist1 = [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"扩大经营", @"3", nil],
//                                [NSArray arrayWithObjects:@"3个月续借", @"3", nil],
//                                [NSArray arrayWithObjects:@"一个月短期周转", @"1", nil],
//                                [NSArray arrayWithObjects:@"一个月短期借款", @"1", nil],
//                                [NSArray arrayWithObjects:@"经营周转续借", @"3", nil],
//                                [NSArray arrayWithObjects:@"短期周转", @"3", nil],
//                                [NSArray arrayWithObjects:@"扩大经营", @"1", nil],
//                                [NSArray arrayWithObjects:@"购置设备", @"1", nil],
//                                [NSArray arrayWithObjects:@"宾馆扩张", @"1", nil],
//                                [NSArray arrayWithObjects:@"经营周转", @"1", nil], nil];
//        NSArray *tmpDatalist2 = [NSArray arrayWithObjects:@"200000", @"500000", @"30000", @"70000", @"50000", @"100000", nil];
//        NSArray *tmpDatalist3 = [NSArray arrayWithObjects:@"500", @"200", @"100", nil];
//        NSArray *tmpDatalist4 = [NSArray arrayWithObjects:@"17", @"12", @"18", @"20", nil];
//        NSArray *tmpDatalist5 = [NSArray arrayWithObjects:@"45", @"32", @"100", @"57", nil];
        
//        //投资列表
//        _investmentList = [[NSMutableArray alloc] init];
//        for (int i = 0; i < 10; i++) {
//            InvestmentItem *item = [[InvestmentItem alloc] init];
//            item.ID = @"201312190001";
//            
//            int nRand = rand()%[tmpDatalist1 count];
//            item.purpose = [[tmpDatalist1 objectAtIndex:nRand] objectAtIndex:0];
//            item.deadline = [[[tmpDatalist1 objectAtIndex:nRand] objectAtIndex:1] integerValue];
//            nRand = rand()%[tmpDatalist2 count];
//            item.borrowingAmount = [[tmpDatalist2 objectAtIndex:nRand] floatValue];
//            nRand = rand()%[tmpDatalist3 count];
//            item.lowInvestmentAmount = [[tmpDatalist3 objectAtIndex:nRand] floatValue];
//            nRand = rand()%[tmpDatalist4 count];
//            item.annualInterestRate = [[tmpDatalist4 objectAtIndex:nRand] floatValue];
//            nRand = rand()%[tmpDatalist5 count];
//            item.progress = [[tmpDatalist5 objectAtIndex:nRand] floatValue];
//            item.jojoType=@"玖玖丰";
//            
//            //详情
//            item.detail = [[InvestmentDetail alloc] init];
//            item.detail.mode = @"每月付息，到期还本";
//            item.detail.guaranteeAgency = @"湖北融森投资担保有限公司";
//            item.detail.counterGuaranteeWay = @"房屋抵押";
//            item.detail.publishedTime = 19;
//            item.detail.surplusBidNums = 17;
//            item.detail.borrowerName = @"湖北某置业有限公司";
//            item.detail.vipStatus = @"VIP会员";
//            item.detail.site = @"湖北省枣阳市";
//            item.detail.flowCopies = 4126;
//            item.detail.repurchase = 0;
//            item.detail.overdueDefault = 0;
////            item.detail.borrowerInformation = @"";
//            item.detail.fundPurpose = @"补充项目资金，续借10万，一个月归还，用于公司经营周转。";
//            
//            [self.investmentList addObject:item];
//        }
        
        //我的回收中借款
        _returningInvestBorrow = [[ReturningInvestBorrow alloc] init];
        self.returningInvestBorrow.totalNums = 10;
        self.returningInvestBorrow.totalAmount = 550000;
        self.returningInvestBorrow.principal = 500000;
        self.returningInvestBorrow.interest = 50000;
        self.returningInvestBorrow.borrowList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 10; i++) {
            InvestBorrowItem *item = [[InvestBorrowItem alloc] init];
            if (i == 1) {
                item.title = @"张绍的借款";
                item.borrower = @"张绍";
                item.investAmount = 70000;
                item.interestRate = 10;
                item.receivableDate = @"2014/03/02";
            }
            else if (i == 2) {
                item.title = @"孙权的借款";
                item.borrower = @"孙权";
                item.investAmount = 30000;
                item.interestRate = 10;
                item.receivableDate = @"2014/02/08";
            }
            else {
                item.title = @"张三的借款";
                item.borrower = @"张三";
                item.investAmount = 50000;
                item.interestRate = 10;
                item.receivableDate = @"2014/02/17";
            }
            [self.returningInvestBorrow.borrowList addObject:item];
        }
        
        //我的已回收借款
        _returnedInvestBorrow = [[ReturnedInvestBorrow alloc] init];
        self.returnedInvestBorrow.totalNums = 8;
        self.returnedInvestBorrow.totalAmount = 880000;
        self.returnedInvestBorrow.principal = 800000;
        self.returnedInvestBorrow.interest = 80000;
        self.returnedInvestBorrow.borrowList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 8; i++) {
            InvestBorrowItem *item = [[InvestBorrowItem alloc] init];
            if (i == 1) {
                item.title = @"郭嘉的借款";
                item.borrower = @"郭嘉";
                item.investAmount = 140000;
                item.interestRate = 10;
                item.receivedDate = @"2014/02/18";
            }
            else if (i == 2) {
                item.title = @"曹操的借款";
                item.borrower = @"曹操";
                item.investAmount = 180000;
                item.interestRate = 10;
                item.receivedDate = @"2014/03/16";
            }
            else {
                item.title = @"李四的借款";
                item.borrower = @"李四";
                item.investAmount = 80000;
                item.interestRate = 10;
                item.receivedDate = @"2014/01/05";
            }
            
            [self.returnedInvestBorrow.borrowList addObject:item];
        }
        
        //我的投资的逾期借款
        _overdueInvestBorrow = [[OverdueInvestBorrow alloc] init];
        self.overdueInvestBorrow.totalNums = 5;
        self.overdueInvestBorrow.principalInterest = 792000;
        self.overdueInvestBorrow.principal = 720000;
        self.overdueInvestBorrow.interest = 72000;
        self.overdueInvestBorrow.borrowList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            InvestBorrowItem *item = [[InvestBorrowItem alloc] init];
            if (i == 1) {
                item.title = @"孔明的借款";
                item.borrower = @"孔明";
                item.investAmount = 180000;
                item.interestRate = 10;
                item.receivableDate = @"2014/01/15";
            }
            else if (i == 2) {
                item.title = @"刘备的借款";
                item.borrower = @"刘备";
                item.investAmount = 180000;
                item.interestRate = 10;
                item.receivableDate = @"2014/01/12";
            }
            else {
                item.title = @"王五的借款";
                item.borrower = @"王五";
                item.investAmount = 120000;
                item.interestRate = 10;
                item.receivableDate = @"2014/01/07";
            }
            
            [self.overdueInvestBorrow.borrowList addObject:item];
        }
        
        //待偿还的借款
        _toPayBorrow = [[ToPayBorrowing alloc] init];
        self.toPayBorrow.totalNums = 4;
        self.toPayBorrow.totalAmount = 352000;
        self.toPayBorrow.principal = 320000;
        self.toPayBorrow.interest = 32000;
        self.toPayBorrow.toPayBorrowingList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i++) {
            RepayBorrowItem *item = [[RepayBorrowItem alloc] init];
            if (i == 1) {
                item.title = @"典韦的借款";
                item.borrowingAmount = 50000;
                item.interestRating = 10;
                item.period = 5;
                item.toPayDate = @"2014/01/22";

            }
            else if (i == 2){
                item.title = @"杨修的借款";
                item.borrowingAmount = 110000;
                item.interestRating = 10;
                item.period = 7;
                item.toPayDate = @"2014/02/13";

            }
            else{
                item.title = @"赵六的借款";
                item.borrowingAmount = 80000;
                item.interestRating = 10;
                item.period = 2;
                item.toPayDate = @"2014/02/07";
            }
            [self.toPayBorrow.toPayBorrowingList addObject:item];
        }
        
        //已还清的借款
        _paidOffBorrow = [[PaidOffBorrowing alloc] init];
        self.paidOffBorrow.totalNums = 13;
        self.paidOffBorrow.totalAmount = 1430000;
        self.paidOffBorrow.principal = 1300000;
        self.paidOffBorrow.interest = 130000;
        self.paidOffBorrow.paidOffList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 13; i++) {
            RepayBorrowItem *item = [[RepayBorrowItem alloc] init];
            if (i == 1) {
                item.title = @"阚泽的借款";
                item.borrowingAmount = 200000;
                item.interestRating = 10;
                item.period = 3;
                item.paidDate = @"2013/12/25";
            }
            else if (i == 2){
                item.title = @"陆抗的借款";
                item.borrowingAmount = 60000;
                item.interestRating = 10;
                item.period = 6;
                item.paidDate = @"2013/01/03";
            }
            else{
                item.title = @"孙七的借款";
                item.borrowingAmount = 130000;
                item.interestRating = 10;
                item.period = 1;
                item.paidDate = @"2013/12/21";
            }
            [self.paidOffBorrow.paidOffList addObject:item];
        }
        
        //逾期借款
        _overdueBorrow = [[OverdueBorrowing alloc] init];
        self.overdueBorrow.totalNums = 6;
        self.overdueBorrow.principalInterest = 99000;
        self.overdueBorrow.principal = 90000;
        self.overdueBorrow.interest = 9000;
        self.overdueBorrow.overdueList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 6; i++) {
            RepayBorrowItem *item = [[RepayBorrowItem alloc] init];
            if (i == 1) {
                item.title = @"廖化的借款";
                item.borrowingAmount = 20000;
                item.interestRating = 10;
                item.period = 5;
                item.toPayDate = @"2014/02/23";
            }
            else if (i == 2){
                item.title = @"诸葛诞的借款";
                item.borrowingAmount = 30000;
                item.interestRating = 10;
                item.period = 2;
                item.toPayDate = @"2014/02/06";
            }
            else{
                item.title = @"周八的借款";
                item.borrowingAmount = 10000;
                item.interestRating = 10;
                item.period = 4;
                item.toPayDate = @"2014/02/15";
            }
            [self.overdueBorrow.overdueList addObject:item];
        }
        
        //我的充值记录
        _rechargeList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i++) {
            RechargeRecordItem *item = [[RechargeRecordItem alloc] init];
            
            if (i == 0) {
                item.rechargeMode = @"盛付通充值";
                item.tradeTime = @"2014-01-13 15:38";
                item.rechargeSum = 3000;
                item.state = @"交易成功";
            }
            if (i == 1) {
                item.rechargeMode = @"在线银行充值";
                item.tradeTime = @"2014-01-10 09:27";
                item.rechargeSum = 10000;
                item.state = @"已关闭";
            }
            if (i == 2) {
                item.rechargeMode = @"盛付通充值";
                item.tradeTime = @"2014-01-09 16:12";
                item.rechargeSum = 8000;
                item.state = @"交易成功";
            }
            if (i == 3) {
                item.rechargeMode = @"在线银行充值";
                item.tradeTime = @"2014-01-03 10:48";
                item.rechargeSum = 5000;
                item.state = @"交易成功";
            }
            [self.rechargeList addObject:item];
        }
        //我的提现记录
        _withdrawList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i ++) {
            WithdrawRecordItem *item = [[WithdrawRecordItem alloc] init];
            
            if (i == 0) {
                item.bankName = @"招商银行";
                item.performTime = @"2014-01-13 15:38";
                item.sum = 3000;
                item.state = @"交易成功";
            }
            if (i == 1) {
                item.bankName = @"中国工商银行";
                item.performTime = @"2014-01-10 09:27";
                item.sum = 10000;
                item.state = @"已关闭";
            }
            if (i == 2) {
                item.bankName = @"中国工商银行";
                item.performTime = @"2014-01-09 16:12";
                item.sum = 8000;
                item.state = @"交易成功";
            }
            if (i == 3) {
                item.bankName = @"招商银行";
                item.performTime = @"2014-01-03 10:48";
                item.sum = 5000;
                item.state = @"交易成功";
            }

            [self.withdrawList addObject:item];
        }
        
        _incomeStatistic = [[IncomeStatistic alloc] init];
        self.incomeStatistic.interestsEarned = 13452.5;
        self.incomeStatistic.hasCostInvestManageFee = 1150;
        self.incomeStatistic.realYield = 11952.5;
        self.incomeStatistic.interestsToBeEarned = 26534;
        self.incomeStatistic.onCostOfInvestManageFee = 1670;
        self.incomeStatistic.projectedIncome = 24864;
        
        _investStatistic = [[InvestmentStatistic alloc] init];
        self.investStatistic.totalAmountOnInvest = 130000;
        self.investStatistic.totalNumsOnInvest = 8;
        self.investStatistic.principalInterestsCollected = 48000;
        self.investStatistic.numsCollected = 3;
        self.investStatistic.principalInterestsOnCollecting = 120000;
        self.investStatistic.numsOnCollecting = 5;
        
        _mediaReportList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 3; i++) {
            NewsReportItem *item = [[NewsReportItem alloc] init];
            if (i == 0) {
                item.title = @"玖玖贷受邀参加2013年中国小额信贷联盟年会";
                item.publishTime = @"2013-11-04";
                item.content = @"中国小额信贷联盟于10月31日至11月1日在北京举办了第九届联盟年会暨2013年中国小额信贷峰会和中国银行业协会（花旗）微型创业奖颁奖典礼系列活动。此次会议的主题是“技术创新、模式创新、融资创新”。玖玖贷投资管理（武汉）有限公司运营总监也受邀参加此次会议。";
            }
            if (i == 1) {
                item.title = @"玖玖贷现身“金博会” P2P网贷武汉引关注";
                item.publishTime = @"2013-10-25";
                item.content = @"近年来，P2P网络借贷作为互联网金融热词一直备受关注，但在中部金融重镇——武汉，人们对它还并不熟知。然而，在刚刚召开的第六届中国·武汉金融交易博览会暨中国中部（湖北）创业大赛（以下简称“武汉金博会”）上，玖玖贷投资管理（武汉）有限公司（以下简称“玖玖贷”）率先拉开展台，正式进驻武汉。这也是专业P2P网贷平台在武汉高规格会展上的首次亮相。";
            }
            if (i == 2) {
                item.title = @"第六届中国武汉金博会开幕 全力推进金融改革创新";
                item.publishTime = @"2013-10-24";
                item.content = @"人民网武汉10月24日电 （洪兵 曹梦雅 高雪雪）推进武汉金融改革创新，服务实体经济发展。24日上午，由湖北省政府、武汉市政府联合主办，科技部、中国人民银行、中国银监会、中国证监会、中国保监会提供支持的第六届中国·武汉金融博览会暨中国中部（湖北）创业投资大会在武昌开幕。";
            }
            
            [_mediaReportList addObject:item];
        }
        
        _latestAnnounceList = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i++) {
            NewsReportItem *item = [[NewsReportItem alloc] init];
            if (i == 0) {
                item.title = @"“盛付通”第三方支付新通道正式上线公告";
                item.publishTime = @"2013-12-18";
                item.content = @"试运营期间，玖玖贷确立了与第三方支付平台的合作模式，实现了资金托管和结算。\n为了进一步保障用户的资金安全，给用户带来更加优质的理财体验，玖玖贷携手盛大旗下“盛付通”第三方支付平台，于今日正式开通新的在线支付通道。\n“盛付通”全称上海盛付通电子商务有限公司，由盛大集团创办，是国内首批获得《支付业务许可证》的单位。\n经过前期的系统对接、测试和调整，“盛付通”与玖玖贷已基本完成功能对接，用户可以直接进入个人账户，通过“盛付通”进行在线充值、提现操作，安全稳定，高效便捷。\n在此，感谢广大用户对玖玖贷一如既往的支持与信任，我们将秉承客户为尊的服务理念，为您提供更优质的服务。\n特此公告！";
            }
            if (i == 1) {
                item.title = @"玖玖贷提现处理时间公告";
                item.publishTime = @"2013-12-10";
                item.content = @"为了便于广大用户安排提现时间，尽量提高资金到账速度，特将玖玖贷提现处理时间公布如下：\n1、提现处理时间：周一至周五上午10：00和下午15:00（法定节假日除外）。建议用户在玖玖贷处理提现的时间节点前完成提现申请，以保证其提现申请能够被及时提交。\n2、处理后到账时间：正常情况下到账时间为1~3个工作日，受到支付机构转账时间的限制，不同银行的到账时间略有不同。\n收到支付机构的转账成功通知后，玖玖贷会即时以站内信的方式通知用户提现成功。受到支付机构转账速度的影响，用户的资金实际到账时间可能会早于或者晚于通知时间。\n因此，如果您在信息到达当天的资金记录中没有看到对应的资金到账，请您耐心等待一段时间或者查看之前1~2天的资金记录。如果您在网站使用过程中有任何不明白的情况，请您随时通过客服QQ或电话与我们的客服人员取得联系。\n玖玖贷会不断对工作流程进行优化，努力为广大用户提供更加安全、舒心的使用体验。";
            }
            if (i == 2) {
                item.title = @"有关玖玖贷开通第三方支付二号通道——盛付通的预告及说明";
                item.publishTime = @"2013-12-10";
                item.content = @"作为专业的P2P网贷平台，玖玖贷坚持与第三方支付平台合作，实现资金托管和结算。\n试运营期间，我们与国付宝（第三方支付平台，全称“国付宝信息科技有限公司”）建立了稳定的合作关系。\n在实际操作中，为了防范由第三方支付平台引起的提现危机，进一步保障用户的资金安全，分散运营风险，我们认为寻找第二家合作平台势在必行。\n经过前期筛选，第二家意向合作单位确定为盛付通（第三方支付平台，全称“上海盛付通电子商务有限公司”）。盛付通由盛大集团创办，是国内首批获得《支付业务许可证》的单位。\n目前，玖玖贷与盛付通已签署了合作协议，双方正处于系统对接、测试和调整阶段。调试期的功能完善程序结束后，玖玖贷将推出第三方支付二号通道——盛付通，为玖玖贷用户提供新的充值及提现途径。\n具体的上线时间及功能介绍，我们会第一时间发出公告，让用户及时知晓。";
            }
            if (i == 3) {
                item.title = @"关于玖玖丰产品规则的更新公告";
                item.publishTime = @"2013-10-25";
                item.content = @"尊敬的用户您好：\n玖玖丰产品自上线以来得到了广大用户的大力支持与厚爱。为了回馈用户，现对其进行产品升级，特此公告。10月25日起，新发布的玖玖丰产品将使用以下新规则：\n1、玖玖丰的投标金额为起投金额的整数倍；\n2、收益利息为13%~18%；\n3、收益期限为1~3个月；\n4、未满标的结算周期为7天；\n目前，网站正在进行产品规则的调试。调试阶段，投资玖玖丰产品，预期收益日期将会与实际收益日期存在一定差异。如有不便，我们深表歉意。\n在投资过程中，若有任何疑问，请咨询客服：400-6888-399。\n再次感谢您的谅解！";
            }

            [_latestAnnounceList addObject:item];
        }
    }

    return self;
}

@end
