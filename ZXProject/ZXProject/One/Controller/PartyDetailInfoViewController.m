//
//  PartyDetailInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/14.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cellheader的高度   280   70
#define PartyDetailInfoCell_Header_Height 10*WIDTH_NIT+35*WIDTH_NIT
#define PartyDetailInfoCell_Height 44*WIDTH_NIT

/************C************/
#import "PartyDetailInfoViewController.h"
#import "PartyJoinedMemberViewController.h" //报名名单详情
#import "PartyCostPayViewController.h" //报名支付
/************V************/
#import "ZXCycleScrollView.h" //顶部视图
#import "PartyInfoTitleTableViewCell.h" //标题
#import "PartyInfoOrganizerTableViewCell.h" //主办方
#import "PartyJoinedMemberTableViewCell.h" //已报名者
/************M************/
#import "PartyDetailInfoModel.h"

@interface PartyDetailInfoViewController ()<ZXCycleScrollViewDelegate>

@property (nonatomic, strong) ZXCycleScrollView *zxCycleScrollView;
@property (nonatomic, strong) NSArray *partyInfoArr;

@end

@implementation PartyDetailInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
    
    [self setupView];
}



#pragma mark - 刷新系统
-(void)setRefresh{
}
-(void)setHeaderRefresh{
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


#pragma mark --初始化数据
-(void)setupData{
    
    
    
    
    /***********************************/
    [self refreshData]; //测试死数据
    
}

#pragma mark --刷新数据
- (void)refreshData {
    
 
    _partyInfoArr = [NSArray arrayWithObjects:@{@"icon" : @"猫狗2", @"title" : @"截止时间"},@{@"icon" : @"猫狗2", @"title" : @"地址地址"},@{@"icon" : @"猫狗2", @"title" : @"已经报名5人"},@{@"icon" : @"猫狗2", @"title" : @"免费"}, nil];
    
    
    
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
    self.title = @"活动详情";
    
    //分享按钮
    UIButton* shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, 0, 80, 44);
    [shareBtn setTitle:@"分享"];
    [shareBtn setTitleColor:KNavigationTitleColor];
    [shareBtn addTarget:self action:@selector(shareAct:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-60*WIDTH_NIT);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];
    
    
    //设置tabViewHeader
    _zxCycleScrollView = [[ZXCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width/750*470)];
    //设置tabViewHeader
    _zxCycleScrollView.backgroundColor = BGColor;
    _zxCycleScrollView.delegate = self;
    self.tableView.tableHeaderView = _zxCycleScrollView;
    
    //底部按钮
    [self setupBottomView];
}

#pragma mark --底部按钮
-(void)setupBottomView{
    
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.tableView.bottom, kScreen_Width,60*WIDTH_NIT)];
    bottomView.backgroundColor = BGColor;
    [self.view addSubview:bottomView];
    
    //和ta聊天
    UIButton *callHerBtn = [[UIButton alloc]initWithFrame: CGRectMake(0, 0, bottomView.width/7*2-1, bottomView.height)];
    callHerBtn.backgroundColor = [UIColor whiteColor];
    [callHerBtn setTitle:@"和Ta聊天"];
    [callHerBtn setImage:@"猫狗2"];
    callHerBtn.titleLabel.font = Font13;
    callHerBtn.titleColor = OneTextColor;
    [UIButton ImageUptoLabelDown:callHerBtn margin:5*WIDTH_NIT];
    [callHerBtn addTarget:self action:@selector(callHerAct:)];
    [bottomView addSubview:callHerBtn];
    
    //收藏
    UIButton *collectBtn = [[UIButton alloc]initWithFrame: CGRectMake(callHerBtn.right+1, 0, bottomView.width/7*2-1, bottomView.height)];
    collectBtn.backgroundColor = [UIColor whiteColor];
    [collectBtn setTitle:@"收藏"];
    [collectBtn setImage:@"猫狗2"];
    collectBtn.titleLabel.font = Font13;
    collectBtn.titleColor = OneTextColor;
    [UIButton ImageUptoLabelDown:collectBtn margin:5*WIDTH_NIT];
    [collectBtn addTarget:self action:@selector(collectBtn:)];
    [bottomView addSubview:collectBtn];
    
    //我要报名
    UIButton *joinBtn = [[UIButton alloc]initWithFrame: CGRectMake(collectBtn.right+1, 0, bottomView.width/7*3, bottomView.height)];
    joinBtn.backgroundColor = [UIColor whiteColor];
    [joinBtn setTitle:@"我要报名"];
    [joinBtn setImage:@"猫狗2"];
    joinBtn.titleLabel.font = Font13;
    joinBtn.titleColor = OneTextColor;
