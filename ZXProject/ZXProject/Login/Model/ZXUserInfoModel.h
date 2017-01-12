//
//  ZXUserInfoModel.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ZXUserInfoModel : JSONModel

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *invitCode;
@property (nonatomic, copy) NSString *idNo;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *iscertification;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, copy) NSString *nikename;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *nation;
@property (nonatomic, copy) NSString *birthdate;
@property (nonatomic, copy) NSString *birthplace;
@property (nonatomic, copy) NSString *weixin;
@property (nonatomic, copy) NSString *weixinname;
@property (nonatomic, copy) NSString *integral;
@property (nonatomic, copy) NSString *createtime;
@property (nonatomic, copy) NSString *certificationtime;
@property (nonatomic, copy) NSString *salt;
@property (nonatomic, copy) NSString *myinvitcode;
@property (nonatomic, copy) NSString *weibo;
@property (nonatomic, copy) NSString *weiboname;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *area;
@property (nonatomic, copy) NSString *follower;
@property (nonatomic, copy) NSString *myFollow;

@property (nonatomic, copy) NSString *mylikeCars; //喜好车型
@property (nonatomic, copy) NSString *mylikeModify; //改装兴趣
@property (nonatomic, copy) NSString *myIntro; //个人说明



@end
