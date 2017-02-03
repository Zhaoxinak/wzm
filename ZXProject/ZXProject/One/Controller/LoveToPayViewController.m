//
//  LoveToPayViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

/************C************/
#import "LoveToPayViewController.h"
/************V************/
#import "ZXLoginTextField.h"
/************M************/

@interface LoveToPayViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) NSArray *partyCostPayArr;  //打赏方式
@property (nonatomic, strong) UIButton *payBtn; //打赏按钮
@property (nonatomic, strong) UIImageView *headImageView; //头像
@property (nonatomic, strong) UILabel *userNameLabel; //用户名
@property (nonatomic, strong) UIButton *moneyBtn; //金额选择
@property (nonatomic, strong) ZXLoginTextField *moneyField; //金额填写


@end

@implementation LoveToPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupData];
    
    [self setupView];
}

#pragma mark - 刷新系统
-(void)setRefresh{
}
-(void)setHeaderRefresh{
}


#pragma mark -执行数据
#pragma mark --初始化数据
-(void)setupData{
    
    _partyCostPayArr = [NSArray arrayWithObjects:@{@"icon" : @"猫狗2", @"title" : @"微信支付"},@{@"icon" : @"猫狗2", @"title" : @"支付宝支付"},@{@"icon" : @"猫狗2", @"title" : @"余额支付"}, nil];
    
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
    self.title = @"打赏作者名";
    
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];
    
    
    
    //顶部头像和金额选择
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height/3*2)];
    topView.backgroundColor = [UIColor whiteColor];
    
    
    //头像
    self.headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10*WIDTH_NIT, 60*WIDTH_NIT, 60*WIDTH_NIT)];
    self.headImageView.centerX = topView.centerX;
    self.headImageView.backgroundColor = [UIColor redColor];
    self.headImageView.clipsToBounds = YES;
    self.headImageView.layer.cornerRadius = self.headImageView.size.width / 2;
    [topView addSubview:self.headImageView];
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    self.headImageView.userInteractionEnabled = YES;
    [self.headImageView addGestureRecognizer:tap];
    
    
    //用户名
    self.userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.headImageView.bottom + 5*WIDTH_NIT, topView.width, 20*WIDTH_NIT)];
    self.userNameLabel.textAlignment = NSTextAlignmentCenter;
    self.userNameLabel.textColor = OneTextColor;
    self.userNameLabel.font = ThreeFont;
    self.userNameLabel.text = @"水冰月";
    [topView addSubview:self.userNameLabel];
    
    //分割
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.userNameLabel.bottom + 20*WIDTH_NIT, topView.width, 10*WIDTH_NIT)];
    line.backgroundColor = BGColor;
    [topView addSubview:line];
    
    
    //金额选择
    //三列 九宫格
    NSInteger totalloc=3;
    CGFloat btnw=90*WIDTH_NIT;
    CGFloat btnh=60*WIDTH_NIT;
    
    CGFloat margin=(self.view.frame.size.width-totalloc*btnw)/(totalloc+1);
    int count=6;
    for (NSInteger i=0; i<count; i++) {
        NSInteger row=i/totalloc;//行号
        //1/3=0,2/3=0,3/3=1;
        NSInteger loc=i%totalloc;//列号
        
        CGFloat appviewx=margin+(margin+btnw)*loc;
        CGFloat appviewy=margin+(margin+btnh)*row;
        
        NSArray *moneyArray = [NSArray arrayWithObjects:@"5元",@"10元",@"20元", @"30元",@"50元",@"100元",nil];
        
        //创建按钮
        _moneyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _moneyBtn.frame= CGRectMake(appviewx, appviewy+line.bottom+10*WIDTH_NIT, btnw, btnh);
       // _moneyBtn.titleLabel.font=[UIFont systemFontOfSize:15.0];
        _moneyBtn.layer.cornerRadius = 5*WIDTH_NIT;
        _moneyBtn.layer.borderWidth = 0.5;
        _moneyBtn.layer.borderColor = [UIColor blackColor].CGColor;
        [_moneyBtn.layer setMasksToBounds:YES];
        [_moneyBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        [_moneyBtn setTitleColor:[UIColor redColor]forState:UIControlStateSelected];
        
        [_moneyBtn setTitle:[moneyArray objectAtIndex:i] forState:UIControlStateNormal];
        [_moneyBtn addTarget:self action:@selector(moneyPress:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:_moneyBtn];
        
        
    }
    
    //填写金额
    self.moneyField = [[ZXLoginTextField alloc] initWithType:NormalType];
    self.moneyField.frame = CGRectMake(20*WIDTH_NIT, _moneyBtn.bottom + 40*WIDTH_NIT, topView.width-40*WIDTH_NIT, 50*WIDTH_NIT);
    self.moneyField.leftLabel.text = @"";
    UILabel *yuan = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40*WIDTH_NIT, 50*WIDTH_NIT)];
    yuan.textAlignment = NSTextAlignmentCenter;
    yuan.text = @"元";
    self.moneyField.inputTextField.rightViewMode = UITextFieldViewModeAlways;
    self.moneyField.inputTextField.rightView = yuan;
    self.moneyField.inputTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.moneyField.inputTextField.layer.cornerRadius = 5;
    self.moneyField.inputTextField.delegate = self;
    [topView addSubview:self.moneyField];
    
    
    
    self.tableView.tableHeaderView = topView;
}


#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _partyCostPayArr.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 80*WIDTH_NIT;
    
}






-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    headerView.backgroundColor = BGColor;
    return headerView;
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    footerView.backgroundColor = BGColor;
    
    //支付按钮
    _payBtn = [[UIButton alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 20*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 40*WIDTH_NIT)];
    [_payBtn setTitle:@"打赏"];
    [_payBtn setBackgroundColor:[UIColor redColor]];
    [_payBtn addTarget:self action:@selector(payAct:)];
    [footerView addSubview:_payBtn];
    
    return footerView;
}



#pragma mark - UITableView展示

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"cell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    cell.imageView.image = [UIImage imageNamed:_partyCostPayArr[indexPath.row][@"icon"]];
    cell.textLabel.text = _partyCostPayArr[indexPath.row][@"title"];
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50*WIDTH_NIT;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark -点击头像
- (void)headTapAction:(UITapGestureRecognizer *)tap {
  
    NSLog(@"点击头像");
}

#pragma mark -金额选择
- (void)moneyPress:(UIButton*)button
{
    if(button!=_moneyBtn){
        _moneyBtn.selected=NO;
        _moneyBtn.layer.borderColor = [UIColor blackColor].CGColor;
        _moneyBtn=button;
        
    }
    _moneyBtn.selected=YES;
    _moneyBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.moneyField.inputTextField.text = [_moneyBtn.title substringWithRange:NSMakeRange(0, [_moneyBtn.title length] - 1)];
}


#pragma mark -支付功能
-(void)payAct:(UIButton *)button{
    NSLog(@"打赏");
    
}



#pragma mark -textfield 代理
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (_moneyBtn.selected == YES) {
        
        _moneyBtn.selected=NO;
        _moneyBtn.layer.borderColor = [UIColor blackColor].CGColor;
        self.moneyField.inputTextField.text = @"";
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
