//
//  MiaoCircleTitleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiaoCircleInfoModel.h"

@protocol MiaoCircleTitleDelegate <NSObject>
#pragma mark --- 取消按钮
@optional

-(void)miaoCircleTitleCancel2go:(NSInteger)tag;


@end

typedef void (^UserHeadClickBlock)(NSString *userId);

@interface MiaoCircleTitleTableViewCell : UITableViewCell
{
    
    UIImageView *headImageView; //头像
    UIImageView *vipImageView;  //Vip
    UILabel *userNameLabel; //用户名
    UILabel *ownerlabel; //楼主
    UILabel *levelLabel; //等级
    UIImageView *sexImageView; //性别～
    
    UILabel *name; //标题
    UILabel *timeName; //时间
    UIButton *cancelBtn; //X按钮
    
}

@property(nonatomic, assign) id<MiaoCircleTitleDelegate> delegate;
@property (nonatomic, strong) MiaoCircleInfoModel *model; //模型
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

//计算cell高度
+ (CGFloat)caculateMiaoCircleTitleCellHeightWithContent:(MiaoCircleInfoModel *)model;


@end
