//
//  PersonalInfoViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


//cell的高度
#define PersonalInfoCell_Height 50*WIDTH_NIT

/************C************/
#import "PersonalInfoViewController.h"
#import "EditPersonalInfoViewController.h" //修改个人信息
#import "ZXBindPhoneViewController.h" //修改电话
/************V************/
#import "PersonalInfoTableViewCell.h"
/************M************/
#import "ZXUserInfoModel.h"

@interface PersonalInfoViewController ()<
    UITableViewDataSource,
    UITableViewDelegate,
    EditPersonalInfoViewControllerDelegate,
    PersonalInfoTableViewCellDelegate,
    QBImagePickerControllerDelegate
>



@property (nonatomic, strong) NSArray *listFunctionArr;
@property (strong, nonatomic) ZXUserInfoModel *userInfoModel;
@property (nonatomic, strong) UMSocialUserInfoResponse *weChatInfo;

@end

@implementation PersonalInfoViewController
{
    NSInteger setionIndex;
    NSInteger rowIndex;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //初始化数据
    [self setupData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    NSString *idString = [NSString stringWithFormat:@"%@", [ZXLoginModel sharedZXLoginModel].userId];
    [self sendRequestId:ZXInterfaceUserInfo rMethod:GETMethod params:@{@"id" : idString}];
    
    
   /***********************************/
    [self refreshData]; //测试死数据
}


- (void)refreshData {
    NSString *livePlace =  @"";
    if (!_userInfoModel.province || !_userInfoModel.city || !_userInfoModel.area) {
        livePlace = @"";
    }else {
        livePlace = [NSString stringWithFormat:@"%@-%@-%@",
                     _userInfoModel.province,
                     _userInfoModel.city ,
                     _userInfoModel.area];
    }
    _listFunctionArr = [NSArray arrayWithObjects:@[
                                           @{@"title": @"头像" ,@"icon" : _userInfoModel.picture ? : @"heard_img" , @"subTitle" : @""}],
                @[
                  @{@"title" : @"昵称", @"subTitle" : _userInfoModel.nikename ?: @"水冰月"},
                  @{@"title" : @"ID", @"subTitle" : _userInfoModel.idNo ?: @"110"},
                  @{@"title" : @"性别", @"subTitle" : _userInfoModel.sex ?: @"----"},
                  @{@"title" : @"出生年月", @"subTitle" : _userInfoModel.birthdate ?: @"----"},
                  @{@"title" : @"城市", @"subTitle" : livePlace ?: @"请选择你的居住地"},
                  @{@"title" : @"喜好车型", @"subTitle" : _userInfoModel.mylikeCars ?: @"奥迪"},
                  @{@"title" : @"改装兴趣", @"subTitle" : _userInfoModel.mylikeModify ?: @"音响"}
                ],
                       
                @[
                  @{@"title" : @"个人说明", @"subTitle" : _userInfoModel.myIntro ?: @"我很牛逼"}
                ],
                
                @[
                  @{@"title" : @"绑定手机", @"subTitle" : _userInfoModel.phone ?: @"13000000000"},
                  @{@"title" : @"绑定微信", @"subTitle" : _userInfoModel.weixinname ?: @"未绑定"}
                ],
                nil];
}


#pragma mark当网络请求开始或结束时，下面两个方法将会被调到。

-(void)ZXsuccessData:(id)data byRequestId:(NSInteger)requestId{
    
    if (requestId == ZXInterfaceUserInfo) {
        NSLog(@"%@", data[@"data"]);
        _userInfoModel = [[ZXUserInfoModel alloc] init];
        NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
        [mDic dictionaryWithValuesForKeys:@[_userInfoModel.picture ? : @"" , @"icon"  , @"title", @"头像"]];
        [mDic setValue:_userInfoModel.picture ? : @"" forKey:@"icon"];
        [self refreshData];
        [self.tableView reloadData];
    } else if (ZXInterfaceModifyUserInfo == requestId){
        
        [self setupData];
   
        NSLog(@"%@",data);
    }else if (requestId == ZXInterfaceUploadPic){
        if ([data[@"success"] integerValue] == 1) {
            //上传成功
            NSArray *urlArray = data[@"data"][@"URLS"];
            NSString *imageUrl = @"";
            if (urlArray.count > 0) {
                imageUrl = urlArray[0][@"pic0"];
                NSDictionary *param = @{@"id"       : _userInfoModel.id,
                                        @"picture"  : imageUrl};
                [self sendRequestId:ZXInterfaceModifyUserInfo rMethod:POSTMethod params:param];
                
            }
        }
    }else if (requestId == ZXInterfaceWeChatBindByMobile){
        [self setupData];
        NSString *message = data[@"message"];
        ALERTTK(nil, message);
    }

    
}


- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId{
    
    
}

- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId{
    
}



#pragma mark -执行视图
#pragma mark --初始化数据视图
- (void)setupView {
    
    //设置标题
    self.title = @"个人资料";
    //设置tableView
    self.tableView.frame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-kScreen_NavHeight);
    [self.view insertSubview:self.tableView atIndex:1];
    
}



