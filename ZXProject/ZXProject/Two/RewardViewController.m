//
//  RewardViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


//cellheader的高度   280   70
#define RewardCell_Header_Height 1*WIDTH_NIT
#define RewardCell_Footer_Height 1*WIDTH_NIT



/************C************/
#import "RewardViewController.h"
/************V************/
#import "RewardTableViewCell.h"
/************M************/



@interface RewardViewController ()



@end

@implementation RewardViewController

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
    self.title = @"";
    
    
    //标题segmentController
    self.segItems = @[@"收到打赏", @"打赏他人"];
    
//    //标题segmentController
//    [self.seg setTitle:@"受到打赏" forSegmentAtIndex:0];
//    [self.seg setTitle:@"打赏他人" forSegmentAtIndex:1];
    self.navigationItem.titleView = self.seg;
    
    // 页面scrollView
    self.pageScrollView.tag = 100;
    [self.view addSubview: self.pageScrollView];
    // 创建scrollView上得视图
    for (NSInteger i = 0; i < 2; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kScreen_Width * i, 0, kScreen_Width, kScreen_Height)];
        [self.pageScrollView addSubview:view];
        if (i == 0) {
            
        }
        view.tag = 10000 + i;
    }
    
    // 左边的tableView
    UIView *view1 = (UIView *)[self.view viewWithTag:10000];
    [view1 addSubview:self.lefttableView];
    
    
    // 右边的tableView
    UIView *view2 = (UIView *)[self.view viewWithTag:10001];
    [view2 addSubview:self.rightTableView];
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return RewardCell_Header_Height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return RewardCell_Footer_Height;
    
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
    
    
    if (tableView == self.lefttableView) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"lefttableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        RewardTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[RewardTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
//        cell.textLabel.text = [NSString stringWithFormat:@"左边--%ld", (long)indexPath.row];
        return cell;
        
        
    }else
    {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"rightTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        RewardTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[RewardTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
//        cell.textLabel.text = [NSString stringWithFormat:@"右边--%ld", (long)indexPath.row];
        return cell;
    }
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return RewardCell_Height;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
}

#pragma mark -加载左边数据
-(void)loadLeftTableViewData{
    
    NSLog(@"加载左边数据");
}

#pragma mark -加载右边数据
-(void)loadRightTableViewData{
    NSLog(@"加载右边数据");
    
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
