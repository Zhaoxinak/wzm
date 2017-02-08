//
//  ZXRegisterViewController.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//



/************C************/
#import "ZXRegisterViewController.h"
/************V************/
#import "ZXLoginTextField.h"
/************M************/
#import "ZXRegisterModel.h"

@interface ZXRegisterViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) ZXRegisterModel *registerModel;

@end

@implementation ZXRegisterViewController
{
    ZXLoginTextField *phoneView;
    ZXLoginTextField *verifyView;
    ZXLoginTextField *setPwView;
    ZXLoginTextField *confirmPwView;
    ZXLoginTextField *inviteView;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    [phoneView.inputTextField resignFirstResponder];
    [verifyView.inputTextField resignFirstResponder];
    [setPwView.inputTextField resignFirstResponder];
//    [confirmPwView.inputTextField resignFirstResponder];
    [inviteView.inputTextField resignFirstResponder];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = _registerType == Register ? @"注册" : @"忘记密码";
    self.view.backgroundColor = MainWhiteColor;
    [self setupView];
    
    _registerModel = [[ZXRegisterModel alloc] init];
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
    phoneView.inputTextField.delegate = self;
    phoneView.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:phoneView];
 
    verifyView = [[ZXLoginTextField alloc] initWithType:SmsType];
    verifyView.frame = CGRectMake(15*WIDTH_NIT, phoneView.bottom, kScreenWidth-30*WIDTH_NIT, 46*WIDTH_NIT);
    verifyView.leftLabel.text = @"  验证码";
    verifyView.inputTextField.delegate = self;
    [verifyView.smsCodeBtn addTarget:self action:@selector(verifyAction)];
    verifyView.inputTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:verifyView];
  
    
    setPwView = [[ZXLoginTextField alloc] initWithType:PwdType];
    setPwView.frame = CGRectMake(15*WIDTH_NIT, verifyView.bottom, kScreenWidth-30*WIDTH_NIT, 46*WIDTH_NIT);
    setPwView.leftLabel.text = @"  密码";
    setPwView.inputTextField.secureTextEntry = YES;
    setPwView.inputTextField.delegate = self;
    [self.view addSubview:setPwView];
  
    
    confirmPwView = [[ZXLoginTextField alloc] initWithType:PwdType];
    NSInteger confirmPwViewHeight = _registerType == Register ?  0 : 46*WIDTH_NIT;
    confirmPwView.hidden = _registerType == Register;
    confirmPwView.frame = CGRectMake(15*WIDTH_NIT, setPwView.bottom, kScreenWidth-30*WIDTH_NIT, confirmPwViewHeight);
    confirmPwView.leftLabel.text = @"  确认密码：";
    confirmPwView.inputTextField.secureTextEntry = YES;
    confirmPwView.inputTextField.delegate = self;
    [self.view addSubview:confirmPwView];
  
    
    inviteView = [[ZXLoginTextField alloc] initWithType:NormalType];
    NSInteger inviteViewHeight = _registerType == Register ? 46*WIDTH_NIT : 0;
    inviteView.hidden = _registerType == ForgetPassWord;
    inviteView.frame = CGRectMake(15*WIDTH_NIT, setPwView.bottom, kScreenWidth-30*WIDTH_NIT, inviteViewHeight);
    inviteView.leftLabel.text = @"  昵称";
    inviteView.inputTextField.delegate = self;
    [self.view addSubview:inviteView];
    
    
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSInteger sureBtnY = _registerType == Register ? inviteView.bottom+35*WIDTH_NIT : confirmPwView.bottom+35*WIDTH_NIT;
    
    sureBtn.frame = CGRectMake(15*WIDTH_NIT, sureBtnY, kScreenWidth-30*WIDTH_NIT, 44*WIDTH_NIT);
    
    NSString *sureTitle = _registerType == Register ? @"完成注册" : @"确认";
    [sureBtn setTitle:sureTitle forState:UIControlStateNormal];
    [sureBtn setTitleColor:MainWhiteColor];
    [sureBtn setBackgroundColor:MainGoldColor];
    sureBtn.titleLabel.font = Font18;
    sureBtn.layer.cornerRadius = 4.0;
    sureBtn.layer.masksToBounds = YES;
    [sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
 

    if (_registerType == Register) {
        
        NSString *titleName = @"点击【完成注册】代表我已阅读并同意《五爪猫用户协议》";
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:titleName];
        [str addAttribute:NSForegroundColorAttributeName value:NameColor range:NSMakeRange(0,titleName.length)];
        
        
        //协议
        UIButton* protocolBtn = [[UIButton alloc]init];
        protocolBtn.frame = CGRectMake(15*WIDTH_NIT, sureBtn.bottom, kScreenWidth-30*WIDTH_NIT, 46*WIDTH_NIT);
        protocolBtn.titleLabel.numberOfLines = 1;
        protocolBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        protocolBtn.titleLabel.font = Font11;
        [protocolBtn setAttributedTitle:str forState:UIControlStateNormal];
        [protocolBtn setTitleColor:NameColor forState:UIControlStateNormal];
        [protocolBtn setBackgroundColor:[UIColor clearColor]];
        [protocolBtn addTarget:self action:@selector(protocolAct)];
        [self.view addSubview:protocolBtn];
    
        
        //已有账户，立即登录
        UIButton* havedUserBtn = [[UIButton alloc]init];
        havedUserBtn.frame = CGRectMake(15*WIDTH_NIT, protocolBtn.bottom + 210*WIDTH_NIT, kScreenWidth-30*WIDTH_NIT, 46*WIDTH_NIT);
        havedUserBtn.titleLabel.numberOfLines = 1;
        havedUserBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        havedUserBtn.titleLabel.font = Font11;
        [havedUserBtn setTitle:@"已有账户？立即登录" forState:UIControlStateNormal];
        [havedUserBtn setTitleColor:NameColor forState:UIControlStateNormal];
        [havedUserBtn setBackgroundColor:[UIColor clearColor]];
        [havedUserBtn addTarget:self action:@selector(havedUserAct)];
        [self.view addSubview:havedUserBtn];
        
    }
}


