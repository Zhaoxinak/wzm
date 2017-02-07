//
//  OneCasesShowTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/26.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneCasesShowModel.h"

//cell高度
#define OneCasesShowCell_Height 120*WIDTH_NIT

@interface OneCasesShowTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UIButton *scanBtn; //浏览者
    UIButton *zanBtn; //赞
    UILabel *subName; //标签1
    UILabel *lessName; //标签2
}

@property (nonatomic, strong) OneCasesShowModel *model; //模型

@end
