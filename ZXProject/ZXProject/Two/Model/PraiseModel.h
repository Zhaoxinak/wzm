//
//  PraiseModel.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import <UIKit/UIKit.h>

@interface PraiseModel : JSONModel

@end

@interface PraiseFrameModel : NSObject

@property (nonatomic, assign) CGRect headImageViewFrame; //头像
@property (nonatomic, assign) CGRect userNameLabelFrame; //用户名
@property (nonatomic, assign) CGRect levelLabelFrame; //等级
@property (nonatomic, assign) CGRect sexImageViewFrame; //性别
@property (nonatomic, assign) CGRect timeLabelFrame; //时间
@property (nonatomic, assign) CGRect commentBtnFrame; //回复
@property (nonatomic, assign) CGRect titleNameLabelFrame;  //标题
@property (nonatomic, assign) CGRect detailViewFrame;  //详情

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) PraiseModel *model;

@end
