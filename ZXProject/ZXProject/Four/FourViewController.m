//
//  FourViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cellheader的高度   280   70
#define FourCell_Header_Height 1*WIDTH_NIT


/************C************/
#import "FourViewController.h"

/************V************/
#import "FourHeadView.h" //顶部视图

/************M************/


@interface FourViewController ()<FourHeadViewDelegate>

@property (nonatomic, strong) FourHeadView *fourHeadView;

@end

@implementation FourViewController

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
    
    //设置tabViewHeader
    _fourHeadView = [[FourHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width/3)];
}


#pragma mark - 初加载数据
-(void)loadNewData{
    
    self.loading = YES;
    self.loading = NO;
    [self endRefresh];
}


#pragma mark - 加载数据
-(void)loadMoreData{
    
    [self endRefresh];
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
    self.navigationItem.title = @"五爪猫";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-kScreen_tabBarHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //设置tabViewHeader
    _fourHeadView.backgroundColor = BGColor;
    _fourHeadView.delegate = self;
    self.tableView.tableHeaderView = _fourHeadView;
    _fourHeadView.headClickBlock = ^(NSString *userId){
        
        NSLog(@"点击头像");
    };
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return FourCell_Header_Height;
    
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
    
   
    static NSString *cellIdentifier=@"cell";
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}


#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}


#pragma mark -- 0 为更换头像  1为跳转用户详情 234分别跳转 喵币、余额、喵友
-(void)fourHeadViewSelect2go:(NSInteger)tag{
    
   
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
