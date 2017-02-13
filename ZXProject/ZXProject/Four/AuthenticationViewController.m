//
//  AuthenticationViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cell的高度
#define AuthenticationCell_Height 45*WIDTH_NIT


/************C************/
#import "AuthenticationViewController.h"
#import "PersonalAuthViewController.h" //个人认证
#import "CompanyAuthViewController.h" //机构认证
/************V************/

/************M************/

@interface AuthenticationViewController ()

@property (nonatomic, strong) NSArray *listFunctionArr;

@end

@implementation AuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
-(void)setupData{
    
    _listFunctionArr = [NSArray arrayWithObjects:
                        @{@"icon" : @"", @"title" : @"我是技师", @"subTitle" : @""},
                        @{@"icon" : @"", @"title" : @"我是机构", @"subTitle" : @""},
                        nil];
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
    self.title = @"我要认证";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    self.tableView.separatorStyle = YES;
    self.tableView.scrollEnabled = NO;
    [self.view insertSubview:self.tableView atIndex:1];
    
}

#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _listFunctionArr.count;
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
    
    
    NSString *cellTitle = _listFunctionArr[indexPath.row][@"title"];
    NSString *cellsubTitle = _listFunctionArr[indexPath.row][@"subTitle"];
    
    static NSString *cellIdentifier=@"cell";
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = Font15;
        cell.textLabel.textColor = NameColor;
    }
    
    cell.textLabel.text =  cellTitle;
    cell.detailTextLabel.text =  cellsubTitle;
    return cell;
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return AuthenticationCell_Height;
}


#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *tempStr = _listFunctionArr[indexPath.row][@"title"];
    if ([tempStr isEqualToString:@"我是技师"]) {
        NSLog(@"我是技师");
        PersonalAuthViewController *personVC = [[PersonalAuthViewController alloc]init];
        [self.navigationController pushViewController:personVC animated:YES];
        
    }else if ([tempStr isEqualToString:@"我是机构"]) {
        NSLog(@"我是机构");
        CompanyAuthViewController *companyVC = [[CompanyAuthViewController alloc]init];
        [self.navigationController pushViewController:companyVC animated:YES];
    }
    
    
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
