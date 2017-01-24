//
//  FourViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cellheader的高度   280   70
#define FourCell_Header_Height 10*WIDTH_NIT+35*WIDTH_NIT
#define FourCell_Height 50*WIDTH_NIT

/************C************/
#import "FourViewController.h"
#import "PersonalMainViewController.h" //个人主页
#import "PersonalInfoViewController.h" //个人资料
#import "FeedBackViewController.h" //意见反馈
#import "FourSettingViewController.h" //设置
#import "MaoCoinInfoTableViewController.h" //猫币明细
#import "BalanceViewController.h"  //余额

#import "CollectionViewController.h" //收藏
#import "NotesViewController.h" //帖子
#import "ExperienceViewController.h" //心得
/************V************/
#import "FourHeadView.h" //顶部视图
#import "FourDailyManagementTableViewCell.h" //日常管理
/************M************/


@interface FourViewController ()<FourHeadViewDelegate,FourDailyManagementCellDelegate>

@property (nonatomic, strong) FourHeadView *fourHeadView;
@property (nonatomic, strong) NSArray *listFunctionArr;

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
#pragma mark -分享数据
- (ZXShareModel *)setupShareModel {
    ZXShareModel *shareModel = [[ZXShareModel alloc] init];
    shareModel.shareTitle = @"五爪猫";
    shareModel.shareContent = @"五爪猫";
    shareModel.shareImage = @"五爪猫";
    shareModel.shareUrl = @"www.baidu.com";
    return shareModel;
}


#pragma mark -执行数据
#pragma mark --初始化数据
-(void)setupData{
    
    //设置tabViewHeader
    _fourHeadView = [[FourHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width/3)];
    
    _listFunctionArr = [NSArray arrayWithObjects:@[],
                  @[@{@"icon" : @"", @"title" : @"猫币商城"},
                  @{@"icon" : @"", @"title" : @"邀请好友"},
                  @{@"icon" : @"", @"title" : @"意见反馈"},
                  @{@"icon" : @"", @"title" : @"设置"}],
                nil];
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
    self.title = @"喵窝";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-kScreen_tabBarHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //设置tabViewHeader
    _fourHeadView.backgroundColor = BGColor;
    _fourHeadView.delegate = self;
    _fourHeadView.userId = @"1";
    self.tableView.tableHeaderView = _fourHeadView;
    _fourHeadView.headClickBlock = ^(NSString *userId){
        
        NSLog(@"点击头像");
    };
    
    
    //主页
    UIButton* personalBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    personalBtn.frame = CGRectMake(0, 0, 80, 44);
    [personalBtn setTitle:@"主页"];
    [personalBtn setTitleColor:KNavigationTitleColor];
    [personalBtn addTarget:self action:@selector(personalAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:personalBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 1) {
        return [_listFunctionArr[section] count];
    }
    
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return FourCell_Header_Height;
    }
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    headerView.backgroundColor = BGColor;
    
    if (section == 0) {
        UILabel *cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 10*WIDTH_NIT, kScreen_Width, 35*WIDTH_NIT)];
        cellTitle.font = TwoFont;
        cellTitle.textColor = OneTextColor;
        cellTitle.backgroundColor = [UIColor whiteColor];
        [headerView addSubview:cellTitle];
        cellTitle.text = @"    日常管理";
       
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
    
    
    if (indexPath.section == 0) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"FourDailyManagementTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        FourDailyManagementTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[FourDailyManagementTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;

    }else{
    
        
        static NSString *cellIdentifier=@"cell";
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.textLabel.text =  _listFunctionArr[indexPath.section][indexPath.row][@"title"];
        return cell;
        
        
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return FourDailyManagementCell_Height;
    }
    
    
    return FourCell_Height;
}


#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 1) {
        
        NSString *tempStr = _listFunctionArr[indexPath.section][indexPath.row][@"title"];
        if ([tempStr isEqualToString:@"猫币商城"]) {
            NSLog(@"猫币商城");
        } else if ([tempStr isEqualToString:@"邀请好友"]) {
            NSLog(@"邀请好友");
            [[ZXShareHelper shareInstance] shareWithShareModel:[self setupShareModel]];
        } else if ([tempStr isEqualToString:@"意见反馈"]) {
            NSLog(@"意见反馈");
            FeedBackViewController *feedVC = [[FeedBackViewController alloc]init];
            [self.navigationController pushViewController:feedVC animated:YES];
        } else if ([tempStr isEqualToString:@"设置"]) {
            NSLog(@"设置");
            FourSettingViewController *fsettingVC = [[FourSettingViewController alloc]init];
            [self.navigationController pushViewController:fsettingVC animated:YES];
            
        }
        
        
        
    }
    
    
    
}


#pragma mark -- 0 为跳转用户详情 123分别跳转 喵币、余额、喵友
-(void)fourHeadViewSelect2go:(NSInteger)tag{
    
    NSLog(@"跳转 %ld",(long)tag);
    switch (tag) {
        case 0:{
            //个人资料
            PersonalInfoViewController *personVC = [[PersonalInfoViewController alloc]init];
            [self.navigationController pushViewController:personVC animated:YES];
            
        }
            break;
        case 1:{
            //喵币
            MaoCoinInfoTableViewController *maoCoinVC = [[MaoCoinInfoTableViewController alloc]init];
            [self.navigationController pushViewController:maoCoinVC animated:YES];
            
        }
            break;
            
        case 2:{
            //余额
            BalanceViewController *balanceVC = [[BalanceViewController alloc]init];
            [self.navigationController pushViewController:balanceVC animated:YES];
            
        }
            break;
        default:
            break;
    }
   
}

#pragma mark -- 012345分别为"收藏", @"认证", @"活动", @"问题", @"帖子", @"心得"
-(void)fourDailyManagementCellSelect2go:(NSInteger)tag{
    
    NSLog(@"跳转 %ld",(long)tag);
    switch (tag) {
           
        case 0:{
            //收藏
            CollectionViewController *collectionVC = [[CollectionViewController alloc]init];
            [self.navigationController pushViewController:collectionVC animated:YES];
        }
            break;
            
        case 4:{
            //帖子
            NotesViewController *noteVC = [[NotesViewController alloc]init];
            [self.navigationController pushViewController:noteVC animated:YES];
        }
            break;
       
        case 5:{
            //帖子
            ExperienceViewController *experienceVC = [[ExperienceViewController alloc]init];
            [self.navigationController pushViewController:experienceVC animated:YES];
        }
            
            break;
            
        default:
            break;
    }
}

#pragma mark -- 跳转个人主页
-(void)personalAct{
    
    PersonalMainViewController *personVC = [[PersonalMainViewController alloc]init];
    [self.navigationController pushViewController:personVC animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
