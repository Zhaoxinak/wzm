//
//  ZXLoginViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//


/************C************/
#import "ZXLoginViewController.h"
#import "ZXRegisterViewController.h" //注册
#import "ZXBindPhoneViewController.h" //绑定手机号
/************V************/
#import "ZXLoginTextField.h"
/************M************/



@interface ZXLoginViewController ()

@property (nonatomic, strong) UMSocialUserInfoResponse *weChatInfo; //微信信息

@end

@implementation ZXLoginViewController

{
    ZXLoginTextField *phoneView;
    ZXLoginTextField *passwordView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = MainWhiteColor;
    
    self.title = @"登录";
    [self setupView];
}


- (void)setupView {
   
    
    //返回按钮
    UIButton* backActBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backActBtn.frame = CGRectMake(0, 0, 28, 42);
    [backActBtn setImage:@"返回"];
    [backActBtn addTarget:self action:@selector(backAct)];
    UIBarButtonItem* leftButton = [[UIBarButtonItem alloc] initWithCustomView:backActBtn];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    phoneView = [[ZXLoginTextField alloc] initWithType:NormalType];
    phoneView.frame = CGRectMake(15*WIDTH_NIT, 20*WIDTH_NIT, kScreenWidth-30*WIDTH_NIT, 46*WIDTH_NIT);
    phoneView.leftLabel.text = @"  手机号码";
    [self.view addSubview:phoneView];
    
  
    passwordView = [[ZXLoginTextField alloc] initWithType:PwdType];
    passwordView.frame = CGRectMake(15*WIDTH_NIT, phoneView.bottom, kScreenWidth-30*WIDTH_NIT, 46*WIDTH_NIT);
    passwordView.leftLabel.text = @"  密码";
    [self.view addSubview:passwordView];

    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(15*WIDTH_NIT, passwordView.bottom+30*WIDTH_NIT, kScreenWidth-30*WIDTH_NIT, 44*WIDTH_NIT);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:MainWhiteColor forState:UIControlStateNormal];
    [loginBtn setBackgroundColor:MainGoldColor];
    loginBtn.titleLabel.font = Font18;
    loginBtn.layer.cornerRadius = 4.0;
    loginBtn.layer.masksToBounds = YES;
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
 
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(kScreenWidth/2-90*WIDTH_NIT, loginBtn.bottom+10*WIDTH_NIT, 80*WIDTH_NIT, 20*WIDTH_NIT);
    [registerBtn setTitle:@"注册新用户" forState:UIControlStateNormal];
    [registerBtn setTitleColor:NameColor forState:UIControlStateNormal];
    registerBtn.titleLabel.font = Font11;
    registerBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    
    UIButton *forgetPwBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwBtn.frame = CGRectMake(kScreenWidth/2+10*WIDTH_NIT, loginBtn.bottom+10*WIDTH_NIT, 80*WIDTH_NIT, 20*WIDTH_NIT);
    [forgetPwBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPwBtn setTitleColor:NameColor forState:UIControlStateNormal];
    forgetPwBtn.titleLabel.font = Font11;
    forgetPwBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [forgetPwBtn addTarget:self action:@selector(forgetPassWordAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwBtn];
    
    
    
    UILabel *speedLogin = [[UILabel alloc]initWithFrame:CGRectMake(20*WIDTH_NIT, kScreen_Height-kScreen_NavHeight-120*WIDTH_NIT, kScreen_Width-40*WIDTH_NIT, 20*WIDTH_NIT)];
    speedLogin.font = Font11;
    speedLogin.textColor = NameColor;
    speedLogin.textAlignment = NSTextAlignmentCenter;
    speedLogin.text = @"——————————  快捷登录  ——————————";
    [self.view addSubview:speedLogin];
    
    
    
    UIButton *wechatLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    wechatLoginBtn.frame = CGRectMake(kScreenWidth/3-20*WIDTH_NIT, kScreen_Height-kScreen_NavHeight-80*WIDTH_NIT, 60*WIDTH_NIT, 50*WIDTH_NIT);
    [wechatLoginBtn setImage:@"weixin"];
    wechatLoginBtn.layer.cornerRadius = 30*WIDTH_NIT;
    wechatLoginBtn.layer.masksToBounds = YES;
    [wechatLoginBtn addTarget:self action:@selector(weChatLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wechatLoginBtn];
    
    UIButton *qqLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    qqLoginBtn.frame = CGRectMake(kScreenWidth/3*2-20*WIDTH_NIT, kScreen_Height-kScreen_NavHeight-80*WIDTH_NIT, 60*WIDTH_NIT, 50*WIDTH_NIT);
    [qqLoginBtn setImage:@"weixin"];
    qqLoginBtn.layer.cornerRadius = 30*WIDTH_NIT;
    qqLoginBtn.layer.masksToBounds = YES;
    [qqLoginBtn addTarget:self action:@selector(qqLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:qqLoginBtn];

   
}


- (void)registerAction{
   
    ZXRegisterViewController *registerVC = [[ZXRegisterViewController alloc] init];
    registerVC.registerType = Register;
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
}

- (void)forgetPassWordAction{
    
    ZXRegisterViewController *registerVC = [[ZXRegisterViewController alloc] init];
    registerVC.registerType = ForgetPassWord;
    [self.navigationController pushViewController:registerVC animated:YES];

}


- (void)weChatLoginAction {
    
    [self getUserInfoForPlatform:UMSocialPlatformType_WechatSession];
}


- (void)qqLoginAction {
    
    [self getUserInfoForPlatform:UMSocialPlatformType_WechatSession];
}

- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:platformType completion:^(id result, NSError *error) {
        
        [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType
                                            currentViewController:nil
                                                       completion:^(id result, NSError *error) {
                                                           UMSocialUserInfoResponse *userinfo =result;
                                                           [self handleWeChatInfo:userinfo];
                                                       }];
        
    }];
    
}

