//
//  CustomTabBar.h
//  ZXProject
//
//  Created by Mr.X on 2016/11/17.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBar;

#warning ZXTabBar继承自UITabBar，所以ZTTabBar的代理必须遵循UITabBar的代理协议！
@protocol ZXTabBarDelegate <UITabBarDelegate>

@optional

- (void)tabBarDidClickPlusButton:(CustomTabBar *)tabBar;

@end

@interface CustomTabBar : UITabBar

@property (nonatomic, weak) id<ZXTabBarDelegate> delegate;

@end
