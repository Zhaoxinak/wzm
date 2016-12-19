//
//  OneJoinPartyViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//


/************C************/
#import "OneJoinPartyViewController.h"
/************V************/
#import "OneJoinPartyTableViewCell.h"  //活动
/************M************/
#import "OneJoinPartyModel.h"
/************侧边栏************/
#import "ZYSideSlipFilterController.h"
#import "ZYSideSlipFilterRegionModel.h"
#import "SideSlipBaseTableViewCell.h"
#import "SideSlipCommonTableViewCell.h"
#import "CommonItemModel.h"
#import "PriceRangeModel.h"


@interface OneJoinPartyViewController ()

@property (strong, nonatomic) ZYSideSlipFilterController *filterController;

@end

@implementation OneJoinPartyViewController

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
    self.navigationItem.title = @"活动";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //右边侧边栏按钮
    UIButton* sideBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sideBtn.frame = CGRectMake(0, 0, 80, 44);
    [sideBtn setTitle:@"侧边栏"];
    [sideBtn addTarget:self action:@selector(sideBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:sideBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [self setFilterController];
}

#pragma mark --设置右边侧边栏按钮
-(void)setFilterController{
    
    self.filterController = [[ZYSideSlipFilterController alloc] initWithSponsor:self
                                                                     resetBlock:^(NSArray *dataList) {
                                                                         for (ZYSideSlipFilterRegionModel *model in dataList) {
                                                                             //selectedStatus
                                                                             for (CommonItemModel *itemModel in model.itemList) {
                                                                                 [itemModel setSelected:NO];
                                                                             }
                                                                             //selectedItem
                                                                             model.selectedItemList = nil;
                                                                         }
                                                                     }                                                               commitBlock:^(NSArray *dataList) {
                                                                         
                                                                         //价格区间
                                                                         ZYSideSlipFilterRegionModel *priceRegionModel = dataList[2];
                                                                         PriceRangeModel *priceRangeModel = [priceRegionModel.customDict objectForKey:PRICE_RANGE_MODEL];
                                                                         NSMutableString *priceRangeString = [NSMutableString stringWithString:@"\n价格区间: "];
                                                                         if (priceRangeModel) {
                                                                             [priceRangeString appendFormat:@"%@ - %@", priceRangeModel.minPrice, priceRangeModel.maxPrice];
                                                                         }
                                                                         NSLog(@"%@", priceRangeString);
                                                                         
                                                                         //人数区间
                                                                         ZYSideSlipFilterRegionModel *personRegionModel = dataList[4];
                                                                         PriceRangeModel *personRangeModel = [personRegionModel.customDict objectForKey:PRICE_RANGE_MODEL];
                                                                         NSMutableString *personRangeString = [NSMutableString stringWithString:@"\n人数区间: "];
                                                                         if (personRangeModel) {
                                                                             [personRangeString appendFormat:@"%@ - %@", personRangeModel.minPrice, personRangeModel.maxPrice];
                                                                         }
                                                                         NSLog(@"%@", personRangeString);
                                                                         
                                                                         //Common Region
                                                                         NSMutableString *commonRegionString = [NSMutableString string];
                                                                         for (int i = 4; i < dataList.count; i ++) {
                                                                             ZYSideSlipFilterRegionModel *commonRegionModel = dataList[i];
                                                                             [commonRegionString appendFormat:@"\n%@:", commonRegionModel.regionTitle];
                                                                             NSMutableArray *commonItemSelectedArray = [NSMutableArray array];
                                                                             for (CommonItemModel *itemModel in commonRegionModel.itemList) {
                                                                                 if (itemModel.selected) {
                                                                                     [commonItemSelectedArray addObject:[NSString stringWithFormat:@"%@-%@", itemModel.itemId, itemModel.itemName]];
                                                                                 }
                                                                             }
                                                                             [commonRegionString appendString:[commonItemSelectedArray componentsJoinedByString:@", "]];
                                                                         }
                                                                         NSLog(@"%@", commonRegionString);
                                                                         
                                                                         [self.filterController dismiss];
                                                                         
                                                                     }];
    _filterController.animationDuration = .3f;
    _filterController.sideSlipLeading = 0.15*[UIScreen mainScreen].bounds.size.width;
    _filterController.dataList = [self packageDataList];

    
}

#pragma mark - 模拟侧边栏数据源
- (NSArray *)packageDataList {
    NSMutableArray *dataArray = [NSMutableArray array];
    
    [dataArray addObject:[self typeFilterRegionModel]];
    [dataArray addObject:[self timeFilterRegionModel]];
    [dataArray addObject:[self priceMMFilterRegionModel]];
    [dataArray addObject:[self priceFilterRegionModel]];
    [dataArray addObject:[self personMMFilterRegionModel]];
    [dataArray addObject:[self personFilterRegionModel]];
   
    return [dataArray mutableCopy];
}

//活动类型
-(ZYSideSlipFilterRegionModel *)typeFilterRegionModel{
    ZYSideSlipFilterRegionModel *model = [[ZYSideSlipFilterRegionModel alloc] init];
    model.containerCellClass = @"SideSlipCommonTableViewCell";
    model.regionTitle = @"活动类型";
    model.customDict = @{REGION_SELECTION_TYPE:@(1)};
    model.isShowAll = YES;
    model.itemList = @[[self createItemModelWithTitle:[NSString stringWithFormat:@"类型1"] itemId:@"0000" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"类型2"] itemId:@"0001" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"类型3"] itemId:@"0002" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"类型4"] itemId:@"0003" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"类型5"] itemId:@"0004" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"类型6"] itemId:@"0005" selected:NO],
                       ];
    
    return model;
    
}
//活动日期
-(ZYSideSlipFilterRegionModel *)timeFilterRegionModel{
    ZYSideSlipFilterRegionModel *model = [[ZYSideSlipFilterRegionModel alloc] init];
    model.containerCellClass = @"SideSlipCommonTableViewCell";
    model.regionTitle = @"活动日期";
    model.customDict = @{REGION_SELECTION_TYPE:@(1)};
    model.isShowAll = YES;
    model.itemList = @[[self createItemModelWithTitle:[NSString stringWithFormat:@"周一"] itemId:@"0000" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"周二"] itemId:@"0001" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"周三"] itemId:@"0002" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"周四"] itemId:@"0003" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"周五"] itemId:@"0004" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"周六"] itemId:@"0005" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"周日"] itemId:@"0006" selected:NO],
                       ];
    
    return model;
    
}
//费用区间
-(ZYSideSlipFilterRegionModel *)priceMMFilterRegionModel{
    ZYSideSlipFilterRegionModel *model = [[ZYSideSlipFilterRegionModel alloc] init];
    model.containerCellClass = @"SideSlipPriceTableViewCell";
    model.regionTitle = @"费用区间";
    return model;
    
}
//活动费用
-(ZYSideSlipFilterRegionModel *)priceFilterRegionModel{
    ZYSideSlipFilterRegionModel *model = [[ZYSideSlipFilterRegionModel alloc] init];
    model.containerCellClass = @"SideSlipCommonTableViewCell";
    model.customDict = @{REGION_SELECTION_TYPE:@(0)};
    model.isShowAll = YES;
    model.itemList = @[[self createItemModelWithTitle:[NSString stringWithFormat:@"免费"] itemId:@"0000" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"0-100"] itemId:@"0001" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"100-200"] itemId:@"0002" selected:NO],
                       ];
    
    return model;
    
}
//人数区间
-(ZYSideSlipFilterRegionModel *)personMMFilterRegionModel{
    ZYSideSlipFilterRegionModel *model = [[ZYSideSlipFilterRegionModel alloc] init];
    model.containerCellClass = @"SideSlipPriceTableViewCell";
    model.regionTitle = @"参加人数";
    return model;
    
}
//活动人数
-(ZYSideSlipFilterRegionModel *)personFilterRegionModel{
    ZYSideSlipFilterRegionModel *model = [[ZYSideSlipFilterRegionModel alloc] init];
    model.containerCellClass = @"SideSlipCommonTableViewCell";
    model.customDict = @{REGION_SELECTION_TYPE:@(0)};
    model.isShowAll = YES;
    model.itemList = @[[self createItemModelWithTitle:[NSString stringWithFormat:@"10"] itemId:@"0000" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"10-20"] itemId:@"0001" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"20以上"] itemId:@"0002" selected:NO],
                       ];
    return model;
}

//设置model
- (CommonItemModel *)createItemModelWithTitle:(NSString *)itemTitle
                                       itemId:(NSString *)itemId
                                     selected:(BOOL)selected {
    CommonItemModel *model = [[CommonItemModel alloc] init];
    model.itemId = itemId;
    model.itemName = itemTitle;
    model.selected = selected;
    return model;
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
 
    static NSString *cellIdentifier=@"OneJoinPartyTableViewCell";
    //首先根据标示去缓存池取
    OneJoinPartyTableViewCell *cell=nil;
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
    
    
    
}

#pragma mark -侧边栏显示
-(void)sideBtn{
    
    [_filterController show];
}


@end