- (void)handleWeChatInfo:(UMSocialUserInfoResponse *)info {
    _weChatInfo = info;
    NSString *openId = info.uid;
    NSString *unionid = openId.length ? openId : @"";
    NSDictionary *dic = @{@"unionid" : unionid};

    [self sendRequestId:ZXInterfaceLogin rMethod:POSTMethod params:dic];
}

- (void)loginAction {
    //    NSDictionary *dic = @{@"mobilPhone" : @"17723267692", @"passWord" : @"123456"};
    if (phoneView.inputTextField.text.length <= 0) {
        ALERTTK(nil, @"请输入手机号");
        return;
    } else if (phoneView.inputTextField.text.length <= 0) {
        ALERTTK(nil, @"请输入密码");
        return;
    }
    NSDictionary *dic = @{@"mobilPhone" : phoneView.inputTextField.text, @"passWord" : passwordView.inputTextField.text};

    [self sendRequestId:ZXInterfaceLogin rMethod:POSTMethod params:dic];

}

- (void)handleData:(id)data byRequestId:(NSInteger)requestId {

    [MBProgressHUD hideHUDForView:self.view animated:YES];
  
    if (requestId == ZXInterfaceLogin) {
        if ([data[@"data"][@"user"] isKindOfClass:[NSDictionary class]]) {
            ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
            [loginModel modelSetWithDictionary:data[@"data"][@"user"]];
            
            NSString *idString = [NSString stringWithFormat:@"%@", [ZXLoginModel sharedZXLoginModel].userId];
            [self sendRequestId:ZXInterfaceUserInfo rMethod:GETMethod params:@{@"id" : idString}];
            
        }else {
            ALERTTK(@"提示", data[@"message"]);
        }
        
    }else if (requestId == ZXInterfaceLogin) {
        if ([data[@"data"][@"user"] isKindOfClass:[NSDictionary class]]) {
            ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
            [loginModel modelSetWithDictionary:data[@"data"][@"user"]];
            
        }
        NSString *bindString = data[@"data"][@"advancePort"];
        if ([bindString isKindOfClass:[NSString class]] && [bindString isEqualToString:@"false"]) {
            //没高级授权，走高级授权
            NSDictionary *param = @{
                                    //@"openid"   : _weChatInfo.originalResponse[@"openid"] ? _weChatInfo.originalResponse[@"openid"] : @"",
                                    @"picture"  : _weChatInfo.iconurl ? _weChatInfo.iconurl : @"",
                                    @"nikeName" : _weChatInfo.name ? _weChatInfo.name  : @"",
                                    @"unionid"  : _weChatInfo.originalResponse[@"unionid"] ? _weChatInfo.originalResponse[@"unionid"] : @""};
           
            [self sendRequestId:ZXInterfaceWeWeChatAdvance rMethod:POSTMethod params:param];
            
            //            PLBindPhoneViewController *bindPhoneVC = [[PLBindPhoneViewController alloc] init];
            //            [self.navigationController pushViewController:bindPhoneVC animated:YES];
            
        }else {
            
            //已绑定，登录成功
            if ([data[@"data"][@"user"] isKindOfClass:[NSDictionary class]]) {
                ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
                [loginModel modelSetWithDictionary:data[@"data"][@"user"]];
                
                
                if ([self didPhoneTurnToV:loginModel.mobilPhone]) {
                    NSDictionary *infoDic = [loginModel modelToJSONObject];
                    [[NSUserDefaults standardUserDefaults] setObject:infoDic forKey:kUserLoginInfo];
                    NSLog(@"%@", [ZXLoginModel sharedZXLoginModel].userIdStr);
                    [self dismissViewControllerAnimated:YES completion:nil];
                }
                
            }else{
                
                ALERTTK(@"提示", data[@"message"]);
            }
            
        }
    }else if (requestId == ZXInterfaceWeWeChatAdvance) {
        
        //已绑定，登录成功
        if ([data[@"data"][@"user"] isKindOfClass:[NSDictionary class]]) {
            ALERTTK(@"提示", @"登录成功!");
            ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
            [loginModel modelSetWithDictionary:data[@"data"][@"user"]];
            //        [PLLoginModel shareLoginModel].userId = data[@"data"][@"user"][@"id"];
            
            if ([self didPhoneTurnToV:loginModel.mobilPhone]) {
                NSDictionary *infoDic = [loginModel modelToJSONObject];
                [[NSUserDefaults standardUserDefaults] setObject:infoDic forKey:kUserLoginInfo];
                NSLog(@"%@", [ZXLoginModel sharedZXLoginModel].userIdStr);
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            
        }else{
            ALERTTK(@"提示", data[@"message"]);
        }
        
        
    } else if (requestId == ZXInterfaceUserInfo) {
        ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
        [loginModel modelSetWithDictionary:data[@"data"][@"user"]];
        //        [PLLoginModel shareLoginModel].userId = data[@"data"][@"user"][@"id"];
        NSDictionary *infoDic = [loginModel modelToJSONObject];
        [[NSUserDefaults standardUserDefaults] setObject:infoDic forKey:kUserLoginInfo];
        
        ALERTTK(@"提示", @"登录成功!");
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)handleError:(id)error byRequestId:(NSInteger)requestId {
    NSLog(@"网络异常");
}

-(BOOL)didPhoneTurnToV:(NSString *)phone{
    
    NSString *mobilPhone = phone;
    if ([NSString isEmpty:mobilPhone] || mobilPhone.length <11) {
        
        ZXBindPhoneViewController *bindPhoneVC = [[ZXBindPhoneViewController alloc] init];
        bindPhoneVC.bindType = BangDing;
        [self.navigationController pushViewController:bindPhoneVC animated:YES];
        
        return NO;
    }else{
        
        ALERTTK(@"提示", @"登录成功!");
        [self dismissViewControllerAnimated:YES completion:nil];
        return YES;
    }
    
    
}

- (void)backAct {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
