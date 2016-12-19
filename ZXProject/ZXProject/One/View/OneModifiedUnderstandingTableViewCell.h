//
//  OneModifiedUnderstandingTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/19.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "OneModifiedUnderstandingModel.h"

//cell高度
#define OneModifiedUnderstandCell_Height kScreen_Width/3

@interface OneModifiedUnderstandingTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *addrName; //地址
    UILabel *timeName; //时间
    UILabel *priceName; //价格
    UILabel *typeName; //活动类型
}

@property (nonatomic, strong) OneModifiedUnderstandingModel *model; //模型

@end
