//
//  OneModifiedUnderstandingTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/19.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneModifiedUnderstandingModel.h"
typedef void (^UserHeadClickBlock)(NSString *userId);

//cell高度
#define OneModifiedUnderstandCell_Height kScreen_Width/3

@interface OneModifiedUnderstandingTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UIImageView *headImageView; //头像
    UILabel *userNameLabel; //用户名
    UILabel *levelLabel; //等级
    UIImageView *sexImageView; //性别～
    UILabel *name; //标题
    UIButton *scanBtn; //浏览者
    UIButton *zanBtn; //赞
    UILabel *timeName; //时间

}

@property (nonatomic, strong) OneModifiedUnderstandingModel *model; //模型
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

@end
