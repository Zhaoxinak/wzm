//
//  OneHeadView.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/9.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneHeadView.h"

@implementation OneHeadView

- (void)drawRect:(CGRect)rect {
    
    //设置广告轮播和按钮打底图
    [self setTopBottomView];
    //设置广告轮播
    [self topADView];
    //设置按钮
    [self BtnView];
    
}


#pragma mark --- 打底图
-(void)setTopBottomView{
    
    //广告轮播图
    adView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
    adView.backgroundColor = [UIColor redColor];
    [self insertSubview:adView atIndex:1];
    
    //按钮图
    btnView = [[UIView alloc]initWithFrame:CGRectMake(0, adView.bottom, self.width, self.height/2)];
    btnView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:btnView atIndex:1];
    
    
}

#pragma mark --- 顶部轮播图
-(void)topADView{
    
    
    // 网络加载 --- 创建不带标题的图片轮播器
    cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:adView.frame delegate:self placeholderImage:[UIImage imageNamed:@""]];
    //轮播是否循环
    cycleScrollView.infiniteLoop = YES;
    //设置页码样式
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    cycleScrollView.autoScrollTimeInterval = 3.0; // 轮播时间间隔，默认1.0秒，可自定义
    cycleScrollView.pageDotColor = [UIColor whiteColor];
    cycleScrollView.currentPageDotColor = [UIColor redColor];
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

#pragma mark --- 底部按钮图
-(void)BtnView{
    
    NSArray *btnNames = [NSArray arrayWithObjects:@"参与活动", @"加入喵圈", @"喵问专家", @"改装心得", @"案例展示", @"改装百科",nil];
    NSArray *btnIamge = [NSArray arrayWithObjects:@"参与活动", @"加入喵圈", @"喵问专家", @"改装心得", @"案例展示", @"改装百科",nil];
    
    //定义总列数、每个九宫格的宽高
    NSInteger totalColumns=3;
    CGFloat appW=btnView.width/3;
    CGFloat appH=btnView.height/2;
    
    //根据arr1中数据数量来初始化并加载一个一个的UIVIew
    for (int index=0; index<6; index++) {
        //计算这个app在几行几列
        int row=index/totalColumns;
        int col=index%totalColumns;
        //创建UIView
        UIView *appView=[[UIView alloc]init];
        appView.backgroundColor = [UIColor redColor];
        //根据一些计算，确定不同UIView的位置
        appView.frame=CGRectMake(col*+appW, row*appH, appW, appH);
        appView.backgroundColor=[UIColor whiteColor];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, appView.width-10*WIDTH_NIT, appView.height-10*WIDTH_NIT)];
        btn.tag = index;
        btn.backgroundColor = BGButtonColor;
        btn.titleColor = OneButtonColor;
        btn.title = btnNames[index];
        [btn addTarget:self action:@selector(btnAct:)];
        [appView addSubview:btn];
        
        [btnView addSubview:appView];
    }

}

#pragma mark --- 顶部轮播点击实现
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    //轮播跳转
    NSLog(@"index%ld",(long)index);
    [self.delegate oneHeadViewSelect2go: index];
    
}


#pragma mark --- 底部按钮点击实现
-(void)btnAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    [self.delegate oneHeadViewSelect2go: tag+100];
    
}


@end
