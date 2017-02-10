//
//  AllCommentsViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cellheader的高度   280   70
#define AllCommentsCell_Header_Height 1*WIDTH_NIT
#define AllCommentsCell_Footer_Height 1*WIDTH_NIT


/************C************/
#import "AllCommentsViewController.h"
/************V************/
#import "AllCommentsTableViewCell.h"
/************M************/
#import "AllCommentsModel.h"


@interface AllCommentsViewController ()<AllCommentsCellDelegate>

@end

@implementation AllCommentsViewController

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
    self.title = @"所有评论";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    

    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return AllCommentsCell_Header_Height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return AllCommentsCell_Footer_Height;
    
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
    
    NSString *cellIdentifier = [NSString stringWithFormat:@"AllCommentsTableViewCell%ld", (long)indexPath.row];
    //首先根据标示去缓存池取
    AllCommentsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[AllCommentsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
    }
    //头像跳转
    WEAK_SELF;
    cell.headClickBlock = ^(NSString *userId) {
        STRONG_SELF;
        
    };
    
    AllCommentsFrameModel *comment = [[AllCommentsFrameModel alloc]init];
    [comment setModel:nil];
    [cell setFrameModel:comment index:indexPath.row];
    //        ThreeHotNoteFrameModel *frameModel = _hotNoteMArr[indexPath.row];
    //        cell.frameModel = frameModel;
    
    return cell;
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//            AllCommentsFrameModel *frameModel = _hotNoteMArr[indexPath.row];
//            return frameModel.cellHeight;
    
    return 220*WIDTH_NIT;
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
    
    
}

#pragma mark -- 实现回复按钮点击
-(void)allCommentsCellSelect2go:(NSInteger)tag{
    
    NSLog(@"回复--%ld",(long)tag);
}


@end
