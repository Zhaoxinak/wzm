//
//  ZXRegisterViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSInteger , RegisterType) {
    Register,  //注册
    ForgetPassWord //忘记密码
};

@interface ZXRegisterViewController : BaseViewController

@property (nonatomic, assign) RegisterType registerType;

@end
