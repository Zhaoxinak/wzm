//
//  ContactsViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

/************C************/
#import "ContactsViewController.h"
/************V************/
#import "ContactsTableViewCell.h"
/************M************/

@interface ContactsViewController ()<ContactsCellDelegate>

@property(nonatomic, retain)UISegmentedControl *seg;
@property(nonatomic, retain)NSArray *segItems;


@end

@implementation ContactsViewController

#pragma mark -设置segItems
- (NSArray *)segItems
{
    if (_segItems == nil) {
        _segItems = [NSArray array];
        
    }
    return _segItems;
}

#pragma mark -设置seg
- (UISegmentedControl *)seg
{
    if (_seg == nil) {
        _seg = [[UISegmentedControl alloc] initWithItems:_segItems];
        _seg.frame = CGRectMake(0, 0, _segItems.count*100*WIDTH_NIT, 30*WIDTH_NIT);
        _seg.backgroundColor = MainWhiteColor;
        _seg.tintColor = MainGoldColor;
        _seg.layer.borderColor = MainWhiteColor.CGColor;
        _seg.layer.borderWidth = 0.4;
        _seg.layer.cornerRadius = 5;
        _seg.clipsToBounds = YES;
        _seg.selectedSegmentIndex = 0;
        [_seg addTarget:self action:@selector(viewChangeAction:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _seg;
}





- (void)viewDidLoad {
    [super viewDidLoad];
   
    //初始化数据
    [self setupData];
    
    //初始试图
    [self setupView];
}


#pragma mark - 刷新系统
-(void)setRefresh{
}
-(void)setHeaderRefresh{
}

#pragma mark -执行数据
#pragma mark --初始化数据

- (void)setupData {
    
   
    /***********************************/
    [self refreshData]; //测试死数据
}

#pragma mark --刷新数据
- (void)refreshData {
    
    NSLog(@"刷新数据");
    
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
- (void)setupView {
    
    //设置标题
    self.title = @"通讯录";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    //顶部选择器背景
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 70*WIDTH_NIT)];

    
    //标题segmentController
    self.segItems = @[@"好友", @"关注", @"粉丝"];
    self.seg.frame = CGRectMake(0, 20*WIDTH_NIT, self.segItems.count*100*WIDTH_NIT, 30*WIDTH_NIT);
    self.seg.centerX = headView.centerX;
    [headView addSubview:self.seg];
    
    self.tableView.tableHeaderView = headView;
    
    
}

#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
   return 1;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"ContactsTableViewCell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    ContactsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[ContactsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    
    
    return cell;

    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return ContactsCell_Height;
}


#pragma mark -执行功能

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    
}




#pragma mark -- 实现按钮按钮点击
-(void)contactsCellSelect2go:(NSInteger)tag{
    
    NSLog(@"点击按钮");
    
}


#pragma mark -切换tableview数据

- (void)viewChangeAction: (UISegmentedControl *)seg {
    switch (seg.selectedSegmentIndex) {
        case 0: {
            self.seg.selectedSegmentIndex = 0;
            [self refreshData];
        }
            break;
        case 1: {
            self.seg.selectedSegmentIndex = 1;
            [self refreshData];
        }
            break;
        case 2: {
            self.seg.selectedSegmentIndex = 2;
            [self refreshData];
        }
            break;
        default:
            break;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
