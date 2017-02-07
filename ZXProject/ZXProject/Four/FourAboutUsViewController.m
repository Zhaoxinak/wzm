//
//  FourAboutUsViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cell的高度
#define FourAboutUsCell_Height 50*WIDTH_NIT


#import "FourAboutUsViewController.h"

@interface FourAboutUsViewController ()

@property (nonatomic, strong) NSArray *listFunctionArr;

@end

@implementation FourAboutUsViewController

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
                        @{@"icon" : @"", @"title" : @"公司介绍", @"subTitle" : @""},
                        @{@"icon" : @"", @"title" : @"条款协议", @"subTitle" : @""},
                        @{@"icon" : @"", @"title" : @"客服电话", @"subTitle" : @"400-2323-222"},
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
    self.title = @"关于我们";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    self.tableView.scrollEnabled = NO;
    [self.view insertSubview:self.tableView atIndex:1];
    
    //顶部app图标版本信息
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width/2)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(headerView.width/2-40*WIDTH_NIT, 40*WIDTH_NIT, 80*WIDTH_NIT, 80*WIDTH_NIT)];
    headerImgView.layer.cornerRadius = 8;
    headerImgView.backgroundColor = [UIColor redColor];
    headerImgView.image = [UIImage imageNamed:@"app_icon"];
    headerImgView.clipsToBounds = YES;
    [headerView addSubview:headerImgView];
  
    
    //当前版本
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, headerImgView.bottom+10*WIDTH_NIT, headerView.width, 50*WIDTH_NIT)];
    versionLabel.text = [NSString stringWithFormat:@"v%@\n五爪猫", app_Version];
    versionLabel.textAlignment = NSTextAlignmentCenter;
    versionLabel.numberOfLines = 2;
    versionLabel.font = Font13;
    versionLabel.textColor = OneTextColor;
    [headerView addSubview:versionLabel];
    
    
    self.tableView.tableHeaderView = headerView;

    
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
    }
    
    cell.textLabel.text =  cellTitle;
    cell.detailTextLabel.text =  cellsubTitle;
    return cell;
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return FourAboutUsCell_Height;
}


#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *tempStr = _listFunctionArr[indexPath.row][@"title"];
    if ([tempStr isEqualToString:@"公司介绍"]) {
        NSLog(@"公司介绍");
    } else if ([tempStr isEqualToString:@"条款协议"]) {
        NSLog(@"条款协议");
    }else if ([tempStr isEqualToString:@"客服电话"]) {
        NSLog(@"客服电话");
        
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
