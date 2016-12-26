//
//  OneViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//
#import "TestModel.h" //测试model

//cellheader的高度   280   70
#define OneCell_Header_Height 10*WIDTH_NIT+35*WIDTH_NIT

/************C************/
#import "OneViewController.h"
#import "OneJoinPartyViewController.h" //参与活动
#import "OneJoinMiaoCircleViewController.h" //加入喵圈
#import "OneMiaoQuestionSquareViewController.h" //喵问专家
#import "OneModifiedUnderstandingViewController.h" //改装心得
#import "OneCasesShowViewController.h" //案例展示
#import "OneModifiedWikiViewController.h" //改装百科
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

-(void)ZXsuccessData:(id)data byRequestId:(NSInteger)requestId{
    
}


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
    _oneHeadView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Width/750*470);
    _oneHeadView.backgroundColor = BGColor;
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
    
    return OneCell_Header_Height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    headerView.backgroundColor = BGColor;
    //cell的标题
    UILabel *cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 10*WIDTH_NIT, kScreen_Width, 35*WIDTH_NIT)];
    cellTitle.font = TwoFont;
    cellTitle.textColor = OneTextColor;
    cellTitle.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:cellTitle];
    //cell的按钮
    UIButton * cellMoreBtn = [[UIButton alloc]initWithFrame:CGRectMake(headerView.width-75*WIDTH_NIT, 10*WIDTH_NIT, 70*WIDTH_NIT, 35*WIDTH_NIT)];
    [cellMoreBtn setBackgroundColor:[UIColor whiteColor]];
    [cellMoreBtn setTitle:@"更多>>"];
    cellMoreBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [cellMoreBtn setTitleColor:ThreeTextColor];
    cellMoreBtn.titleLabel.font = FourFont;
    [cellMoreBtn addTarget:self action:@selector(cellMoreTap:)];
    [headerView addSubview:cellMoreBtn];
    
    if (section == 0) {
        cellTitle.text = @"    改装百科";
        cellMoreBtn.tag = 0;
    }
    if (section == 1) {
        cellTitle.text = @"    精选案例";
        cellMoreBtn.tag = 1;
    }
    
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
        NSString *cellIdentifier = [NSString stringWithFormat:@"OneModifiedEncyclopediaTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        OneModifiedEncyclopediaTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[OneModifiedEncyclopediaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        return cell;
    }
    
    //精选案例
    if (indexPath.section == 1) {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"OneChosenCasesTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        OneChosenCasesTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[OneChosenCasesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        return cell;
    }
   
    
    static NSString *cellIdentifier=@"cell";
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
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
        }else
        if (tag == 102) {
            //喵问专家
            OneMiaoQuestionSquareViewController *mqVC = [[OneMiaoQuestionSquareViewController alloc]init];
            [self.navigationController pushViewController:mqVC animated:YES];
        }else
        if (tag == 103) {
            //改装心得
            OneModifiedUnderstandingViewController *muVC = [[OneModifiedUnderstandingViewController alloc]init];
            [self.navigationController pushViewController:muVC animated:YES];
        }else
        if (tag == 104) {
            //案例展示
            OneCasesShowViewController *chVC = [[OneCasesShowViewController alloc]init];
            [self.navigationController pushViewController:chVC animated:YES];
        }else
        if (tag == 105) {
            //改装百科
            OneModifiedWikiViewController *mwVC = [[OneModifiedWikiViewController alloc]init];
            [self.navigationController pushViewController:mwVC animated:YES];
        }
    }
}

#pragma mark -cell头部功能执行（更多）
-(void)cellMoreTap:(UIButton *)button{
    
    NSLog(@"更多:%ld",(long)button.tag);
    //tag = 0 改装百科   tag = 1 精选案例
    if (button.tag == 0) {
        //改装百科
        OneModifiedWikiViewController *mwVC = [[OneModifiedWikiViewController alloc]init];
        [self.navigationController pushViewController:mwVC animated:YES];
    }else if (button.tag == 1){
        //案例展示
        OneCasesShowViewController *chVC = [[OneCasesShowViewController alloc]init];
        [self.navigationController pushViewController:chVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
