//
//  OneModifiedEncyclopediaTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/12.
//  Copyright © 2016年 Mr.X. All rights reserved.
//
//改装百科

#import <UIKit/UIKit.h>
#import "HomePageModel.h"

//cell高度
#define OneModifiedCell_Height 158*WIDTH_NIT


@interface OneModifiedEncyclopediaTableViewCell : UITableViewCell{
    
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *subName; //内容
    UIButton *scanBtn; //浏览者
    UIButton *zanBtn; //赞
    
}

@property (nonatomic, strong) HomePageModel *model; //模型

@end