//    [UIButton ImageUptoLabelDown:joinBtn margin:5*WIDTH_NIT];
    [joinBtn addTarget:self action:@selector(joinBtn:)];
    [bottomView addSubview:joinBtn];
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 1) {
      return  _partyInfoArr.count;
    }
    
    
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0 ||section == 1 ||section == 2 ) {
        return 1;
    }
    
    return PartyDetailInfoCell_Header_Height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 1;
    
}






-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    headerView.backgroundColor = BGColor;
   
    UILabel *cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 10*WIDTH_NIT, kScreen_Width, 35*WIDTH_NIT)];
    //cell的标题
    
    cellTitle.font = Font13;
    cellTitle.textColor = OneTextColor;
    cellTitle.backgroundColor = [UIColor whiteColor];
    
    if (section == 3 || section == 4 || section == 5) {
       
        [headerView addSubview:cellTitle];
    }
    
   
    
    if (section == 3) {
        cellTitle.text = @"    活动详情";
        
    }
    if (section == 4) {
        cellTitle.text = @"    已报名（5）";
        
        //cell的按钮
        UIButton * allMemberBtn = [[UIButton alloc]initWithFrame:CGRectMake(headerView.width-75*WIDTH_NIT, 10*WIDTH_NIT, 70*WIDTH_NIT, 35*WIDTH_NIT)];
        [allMemberBtn setBackgroundColor:[UIColor whiteColor]];
        [allMemberBtn setTitle:@"所有报名>"];
        allMemberBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [allMemberBtn setTitleColor:ThreeTextColor];
        allMemberBtn.titleLabel.font = Font13;
        [allMemberBtn addTarget:self action:@selector(allMemberAct:)];
        [headerView addSubview:allMemberBtn];

    }
    
    if (section == 5) {
        cellTitle.text = @"    评论（12）";
        
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
    
    //活动标题
    if (indexPath.section == 0) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"PartyInfoTitleTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        PartyInfoTitleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[PartyInfoTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        return cell;
    }
    
    //活动详细内容
    if (indexPath.section == 1) {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"cell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        cell.imageView.image = [UIImage imageNamed:_partyInfoArr[indexPath.row][@"icon"]];
        cell.textLabel.text = _partyInfoArr[indexPath.row][@"title"];
        
        return cell;
    }
    
    //活动主办方
    if (indexPath.section == 2) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"PartyInfoOrganizerTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        PartyInfoOrganizerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[PartyInfoOrganizerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        cell.userId = @"1";
        cell.headClickBlock = ^(NSString *userId){
            
            NSLog(@"点击头像-- %@", userId);
            
        };
        return cell;
    }
    
    //已经报名
    if (indexPath.section == 4) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"PartyJoinedMemberTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        PartyJoinedMemberTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[PartyJoinedMemberTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        [cell setModel:nil];
       
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
        return PartyInfoTitleCell_Height;
    }
    if (indexPath.section == 1) {
        return PartyDetailInfoCell_Height;
    }
    if (indexPath.section == 2) {
        return PartyInfoOrganizerCell_Height;
    }
    if (indexPath.section == 4) {
        return PartyJoinedMemberCell_Height;
    }
    return 44;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}


#pragma mark -- 所有报名者
-(void)allMemberAct:(UIButton *)button{
    
    NSLog(@"所有报名");
    PartyJoinedMemberViewController *memberVC = [[PartyJoinedMemberViewController alloc]init];
    [self.navigationController pushViewController:memberVC animated:YES];
}

#pragma mark -- 实现轮播图跳转
-(void)zxCycleScrollViewSelect2go:(NSInteger)tag{
    
    NSLog(@"顶部轮播---%ld", (long)tag);
}

#pragma mark -- 查看参与者头像按钮点击
-(void)partyJoinedMemberCellSelect2go:(NSInteger)tag{
    
    NSLog(@"点击头像%ld", (long)tag);
}


#pragma mark -- 和ta聊天
-(void)callHerAct:(UIButton *)button{
    
    NSLog(@"和ta聊天");
    
}

#pragma mark -- 收藏
-(void)collectBtn:(UIButton *)button{
    
    NSLog(@"收藏");
    
}

#pragma mark -- 我要报名
-(void)joinBtn:(UIButton *)button{
    
    NSLog(@"我要报名");
    PartyCostPayViewController *partyCostVC = [[PartyCostPayViewController alloc]init];
    [self.navigationController pushViewController:partyCostVC animated:YES];
}

#pragma mark -- 分享
-(void)shareAct:(UIButton *)button{
    
    NSLog(@"分享");
    [[ZXShareHelper shareInstance] shareWithShareModel:[self setupShareModel]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
