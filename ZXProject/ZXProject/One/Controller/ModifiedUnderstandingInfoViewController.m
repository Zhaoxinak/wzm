//
//  ModifiedUnderstandingInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/18.
//  Copyright © 2017年 Mr.X. All rights reserved.
//



/************C************/
#import "ModifiedUnderstandingInfoViewController.h"
#import "LoveToPayViewController.h" //打赏
/************V************/
#import "UnderstandingTitleTableViewCell.h" //顶部
#import "UnderstandingPayTableViewCell.h" //打赏
#import "UnderstandingAuthorTableViewCell.h" //作者
/************M************/
#import "UnderstandingInfoModel.h" //


@interface ModifiedUnderstandingInfoViewController ()<UnderstandingPayDelegate>

@property(nonatomic, strong)UnderstandingInfoModel *understandModel;

@end

@implementation ModifiedUnderstandingInfoViewController

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
    self.title = @"心得详情";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    

    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 3) {
        return 10;
    }
    
    return 1;
    
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
    
   //顶部详情
    if (indexPath.section == 0) {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"UnderstandingTitleTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UnderstandingTitleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UnderstandingTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
        
    }else
    
    if (indexPath.section == 1)
    {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"UnderstandingPayTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UnderstandingPayTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UnderstandingPayTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
        }
        
        [cell setModel:nil];
        return cell;
        
    }else
    
    if (indexPath.section == 2)
    {
        
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"UnderstandingAuthorTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UnderstandingAuthorTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UnderstandingAuthorTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.userId = @"1";
        cell.headClickBlock = ^(NSString *userId){
            
            NSLog(@"userId--%@",userId);
            
        };
        
        return cell;
        
    }else{
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"cell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
       
        cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
        return cell;
        
        
        
    }
    
    
   
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        return [UnderstandingTitleTableViewCell caculateUnderstandingTitleCellHeightWithContent:_understandModel];
    }
    
    if (indexPath.section == 1) {
        return [UnderstandingPayTableViewCell caculateUnderstandingPayCellHeightWithPerson:_understandModel];
    }
    
    if (indexPath.section == 2) {
        return UnderstandingAuthorCell_Height;
    }
    return 49.f;
    
    
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark -打赏
-(void)understandingPaySelect2go:(NSInteger)tag{
    
    NSLog(@"打赏");
    LoveToPayViewController *payVC = [[LoveToPayViewController alloc]init];
    [self.navigationController pushViewController:payVC animated:YES];
}

#pragma mark -打赏人的头像
-(void)understandingPayMemberSelect2go:(NSInteger)tag{
    
    NSLog(@"打赏人的头像--%ld",(long)tag);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
