//
//  PersonalMainViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/22.
//  Copyright © 2017年 Mr.X. All rights reserved.
//
//cellheader的高度   280   70
#define PersonalMainCell_Header_Height 1*WIDTH_NIT
#define PersonalMainCell_Footer_Height 1*WIDTH_NIT

/************C************/
#import "PersonalMainViewController.h"
/************V************/
#import "PersonalMainOneTableViewCell.h"
/************M************/
#import "PersonalMainModel.h"

@interface PersonalMainViewController ()
{
    UIImageView *headerImgView; //头像
    UIImageView *vipImageView; //vip
    UILabel *userNameLabel; //用户名
    UILabel *levelLabel; //等级
    UIImageView *sexImageView; //性别～
    UILabel *addressLabel; //地址
    UIButton * pmBtn; //私聊
    UIButton *followBtn; //关注
    
}

@property (nonatomic, strong) NSArray *oneTableViewArr;
@property (nonatomic, strong)PersonalMainModel * personalMainModel;


@end

@implementation PersonalMainViewController

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
    
    
    
    /***********************************/
    [self refreshData]; //测试死数据
}

#pragma mark --刷新数据
- (void)refreshData {
    
    _oneTableViewArr = [NSArray arrayWithObjects:@{@"title": @"地址" , @"subTitle" : @"地址地址地址地址地址地址地址地址地址地址地址地址地址地址地址地址"}, @{@"title": @"简介" , @"subTitle" : @"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介"},@{@"title": @"说明" , @"subTitle" : @"说明说明说明说明说明说明说明说明说明说明说明说明说明说明说明说明说明"},@{@"title": @"关注车型" , @"subTitle" : @""},@{@"title": @"喜欢改装车型" , @"subTitle" : @""},nil];
    
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
    self.title = @"个人主页";
    
    //设置顶部
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 185*WIDTH_NIT)];
    topView.backgroundColor = [UIColor redColor];
    [self.view addSubview:topView];
    
    
    //头像
    headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(topView.width/2-42*WIDTH_NIT, 15*WIDTH_NIT, 84*WIDTH_NIT, 84*WIDTH_NIT)];
    headerImgView.image = [UIImage imageNamed:@"touxiang02"];
    headerImgView.layer.cornerRadius = headerImgView.width/2;
    [topView addSubview:headerImgView];
    
    //Vip标志
    vipImageView = [UIImageView new];
    vipImageView.frame = CGRectMake(CGRectGetMaxX(headerImgView.frame)-18*WIDTH_NIT-5*WIDTH_NIT, CGRectGetMaxY(headerImgView.frame)-18*WIDTH_NIT, 18*WIDTH_NIT, 18*WIDTH_NIT);
    vipImageView.image = [UIImage imageNamed:@"V-huangse"];
    [topView addSubview:vipImageView];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(headerImgView.right + 10*WIDTH_NIT, headerImgView.centerY-10*WIDTH_NIT, 32*WIDTH_NIT, 20*WIDTH_NIT)];
    levelLabel.layer.borderWidth = 0.4;
    levelLabel.layer.borderColor = MainGoldColor.CGColor;
    levelLabel.textColor = MainGoldColor;
    levelLabel.font = Font12;
    levelLabel.text = @"Lv15";
    [topView addSubview:levelLabel];
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,headerImgView.bottom + 5*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = MainWhiteColor;
    userNameLabel.font = Font15;
    userNameLabel.text = @"水冰月";
    [userNameLabel sizeToFit];
    userNameLabel.centerX = headerImgView.centerX;
    [topView addSubview:userNameLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(userNameLabel.right + 10*WIDTH_NIT, 0, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    sexImageView.centerY = userNameLabel.centerY;
    sexImageView.image = [UIImage imageNamed:@"nan"];
    [topView addSubview:sexImageView];
    
    
    //地址
    addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, topView.height-25*WIDTH_NIT, kScreen_Width - 20*WIDTH_NIT, 20*WIDTH_NIT)];
    addressLabel.textColor = LittleNameColor;
    addressLabel.font = Font13;
    addressLabel.text = @"地址地址地址地址地址地址地址地址地址地址地址地址地址地址地址";
    [topView addSubview:addressLabel];
    
    
    //设置选择器
    NSArray *titleArr = [NSArray arrayWithObjects:@"资料", @"圈子", @"问题", @"心得" ,nil];
    self.seg.titleArray = titleArr;
    self.seg.titleWidth = kScreen_Width/4;
    self.seg.font = Font12;
    self.seg.selectedFont = Font12;
    self.seg.lineWidth = kScreen_Width/4;
    self.seg.frame = CGRectMake(0, topView.bottom, kScreen_Width, 40*WIDTH_NIT);
    [self.view addSubview:self.seg];
    
    // 页面scrollView
    self.pageScrollView.frame = CGRectMake(0, self.seg.bottom, kScreen_Width, kScreen_Height-kScreen_NavHeight-self.seg.bottom-50*WIDTH_NIT);
    self.pageScrollView.contentSize = CGSizeMake(4 * kScreen_Width, 0);
    self.pageScrollView.tag = 100;
    [self.view addSubview: self.pageScrollView];
   
    // 创建scrollView上得视图
    for (NSInteger i = 0; i < 4; i++) {
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
    
    // threetableView
    UIView *view3 = (UIView *)[self.view viewWithTag:10002];
    self.threetableView.frame = CGRectMake(0, 0, kScreen_Width, view3.height);
    [view3 addSubview:self.threetableView];
    
    // fourTableView
    UIView *view4 = (UIView *)[self.view viewWithTag:10003];
    self.fourTableView.frame = CGRectMake(0, 0, kScreen_Width, view4.height);
    [view4 addSubview:self.fourTableView];
    
    
    
    //私聊
    pmBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.pageScrollView.bottom, kScreen_Width/2, 50*WIDTH_NIT)];
    [pmBtn setTitleColor:NameColor];
    [pmBtn setImage:@"私聊"];
    [pmBtn setTitle:@"私聊"];
    [pmBtn addTarget:self action:@selector(pmAct:)];
    [self.view addSubview:pmBtn];
    
    
    //关注
    followBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2, self.pageScrollView.bottom, kScreen_Width/2, 50*WIDTH_NIT)];
    [followBtn setTitleColor:NameColor];
    [followBtn setImage:@"关注"];
    [followBtn setTitle:@"关注"];
    [followBtn addTarget:self action:@selector(followAct:)];
    [self.view addSubview:followBtn];
}