#pragma  mark --- 用户协议
-(void)protocolAct{
    
    NSLog(@"用户协议");
//    //用户协议
//    PLXieYiViewController *webView1 = [PLXieYiViewController new];
//    webView1.title = @"用户协议";
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"用户协议-纯真生活网1.0" ofType:@"doc"];
//    NSURL *url = [NSURL fileURLWithPath:path];
//    webView1.requestUrl = url;
//    [self.navigationController pushViewController:webView1 animated:YES];
    
}

#pragma  mark --- 已有账户，立即登录
-(void)havedUserAct{
    
    NSLog(@"已有账户，立即登录");
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (textField == phoneView.inputTextField) {
        _registerModel.mobilPhone = textField.text;
    } else if (textField == verifyView.inputTextField) {
        _registerModel.smsCode = textField.text;
    } else if (textField == setPwView.inputTextField) {
        _registerModel.passWord = textField.text;
    } else if (textField == inviteView.inputTextField) {
        _registerModel.invitCode = textField.text;
    }
}

- (void)sureAction {
    [phoneView.inputTextField resignFirstResponder];
    [verifyView.inputTextField resignFirstResponder];
    [setPwView.inputTextField resignFirstResponder];
    [inviteView.inputTextField resignFirstResponder];
    //    [self verifyInputText];
    
    NSDictionary *dic = [NSDictionary dictionary];
    
    if ([NSString isEmpty:_registerModel.smsCode]) {
        ALERTTK(nil, @"验证码不能为空");
    } else if ([NSString isEmpty:_registerModel.passWord]) {
        ALERTTK(nil, @"密码不能为空");
//    } else if ([NSString isEmpty:confirmPwView.inputTextField.text] || ![_registerModel.passWord isEqualToString:confirmPwView.inputTextField.text]) {
//        ALERTTK(nil, @"两次密码不一致");
    } else if ([NSString isEmpty:_registerModel.invitCode]) {
        dic = @{@"mobilPhone" : _registerModel.mobilPhone, @"smsCode" : _registerModel.smsCode, @"passWord" : _registerModel.passWord,};
        NSInteger requestID = _registerType == Register ?
        ZXInterfaceRegister :
        ZXInterfaceUserFindPassword;
        [self sendRequestId:requestID rMethod:POSTMethod params:dic];
      
    } else {
        dic = @{@"mobilPhone" : _registerModel.mobilPhone, @"smsCode" : _registerModel.smsCode, @"passWord" : _registerModel.passWord, @"invitCode" : _registerModel.invitCode};
        int requestID = _registerType == Register ?
        ZXInterfaceRegister :
        ZXInterfaceUserFindPassword;
        [self sendRequestId:requestID rMethod:POSTMethod params:dic];
       
    }
    
}

