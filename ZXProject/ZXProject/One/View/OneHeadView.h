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

@optional
-(void)didSelect2go:(NSInteger)tag;

@end

@interface OneHeadView : UIView<SDCycleScrollViewDelegate>{
    
    UIView *adView;
    UIView *btnView;
    SDCycleScrollView *cycleScrollView; //广告
    
}

@property(nonatomic, assign) id<OneHeadViewDelegate> delegate;
-(void)setcycleScrollView:(NSArray *)imageArray;


@end
