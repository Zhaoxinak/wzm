//
//  UnderstandingTitleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/18.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnderstandingInfoModel.h"


@interface UnderstandingTitleTableViewCell : UITableViewCell
{
    
    UILabel *userNameLabel; //用户名
    UILabel *name; //标题
    UILabel *timeName; //时间
    
}

@property (nonatomic, strong) UnderstandingInfoModel *model; //模型

//计算cell高度
+ (CGFloat)caculateUnderstandingTitleCellHeightWithContent:(UnderstandingInfoModel *)model;

@end
