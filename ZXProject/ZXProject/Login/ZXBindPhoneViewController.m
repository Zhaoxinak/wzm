//
//  ZXBindPhoneViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


/************C************/
#import "ZXBindPhoneViewController.h"
/************V************/
#import "ZXLoginTextField.h"
/************M************/


@interface ZXBindPhoneViewController ()<UITextFieldDelegate>{
    ZXLoginTextField *phoneView;
    ZXLoginTextField *verifyView;
    UILabel *alertTitle;
}

@end

@implementation ZXBindPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView {


    alertTitle = [[UILabel alloc]init];
    alertTitle.frame = CGRectMake(20*WIDTH_NIT, 20*WIDTH_NIT, kScreenWidth-40*WIDTH_NIT, 50*WIDTH_NIT);
    alertTitle.font = ThreeFont;
    [self.view addSubview:alertTitle];
 
    
    phoneView = [[ZXLoginTextField alloc] initWithType:NormalType];
    phoneView.frame = CGRectMake(20*WIDTH_NIT, 100*WIDTH_NIT, kScreenWidth-40*WIDTH_NIT, 50*WIDTH_NIT);
    phoneView.leftLabel.text = @"  手机号：";
    [self.view addSubview:phoneView];
    
    
    verifyView = [[ZXLoginTextField alloc] initWithType:SmsType];
    verifyView.frame = CGRectMake(20*WIDTH_NIT, phoneView.bottom, kScreenWidth-40*WIDTH_NIT, 50*WIDTH_NIT);
    verifyView.leftLabel.text = @"  验证码：";
    verifyView.inputTextField.delegate = self;
    [verifyView.smsCodeBtn addTarget:self action:@selector(verifyAction) forControlEvents:UIControlEventTouchUpInside];
    verifyView.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:verifyView];
    

    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(20*WIDTH_NIT, verifyView.bottom + 40*WIDTH_NIT, kScreenWidth-40*WIDTH_NIT, 50*WIDTH_NIT);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:RGBColor(255, 255, 255, 1)];
    [sureBtn setBackgroundColor:RGBColor(58, 58, 58, 1)];
    [sureBtn addTarget:self action:@selector(confirmAction)];
    sureBtn.titleLabel.font = TwoFont;
    sureBtn.layer.cornerRadius = 4.0;
    sureBtn.layer.masksToBounds = YES;
    [self.view addSubview:sureBtn];
   
    
    
    ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
    NSString *mobilPhone = [NSString stringWithFormat:@"%@",loginModel.mobilPhone];
    if (_bindType == BangDing) {
        self.title = @"绑定手机号";
        alertTitle.text = @"";
    }else if (_bindType == XiuGai){
        self.title = @"验证原手机号";
        alertTitle.text = @"修改手机号前请确认原手机号码可用";
        phoneView.userInteractionEnabled = NO;
        phoneView.inputTextField.text = mobilPhone;
    }else if (_bindType == ReBangDing){
        self.title = @"绑定手机号";
        alertTitle.text = @"验证您要绑定的手机号";
    }
    
    
}

#pragma mark - action
- (void)confirmAction {
    
    ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
    NSString *userID = [NSString stringWithFormat:@"%@",loginModel.userId];
    
    if (_bindType == BangDing) {
        NSDictionary *param = @{@"userid"   : userID.length ? userID : @"",
                                @"phone"    : phoneView.inputTextField.text.length ? phoneView.inputTextField.text : @"",
                                @"captcha"  : verifyView.inputTextField.text.length ? verifyView.inputTextField.text : @""};
        [self sendRequestId:ZXInterfaceWeChatBind rMethod:POSTMethod params:param];
    }else if (_bindType == XiuGai){
        NSDictionary *param = @{@"mobilPhone"    : phoneView.inputTextField.text.length ? phoneView.inputTextField.text : @"",
                                @"smsCode"  : verifyView.inputTextField.text.length ? verifyView.inputTextField.text : @""};
        [self sendRequestId:ZXInterfaceMobileValidationSms rMethod:GETMethod params:param];
    }else if (_bindType == ReBangDing){
        NSDictionary *param = @{@"id"   : userID.length ? userID : @"",
                                @"phone"    : phoneView.inputTextField.text.length ? phoneView.inputTextField.text : @"",
                                @"captcha"  : verifyView.inputTextField.text.length ? verifyView.inputTextField.text : @""};
        [self sendRequestId:ZXInterfaceModifyUserInfo rMethod:POSTMethod params:param];
        
        
    }
  
}

