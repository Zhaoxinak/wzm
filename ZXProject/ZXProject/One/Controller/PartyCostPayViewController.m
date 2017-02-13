//
//  PartyCostPayViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/17.
//  Copyright © 2017年 Mr.X. All rights reserved.
//



/************C************/
#import "PartyCostPayViewController.h"
/************V************/
#import "OneJoinPartyTableViewCell.h"  //活动
/************M************/


@interface PartyCostPayViewController ()

@property (nonatomic, strong) NSArray *partyCostPayArr;
@property (nonatomic, strong) UIButton *payBtn;

@end

@implementation PartyCostPayViewController

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
    
     _partyCostPayArr = [NSArray arrayWithObjects:@{@"icon" : @"微信支付", @"title" : @"微信支付"},@{@"icon" : @"支付宝支付", @"title" : @"支付宝支付"},@{@"icon" : @"余额支付", @"title" : @"余额支付"}, nil];
    
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
    self.title = @"活动支付";
    

    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];
    
    //支付剩余时间
    UILabel *lastTime = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 32*WIDTH_NIT)];
    lastTime.backgroundColor = MainGoldColor;
    lastTime.textColor = MainWhiteColor;
    lastTime.font = Font12;
    lastTime.textAlignment = NSTextAlignmentCenter;
    lastTime.text = @"剩余支付时间 29:29";
    self.tableView.tableHeaderView = lastTime;
    
    
    //支付按钮
    _payBtn = [[UIButton alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 410*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 42*WIDTH_NIT)];
    _payBtn.layer.cornerRadius = 5;
    [_payBtn setTitle:@"前往支付"];
    [_payBtn setBackgroundColor:MainGoldColor];
    [_payBtn addTarget:self action:@selector(payAct:)];
    [self.view addSubview:_payBtn];
}

#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 1) {
        return _partyCostPayArr.count;
    }
    
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10*WIDTH_NIT;
    
}






-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    headerView.backgroundColor = BGColor;
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    footerView.backgroundColor = BGColor;
    return footerView;
}



#pragma mark - UITableView展示

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"OneJoinPartyTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        OneJoinPartyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[OneJoinPartyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        return cell;
    }else{
        
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
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return OneJoinPartyCell_Height;
    }
    
    return 50*WIDTH_NIT;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark -支付功能
-(void)payAct:(UIButton *)button{
    NSLog(@"支付");
    
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
