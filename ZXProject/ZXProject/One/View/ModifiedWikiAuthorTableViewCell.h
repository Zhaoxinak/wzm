//
//  ModifiedWikiAuthorTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifiedWikiInfoModel.h"

typedef void (^UserHeadClickBlock)(NSString *userId);

//cell高度
#define ModifiedWikiAuthorCell_Height kScreen_Width/2

@interface ModifiedWikiAuthorTableViewCell : UITableViewCell
{
    
    UIImageView *headImageView; //头像
    UILabel *userNameLabel; //用户名
    UILabel *levelLabel; //等级
    UIImageView *sexImageView; //性别～
    UILabel *address; //标题
    UILabel *intro; //标题
    UIButton *followBtn; //关注
    
}

@property (nonatomic, strong) ModifiedWikiInfoModel *model; //模型
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

@end
