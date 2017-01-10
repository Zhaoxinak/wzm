//
//  ZXSelectTableView.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/10.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface ZXSelectTableViewItem : NSObject

@property (nonatomic, strong) UIImage  *image;// 图标
@property (nonatomic, copy  ) NSString *title;// 标题

@property (nonatomic, strong) UIColor  *titleColor;// 颜色
@property (nonatomic, strong) UIFont   *titleFont;// 字体大小

+ (instancetype)selectTableViewItemWithImage:(UIImage *)image title:(NSString *)title;

@end

@interface ZXSelectTableView : NSObject

@property (nonatomic, strong) NSArray *items;// 菜单数据


//@property (nonatomic, strong) UIColor *separatorColor;// 分割线颜色 #e8e8e8
@property (nonatomic, assign) CGFloat rowHeight;// 菜单条目高度

@property (nonatomic, copy) void(^didSelectMenuItem)(ZXSelectTableView *menu, ZXSelectTableViewItem *item);// 点击条目

- (instancetype)initWithOrigin:(CGPoint)origin width:(CGFloat)width;
- (void)show;
- (void)dismiss;

@end
