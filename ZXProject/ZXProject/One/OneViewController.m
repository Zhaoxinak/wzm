//
//  OneViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//
#import "TestModel.h" //测试model

/************C************/
#import "OneViewController.h"
#import "OneJoinPartyViewController.h" //参与活动
#import "OneJoinMiaoCircleViewController.h" //加入喵圈
/************V************/
#import "OneHeadView.h" //顶部视图
#import "OneModifiedEncyclopediaTableViewCell.h"  //改装百科
#import "OneChosenCasesTableViewCell.h"  //精选案例
/************M************/
#import "HomePageModel.h"


@interface OneViewController ()<OneHeadViewDelegate>

@property (nonatomic, strong) OneHeadView *oneHeadView;

@end

@implementation OneViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self setData];
    //初始试图
    [self setView];
    
}

#pragma mark -执行数据
#pragma mark --初始化数据
-(void)setData{
    
    //设置tabViewHeader
    _oneHeadView = [[OneHeadView alloc]init];
    
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
- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId{
    
    
}

- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId{
    
}


#pragma mark -执行视图
#pragma mark --初始化数据视图
-(void)setView{
    
    //设置标题
    self.navigationItem.title = @"五爪猫";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-kScreen_tabBarHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //设置tabViewHeader
    _oneHeadView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Width/3*2);
    _oneHeadView.delegate = self;
    self.tableView.tableHeaderView = _oneHeadView;
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
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
    
    //改装百科
    if (indexPath.section == 0) {
        static NSString *cellIdentifier=@"OneModifiedEncyclopediaTableViewCell";
        
        //首先根据标示去缓存池取
        OneModifiedEncyclopediaTableViewCell *cell=nil;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[OneModifiedEncyclopediaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        return cell;
    }
    
    //精选案例
    if (indexPath.section == 1) {
        static NSString *cellIdentifier=@"OneChosenCasesTableViewCell";
        
        //首先根据标示去缓存池取
        OneChosenCasesTableViewCell *cell=nil;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[OneChosenCasesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        return cell;
    }
   
    
    static NSString *cellIdentifier=@"cell";
    //首先根据标示去缓存池取
    UITableViewCell *cell=nil;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return OneModifiedCell_Height;
    }
    if (indexPath.section == 1) {
        return OneChosenCasesCell_Height;
    }
    return 44;
}


#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}


#pragma mark -- 实现轮播图与按钮 同时跳转 低于100为轮播， 高于等于100为按钮
-(void)oneHeadViewSelect2go:(NSInteger)tag{
    
    
    
    
    
    //实现按钮跳转
    if (tag>= 100) {
        if (tag == 100) {
            //参与活动
            OneJoinPartyViewController *jpVC = [[OneJoinPartyViewController alloc]init];
            [self.navigationController pushViewController:jpVC animated:YES];
        }else
        if (tag == 101) {
            //加入喵圈
            OneJoinMiaoCircleViewController *jmVC = [[OneJoinMiaoCircleViewController alloc]init];
            [self.navigationController pushViewController:jmVC animated:YES];
        }
        
    
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
