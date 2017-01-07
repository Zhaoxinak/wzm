//
//  ZXLoginModel.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/7.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ZXLoginModel.h"
#import "CommonHeader.h"

@implementation ZXLoginModel

ZXSingletonM(ZXLoginModel)


- (NSString *)userIdStr {
    if (self.userId) {
        return [NSString stringWithFormat:@"%@", [ZXLoginModel sharedZXLoginModel].userId];
    }
    return @"";
}

- (void)logOutAction {
    _mobilPhone = nil;
    _passWord = nil;
    _picture = nil;
    _userId = nil;
    _userIdStr = nil;
    _iscertification = nil;
}

@end
