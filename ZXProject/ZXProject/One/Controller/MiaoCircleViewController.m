//
//  MiaoCircleViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/17.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


/************C************/
#import "MiaoCircleViewController.h"
#import "PublishMiaoCicleViewController.h" //发帖
/************V************/
#import "ThreeHotNoteTableViewCell.h" //热帖推荐
#import "MiaoCircleTopView.h" //圈内顶部 加入／公告
/************M************/
#import "ThreeMiaoCircleModel.h"

@interface MiaoCircleViewController ()<MiaoCircleTopViewDelegate>

@property (nonatomic, strong) NSMutableArray *hotNoteMArr; //热帖

@end

@implementation MiaoCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    
    [self setupView];
}


#pragma mark -执行数据
#pragma mark --初始化数据
-(void)setupData{
    
    self.hotNoteMArr = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6",nil];
    
    //    ThreeHotNoteFrameModel *frameModel = [ThreeHotNoteFrameModel new];
    //    frameModel.model = model;
    //    [_hotNoteMArr addObject:frameModel];
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
    self.title = @"音响改装圈";
    
    //发布按钮
    UIButton* publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    publishBtn.frame = CGRectMake(0, 0, 80, 44);
    [publishBtn setTitle:@"发帖"];
    [publishBtn setTitleColor:MainGoldColor];
    [publishBtn addTarget:self action:@selector(publishAct:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:publishBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];
    
    
    //顶部加入
    MiaoCircleTopView *miaoTopView = [[MiaoCircleTopView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 230*WIDTH_NIT)];
    miaoTopView.delegate = self;
    self.tableView.tableHeaderView = miaoTopView;
    
    
    
}

#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _hotNoteMArr.count;
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
    
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"ThreeHotNoteTableViewCell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    ThreeHotNoteTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[ThreeHotNoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //头像跳转
    WEAK_SELF;
    cell.headClickBlock = ^(NSString *userId) {
        STRONG_SELF;
        NSLog(@"头像---%@",userId);
        
    };
    
    ThreeHotNoteFrameModel *note = [[ThreeHotNoteFrameModel alloc]init];
    [note setModel:nil];
    [cell setFrameModel:note];
    //        ThreeHotNoteFrameModel *frameModel = _hotNoteMArr[indexPath.row];
    //        cell.frameModel = frameModel;

    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    ThreeHotNoteFrameModel *frameModel = _hotNoteMArr[indexPath.row];
//    return frameModel.cellHeight;
    
    return kScreen_Width/3;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark -发帖
-(void)publishAct:(UIButton *)button{
    
    NSLog(@"发帖");
    PublishMiaoCicleViewController *publishVC = [[PublishMiaoCicleViewController alloc]init];
    [self.navigationController pushViewController:publishVC animated:YES];
    
}

#pragma mark -加入圈子
-(void)miaoCircleTopViewSelect2go:(NSInteger)tag{
    
    NSLog(@"加入圈子");
    
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
