//
//  ZXShareModel.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXShareModel : NSObject
//分享标题
@property (nonatomic, strong) NSString *shareTitle;
//分享内容
@property (nonatomic, strong) NSString *shareContent;
//分享图片
@property (nonatomic, strong) id shareImage;
//分享链接
@property (nonatomic, strong) NSString *shareUrl;

@end
