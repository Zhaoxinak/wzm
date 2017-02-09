//
//  OneJoinPartyTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneJoinPartyModel.h"

//cell高度
#define OneJoinPartyCell_Height 120*WIDTH_NIT

@interface OneJoinPartyTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *status; //活动状态
    UILabel *addrName; //地址
    UILabel *timeName; //时间
    UILabel *priceName; //价格
    UILabel *typeName; //活动类型
}

@property (nonatomic, strong) OneJoinPartyModel *model; //模型

@end
