//
//  ZXBindPhoneViewController.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"

typedef NS_ENUM(NSUInteger, BindType){
    BangDing,  //绑定
    XiuGai,  //修改
    ReBangDing, //再次绑定
};  //请求短信类型

@interface ZXBindPhoneViewController : BaseViewController

@property (nonatomic, assign) BindType bindType;

@end