- (void)verifyAction {
    if (phoneView.inputTextField.text.length != 11) {
        ALERTTK(nil, @"手机号不正确");
        return;
    } else {
        //        verifyView.inviteCodeBtn.enabled = NO;
        
        
        //        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phoneView.inputTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        //            if (!error) {
        //                ALERTTK(nil, @"获取验证码成功");
        //            } else {
        //                NSString *str = [NSString stringWithFormat:@"错误信息：%@", error];
        //                ALERTTK(nil, str);
        //            }
        //        }];
        if (_registerType ==Register) {
            [self sendRequestId:ZXInterfaceSmsCode rMethod:POSTMethod params:@{@"phone" : phoneView.inputTextField.text, @"type" : @"register"}];
        } else {
            [self sendRequestId:ZXInterfaceSmsCode rMethod:POSTMethod params:@{@"phone" : phoneView.inputTextField.text, @"type" : @"forget"}];
        }
        
    }
}



- (void)handleData:(id)data byRequestId:(NSInteger)requestId {

    long requestCode = [data[@"code"] longValue];
    if (requestId == ZXInterfaceSmsCode) {
        
        if (requestCode == 200) {
            verifyView.inputTextField.text = data[@"data"][@"smsCode"];
            dispatch_async(dispatch_get_main_queue(), ^{
                //verifyView.inviteCodeBtn.enabled = YES;
                [verifyView.smsCodeBtn timeFailBeginFrom:60];
            });
        } else {
            ALERTTK(nil, data[@"message"]);
        }
    } else if (requestId == ZXInterfaceRegister){
        
        if ([data[@"success"] integerValue] == 1) {
            ALERTTK(nil, @"注册成功！");
            [self.navigationController dismissViewControllerAnimated:YES completion:^{
                ZXLoginModel *loginModel = [ZXLoginModel sharedZXLoginModel];
                [loginModel modelSetWithDictionary:data[@"data"][@"user"]];
                NSDictionary *infoDic = [loginModel modelToJSONObject];
                [[NSUserDefaults standardUserDefaults] setObject:infoDic forKey:kUserLoginInfo];
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }else {
            ALERTTK(nil, data[@"message"]);
        }
        //        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    } else if (ZXInterfaceUserFindPassword == requestId) {
        if ([data[@"success"] integerValue] == 1) {
            ALERTTK(nil, @"密码重置成功！");
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            ALERTTK(nil, data[@"message"]);
        }
        
    }
}



- (void)handleError:(id)error byRequestId:(NSInteger)requestId {
    if (requestId == ZXInterfaceSmsCode) {
        ALERTTK(nil, @"数据错误");
        //verifyView.inviteCodeBtn.enabled = YES;
    }

}

- (void)backAct {
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
