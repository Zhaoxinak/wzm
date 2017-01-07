//
//  ZXTools.h
//  XRBB
//
//  Created by mac on 16/5/27.
//  Copyright © 2016年 赵昕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CommonHeader.h"

#import "ZXScrollView.h"        //
#import "ZXTableView.h"         //
#import "ZXSegmentedControl.h"  //选择器


typedef NS_ENUM(NSUInteger, TextFieldLimit){
    PhoneLimit,  //手机限制
    IDCardLimit, //身份证限制
    TelLimit,    //固话限制
    NumberLimit  //数字限制
};

@interface ZXTools : NSObject

#pragma mark按钮时间倒计时
+(void)leftTimeButton:(UIButton *)button;
#pragma mark简单提醒
+(UIAlertController *)alert:(UIViewController *)vc message:(NSString *)message;
#pragma mark颜色转图片
+(UIImage*)createImageWithColor: (UIColor*) color;
#pragma mark输入限制
+ (UITextField *)PhoneLimit:(UITextField *)textField limit:(TextFieldLimit)limit vc:(UIViewController *)vc;
#pragma mark设置空白nav
+(void)setNav:(UINavigationController *)nav;
#pragma mark还原原来nav
+(void)returnNav:(UINavigationController *)nav;
#pragma mark获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;
#pragma mark获取当前window
+(UIView *)getCurrentWindow;
#pragma mark判断数组是否为空
+ (BOOL)isBlankArray:(NSArray *)array;
#pragma mark百分比后取小数点后两位
+(NSString *)rate:(NSString *)floatString;
#pragma mark提示
+ (void)makeTask:(NSString *)errorMessage;
#pragma mark md5
+ (NSString *)md5String:(NSString *)string;
@end
