//
//  CaseTitleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaseInfoModel.h"

@interface CaseTitleTableViewCell : UITableViewCell
{
    UILabel *name; //标题
    UILabel *timeName; //时间
    UILabel *subName; //标签1
    UILabel *lessName; //标签2
}

@property (nonatomic, strong) CaseInfoModel *model; //模型

//计算cell高度
+ (CGFloat)caculateCaseTitleCellHeightWithContent:(CaseInfoModel *)model;

@end
