//
//  NotesViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/24.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

//cellheader的高度   280   70
#define NotesCell_Header_Height 1*WIDTH_NIT
#define NotesCell_Footer_Height 1*WIDTH_NIT



/************C************/
#import "NotesViewController.h"
/************V************/
#import "NotesTableViewCell.h"
/************M************/
#import "NotesModel.h"


@interface NotesViewController ()

@property(nonatomic, strong)NotesModel *noteModel;

@end

@implementation NotesViewController

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
    self.title = @"帖子";
  
    
    //设置选择器
    NSArray *titleArr = [NSArray arrayWithObjects:@"主贴", @"跟帖",nil];
    self.seg.titleArray = titleArr;
    self.seg.titleWidth = kScreen_Width/2;
    self.seg.frame = CGRectMake(0, 0, kScreen_Width, 44);
    [self.view addSubview:self.seg];
    
    // 页面scrollView
    self.pageScrollView.frame = CGRectMake(0, self.seg.bottom, kScreen_Width, kScreen_Height-kScreen_NavHeight-self.seg.bottom);
    self.pageScrollView.contentSize = CGSizeMake(2 * kScreen_Width, 0);
    self.pageScrollView.tag = 100;
    self.pageScrollView.bounces = NO;
    self.pageScrollView.delaysContentTouches = NO;
    self.pageScrollView.canCancelContentTouches = NO;
    self.pageScrollView.scrollEnabled = NO;
    
    [self.view addSubview: self.pageScrollView];
    
    // 创建scrollView上得视图
    for (NSInteger i = 0; i < 2; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(kScreen_Width * i, 0, kScreen_Width, self.pageScrollView.height)];
        [self.pageScrollView addSubview:view];
        if (i == 0) {
            
        }
        view.tag = 10000 + i;
    }
    
    // onetableView
    UIView *view1 = (UIView *)[self.view viewWithTag:10000];
    self.onetableView.frame = CGRectMake(0, 0, kScreen_Width, view1.height);
    [view1 addSubview:self.onetableView];
    
    // twoTableView
    UIView *view2 = (UIView *)[self.view viewWithTag:10001];
    self.twoTableView.frame = CGRectMake(0, 0, kScreen_Width, view2.height);
    [view2 addSubview:self.twoTableView];
    
    
    
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
    
    
    if (tableView == self.onetableView) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"NotesTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        NotesTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[NotesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setModel:self.noteModel setMode:MainNoteCellMode];
        return cell;

    }else{
        NSString *cellIdentifier = [NSString stringWithFormat:@"NotesTableViewCell%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        NotesTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[NotesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        [cell setModel:self.noteModel setMode:FollowNoteCellMode];
        return cell;
        
        
    }
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return NotesCell_Height;
}

#pragma mark -执行功能
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    
}

#pragma mark -第一个tableview数据
-(void)loadOneTableViewData{
    NSLog(@"加载OneTableView数据");
    
}

#pragma mark -第二个tableview数据
-(void)loadTwoTableViewData{
    
    NSLog(@"加载TwoTableView数据");
}


#pragma mark tableview数据编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}


- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    if (editingStyle == UITableViewCellEditingStyleDelete){
            
        
        NSLog(@"重载数据");
        
    }
    
    
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return NO;
    
}

@end
