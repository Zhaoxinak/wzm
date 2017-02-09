//
//  CarsSelectedViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/9.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "CarsSelectedViewController.h"

@interface CarsSelectedViewController ()

@end

@implementation CarsSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据
    [self setupData];
    //初始试图
    [self setupView];
}

#pragma mark - 刷新系统
-(void)setRefresh{
}
-(void)setHeaderRefresh{
}

#pragma mark -执行数据
#pragma mark --初始化数据
//初始化数据源
- (void)setupData {
    
    
    
    
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
- (void)setupView {
    
    //初始化导航
    [self setupNaviItem];
    //初始化表视图
    [self setupTableView];
    
}

- (void)setupNaviItem {
    self.title = @"车型选择";
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmButton.frame = CGRectMake(0, 0, 56, 30);
    [confirmButton setTitleColor:KNavigationTitleColor forState:UIControlStateNormal];
    confirmButton.titleLabel.font = [UIFont systemFontOfSize:14];
    confirmButton.layer.borderColor = [UIColor whiteColor].CGColor;
    confirmButton.layer.borderWidth = 1.;
    confirmButton.layer.cornerRadius = 4;
    [confirmButton setTitle:@"提交" forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithCustomView:confirmButton];
    self.navigationItem.rightBarButtonItem = confirmItem;
    
}

- (void)setupTableView {
    
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height - kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
    
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
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"cell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60*WIDTH_NIT;
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

#pragma mark -提交
- (void)confirmAction {
    
   
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
