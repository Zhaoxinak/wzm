//
//  RewardTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewardModel.h"

//cell高度
#define RewardCell_Height kScreen_Width/4


@interface RewardTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *time; //时间
    UILabel *money; //金钱
}

@property (nonatomic, strong) RewardModel *model; //模型

@end
