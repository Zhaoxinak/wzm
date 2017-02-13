//
//  MiaoQuestionTitleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiaoQuestionInfoModel.h"

@protocol MiaoQuestionTitleDelegate <NSObject>
#pragma mark --- 取消按钮
@optional

-(void)miaoQuestionTitleCancel2go:(NSInteger)tag;


@end


@interface MiaoQuestionTitleTableViewCell : UITableViewCell
{
    
    UILabel *userNameLabel; //用户名
    UILabel *name; //标题
    UILabel *timeName; //时间
    UIButton *cancelBtn; //X按钮
    
}

@property (nonatomic, strong) MiaoQuestionInfoModel *model; //模型
@property(nonatomic, assign) id<MiaoQuestionTitleDelegate> delegate;

//计算cell高度
+ (CGFloat)caculateMiaoQuestionTitleCellHeightWithContent:(MiaoQuestionInfoModel *)model;

@end
