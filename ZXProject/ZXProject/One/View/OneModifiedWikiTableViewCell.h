//
//  OneModifiedWikiTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/26.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneModifiedWikiModel.h"

//cell高度
#define OneModifiedWikiCell_Height 115*WIDTH_NIT

@interface OneModifiedWikiTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *subName; //内容
    UILabel *time; //时间
    
}

@property (nonatomic, strong) OneModifiedWikiModel *model; //模型


@end