#pragma mark - UITableViewDelegate，UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    //资料
    if (tableView == self.onetableView) {
        
        return 1;
    }
    
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //资料
    if (tableView == self.onetableView) {
        
        return _oneTableViewArr.count;
    }
    
    
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return PersonalMainCell_Header_Height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return PersonalMainCell_Footer_Height;
    
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
    
    //资料
    if (tableView == self.onetableView) {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"oneTableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        PersonalMainOneTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[PersonalMainOneTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
       
        cell.titleLabel.text = _oneTableViewArr[indexPath.row][@"title"];
        cell.detailLabel.text = _oneTableViewArr[indexPath.row][@"subTitle"];
        
        if (indexPath.row == 3) {
          
            [cell setMainCellMode:FollowCarsCellMode model:self.personalMainModel];
        }else
        if (indexPath.row == 4) {
           
            [cell setMainCellMode:ModifiedCarsCellMode model:self.personalMainModel];
            
        }else{
        
            [cell setMainCellMode:UsualCellMode model:self.personalMainModel];
        }
        
        
        return cell;
        
      
        
    }else
    //圈子
    if (tableView == self.twoTableView) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"twoTableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        PersonalMainOneTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[PersonalMainOneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        cell.titleLabel.text = @"圈子名称1";
        cell.detailLabel.text = @"成员：2351";
        
        [cell setMainCellMode:UsualCellMode model:self.personalMainModel];
        
        return cell;
        
        
    }else
    //问题
    if (tableView == self.threetableView) {
        NSString *cellIdentifier = [NSString stringWithFormat:@"threetableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        PersonalMainOneTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[PersonalMainOneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.titleLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
        cell.detailLabel.text = @"内容内容内容内容内容内容内容内容内容";
        
        [cell setMainCellMode:UsualCellMode model:self.personalMainModel];
        
        return cell;
        
        
    }else
    //心得
    {
        NSString *cellIdentifier = [NSString stringWithFormat:@"fourTableView%ld", (long)indexPath.row];
        //首先根据标示去缓存池取
        PersonalMainOneTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];;
        //如果缓存池没有取到则重新创建并放到缓存池中
        if(!cell){
            cell=[[PersonalMainOneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        
        cell.titleLabel.text = @"标题标题标题标题标题标题标题标题标题标题标题标题";
        cell.detailLabel.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
        
        [cell setMainCellMode:UsualCellMode model:self.personalMainModel];
        
        return cell;
        
        
    }
    
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //资料
    if (tableView == self.onetableView) {
        
        NSString *title = _oneTableViewArr[indexPath.row][@"title"];
        NSString *subTitle = _oneTableViewArr[indexPath.row][@"subTitle"];
        
        if (indexPath.row == 3) {
            
            return [PersonalMainOneTableViewCell caculatePersonalMainCellHeightWithTitle:title SubTitle:subTitle PictureArrayNum:6 MainCellMode:FollowCarsCellMode];
        }else
        if (indexPath.row == 4) {
            
            return [PersonalMainOneTableViewCell caculatePersonalMainCellHeightWithTitle:title SubTitle:subTitle PictureArrayNum:3 MainCellMode:ModifiedCarsCellMode];
                
        }else{
         
            return [PersonalMainOneTableViewCell caculatePersonalMainCellHeightWithTitle:title SubTitle:subTitle PictureArrayNum:1 MainCellMode:UsualCellMode];
        }
   
    }else
    //圈子
    if (tableView == self.twoTableView) {
        return [PersonalMainOneTableViewCell caculatePersonalMainCellHeightWithTitle:@"圈子名称1" SubTitle:@"成员：2351" PictureArrayNum:1 MainCellMode:UsualCellMode];
    }else
    //问题
    if (tableView == self.threetableView) {
        return [PersonalMainOneTableViewCell caculatePersonalMainCellHeightWithTitle:@"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题" SubTitle:@"内容内容内容内容内容内容内容内容内容" PictureArrayNum:1 MainCellMode:UsualCellMode];
    }else
    //心得
    {
        return [PersonalMainOneTableViewCell caculatePersonalMainCellHeightWithTitle:@"标题标题标题标题标题标题标题标题标题标题标题标题" SubTitle:@"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容" PictureArrayNum:1 MainCellMode:UsualCellMode];
    }
    
   
    
    
    
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

#pragma mark -第三个tableview数据
-(void)loadThreeTableViewData{
    
    NSLog(@"加载ThreeTableView数据");
}

#pragma mark -第四个tableview数据
-(void)loadFourTableViewData{
    
    NSLog(@"加载FourTableView数据");
}

#pragma mark -私聊
-(void)pmAct:(UIButton *)button{
    
    NSLog(@"私聊");
}

#pragma mark -关注
-(void)followAct:(UIButton *)button{
    
    NSLog(@"关注");
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
