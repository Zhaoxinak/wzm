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
#import "OneJoinMiaoCircleViewController.h" //参加其他喵圈
/************V************/
#import "TwoMiaoCircleTableViewCell.h"  //喵圈
#import "TwoHotNoteTableViewCell.h" //热帖推荐
/************M************/
#import "TwoMiaoCircleModel.h"

@interface TwoViewController ()<TwoMiaoCircleCellDelegate>

@property (nonatomic, assign) BOOL myMiaoCircleSwitch;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *hotNoteMArr; //热帖推荐
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
-(void)setData{
    
    self.myMiaoCircleSwitch = NO;
    self.dataArr = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4",nil];
    self.hotNoteMArr = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4",nil];
    
//    TwoHotNoteFrameModel *frameModel = [TwoHotNoteFrameModel new];
//    frameModel.model = model;
//    [_hotNoteMArr addObject:frameModel];
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
    
    //分享按钮
    UIButton* shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shareBtn.frame = CGRectMake(0, 0, 80, 44);
    [shareBtn setTitle:@"分享"];
    [shareBtn addTarget:self action:@selector(shareBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:shareBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
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
    
    //热帖推荐
    if (section == 2) {
        return _hotNoteMArr.count;;
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
    //cell的标题
    UILabel *cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 10*WIDTH_NIT, kScreen_Width, 35*WIDTH_NIT)];
    cellTitle.font = TwoFont;
    cellTitle.textColor = OneTextColor;
    cellTitle.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:cellTitle];
    
    if (section == 0) {
        cellTitle.text = @"    我的喵圈";
    }
    if (section == 1) {
        cellTitle.text = @"    其他喵圈";
    }
    if (section == 1) {
        cellTitle.text = @"    热帖推荐";
    }
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
        NSString *cellIdentifier = [NSString stringWithFormat:@"TwoMiaoCircleTableViewCell000%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        TwoMiaoCircleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
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
        NSString *cellIdentifier = [NSString stringWithFormat:@"TwoMiaoCircleTableViewCell111%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        TwoMiaoCircleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
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
  
    //热帖推荐
    if (indexPath.section == 2) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"TwoHotNoteTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        TwoHotNoteTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[TwoHotNoteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
          
        }
        //头像跳转
        WEAK_SELF;
        cell.headClickBlock = ^(NSString *userId) {
            STRONG_SELF;
            
        };
        
        TwoHotNoteFrameModel *note = [[TwoHotNoteFrameModel alloc]init];
        [note setModel:nil];
        [cell setFrameModel:note];
//        TwoHotNoteFrameModel *frameModel = _hotNoteMArr[indexPath.row];
//        cell.frameModel = frameModel;
        
        return cell;
    }
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"cell%ld", (long)indexPath.row];
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

#pragma mark -- 分享
-(void)shareBtn{
    
    [[ZXShareHelper shareInstance] shareWithShareModel:[self setupShareModel]];
    
}

@end
