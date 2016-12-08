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


@interface NSObject (FetchData)


/**
 *  <#Description#>
 *
 *  @param progress   <#progress description#>
 */
-(void)dataWithDiscover:(BOOL)progress requestId:(NSInteger)requestId;






#pragma mark当网络请求开始或结束时，下面两个方法将会被调到。
- (void)fetchingDidStartWithRequestId:(NSInteger)requestId;
- (void)fetchingDidEndWithRequestId:(NSInteger)requestId;
#pragma mark当网络请求成功或失败时，下面两个方法将会被调到。
- (void)handleData:(id _Nullable)data byRequestId:(NSInteger)requestId;
- (void)handleError:(id _Nullable)error byRequestId:(NSInteger)requestId;
#pragma mark请求不成功后的处理
-(void)showServerMsg:(NSString *_Nonnull)msg;
@end
