//
//  MaoCoinInfoTableViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/23.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cell的高度   280   70
#define MaoCoinInfoCell_Height 50*WIDTH_NIT

/************C************/
#import "MaoCoinInfoTableViewController.h"
/************V************/

/************M************/
#import "MaoCoinInfoModel.h"

@interface MaoCoinInfoTableViewController ()
{
    UIImageView *headerImgView; //头像
    UILabel *maoCoinNum; //猫币数量
    UILabel *cellRightLabel; //猫币变动
    
}

@property (nonatomic, strong)MaoCoinInfoModel * maoCoinInfoModel;
@end

@implementation MaoCoinInfoTableViewController

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
    self.title = @"猫币明细";
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    
    //充值
    UIButton* chargeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    chargeBtn.frame = CGRectMake(0, 0, 80, 44);
    [chargeBtn setTitle:@"充值"];
    [chargeBtn setTitleColor:KNavigationTitleColor];
    [chargeBtn addTarget:self action:@selector(chargeAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:chargeBtn];
    self.navigationItem.rightBarButtonItem = rightButton;

    
    //设置顶部
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Width/2)];
    topView.backgroundColor = [UIColor redColor];
  
    //头像
    headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(topView.width/2-30*WIDTH_NIT, 10*WIDTH_NIT, 60*WIDTH_NIT, 60*WIDTH_NIT)];
    headerImgView.backgroundColor = [UIColor yellowColor];
    [topView addSubview:headerImgView];
    
   
    
    //猫币数量
    maoCoinNum = [[UILabel alloc]initWithFrame:CGRectMake(0,headerImgView.bottom + 5*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    maoCoinNum.textColor = OneTextColor;
    maoCoinNum.font = ThreeFont;
    maoCoinNum.text = @"450枚";
    [maoCoinNum sizeToFit];
    maoCoinNum.centerX = headerImgView.centerX;
    [topView addSubview:maoCoinNum];
    
    //分割线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, maoCoinNum.bottom +20*WIDTH_NIT, topView.width, 1)];
    line.backgroundColor = BGColor;
    [topView addSubview:line];
    
    //余额明细
    UILabel *infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, topView.height-30*WIDTH_NIT, topView.width, 30*WIDTH_NIT)];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.text = @"余额明细";
    [topView addSubview:infoLabel];
    
    self.tableView.tableHeaderView = topView;
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
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
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"cell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cellRightLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60*WIDTH_NIT, 30*WIDTH_NIT)];
        cellRightLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryView  = cellRightLabel;
    }
    
    cell.textLabel.text = @"今日首次登入";
    cell.detailTextLabel.text = @"2017.7.7  14:20:30";
    cellRightLabel.text = @"+15";
    return cell;

    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return MaoCoinInfoCell_Height;
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
}

#pragma mark -- 充值
-(void)chargeAct{
    NSLog(@"充值");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
