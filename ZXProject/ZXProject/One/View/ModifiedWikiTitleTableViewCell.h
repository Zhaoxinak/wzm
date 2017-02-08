//
//  ModifiedWikiTitleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifiedWikiInfoModel.h"

@interface ModifiedWikiTitleTableViewCell : UITableViewCell
{
 
    UILabel *name; //标题
    UILabel *timeName; //时间
    
}

@property (nonatomic, strong) ModifiedWikiInfoModel *model; //模型

//计算cell高度
+ (CGFloat)caculateModifiedWikiTitleCellHeightWithContent:(ModifiedWikiInfoModel *)model;


@end
