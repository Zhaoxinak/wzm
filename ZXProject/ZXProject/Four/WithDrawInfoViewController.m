//
//  WithDrawInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/23.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "WithDrawInfoViewController.h"

@interface WithDrawInfoViewController ()
{
    UIImageView *headerImgView; //头像
    UILabel *alipayLabel; //支付宝
    UILabel *withDrawLabel; //提现金额
    UIButton *doneBtn; //完成
    
}
@end

@implementation WithDrawInfoViewController

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
    self.title = @"提现详情";
    

    
    //头像
    headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width/2-78*WIDTH_NIT, 30*WIDTH_NIT, 156*WIDTH_NIT, 156*WIDTH_NIT)];
    headerImgView.image = [UIImage imageNamed:@"shalou"];
    [self.view addSubview:headerImgView];
    
    
    //提示
    UILabel *tipsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, headerImgView.bottom +20*WIDTH_NIT, kScreen_Width, 20*WIDTH_NIT)];
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    tipsLabel.font = Font(15);
    tipsLabel.textColor = NameColor;
    tipsLabel.text = @"提现申请已提交";
    [self.view addSubview:tipsLabel];
    
    //支付宝
    alipayLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, tipsLabel.bottom +10*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 40*WIDTH_NIT)];
    alipayLabel.backgroundColor = [UIColor whiteColor];
    alipayLabel.font = Font(15);
    alipayLabel.textColor = MainGoldColor;
    alipayLabel.text = @"提现到   支付宝 249227498@qq.com";
    [self.view addSubview:alipayLabel];
    
    
    //提现金额
    withDrawLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, alipayLabel.bottom +1*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 40*WIDTH_NIT)];
    withDrawLabel.backgroundColor = [UIColor whiteColor];
    withDrawLabel.font = Font(15);
    withDrawLabel.textColor = MainGoldColor;
    withDrawLabel.text = @"提现金额   ¥ 20.00";
    [self.view addSubview:withDrawLabel];
    
    
    //完成
    doneBtn=[[UIButton alloc] initWithFrame:CGRectMake(20*WIDTH_NIT, withDrawLabel.bottom + 30*WIDTH_NIT, kScreen_Width-40*WIDTH_NIT, 40*WIDTH_NIT)];
    doneBtn.titleLabel.font = Font(20);
    doneBtn.backgroundColor=MainGoldColor;
    [doneBtn setTitleColor:MainWhiteColor];
    [doneBtn setTitle:@"完成" forState:UIControlStateNormal];
    doneBtn.layer.cornerRadius=5;
    doneBtn.layer.masksToBounds=YES;
    [doneBtn addTarget:self action:@selector(doneAct:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:doneBtn];
    
}





#pragma mark -- 完成
-(void)doneAct:(UIButton *)button{
    NSLog(@"完成");
  
    
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
