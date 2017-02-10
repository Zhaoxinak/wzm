//
//  RecordInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/23.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cell的高度   280   70
#define RecordInfoCell_Height 50*WIDTH_NIT

#import "RecordInfoViewController.h"

@interface RecordInfoViewController ()

@property (nonatomic, strong) NSArray *listFunctionArr;

@end

@implementation RecordInfoViewController

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
-(void)setupData{
    
    _listFunctionArr = [NSArray arrayWithObjects:
                        @{@"icon" : @"", @"title" : @"提现金额", @"subTitle" : @"100.00"},
                        @{@"icon" : @"", @"title" : @"交易状态", @"subTitle" : @"失败"},
                        @{@"icon" : @"", @"title" : @"失败原因", @"subTitle" : @"失败原因失败原因失败原因失败原因失败原因失败原因失败原因"},
                        @{@"icon" : @"", @"title" : @"交易时间", @"subTitle" : @"2017.1.1 12:12:12"},
                        @{@"icon" : @"", @"title" : @"交易单号", @"subTitle" : @"23452345234234324"},
                        @{@"icon" : @"", @"title" : @"剩余零钱", @"subTitle" : @"2345.00"},
                        nil];
    
    
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
    self.title = @"提现明细";
    
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    self.tableView.separatorStyle = YES;
    [self.view insertSubview:self.tableView atIndex:1];

}

#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _listFunctionArr.count;
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
    
    NSString *cellTitle = _listFunctionArr[indexPath.row][@"title"];
    NSString *cellsubTitle = _listFunctionArr[indexPath.row][@"subTitle"];
    
    static NSString *cellIdentifier=@"cell";
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.detailTextLabel.numberOfLines = 0;
        cell.textLabel.font = Font15;
        cell.detailTextLabel.font = Font12;
        cell.textLabel.textColor = NameColor;
        cell.detailTextLabel.textColor = LessNameColor;
    }
    
    cell.textLabel.text =  cellTitle;
    cell.detailTextLabel.text =  cellsubTitle;
    return cell;
    
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellsubTitle = _listFunctionArr[indexPath.row][@"subTitle"];
    
    CGSize tipSize = [cellsubTitle boundingRectWithSize:CGSizeMake(kScreen_Width - 100*WIDTH_NIT, MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                               context:nil].size;
    
    return MAX(RecordInfoCell_Height, tipSize.height+20*WIDTH_NIT);
    
    
}



#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
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
