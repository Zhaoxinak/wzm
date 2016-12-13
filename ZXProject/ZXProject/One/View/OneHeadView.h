//
//  OneHeadView.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/9.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "UIView+Common.h"
@protocol OneHeadViewDelegate <NSObject>

#pragma mark -- 实现轮播图与按钮 同时跳转 低于100为轮播， 高于等于100为按钮
@optional
-(void)oneHeadViewSelect2go:(NSInteger)tag;

@end

@interface OneHeadView : UIView<SDCycleScrollViewDelegate>{
    
    UIView *adView;
    UIView *btnView;
    SDCycleScrollView *cycleScrollView; //广告
    
}

@property(nonatomic, assign) id<OneHeadViewDelegate> delegate;
@property(nonatomic, strong) NSMutableArray *imageArray;


@end
