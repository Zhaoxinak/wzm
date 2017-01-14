//
//  ZXCycleScrollView.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/14.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ZXCycleScrollView.h"
#import "CommonHeader.h"

@interface ZXCycleScrollView()<SDCycleScrollViewDelegate>{
    
    UIView *adView;
    SDCycleScrollView *cycleScrollView; //广告
}


@end

@implementation ZXCycleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置广告轮播打底图
        [self setupTopView];
        //设置广告轮播
        [self topADView];
      
    }
    return self;
}

#pragma mark --- 打底图
-(void)setupTopView{
    
    //广告轮播图
    adView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    adView.backgroundColor = [UIColor redColor];
    [self insertSubview:adView atIndex:1];

}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
}

#pragma mark --- 顶部轮播图
-(void)topADView{
    
    // 网络加载 --- 创建不带标题的图片轮播器
    cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:adView.frame delegate:self placeholderImage:[UIImage imageNamed:@""]];
    //轮播是否循环
    cycleScrollView.infiniteLoop = YES;
    //设置页码样式
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScrollView.autoScrollTimeInterval = 3.0; // 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView.pageDotColor = [UIColor clearColor];
    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
    cycleScrollView.backgroundColor = [UIColor clearColor];
    [adView insertSubview:cycleScrollView atIndex:2];
    
}

#pragma mark --- 设置轮播图的图片
-(void)setImageArray:(NSMutableArray *)imageArray{
    
    NSArray *imagesURLStrings = imageArray;
    
    //模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    });
    
    
}


#pragma mark --- 顶部轮播点击实现
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    //轮播跳转
    if ([self.delegate respondsToSelector:@selector(zxCycleScrollViewSelect2go:)]) {
        [self.delegate zxCycleScrollViewSelect2go:index];
        NSLog(@"index%ld",(long)index);
    }
}


@end
