//
//  ZXLoginTextField.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ZXLoginTextField.h"
#import "CommonHeader.h"

@implementation ZXLoginTextField

- (instancetype)initWithType:(TextFieldType)type{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _type = type;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _leftLabel = [[UILabel alloc] init];
    _leftLabel.textColor = RGBColor(128, 128, 128, 1);
    _leftLabel.font = Font13;
    [self addSubview:_leftLabel];
   
    _leftBtn = [[UIButton alloc] init];
    _leftBtn.backgroundColor = [UIColor clearColor];
    [_leftBtn addTarget:self action:@selector(tapAction)];
    [self addSubview:_leftBtn];
    
    _inputTextField = [[UITextField alloc] init];
    _inputTextField.textColor = RGBColor(58, 58, 58, 1);
    _inputTextField.font = Font13;
    [self addSubview:_inputTextField];
    
    if (_type == SmsType) {
        _smsCodeBtn = [ZXCountdDownButton buttonWithType:UIButtonTypeCustom];
        [_smsCodeBtn setTitleColor:RGBColor(58, 58, 58, 1)];
        _smsCodeBtn.titleLabel.font = Font13;
        [_smsCodeBtn setTitle:@"获取验证码"];
        [_smsCodeBtn addTarget:self action:@selector(smsAction)];
        [self addSubview:_smsCodeBtn];
    }
   
    if (_type == PwdType) {
        //密码显示开关
        _inputTextField.secureTextEntry = YES;
        
        _switchButton = [[UIButton alloc]init];
        [_switchButton setBackgroundImage:[UIImage imageNamed:@"眼睛"] forState:UIControlStateNormal];
        [_switchButton setBackgroundImage:[UIImage imageNamed:@"眼睛"] forState:UIControlStateSelected];
        _switchButton.selected =YES;
        [_switchButton addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_switchButton];
    }
    
    
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = RGBColor(224, 224, 224, 1);
//    view.tag = 1000;
//    [self addSubview:view];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.height = 50.0*WIDTH_NIT;

    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;

    
    
    if (_type == SmsType) {
        _leftLabel.frame = CGRectMake(0, 14*WIDTH_NIT, 100*WIDTH_NIT, 22*WIDTH_NIT);
        [_leftLabel sizeToFit];
        _smsCodeBtn.frame = CGRectMake(self.width-110*WIDTH_NIT, 0, 100*WIDTH_NIT, 50*WIDTH_NIT);
        _inputTextField.frame = CGRectMake(_leftLabel.right+5*WIDTH_NIT, 14*WIDTH_NIT, self.width-_leftLabel.right-_smsCodeBtn.width-10*WIDTH_NIT, 22*WIDTH_NIT);
        
    }else
    if (_type == PwdType) {
        _leftLabel.frame = CGRectMake(0, 14*WIDTH_NIT, 100*WIDTH_NIT, 22*WIDTH_NIT);
        [_leftLabel sizeToFit];
        _switchButton.frame = CGRectMake(self.width-50*WIDTH_NIT, 15*WIDTH_NIT, 30*WIDTH_NIT, 20*WIDTH_NIT);
        _inputTextField.frame = CGRectMake(_leftLabel.right+5*WIDTH_NIT, 14*WIDTH_NIT, self.width-_leftLabel.right-_switchButton.width-10*WIDTH_NIT, 22*WIDTH_NIT);
        
    }
    
    
    else{
        _leftLabel.frame = CGRectMake(0, 14*WIDTH_NIT, 100*WIDTH_NIT, 22*WIDTH_NIT);
        [_leftLabel sizeToFit];
        _inputTextField.frame = CGRectMake(_leftLabel.right+5*WIDTH_NIT, 14*WIDTH_NIT, self.width-_leftLabel.right-10*WIDTH_NIT, 22*WIDTH_NIT);
    }
    
    _leftBtn.frame = _leftLabel.frame;
    
    
//    UIView *lineView = (UIView *)[self viewWithTag:1000];
//    lineView.frame = CGRectMake(_leftLabel.right-1, 14*WIDTH_NIT, 0.3, 22*WIDTH_NIT);
    
    
    
}

- (void)smsAction{
    
    NSLog(@"获取验证码");
    if (_smsCodeBtn.count > 0) {
        _smsCodeBtn.enabled = NO;
     
    } else {
        
    }
}

- (void)tapAction{
   
    NSLog(@"点击输入框");
    [_inputTextField becomeFirstResponder];
}

#pragma mark 密码显现
- (void)switchChanged:(UIButton *)sender {
    sender.selected=!sender.selected;
    
    _inputTextField.secureTextEntry = sender.selected;
    
}

@end
