//
//  MoreFunctionView.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoreFunctionViewDelegate <NSObject>

#pragma mark -- 实现按钮 0为点赞 1为收藏 2为分享 3评论
@optional
-(void)moreFunctionViewSelect2go:(NSInteger)tag;

@end


@interface MoreFunctionView : UIView

@property(nonatomic, assign) id<MoreFunctionViewDelegate> delegate;
@property(nonatomic, strong) UIButton * zanBtn; //点赞
@property(nonatomic, strong) UIButton * collectBtn; //收藏
@property(nonatomic, strong) UIButton * shareBtn; //分享
@property(nonatomic, strong) UIButton * commentBtn; //评论

@end
