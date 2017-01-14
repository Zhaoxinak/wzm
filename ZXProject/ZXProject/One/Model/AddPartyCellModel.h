//
//  AddPartyCellModel.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger , AddPartyCellType) {
    AddPartyCellTypeTextField,
    AddPartyCellTypePhone,
    AddPartyCellTypeTime,
    AddPartyCellTypeMap,
    AddPartyCellTypeStyle,
    AddPartyCellTypeCost,
    AddPartyCellTypeNumLimit
    
};


@interface AddPartyCellModel : NSObject

//显示星星
@property (nonatomic, assign) BOOL showStar;
//底部分割线为屏幕宽度
@property (nonatomic, assign) BOOL fullScreenSeperateLine;
//显示右侧下拉箭头
@property (nonatomic, assign) BOOL showDownArrow;
//占位文字对齐方式     YES  左对齐    NO 右对齐
@property (nonatomic, assign) BOOL placeHolderLeft;
//标题文字
@property (nonatomic, strong) NSString *titleText;
//详情文字
@property (nonatomic, strong) NSString *detailText;
//占位文字
@property (nonatomic, strong) NSString *placeHolderText;
//点击操作类型
@property (nonatomic, assign) AddPartyCellType selectType;

@property (nonatomic, copy) NSString *detailIntroText;//详情描述

@end
