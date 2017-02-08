//
//  ModifiedWikiInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//



/************C************/
#import "ModifiedWikiInfoViewController.h"
#import "LoveToPayViewController.h" //打赏
/************V************/
#import "ModifiedWikiTitleTableViewCell.h" //顶部
#import "ModifiedWikiPayTableViewCell.h" //打赏
//#import "ModifiedWikiAuthorTableViewCell.h" //作者
/************M************/
#import "ModifiedWikiInfoModel.h" //

@interface ModifiedWikiInfoViewController ()<ModifiedWikiPayDelegate>

@property(nonatomic, strong)ModifiedWikiInfoModel *modifiedWikiModel;

@end

@implementation ModifiedWikiInfoViewController

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
    self.title = @"百科详情";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
    
    
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 2) {
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
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"ModifiedWikiTitleTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        ModifiedWikiTitleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[ModifiedWikiTitleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
        
    }else
        
        if (indexPath.section == 1)
        {
            
            NSString *cellIdentifier = [NSString stringWithFormat:@"ModifiedWikiPayTableViewCell%ld", (long)indexPath.row];
            //首先根据标示去缓存池取
            ModifiedWikiPayTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
            //如果缓存池没有取到则重新创建并放到缓存池中
            if(!cell){
                cell=[[ModifiedWikiPayTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.delegate = self;
            }
            
            [cell setModel:nil];
            return cell;
            
//        }else
//            
//            if (indexPath.section == 2)
//            {
//                
//                
//                NSString *cellIdentifier = [NSString stringWithFormat:@"ModifiedWikiAuthorTableViewCell%ld", (long)indexPath.row];
//                //首先根据标示去缓存池取
//                ModifiedWikiAuthorTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
//                //如果缓存池没有取到则重新创建并放到缓存池中
//                if(!cell){
//                    cell=[[ModifiedWikiAuthorTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//                    
//                }
//                
//                cell.userId = @"1";
//                cell.headClickBlock = ^(NSString *userId){
//                    
//                    NSLog(@"userId--%@",userId);
//                    
//                };
//                
//                return cell;
            
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
        return [ModifiedWikiTitleTableViewCell caculateModifiedWikiTitleCellHeightWithContent:_modifiedWikiModel];
    }
    
    if (indexPath.section == 1) {
        return [ModifiedWikiPayTableViewCell caculateModifiedWikiPayCellHeightWithPerson:_modifiedWikiModel];
    }
    
//    if (indexPath.section == 2) {
//        return ModifiedWikiAuthorCell_Height;
//    }
    return 49.f;
    
    
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}

#pragma mark -打赏
-(void)modifiedWikiPaySelect2go:(NSInteger)tag{
    
    NSLog(@"打赏");
    LoveToPayViewController *payVC = [[LoveToPayViewController alloc]init];
    [self.navigationController pushViewController:payVC animated:YES];
}

#pragma mark -打赏人的头像
-(void)modifiedWikiPayMemberSelect2go:(NSInteger)tag{
    
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
