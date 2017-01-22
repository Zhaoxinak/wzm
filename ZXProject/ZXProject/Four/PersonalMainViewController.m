//
//  PersonalMainViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/22.
//  Copyright © 2017年 Mr.X. All rights reserved.
//
//cellheader的高度   280   70
#define PersonalMainCell_Header_Height 1*WIDTH_NIT
#define PersonalMainCell_Footer_Height 1*WIDTH_NIT

/************C************/
#import "PersonalMainViewController.h"
/************V************/

/************M************/


@interface PersonalMainViewController ()


@end

@implementation PersonalMainViewController

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
    self.title = @"个人主页";
    
    NSArray *titleArr = [NSArray arrayWithObjects:@"资料", @"圈子", @"问题", @"心得" ,nil];
    self.seg.titleArray = titleArr;
    self.seg.frame = CGRectMake(0, kScreen_Width/2, kScreen_Width, 44);
    [self.view addSubview:self.seg];
    
    // 页面scrollView
    self.pageScrollView.frame = CGRectMake(0, self.seg.bottom, kScreen_Width, kScreen_Height-kScreen_NavHeight-self.seg.bottom);
    self.pageScrollView.tag = 100;
    [self.view addSubview: self.pageScrollView];
   
    // 创建scrollView上得视图
    for (NSInteger i = 0; i < 4; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kScreen_Width * i, 0, kScreen_Width, self.pageScrollView.height)];
        [self.pageScrollView addSubview:view];
        if (i == 0) {
            
        }
        view.tag = 10000 + i;
    }
    
    // onetableView
    UIView *view1 = (UIView *)[self.view viewWithTag:10000];
    self.onetableView.frame = CGRectMake(0, 0, kScreen_Width, view1.height);
    [view1 addSubview:self.onetableView];
    
    // twoTableView
    UIView *view2 = (UIView *)[self.view viewWithTag:10001];
    self.twoTableView.frame = CGRectMake(0, 0, kScreen_Width, view2.height);
    [view2 addSubview:self.twoTableView];
    
    // threetableView
    UIView *view3 = (UIView *)[self.view viewWithTag:10002];
    self.threetableView.frame = CGRectMake(0, 0, kScreen_Width, view3.height);
    [view3 addSubview:self.threetableView];
    
    // fourTableView
    UIView *view4 = (UIView *)[self.view viewWithTag:10003];
    self.fourTableView.frame = CGRectMake(0, 0, kScreen_Width, view4.height);
    [view4 addSubview:self.fourTableView];
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return PersonalMainCell_Header_Height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return PersonalMainCell_Footer_Height;
    
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
    
    
    if (tableView == self.onetableView) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"onetableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
                cell.textLabel.text = [NSString stringWithFormat:@"onetableView--%ld", (long)indexPath.row];
        return cell;
        
        
    }else
    if (tableView == self.twoTableView) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"twoTableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"twoTableView--%ld", (long)indexPath.row];
        return cell;
        
        
    }else
    if (tableView == self.threetableView) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"threetableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"threetableView--%ld", (long)indexPath.row];
        return cell;
        
        
    }else
    {
        NSString *cellIdentifier = [NSString stringWithFormat:@"fourTableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"fourTableView--%ld", (long)indexPath.row];
        return cell;
        
        
    }
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.f;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
}


#pragma mark -第一个tableview数据
-(void)loadOneTableViewData{
    NSLog(@"加载OneTableView数据");
    
}

#pragma mark -第二个tableview数据
-(void)loadTwoTableViewData{
    
    NSLog(@"加载TwoTableView数据");
}

#pragma mark -第三个tableview数据
-(void)loadThreeTableViewData{
    
    NSLog(@"加载ThreeTableView数据");
}

#pragma mark -第四个tableview数据
-(void)loadFourTableViewData{
    
    NSLog(@"加载FourTableView数据");
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
