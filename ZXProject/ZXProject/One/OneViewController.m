//
//  OneViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//
#import "TestModel.h" //测试model

#import "OneViewController.h"
#import "OneHeadView.h"



@interface OneViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) OneHeadView *oneHeadView;


@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation OneViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    [self setData];
    //初始试图
    [self setView];
    
}

#pragma mark --初始化数据
-(void)setData{
    
    //设置tabViewHeader
    _oneHeadView = [[OneHeadView alloc]init];
    
}


#pragma mark - 初加载数据
-(void)loadNewData{
    
    [self endRefresh];
}


#pragma mark - 加载数据
-(void)didlaodDataButton{
    
    
    self.loading = YES;
    //模拟加载延迟
    WEAK_SELF;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        STRONG_SELF;
        //初始化数据
        _dataArray = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
        [self.tableView reloadData];
        [self endRefresh];
        self.loading = NO;
        
    });

    
}


#pragma mark --初始化数据视图
-(void)setView{
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-kScreen_tabBarHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //设置tabViewHeader
    _oneHeadView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Width/3*2);
    
}

#pragma mark当网络请求开始或结束时，下面两个方法将会被调到。
- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId{
  
    
}

- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId{
 
}

#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
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
    
    static NSString *cellIdentifier=@"cell";
    
    //首先根据标示去缓存池取
    UITableViewCell *cell=nil;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
