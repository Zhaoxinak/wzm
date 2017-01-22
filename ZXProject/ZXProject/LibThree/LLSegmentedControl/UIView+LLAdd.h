//
//  UIView+LLAdd.h
//  LLSegmentedControl
//
//  Created by 雷亮 on 16/8/11.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LLAdd)

@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;

@end

@interface UIView (LLViewController)

@property (nonatomic, weak, readonly) UIViewController *viewController;

@end
