//
//  ZXCycleScrollView.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/14.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZXCycleScrollViewDelegate <NSObject>

#pragma mark -- 实现轮播图跳转
@optional
-(void)zxCycleScrollViewSelect2go:(NSInteger)tag;

@end

@interface ZXCycleScrollView : UIView
@property(nonatomic, assign) id<ZXCycleScrollViewDelegate> delegate;
@property(nonatomic, strong) NSMutableArray *imageArray;
@end
