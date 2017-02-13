//
//  MiaoQuestionInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


/************C************/
#import "MiaoQuestionInfoViewController.h"
/************V************/
#import "MiaoQuestionTitleTableViewCell.h" //顶部
/************M************/
#import "MiaoQuestionInfoModel.h" //


@interface MiaoQuestionInfoViewController ()<MiaoQuestionTitleDelegate>

@property(nonatomic, strong)MiaoQuestionInfoModel *miaoQuestionModel;

@end

@implementation MiaoQuestionInfoViewController

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
    self.title = @"问题详情";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //回答问题
    UIButton* answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    answerBtn.frame = CGRectMake(0, 0, 60, 44);
    [answerBtn setTitle:@"回答问题"];
    [answerBtn setTitleColor:KNavigationTitleColor];
    answerBtn.titleLabel.font = Font13;
    [answerBtn addTarget:self action:@selector(answerAct:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:answerBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 1) {
        return 10;
    }
    
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
    
    //顶部详情
    if (indexPath.section == 0) {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"MiaoQuestionTitleTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        MiaoQuestionTitleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[MiaoQuestionTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
        }
        
        return cell;
        
    }else
    {
        
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
    
    
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        return [MiaoQuestionTitleTableViewCell caculateMiaoQuestionTitleCellHeightWithContent:_miaoQuestionModel];
    }
    
    return 49.f;
    
    
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark -回答问题
-(void)answerAct:(UIButton *)button{
    
    NSLog(@"回答问题");
}

#pragma mark --- title取消按钮
-(void)miaoQuestionTitleCancel2go:(NSInteger)tag{
    
    NSLog(@"取消c");
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
