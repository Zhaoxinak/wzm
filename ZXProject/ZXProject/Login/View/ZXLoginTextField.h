//
//  ZXLoginTextField.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXCountdDownButton.h"

typedef NS_ENUM(NSUInteger, TextFieldType)  {
    NormalType,  //正常输入框
    PwdType,  //密码模式
    SmsType  //带短信请求
};  //输入框类型


@interface ZXLoginTextField : UIView
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UITextField *inputTextField;
@property (nonatomic, strong) ZXCountdDownButton *smsCodeBtn;
@property (nonatomic, strong) UIButton *switchButton;

@property (nonatomic, assign) TextFieldType type;

- (instancetype)initWithType:(TextFieldType)type;


@end
