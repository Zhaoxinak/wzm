//
//  PartyJoinedInfoTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/16.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartyDetailInfoModel.h"

typedef void (^UserHeadClickBlock)(NSString *userId);

//cell高度
#define PartyJoinedInfoCell_Height 50*WIDTH_NIT


@interface PartyJoinedInfoTableViewCell : UITableViewCell
{
    UIImageView *headImageView; //头像
    UILabel *userNameLabel; //用户名
    UILabel *levelLabel; //等级
    UIImageView *sexImageView; //性别～
    UILabel *time; //时间
    
    
}

@property (nonatomic, strong) PartyDetailInfoModel *model; //模型
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

@end
