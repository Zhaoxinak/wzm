//
//  AppDelegate.m
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "AppDelegate.h"
#import "CommonHeader.h"
#import "CustomTabBarController.h"

//微信
static NSString *const WXAppKey = @"wxd984510cc0a8dfd6";
static NSString *const WXAppSecret = @"35a92db0f67e613012fcbf5eaa9bba43";


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //友盟配置
    [self setupUMConfig];
    [WXApi registerApp:WXAppKey];
    
    
    // 设置键盘监听管理
    [self setKeyboardManager];
   
    
    // 设置tabBar
    CustomTabBarController *customTabBar = [CustomTabBarController new];
    self.window.rootViewController = customTabBar;

    return YES;
}

//初始化友盟配置
- (void)setupUMConfig {
    //打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
    
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"57e8c11ce0f55a569a00348f"];
    
    //设置微信的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession
                                          appKey:@"wxd984510cc0a8dfd6"
                                       appSecret:@"35a92db0f67e613012fcbf5eaa9bba43"
                                     redirectURL:@"http://mobile.umeng.com/social"];
    //设置分享到QQ互联的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ
                                          appKey:@"1105646739"
                                       appSecret:nil
                                     redirectURL:@"http://mobile.umeng.com/social"];
    
    //设置新浪的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina
                                          appKey:@"583983328"
                                       appSecret:@"ddc5c1c766b0791dff4b013a60868c3f"
                                     redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    
//    //友盟统计
//    UMConfigInstance.appKey = @"57e8c11ce0f55a569a00348f";
//    UMConfigInstance.channelId = @"App Store";
//    [MobClick startWithConfigure:UMConfigInstance];//配置以上参数后调用此方法初始化SDK！
//    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
//    [MobClick setAppVersion:version];
//    
//    PLLoginModel *loginModel = [PLLoginModel shareLoginModel];
//    NSNumber *userId = loginModel.userId;
//    NSString *userID = [NSString stringWithFormat:@"userId:%@", userId];
//    [MobClick profileSignInWithPUID:userID];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -- 设置全局键盘弹出
-(void)setKeyboardManager{
    
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES; // 控制整个功能是否启用。
    manager.shouldResignOnTouchOutside =YES; // 控制点击背景是否收起键盘
    manager.shouldToolbarUsesTextFieldTintColor =YES; // 控制键盘上的工具条文字颜色是否用户自定义
    manager.enableAutoToolbar =YES; // 控制是否显示键盘上的工具条
    manager.toolbarManageBehaviour =IQAutoToolbarByPosition; // 最新版的设置键盘的returnKey的关键字 ,可以点击键盘上的next键，自动跳转到下一个输入框，最后一个输入框点击完成，自动收起键盘。
  
}



@end
