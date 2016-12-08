//
//  ZXTools.m
//  XRBB
//
//  Created by mac on 16/5/27.
//  Copyright © 2016年 赵昕. All rights reserved.
//

#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height

#import "ZXTools.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ZXTools


#pragma mark按钮时间倒计时

+(void)leftTimeButton:(UIButton *)button{
    
    
    __block int timeout=58; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout<=0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                [button setTitle:@"获取验证码" forState:UIControlStateNormal];
                
                button.backgroundColor = [UIColor clearColor];
                
                button.userInteractionEnabled = YES;
                
            });
            
        }else{
            
            //            int minutes = timeout / 60;
            
            int seconds = timeout % 59;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                NSLog(@"____%@",strTime);
                
                [button setTitle:[NSString stringWithFormat:@"%@",strTime] forState:UIControlStateNormal];
                
                button.backgroundColor = [UIColor clearColor];
                
                button.userInteractionEnabled = NO;
                
            });
            
            timeout--;
            
        }
        
    });
    
    dispatch_resume(_timer);
    
    
}

#pragma mark简单提醒
+(UIAlertController *)alert:(UIViewController *)vc message:(NSString *)message{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    
    __weak __typeof__(vc) weakSelf = vc;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        __weak __typeof__(vc) strongSelf = weakSelf;
        
        [strongSelf presentViewController:alert animated:YES completion:nil];
        
    });
    
    return  alert;
    
}

#pragma mark颜色转图片
+(UIImage*)createImageWithColor: (UIColor*) color
{
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
    
}

#pragma mark输入限制
+ (UITextField *)PhoneLimit:(UITextField *)textField limit:(TextFieldLimit)limit vc:(UIViewController *)vc{
    
    NSString *method = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSString *message = @"请填写正确的手机号码";
    
    switch (limit) {
        case PhoneLimit:
            method = @"^1[3|4|5|7|8][0-9]\\d{8}$"; //手机
            message = @"请填写正确的手机号码";
            break;
        case IDCardLimit:
            method = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)"; //身份证
            message = @"请填写正确的身份证号码";
            break;
        case TelLimit:
            method = @"^(\\d{3,4}-)\\d{7,8}$"; //座机号码
            message = @"请填写正确的座机号码";
            break;
        case NumberLimit:
            method = @"^[0-9]+([.]{0,1}[0-9]+){0,1}$"; //整数或者小数
            message = @"请填写正确的数字";
            break;
        default:
            break;
    }
    
    
    NSString *searchText = textField.text;
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:method options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    if (result) {
        NSLog(@"result %@", [searchText substringWithRange:result.range]);
    }else{
        textField.text = @"";
        [ZXTools alert:vc message:message];
    }
    
    return textField;
}


#pragma mark设置空白nav
+(void)setNav:(UINavigationController *)nav{
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    textAttrs[NSFontAttributeName] = KNavigationFont;
    textAttrs[NSShadowAttributeName] = [[NSShadow alloc] init];
    [nav.navigationBar setTitleTextAttributes:textAttrs];
    [nav.navigationBar setBackgroundImage:[ZXTools createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    //compact：及时更新背景样式,让导航条彻底透明，不显示底部那条线。 maskToBounds：不让透明图片影响状态栏
    nav.navigationBar.layer.masksToBounds = YES;
    
}

#pragma mark还原原来nav
+(void)returnNav:(UINavigationController *)nav{
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = KNavigationFont;
    textAttrs[NSShadowAttributeName] = [[NSShadow alloc] init];
    [nav.navigationBar setTitleTextAttributes:textAttrs];
    [nav.navigationBar setBackgroundImage:[ZXTools createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    //compact：及时更新背景样式,让导航条彻底透明，不显示底部那条线。 maskToBounds：不让透明图片影响状态栏
    nav.navigationBar.layer.masksToBounds = NO;
    
}



#pragma mark获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    //app默认windowLevel是UIWindowLevelNormal，如果不是，找到UIWindowLevelNormal的
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    id  nextResponder = nil;
    UIViewController *appRootVC=window.rootViewController;
    //    如果是present上来的appRootVC.presentedViewController 不为nil
    if (appRootVC.presentedViewController) {
        nextResponder = appRootVC.presentedViewController;
    }else{
        UIView *frontView = [[window subviews] objectAtIndex:0];
        nextResponder = [frontView nextResponder];
    }
    
    if ([nextResponder isKindOfClass:[UITabBarController class]]){
        UITabBarController * tabbar = (UITabBarController *)nextResponder;
        UINavigationController * nav = (UINavigationController *)tabbar.viewControllers[tabbar.selectedIndex];
        //        UINavigationController * nav = tabbar.selectedViewController ; 上下两种写法都行
        result=nav.childViewControllers.lastObject;
        
    }else if ([nextResponder isKindOfClass:[UINavigationController class]]){
        UIViewController * nav = (UIViewController *)nextResponder;
        result = nav.childViewControllers.lastObject;
    }else{
        result = nextResponder;
    }
    
    return result;
    
}

#pragma mark获取当前window
+(UIView*)getCurrentWindow{
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    // 添加到窗口
    return window;
}


#pragma mark判断数组是否为空
+ (BOOL)isBlankArray:(NSArray *)array{
    
    if (array != nil && ![array isKindOfClass:[NSNull class]] && array.count != 0) {
    
        return YES;
    }
    
    return NO;
}

#pragma mark百分比后取小数点后两位
+(NSString* )rate:(NSString* )floatString{
    
    
    NSString *str2 = [NSString stringWithFormat:@"%.2f%%",[floatString floatValue]*100];
    
    return str2;
}

#pragma mark提示
+ (void)makeTask:(NSString *)errorMessage{
    __weak __typeof__(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *message = errorMessage;
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[weakSelf getCurrentWindow] animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = message;
        hud.margin = 10.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hideAnimated:YES afterDelay:2];
    });
}




#pragma mark md5
+ (NSString *)md5String:(NSString *)string{
    
    const char *str = [string UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH] = {0};
    CC_MD5(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    
    return ret;
}

@end
