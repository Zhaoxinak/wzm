//
//  MiaoCircleTopView.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/17.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThreeMiaoCircleModel.h"

@protocol MiaoCircleTopViewDelegate <NSObject>
#pragma mark -- 实现加入按钮点击
@optional
-(void)miaoCircleTopViewSelect2go:(NSInteger)tag;

@end


@interface MiaoCircleTopView : UIView{
    
    UIImageView *avatarView; //头像
    UIButton *avatarBtn; //头像点击
    UILabel *name; //标题
    UILabel *subName; //内容
    UIButton *joinBtn; //加入按钮
    UILabel *memberNum; //成员数量
    UILabel *noteNum; //帖子数量
    UILabel * contentLabel; //公告
    
}

@property(nonatomic, assign) id<MiaoCircleTopViewDelegate> delegate;
@property (nonatomic, strong) ThreeMiaoCircleModel *model; //模型

@end
