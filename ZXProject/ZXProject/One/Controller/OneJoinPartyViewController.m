//
//  OneJoinPartyViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//


/************C************/
#import "OneJoinPartyViewController.h"
#import "PublishPartyViewController.h" //发布活动
#import "PartyDetailInfoViewController.h" //活动详情
/************V************/
#import "OneJoinPartyTableViewCell.h"  //活动
#import "ZXSelectTableView.h" //标题选择器
/************M************/
#import "OneJoinPartyModel.h"



@interface OneJoinPartyViewController ()

@property (strong, nonatomic) ZXSelectTableView *selectTableView; //选择界面
@property (strong, nonatomic) NSMutableArray *selectItems; //选择按钮

@end

@implementation OneJoinPartyViewController

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
    
   //选择器
    self.selectItems = [NSMutableArray array];
  
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
//    self.navigationItem.title = @"活动";
   
    UIButton *titleBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100*WIDTH_NIT, 50*WIDTH_NIT)];
    titleBtn.titleLabel.font = KNavigationFont;
    [titleBtn setTitle:@"活动"];
    [titleBtn setImage:@"活动下拉箭头"];
    [titleBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -titleBtn.imageView.size.width, 0, titleBtn.imageView.size.width)];
    [titleBtn setImageEdgeInsets:UIEdgeInsetsMake(0, titleBtn.titleLabel.bounds.size.width, 0, -titleBtn.titleLabel.bounds.size.width)];
    [titleBtn setTitleColor:KNavigationTitleColor];
    [titleBtn addTarget:self action:@selector(titleAct)];
    self.navigationItem.titleView = titleBtn;
    
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //发布按钮
    UIButton* publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    publishBtn.frame = CGRectMake(0, 0, 44, 44);
    [publishBtn setImage:@"发布"];
    [publishBtn addTarget:self action:@selector(publishAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:publishBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    //设置标题选择器
    [self setupZXSelectTableView];

    
}

#pragma mark --设置标题选择器
-(void)setupZXSelectTableView{
    
    NSArray *menuImages = @[@"", @"", @"", @""];
    NSArray *menuTitles = @[@"比赛", @"活动", @"会展", @"培训"];
    for (int i = 0; i < menuImages.count; i++) {
        ZXSelectTableViewItem *item = [ZXSelectTableViewItem selectTableViewItemWithImage:[UIImage imageNamed:menuImages[i]] title:menuTitles[i]];
        [self.selectItems addObject:item];
    }
    
    self.selectTableView = [[ZXSelectTableView alloc] initWithOrigin:CGPointMake(0, 64) width:kScreen_Width];
    self.selectTableView.items = self.selectItems;
    WEAK_SELF;
    self.selectTableView.didSelectMenuItem = ^(ZXSelectTableView *menu, ZXSelectTableViewItem *item){
        STRONG_SELF;
        [self didSelectTableView:menu selectItem:item];
      
    };

    
    
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
 
    NSString *cellIdentifier = [NSString stringWithFormat:@"OneJoinPartyTableViewCell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    OneJoinPartyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[OneJoinPartyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return OneJoinPartyCell_Height;
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PartyDetailInfoViewController *partyInfoVC = [[PartyDetailInfoViewController alloc]init];
    [self.navigationController pushViewController:partyInfoVC animated:YES];
    
    
}

#pragma mark -发起活动
-(void)publishAct{
    NSLog(@"发起活动");
    PublishPartyViewController *publishVC = [[PublishPartyViewController alloc]init];
    [self.navigationController pushViewController:publishVC animated:YES];
}


#pragma mark 标题按钮选择
-(void)titleAct{
    NSLog(@"点击标题");
    [_selectTableView show];
    
   
}

#pragma mark 选择标题按钮
-(void)didSelectTableView:(ZXSelectTableView *)menu selectItem:(ZXSelectTableViewItem *)item{
    
    NSLog(@"%@",item.title);
    
}

@end
