//
//  ZXShareHelper.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "ZXShareHelper.h"
#import "ZXShareViewController.h"

@interface ZXShareHelper ()

@property (nonatomic, strong) ZXShareViewController *shareVC;

@end

@implementation ZXShareHelper

+ (ZXShareHelper *)shareInstance {
    static ZXShareHelper *shareInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}


- (void)shareShow {
    if (!_shareVC) {
        _shareVC = [[ZXShareViewController alloc] init];
    }
    _shareVC = [[ZXShareViewController alloc] init];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:_shareVC.view];
}

- (void)shareWithShareModel:(ZXShareModel *)shareModel {
    if (!_shareVC) {
        _shareVC = [[ZXShareViewController alloc] init];
    }
    _shareVC = [[ZXShareViewController alloc] init];
    _shareVC.shareModel = shareModel;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:_shareVC.view];
}


@end