#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    NSLog(@"%lu", (unsigned long)_listFunctionArr.count);
    return _listFunctionArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_listFunctionArr[section] count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 || indexPath.section == 2) {
        return 100;
    } else {
        return 50;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *reuse = @"PersonalInfoTableViewCell";
    PersonalInfoTableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!infoCell) {
        infoCell = [[PersonalInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
        infoCell.delegate = self;
    }
    
    if (indexPath.row != [_listFunctionArr[indexPath.section] count] - 1) {
        infoCell.isHiddenBottomLine = YES;
    }
    NSString *tempStr = _listFunctionArr[indexPath.section][indexPath.row][@"title"];
    if ([tempStr isEqualToString:@"头像"]) {
        infoCell.infoCellMode = HeaderCellMode;
        [infoCell.headerImgView sd_setImageWithURL:[NSURL URLWithString:_userInfoModel.picture] placeholderImage: [UIImage imageNamed:@"heard_img"]];
        
    }else
        
//    if ([tempStr isEqualToString:@"ID"]){
//        infoCell.infoCellMode = UsualCellMode;
//    } else {
        infoCell.infoCellMode = ArrowCellMode;
//    }
    
    infoCell.titleLabel.text = _listFunctionArr[indexPath.section][indexPath.row][@"title"];
    infoCell.detailLabel.text = _listFunctionArr[indexPath.section][indexPath.row][@"subTitle"];
    
    infoCell.detailLabel.backgroundColor = [UIColor clearColor];
    infoCell.detailLabel.textColor = [UIColor blackColor];
    infoCell.detailLabel.font = [UIFont systemFontOfSize:16];
    infoCell.detailLabel.textAlignment = NSTextAlignmentRight;
    infoCell.detailLabel.width = kScreen_Width - 110;
    
    infoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return infoCell;
    
}



#pragma mark -执行功能

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *tempStr = _listFunctionArr[indexPath.section][indexPath.row][@"title"];
    
    if ([tempStr isEqualToString:@"头像"]) {
        
        NSLog(@"头像跳转");
        
    }else if ([tempStr isEqualToString:@"ID"]){
        NSLog(@"不能修改ID");
        
    }else if ([tempStr isEqualToString:@"绑定手机"]){
        NSLog(@"绑定手机跳转");
        ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
        NSString *mobilPhone = loginModel.mobilPhone;
        if ([NSString isEmpty:mobilPhone] || mobilPhone.length <11) {
            ZXBindPhoneViewController *bindPhoneVC = [[ZXBindPhoneViewController alloc] init];
            bindPhoneVC.bindType = BangDing;
            [self.navigationController pushViewController:bindPhoneVC animated:YES];
        }else{
            ZXBindPhoneViewController *bindPhoneVC = [[ZXBindPhoneViewController alloc] init];
            bindPhoneVC.bindType = XiuGai;
            [self.navigationController pushViewController:bindPhoneVC animated:YES];
        }

        
    }else if ([tempStr isEqualToString:@"绑定微信"]){
        NSLog(@"绑定微信跳转");
        if (_userInfoModel.weixinname) {
            ALERTTK(nil, @"已绑定微信");
        } else {
            [self getUserInfoForPlatform:UMSocialPlatformType_WechatSession];
        }
        
    }else{
        
   
        EditPersonalInfoViewController *vc = [[EditPersonalInfoViewController alloc] init];
        vc.titleString = _listFunctionArr[indexPath.section][indexPath.row][@"title"];
        NSString *oldData = _listFunctionArr[indexPath.section][indexPath.row][@"subTitle"];
        vc.oldData = oldData;
        setionIndex = indexPath.section;
        rowIndex = indexPath.row;
        [[NSUserDefaults standardUserDefaults] setInteger:indexPath.section forKey:@"indexPathsection"];
        [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:@"indexPathrow"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        vc.type = [self returnType:tempStr];
        vc.delegate = self;
        vc.userId = _userInfoModel.id;
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }


    
}



#pragma mark -绑定微信
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:platformType completion:^(id result, NSError *error) {
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType
                                            currentViewController:nil
                                                       completion:^(id result, NSError *error) {
                                                           if (error) {
                                                               
                                                           } else {
                                                               UMSocialUserInfoResponse *userinfo =result;
                                                               [self handleWeChatInfo:userinfo];
                                                           }
                                                           
                                                       }];
    }];
}

