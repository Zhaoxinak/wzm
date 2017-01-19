//
//  AddUnderstandingDataModel.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddUnderstandingDataModel : NSObject

//餐厅名字
@property (nonatomic, strong) NSString *name;
//详细地址
@property (nonatomic, strong) NSString *address;
//省
@property (nonatomic, strong) NSString *province;
//市
@property (nonatomic, strong) NSString *city;
//区
@property (nonatomic, strong) NSString *area;
//餐厅类型
@property (nonatomic, strong) NSString *type;
//创建者类型
@property (nonatomic, strong) NSString *creatortype;
//用户id
@property (nonatomic, strong) NSString *creatorid;
//经度
@property (nonatomic, strong) NSString *longitude;
//纬度
@property (nonatomic, strong) NSString *latitude;
//图片json
@property (nonatomic, strong) NSString *restaurantPic;
//电话
@property (nonatomic, strong) NSString *phone;
//报名时间
@property (nonatomic, strong) NSString *joinTime;
//活动时间
@property (nonatomic, strong) NSString *partyTime;
//简介
@property (nonatomic, strong) NSString *introduction;
//费用
@property (nonatomic, strong) NSString *cost;

@end
