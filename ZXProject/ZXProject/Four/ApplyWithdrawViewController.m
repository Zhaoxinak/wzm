//
//  ApplyWithdrawViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/23.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


/************C************/
#import "ApplyWithdrawViewController.h"
#import "WithDrawRecordViewController.h" //提现记录
#import "WithDrawInfoViewController.h" //提现详情
/************V************/
#import "ZXLoginTextField.h"
/************M************/
#import "BalanceModel.h"


@interface ApplyWithdrawViewController ()
{

    UILabel *alipayLabel; //支付宝
    ZXLoginTextField *moneyField; //提现金额
    UILabel *balanceLabel; //可提现金额
    UIButton * withDrawBtn; //提现
   
    
}

@end

@implementation ApplyWithdrawViewController

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
    self.title = @"申请提现";
    
    
    //提现记录
    UIButton* recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    recordBtn.frame = CGRectMake(0, 0, 80, 44);
    [recordBtn setTitle:@"提现记录"];
    [recordBtn setTitleColor:KNavigationTitleColor];
    [recordBtn addTarget:self action:@selector(recordAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:recordBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    //设置顶部
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, kScreen_Width)];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    

    
    
    //金钱
    alipayLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT,10*WIDTH_NIT, topView.width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    alipayLabel.textColor = OneTextColor;
    alipayLabel.font = Font13;
    alipayLabel.text = @"提现到  支付宝 249227498@qq.com";
    [topView addSubview:alipayLabel];
    
    //提现金额
    UILabel *tixianLabel =  [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT,alipayLabel.bottom + 10*WIDTH_NIT, topView.width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    tixianLabel.textColor = OneTextColor;
    tixianLabel.font = Font13;
    tixianLabel.text = @"提现金额";
    [topView addSubview:tixianLabel];
    
    //提现金额
    moneyField = [[ZXLoginTextField alloc] initWithType:NormalType];
    moneyField.frame = CGRectMake(10*WIDTH_NIT, tixianLabel.bottom + 10*WIDTH_NIT, topView.width-20*WIDTH_NIT, 50*WIDTH_NIT);
    moneyField.inputTextField.keyboardType = UIKeyboardTypeDecimalPad;
    moneyField.leftLabel.text = @"¥";
    [topView addSubview:moneyField];
    
    
    //可提现金额
    balanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT,moneyField.bottom + 10*WIDTH_NIT, topView.width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    balanceLabel.textColor = OneTextColor;
    balanceLabel.font = Font13;
    balanceLabel.text = @"可提现金额 1212.00元";
    [topView addSubview:balanceLabel];
    
    //提示
    UILabel *tipsLabel =  [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT,balanceLabel.bottom + 20*WIDTH_NIT, topView.width-20*WIDTH_NIT, 50*WIDTH_NIT)];
    tipsLabel.numberOfLines = 2;
    tipsLabel.textColor = OneTextColor;
    tipsLabel.font = Font13;
    tipsLabel.text = @"提示：最多一次提现2000元，最少一次提现100，一天最多发起三次体现";
    [topView addSubview:tipsLabel];
    
    
    //提现
    withDrawBtn = [[UIButton alloc]initWithFrame:CGRectMake(20*WIDTH_NIT, topView.bottom + 30*WIDTH_NIT, topView.width-40*WIDTH_NIT, 30*WIDTH_NIT)];
    withDrawBtn.backgroundColor = [UIColor blackColor];
    [withDrawBtn setTitle:@"提现"];
    [withDrawBtn addTarget:self action:@selector(withDrawAct:)];
    [self.view addSubview:withDrawBtn];
    
  
    
    
    
}



#pragma mark -- 提现记录
-(void)recordAct{
    NSLog(@"提现记录");
    
    WithDrawRecordViewController * recordVC = [[WithDrawRecordViewController alloc]init];
    [self.navigationController pushViewController:recordVC animated:YES];
}

#pragma mark -- 提现
-(void)withDrawAct:(UIButton *)button{
    NSLog(@"提现");
    WithDrawInfoViewController * infoVC = [[WithDrawInfoViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
