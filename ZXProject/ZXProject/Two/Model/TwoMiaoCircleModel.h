//
//  TwoMiaoCircleModel.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonHeader.h"
#import <JSONModel.h> //模型


@interface TwoMiaoCircleModel : JSONModel
@property (copy, nonatomic) NSString *commentSize;
@property (copy, nonatomic) NSString *id;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *descriptions;
@property (copy, nonatomic) NSString *commentid;
@property (copy, nonatomic) NSString *pictype;
@property (copy, nonatomic) NSString *picCount;

@property (copy, nonatomic) NSString *extCommentSize;
@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *overallrating;


@property (copy, nonatomic) NSDictionary *comment;
@property (copy, nonatomic) NSString *mosqueid;
@property (copy, nonatomic) NSString *userid;
@property (copy, nonatomic) NSString *createtime;

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *introduce;
@property (copy, nonatomic) NSString *picture;

@property (copy, nonatomic) NSNumber *collectcount;

@property (copy, nonatomic) NSString *createtimeComment;

@property (copy, nonatomic) NSString *creatortype;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *creatorid;
@property (copy, nonatomic) NSString *ischecked;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *ismuslim;
@property (copy, nonatomic) NSString *latitude;
@property (copy, nonatomic) NSString *longitude;
@property (copy, nonatomic) NSString *province;

@property (copy, nonatomic) NSString *area;

@property (copy, nonatomic) NSString *creatorname;
@property (copy, nonatomic) NSString *userPic;
@property (copy, nonatomic) NSNumber *piccount;
@property (copy, nonatomic) NSString *iscollect;
@property (copy, nonatomic) NSString *facilities;

@property (copy, nonatomic) NSDictionary *pics;

@property (copy, nonatomic) NSString *opentime;
@property (copy, nonatomic) NSString *closetime;
@property (copy, nonatomic) NSString *capitaconsumption;
@property (copy, nonatomic) NSNumber *trustcount;
@property (copy, nonatomic) NSNumber *sharecount;
@property (copy, nonatomic) NSString *staff;
@property (copy, nonatomic) NSNumber *service;
@property (copy, nonatomic) NSNumber *taste;
@property (copy, nonatomic) NSNumber *environment;

@end


@interface TwoHotNoteFrameModel : NSObject
@property (nonatomic, assign) CGRect titleNameLabelFrame;  //标题
@property (nonatomic, assign) CGRect imageArrayFrame;  //图组
@property (nonatomic, assign) CGRect headImageViewFrame; //头像
@property (nonatomic, assign) CGRect userNameLabelFrame; //用户名
@property (nonatomic, assign) CGRect levelLabelFrame; //等级
@property (nonatomic, assign) CGRect sexImageViewFrame; //性别
@property (nonatomic, assign) CGRect timeLabelFrame; //时间
@property (nonatomic, assign) CGRect commentBtnFrame; //评论
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) TwoMiaoCircleModel *model;

@end
