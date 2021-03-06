//
//  OneMiaoQuestionSquareViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/26.
//  Copyright © 2016年 Mr.X. All rights reserved.
//


/************C************/
#import "OneMiaoQuestionSquareViewController.h"
#import "PublishQuestionViewController.h" //发布问题
#import "MiaoQuestionInfoViewController.h" //问题详情
/************V************/
#import "OneMiaoQuestionSquareTableViewCell.h"  //喵问广场
/************M************/
#import "OneMiaoQuestionSquareModel.h"


@interface OneMiaoQuestionSquareViewController ()

@end

@implementation OneMiaoQuestionSquareViewController

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
    self.title = @"你问我答";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];
    
    //发布问题
    UIButton* askBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    askBtn.frame = CGRectMake(0, 0, 44, 44);
    askBtn.titleLabel.font = Font24;
    [askBtn setImage:@"问答"];
    [askBtn addTarget:self action:@selector(askAct:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:askBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
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
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"OneMiaoQuestionSquareTableViewCell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    OneMiaoQuestionSquareTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[OneMiaoQuestionSquareTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    OneMiaoQuestionSquareFrameModel *note = [[OneMiaoQuestionSquareFrameModel alloc]init];
    [note setModel:nil];
    [cell setFrameModel:note];
    //        TwoHotNoteFrameModel *frameModel = _hotNoteMArr[indexPath.row];
    //        cell.frameModel = frameModel;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //        ThreeHotNoteFrameModel *frameModel = _hotNoteMArr[indexPath.row];
    //        return frameModel.cellHeight;
    return kScreen_Width/2;
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    MiaoQuestionInfoViewController *questionVC = [[MiaoQuestionInfoViewController alloc]init];
    [self.navigationController pushViewController:questionVC animated:YES];
    
}

#pragma mark -发起问题
-(void)askAct:(UIButton *)button{
    
    NSLog(@"发起问题");
    PublishQuestionViewController *publishVC = [[PublishQuestionViewController alloc]init];
    [self.navigationController pushViewController:publishVC animated:YES];
    
}

@end
