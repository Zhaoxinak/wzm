//
//  OneMiaoQuestionSquareModel.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/26.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHeader.h"
#import <JSONModel.h> //模型

@interface OneMiaoQuestionSquareModel : JSONModel

@property (copy, nonatomic) NSDictionary *comment;
@property (copy, nonatomic) NSDictionary *pics;


@end

@interface OneMiaoQuestionSquareFrameModel : NSObject
@property (nonatomic, assign) CGRect titleNameLabelFrame;  //标题
@property (nonatomic, assign) CGRect imageArrayFrame;  //图组
@property (nonatomic, assign) CGRect headImageViewFrame; //头像
@property (nonatomic, assign) CGRect userNameLabelFrame; //用户名
@property (nonatomic, assign) CGRect levelLabelFrame; //等级
@property (nonatomic, assign) CGRect sexImageViewFrame; //性别
@property (nonatomic, assign) CGRect timeLabelFrame; //时间
@property (nonatomic, assign) CGRect commentNumFrame; //评论数
@property (nonatomic, assign) CGRect commentBtnFrame; //评论
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) OneMiaoQuestionSquareModel *model;

@end
