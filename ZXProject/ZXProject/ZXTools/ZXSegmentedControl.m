//
//  ZXSegmentedControl.m
//  TGS
//
//  Created by 重庆青檬信息 on 16/8/31.
//  Copyright © 2016年 重庆青檬信息. All rights reserved.
//

#import "ZXSegmentedControl.h"

@implementation ZXSegmentedControl


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}


//第一次使用这个类的时候调用1次
+ (void)initialize
{
 
    UISegmentedControl *appearance = [UISegmentedControl appearance];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = OneColor;
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    dic[NSShadowAttributeName] = [[NSShadow alloc] init];
   
    [appearance setTitleTextAttributes:dic forState:UIControlStateSelected];
    
    NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
    dic1[NSForegroundColorAttributeName] = [UIColor blackColor];
    dic1[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    dic1[NSShadowAttributeName] = [[NSShadow alloc] init];
    
    [appearance setTitleTextAttributes:dic1 forState:UIControlStateNormal];
    
    
    appearance.tintColor = [UIColor clearColor];
    
    //被选中的背景图片转换
    UIView* statusBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, appearance.frame.size.width, appearance.frame.size.height)];
    statusBackView.backgroundColor = [UIColor whiteColor];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(5, appearance.frame.size.height-1, appearance.frame.size.width-10, 1)];
    line.backgroundColor = OneColor;
    [statusBackView addSubview:line];
    
    UIImage *backImage = [[UIImage alloc]init];
    backImage = [self convertViewToImage:statusBackView];
    
   
    
}



- (void)drawRect:(CGRect)rect {

}


//图片合成
+(UIImage*)convertViewToImage:(UIView*)v{
    
    UIGraphicsBeginImageContext(v.bounds.size);
    
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}


@end