- (void)verifyAction {
    if (phoneView.inputTextField.text.length != 11) {
        ALERTTK(nil, @"手机号不正确");
        return;
    } else {
        //[verifyView.inviteCodeBtn timeFailBeginFrom:60];
        //        verifyView.inviteCodeBtn.enabled = NO;
        NSString *type = @"";
        if (_bindType == BangDing) {
            type = @"band";
        } else if (_bindType == XiuGai) {
            //            type = @"";
        } else if (_bindType == ReBangDing) {
            type = @"band";
        }
        
        NSDictionary *param = @{@"phone" : phoneView.inputTextField.text,
                                @"type" : type};
        [self sendRequestId:ZXInterfaceSmsCode rMethod:GETMethod params:param];
    }
}

- (void)handleData:(id)data byRequestId:(NSInteger)requestId {
    
    if (requestId == ZXInterfaceSmsCode) {
        long requestCode = [data[@"code"] longValue];
        if (requestCode == 200) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //                verifyView.inviteCodeBtn.enabled = YES;
                [verifyView.smsCodeBtn timeFailBeginFrom:60];
            });
        } else {
            ALERTTK(nil, data[@"message"]);
        }
    }else if (ZXInterfaceWeChatBind == requestId) {
        [self handleWeChatBindData:data];
    }
    else if (ZXInterfaceMobileValidationSms == requestId) {
        [self handleViMobileData:data];
    }
    else if (ZXInterfaceModifyUserInfo == requestId) {
        [self handleReMobileData:data];
    }
}


- (void)handleWeChatBindData:(id)data {
    
    
    NSString *code = [NSString stringWithFormat:@"%@", data[@"code"]];
    if ([code isEqualToString:@"200"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@{@"phone":phoneView.inputTextField.text,
                                                           @"userid":[ZXLoginModel sharedZXLoginModel].userIdStr
                                                           } forKey:@"userPhone"];
        ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
        [loginModel modelSetWithDictionary:data[@"data"][@"user"]];
        NSMutableDictionary *infoDic = [[loginModel modelToJSONObject] mutableCopy];
        [infoDic setObject:phoneView.inputTextField.text forKey:@"mobilPhone"];
        [[NSUserDefaults standardUserDefaults] setObject:infoDic forKey:kUserLoginInfo];
        NSString *advanceString = data[@"data"][@"advancePort"];
        if ([advanceString isEqualToString:@"false"]) {
            //未调用高级授权，调用一次
            NSDictionary *param = @{
                                    //@"openid"   : loginModel.weixin ? loginModel.weixin : @"",
                                    @"picture"  : loginModel.picture ? loginModel.picture : @"",
                                    @"nikeName" : loginModel.nikeName ? loginModel.nikeName : @"",
                                    @"unionid" : loginModel.unionid ? loginModel.unionid : @""};
            [self sendRequestId:ZXInterfaceWeWeChatAdvance rMethod:POSTMethod params:param];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        
        NSString *message = data[@"message"];
        ALERTTK(nil, message);
    }
    
    
    
}

- (void)handleViMobileData:(id)data {
    
    NSString *message = data[@"data"][@"message"];
    if ([message isEqualToString:@"验证成功"]) {
        ZXBindPhoneViewController *bindPhoneVC = [[ZXBindPhoneViewController alloc] init];
        bindPhoneVC.bindType = ReBangDing;
        [self.navigationController pushViewController:bindPhoneVC animated:YES];
        
    }else{
        ALERTTK(nil, @"原手机号验证不通过,请重试");
        return;
    }
    
    
}

- (void)handleReMobileData:(id)data {
    
    NSString *message = data[@"message"];
    
    if ([message isEqualToString:@"请求成功"]) {
        NSArray * ctrlArray = self.navigationController.viewControllers;
        [self dismissViewControllerAnimated:YES completion:nil];
        [self.navigationController popToViewController:[ctrlArray objectAtIndex:1] animated:YES];
    }else{
        ALERTTK(nil, @"手机号修改失败,请重试");
        return;
    }
}


- (void)handleError:(id)error byRequestId:(NSInteger)requestId {
  
    if (requestId == ZXInterfaceSmsCode) {
        ALERTTK(nil, @"数据错误");
        //        verifyView.inviteCodeBtn.enabled = YES;
    }
    if (ZXInterfaceMobileValidationSms == requestId) {
        ALERTTK(nil, @"原手机号验证不通过,请重试");
        return;
    }
    else if (ZXInterfaceMobileValidationSms == requestId) {
        ALERTTK(nil, @"手机号修改失败,请重试");
        return;
    }
}
#pragma mark - action
- (void)navBackAction {
    
    if (_bindType == BangDing) {
        [[ZXLoginModel sharedZXLoginModel] logOutAction];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kUserLoginInfo];
        
    }else if (_bindType == XiuGai){
        
    }else if (_bindType == ReBangDing){
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
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
