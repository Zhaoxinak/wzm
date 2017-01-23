//
//  BalanceViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/23.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


/************C************/
#import "BalanceViewController.h"
#import "ApplyWithdrawViewController.h"
/************V************/

/************M************/
#import "BalanceModel.h"

@interface BalanceViewController ()
{
    UIImageView *headerImgView; //头像
    UILabel *moneyNum; //金钱
    UILabel *moneyStatus; //金钱状态
    UIButton *withDrawBtn; //提现
    UIButton *exchageMaoCoinBtn; //兑换猫币
    
}

@end

@implementation BalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    [self setupData];
    //初始试图
    [self setupView];
}

#pragma mark -执行数据
#pragma mark --初始化数据
-(void)setupData{
    
    
    
    
}

#pragma mark当网络请求开始或结束时，下面两个方法将会被调到。

-(void)ZXsuccessData:(id)data byRequestId:(NSInteger)requestId{
    
}

- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId{
    
    
}

- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId{
    
}


#pragma mark -执行视图
#pragma mark --初始化数据视图
-(void)setupView{
    
    //设置标题
    self.title = @"猫币明细";
    
   
    //明细
    UIButton* infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    infoBtn.frame = CGRectMake(0, 0, 80, 44);
    [infoBtn setTitle:@"明细"];
    [infoBtn setTitleColor:KNavigationTitleColor];
    [infoBtn addTarget:self action:@selector(infoAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:infoBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    //设置顶部
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    
    //头像
    headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(topView.width/2-30*WIDTH_NIT, 10*WIDTH_NIT, 60*WIDTH_NIT, 60*WIDTH_NIT)];
    headerImgView.backgroundColor = [UIColor yellowColor];
    [topView addSubview:headerImgView];
    
    
    //金钱
    moneyNum = [[UILabel alloc]initWithFrame:CGRectMake(0,headerImgView.bottom + 5*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    moneyNum.textColor = OneTextColor;
    moneyNum.font = ThreeFont;
    moneyNum.text = @"¥ 450.11";
    [moneyNum sizeToFit];
    moneyNum.centerX = headerImgView.centerX;
    [topView addSubview:moneyNum];
    

    
    //金钱状态
    moneyStatus = [[UILabel alloc]initWithFrame:CGRectMake(0, moneyNum.bottom + 5*WIDTH_NIT, topView.width, 20*WIDTH_NIT)];
    moneyStatus.textAlignment = NSTextAlignmentCenter;
    moneyStatus.text = @"(冻结)";
    [topView addSubview:moneyStatus];
    
    //提现
    withDrawBtn = [[UIButton alloc]initWithFrame:CGRectMake(20*WIDTH_NIT, moneyStatus.bottom + 10*WIDTH_NIT, topView.width-40*WIDTH_NIT, 30*WIDTH_NIT)];
    withDrawBtn.backgroundColor = [UIColor blackColor];
    [withDrawBtn setTitle:@"提现"];
    [withDrawBtn addTarget:self action:@selector(withDrawAct:)];
    [topView addSubview:withDrawBtn];
    
    //兑换猫币
    exchageMaoCoinBtn = [[UIButton alloc]initWithFrame:CGRectMake(20*WIDTH_NIT, withDrawBtn.bottom + 10*WIDTH_NIT, topView.width-40*WIDTH_NIT, 30*WIDTH_NIT)];
    exchageMaoCoinBtn.backgroundColor = [UIColor blackColor];
    [exchageMaoCoinBtn setTitle:@"兑换猫币"];
    [exchageMaoCoinBtn addTarget:self action:@selector(exchageMaoCoinAct:)];
    [topView addSubview:exchageMaoCoinBtn];
   
}



#pragma mark -- 明细
-(void)infoAct{
    NSLog(@"明细");
    
    
}

#pragma mark -- 提现
-(void)withDrawAct:(UIButton *)button{
    NSLog(@"提现");
    ApplyWithdrawViewController *applyVC = [[ApplyWithdrawViewController alloc]init];
    [self.navigationController pushViewController:applyVC animated:YES];
    
}

#pragma mark -- 兑换猫币
-(void)exchageMaoCoinAct:(UIButton *)button{
    NSLog(@"兑换猫币");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
