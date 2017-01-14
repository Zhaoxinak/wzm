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
/************V************/
#import "ZXCycleScrollView.h" //顶部视图
#import "PartyInfoTitleTableViewCell.h" //标题
#import "PartyInfoOrganizerTableViewCell.h" //主办方
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
#pragma mark --初始化数据
-(void)setupData{
    
    
    
    
    /***********************************/
    [self refreshData]; //测试死数据
    
}

- (void)refreshData {
    
 
    _partyInfoArr = [NSArray arrayWithObjects:@{@"icon" : @"图片", @"title" : @"截止时间"},@{@"icon" : @"图片", @"title" : @"地址地址"},@{@"icon" : @"图片", @"title" : @"已经报名5人"},@{@"icon" : @"图片", @"title" : @"免费"}, nil];
    
    
    
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
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-kScreen_tabBarHeight);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];
    
    
    //设置tabViewHeader
    _zxCycleScrollView = [[ZXCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width/750*470)];
    //设置tabViewHeader
    _zxCycleScrollView.backgroundColor = BGColor;
    _zxCycleScrollView.delegate = self;
    self.tableView.tableHeaderView = _zxCycleScrollView;
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
    
    cellTitle.font = TwoFont;
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
        allMemberBtn.titleLabel.font = FourFont;
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
    return 44;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}


#pragma mark -- 所有报名者
-(void)allMemberAct:(UIButton *)button{
    
    NSLog(@"所有报名");
    
}

#pragma mark -- 实现轮播图跳转
-(void)zxCycleScrollViewSelect2go:(NSInteger)tag{
    
    NSLog(@"顶部轮播---%ld", (long)tag);
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
