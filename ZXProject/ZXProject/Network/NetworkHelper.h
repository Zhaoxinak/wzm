//
//  NetworkHelper.h
//  InterfaceHelper
//
//  Created by Wu Hengmin on 16/3/23.
//  Copyright © 2016年 Wu Hengmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CommonHeader.h"
typedef NS_ENUM(NSUInteger, RequestName) {
    ZXInterfaceDiscover, //发现 （测试）
    ZXInterfaceLogin,    //登录
    ZXInterfaceWeChatLogin,  //微信登录
    ZXInterfaceWeWeChatAdvance,  //高级授权
    ZXInterfaceUserInfo, //获取用户信息
    ZXInterfaceWeChatBind, //绑定微信电话
    ZXInterfaceMobileValidationSms, //验证手机
    ZXInterfaceModifyUserInfo, //修改用户信息
    ZXInterfaceSmsCode,  //获取短信
    ZXInterfaceRegister, //注册
    ZXInterfaceUserFindPassword, //忘记密码
    ZXInterfaceAddUserFaceBack //意见反馈
    
};

//请求方法
typedef NS_ENUM(NSUInteger, HTTPMethod) {
    GETMethod, //GET请求方法
    POSTMethod //POST请求方法
};


@interface NSObject (FetchData)


/**
 *  <#Description#>
 *
 *  @param progress   <#progress description#>
 */
-(void)dataWithDiscover:(BOOL)progress requestId:(NSInteger)requestId;


-(void)sendRequestId:(RequestName)requestId rMethod:(HTTPMethod)rMethod params:(id _Nonnull)params;


#pragma mark当网络请求开始或结束时，下面两个方法将会被调到。
- (void)fetchingDidStartWithRequestId:(NSInteger)requestId;
- (void)fetchingDidEndWithRequestId:(NSInteger)requestId;
#pragma mark当网络请求成功或失败时，下面两个方法将会被调到。
- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId;
- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId;
#pragma mark当网络请求成功时，处理后获取到的成功数据。
- (void)ZXsuccessData:(id _Nullable)data byRequestId:(NSInteger)requestId;
#pragma mark请求不成功后的处理
-(void)showServerMsg:(NSString *_Nonnull)msg;
@end
