//
//  CollectionTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/24.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionModel.h"

//cell高度
#define CollectionCell_Height 90*WIDTH_NIT


@interface CollectionTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *timeName; //时间
    UILabel *typeName; //活动类型
}

@property (nonatomic, strong) CollectionModel *model; //模型

@end
