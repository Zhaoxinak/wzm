//
//  TwoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

//cell的高度
#define TwoCell_Height 40*WIDTH_NIT
//cellheader的高度   280   70
#define TwoCell_Header_Height 1*WIDTH_NIT
#define TwoCell_Footer_Height 1*WIDTH_NIT

/************C************/
#import "TwoViewController.h"
#import "ContactsViewController.h" //通讯录
#import "AllCommentsViewController.h" //所有评论
#import "PraiseViewController.h"  //赞
#import "RewardViewController.h" //打赏
#import "AnswerNoticeViewController.h" //问答通知
#import "SystemNoticeViewController.h" //系统通知
/************V************/
#import "TwoNoticeTableViewCell.h" //暂时通话内容
/************M************/

@interface TwoViewController ()

@property (nonatomic, strong) NSArray *listFunctionArr;


@end

@implementation TwoViewController

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
    
    _listFunctionArr = [NSArray arrayWithObjects:
                        @{@"icon" : @"评论", @"title" : @"评   论", @"subTitle" : @""},
                        @{@"icon" : @"赞-有笑脸", @"title" : @"点   赞", @"subTitle" : @""},
                        @{@"icon" : @"打赏", @"title" : @"打   赏", @"subTitle" : @""},
                        @{@"icon" : @"问答-", @"title" : @"问答通知", @"subTitle" : @""},
                        @{@"icon" : @"通知", @"title" : @"系统通知", @"subTitle" : @""},
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
    self.title = @"消息";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight-kScreen_tabBarHeight);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];
    
    //通讯录按钮
    UIButton* phoneBookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    phoneBookBtn.frame = CGRectMake(0, 0, 44, 44);
    [phoneBookBtn setImage:@"通讯录"];
    [phoneBookBtn addTarget:self action:@selector(phoneBookAct) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithCustomView:phoneBookBtn];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return _listFunctionArr.count;
    }
    
    return 10;
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
    return footerView;
}



#pragma mark - UITableView展示

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        NSString *cellIcon = _listFunctionArr[indexPath.row][@"icon"];
        NSString *cellTitle = _listFunctionArr[indexPath.row][@"title"];
        NSString *cellsubTitle = _listFunctionArr[indexPath.row][@"subTitle"];
        
        static NSString *cellIdentifier=@"cell";
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            
        }
        
        cell.imageView.image = [UIImage imageNamed:cellIcon];
        cell.textLabel.text =  cellTitle;
        cell.detailTextLabel.text =  cellsubTitle;
        return cell;

        
    }else{
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"TwoNoticeTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        TwoNoticeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[TwoNoticeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.userId = @"1";
        cell.headClickBlock = ^(NSString *userId){
            
            NSLog(@"userId%@",userId);
        };
        
//        cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        return cell;
    }
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return TwoCell_Height;
    }
    return TwoNoticeCell_Height;
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        NSString *tempStr = _listFunctionArr[indexPath.row][@"title"];
        if ([tempStr isEqualToString:@"评   论"]) {
            NSLog(@"评   论");
            AllCommentsViewController *commentsVC = [[AllCommentsViewController alloc]init];
            [self.navigationController pushViewController:commentsVC animated:YES];
        } else if ([tempStr isEqualToString:@"点   赞"]) {
            NSLog(@"点   赞");
            PraiseViewController *praiseVC = [[PraiseViewController alloc]init];
            [self.navigationController pushViewController:praiseVC animated:YES];
            
        }else if ([tempStr isEqualToString:@"打   赏"]) {
            NSLog(@"打   赏");
            RewardViewController *rewardVC = [[RewardViewController alloc]init];
            [self.navigationController pushViewController:rewardVC animated:YES];
            
            
        }else if ([tempStr isEqualToString:@"问答通知"]) {
            NSLog(@"问答通知");
            
            AnswerNoticeViewController *answerNoticeVC = [[AnswerNoticeViewController alloc]init];
            [self.navigationController pushViewController:answerNoticeVC animated:YES];
            
        }else if ([tempStr isEqualToString:@"系统通知"]) {
            NSLog(@"系统通知");
            SystemNoticeViewController *systemNoticeVC = [[SystemNoticeViewController alloc]init];
            [self.navigationController pushViewController:systemNoticeVC animated:YES];
            
            
        }
        
    }
    
    
    
}



#pragma mark -- 通讯录
-(void)phoneBookAct{
    NSLog(@"通讯录");
    ContactsViewController *contactsVC = [[ContactsViewController alloc]init];
    [self.navigationController pushViewController:contactsVC animated:YES];
}

@end
