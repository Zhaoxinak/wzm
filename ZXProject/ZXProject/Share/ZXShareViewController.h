//
//  ZXShareViewController.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "BaseViewController.h"

@class ZXShareModel;
typedef NS_ENUM(NSInteger, ZXShareChannel) {
    ZXShareChannelWeChatFriend,
    ZXShareChannelWechatTimeLine,
    ZXShareChannelQQFriend,
    ZXShareChannelQQZone,
    ZXShareChannelSina,
    ZXShareChannelSms
};

@interface ZXShareViewController : BaseViewController

@property (nonatomic, strong) ZXShareModel *shareModel;

@end
