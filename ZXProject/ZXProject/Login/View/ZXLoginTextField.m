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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _leftLabel = [[UILabel alloc] init];
    _leftLabel.textColor = RGBColor(128, 128, 128, 1);
    _leftLabel.font = OneFont;
    [self addSubview:_leftLabel];
    
    _inputTextField = [[UITextField alloc] init];
    _inputTextField.textColor = RGBColor(58, 58, 58, 1);
    _inputTextField.font = OneFont;
    [self addSubview:_inputTextField];
    
    if (_type == SmsType) {
        _smsCodeBtn = [ZXCountdDownButton buttonWithType:UIButtonTypeCustom];
        [_smsCodeBtn setTitleColor:RGBColor(58, 58, 58, 1)];
        [_smsCodeBtn setTitle:@"获取验证码"];
        [_smsCodeBtn addTarget:self action:@selector(smsAction)];
        [self addSubview:_smsCodeBtn];
    }
   
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = RGBColor(224, 224, 224, 1);
    line.tag = 1000;
    [self addSubview:line];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.height = 50.0*WIDTH_NIT;
    
    UIView *lineView = (UIView *)[self viewWithTag:1000];
    lineView.frame = CGRectMake(0, self.height-1, self.width, 1);
    
    if (_type == SmsType) {
        _leftLabel.frame = CGRectMake(0, 14*WIDTH_NIT, 120*WIDTH_NIT, 22*WIDTH_NIT);
        _smsCodeBtn.frame = CGRectMake(self.width-130*WIDTH_NIT, 0, 120*WIDTH_NIT, 50*WIDTH_NIT);
        _inputTextField.frame = CGRectMake(_leftLabel.right, 14*WIDTH_NIT, self.width-_leftLabel.right-_smsCodeBtn.width, 22*WIDTH_NIT);
    }else{
        _leftLabel.frame = CGRectMake(0, 14*WIDTH_NIT, 120*WIDTH_NIT, 22*WIDTH_NIT);
        _inputTextField.frame = CGRectMake(_leftLabel.right, 14*WIDTH_NIT, self.width-_leftLabel.right, 22*WIDTH_NIT);
    }
 
}

- (void)smsAction{
    
    if (_smsCodeBtn.count > 0) {
        _smsCodeBtn.enabled = NO;
     
    } else {
        
    }
}


@end
