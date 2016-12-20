//
//  TwoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

//cellheader的高度   280   70
#define TwoCell_Header_Height 45*WIDTH_NIT
#define TwoCell_Footer_Height 45*WIDTH_NIT

/************C************/
#import "TwoViewController.h"
/************V************/
#import "TwoMiaoCircleTableViewCell.h"  //喵圈
#import "OneJoinMiaoCircleViewController.h" //参加其他喵圈
/************M************/
#import "TwoMiaoCircleModel.h"

@interface TwoViewController ()<TwoMiaoCircleCellDelegate>

@property (nonatomic, assign) BOOL myMiaoCircleSwitch;
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation TwoViewController

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
    
    self.myMiaoCircleSwitch = NO;
    self.dataArr = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4",nil];
    
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
    self.navigationItem.title = @"全部喵圈";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-kScreen_tabBarHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //我的喵圈
    if (section == 0) {
        
        if (_myMiaoCircleSwitch == NO) {
            if (self.dataArr.count>3) {
                return 2;
            }else{
                return self.dataArr.count;
            }
        }else{
            return self.dataArr.count;
        }
        
    }
    //其他喵圈
    if (section == 1) {
        return 4;
    }
    
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return TwoCell_Header_Height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return TwoCell_Footer_Height;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    headerView.backgroundColor = BGColor;
    
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, 0.5)];
    footerView.backgroundColor = [UIColor whiteColor];
    
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, TwoCell_Footer_Height)];
    [moreBtn setTitleColor:OneTextColor];
    [moreBtn addTarget:self action:@selector(footerMoreBtn:)];
    [footerView addSubview:moreBtn];
    
    //我的喵圈
    if (section == 0) {
        moreBtn.tag = 0;
        [moreBtn setTitle:@">>"];
    }
    //其他喵圈
    if (section == 1) {
        moreBtn.tag = 1;
        [moreBtn setTitle:@"更多"];
    }
    
    return footerView;
}



#pragma mark - UITableView展示

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //我的喵圈
    if (indexPath.section == 0) {
        static NSString *cellIdentifier=@"TwoMiaoCircleTableViewCell0";
        //首先根据标示去缓存池取
        TwoMiaoCircleTableViewCell *cell=nil;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[TwoMiaoCircleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
            cell.miaoCircleType = MyMiaoCircleMode;
        }
        
        [cell setModel:nil];
        return cell;
    }
    //其他喵圈
    if (indexPath.section == 1) {
        static NSString *cellIdentifier=@"TwoMiaoCircleTableViewCell1";
        //首先根据标示去缓存池取
        TwoMiaoCircleTableViewCell *cell=nil;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[TwoMiaoCircleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
            cell.miaoCircleType = OtherMiaoCircleMode;
        }
        
        [cell setModel:nil];
        return cell;
    }
  
    
    
    
    static NSString *cellIdentifier=@"cell";
    //首先根据标示去缓存池取
    UITableViewCell *cell=nil;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return TwoMiaoCircleCell_Height;
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark -- 实现加入按钮点击
-(void)twoMiaoCircleCellSelect2go:(NSInteger)tag{
    
    NSLog(@"加入");
}

#pragma mark -- 更多喵圈按钮
-(void)footerMoreBtn:(UIButton *)button{
    
    //我的喵圈更多
    if (button.tag == 0) {
        self.myMiaoCircleSwitch = !self.myMiaoCircleSwitch;
        [self.tableView reloadData];
    }
    //其他喵圈更多
    if (button.tag == 1) {
        //加入喵圈
        OneJoinMiaoCircleViewController *jmVC = [[OneJoinMiaoCircleViewController alloc]init];
        [self.navigationController pushViewController:jmVC animated:YES];

    }
    
    
}

@end