- (void)handleWeChatInfo:(UMSocialUserInfoResponse *)info {
    _weChatInfo = info;
    NSString *openId = info.uid;
    //    [self sendRequestId:kPLInterfaceWeChatLogin params:@{@"unionid": openId.length ? openId : @""}];
    
    ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
    NSDictionary *param = @{@"userid"    : loginModel.userId,
                            @"nikename"  : loginModel.nikeName,
                            @"unionid"   : openId.length ? openId : @""};
    
    [self sendRequestId:ZXInterfaceWeChatBindByMobile rMethod:POSTMethod params:param];
}





- (void)sendBackString:(NSString *)string {
    
    if ([_listFunctionArr[[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathsection"]][[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathrow"]][@"title"] isEqualToString:@"昵称"]) {
        _userInfoModel.nikename = string;
    } else if ([_listFunctionArr[[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathsection"]][[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathrow"]][@"title"] isEqualToString:@"性别"]) {
        _userInfoModel.sex = string;
    } else if  ([_listFunctionArr[[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathsection"]][[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathrow"]][@"title"] isEqualToString:@"出生年月"]) {
        _userInfoModel.birthdate = string;
    } else if  ([_listFunctionArr[[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathsection"]][[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathrow"]][@"title"] isEqualToString:@"常居地"]) {
        _userInfoModel.birthplace = string;
    } else if  ([_listFunctionArr[[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathsection"]][[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathrow"]][@"title"] isEqualToString:@"手机号码"]) {
        _userInfoModel.phone = string;
    } else if  ([_listFunctionArr[[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathsection"]][[[NSUserDefaults standardUserDefaults] integerForKey:@"indexPathrow"]][@"title"] isEqualToString:@"民族"]) {
        _userInfoModel.nation = string;
    }
    NSDictionary *dic = [NSDictionary dictionary];
    dic = @{@"id" : _userInfoModel.id ?: @"",
            @"nikename" : _userInfoModel.nikename ?: @"",
            @"sex" : _userInfoModel.sex ?: @"",
            @"nation" : _userInfoModel.nation ?: @"",
            @"birthdate" : _userInfoModel.birthdate ?: @"",
            };
 

    [self sendRequestId:ZXInterfaceModifyUserInfo rMethod:POSTMethod params:dic];
    
}

#pragma mark ---点击头像
-(void)didPersonalHeadView2go{
    
    QBImagePickerController *imagePicker = [[QBImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.allowsMultipleSelection = NO;
    imagePicker.maximumNumberOfSelection = 1;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - QBImagePicker delegate
- (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController {

    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
}


- (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didSelectAsset:(ALAsset *)asset {
    UIImage *result = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
    [self uploadImages:@[result]];
    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(PersonalEditType)returnType:(NSString *)titleName{
    
    PersonalEditType type;
    if ([titleName isEqualToString:@"昵称"]) {
        type = NameEdit;
    }else
    if ([titleName isEqualToString:@"性别"]) {
        type = SexEdit;
    }else
    if ([titleName isEqualToString:@"出生年月"]) {
        type = BrithdayEdit;
    }else
    if ([titleName isEqualToString:@"城市"]) {
        type = BrithCtiyEdit;
    }else
    if ([titleName isEqualToString:@"喜好车型"]) {
        type = CarsEdit;
    }else
    if ([titleName isEqualToString:@"改装兴趣"]) {
        type = InterestEdit;
    }else
    if ([titleName isEqualToString:@"个人说明"]) {
        type = PersonInfoEdit;
    }
    
    return type;
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
