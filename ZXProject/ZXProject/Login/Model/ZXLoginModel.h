//
//  ZXLoginModel.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZXLoginModel : NSObject

@property (copy, nonatomic) NSString *mobilPhone;
@property (copy, nonatomic) NSString *passWord;

@property (copy, nonatomic) NSString *picture;
@property (copy, nonatomic) NSNumber *userId;
@property (copy, nonatomic) NSString *iscertification;
@property (nonatomic, strong) NSString *userIdStr;
@property (copy, nonatomic) NSString *nikeName;
//微信openID
@property (copy, nonatomic) NSString *weixin;

@property (copy, nonatomic) NSString *unionid;

@property (nonatomic, copy) NSString *myinvitcode;


- (void)logOutAction;

+ (instancetype)sharedZXLoginModel;

@end
