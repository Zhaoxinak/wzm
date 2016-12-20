//
//  ZXShareHelper.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHeader.h"

@class ZXShareModel;
@interface ZXShareHelper : NSObject

+ (ZXShareHelper *)shareInstance;

- (void)shareShow;

- (void)shareWithShareModel:(ZXShareModel *)shareModel;

@end
