//
//  TwoNoticeTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoNoticeModel.h"

typedef void (^UserHeadClickBlock)(NSString *userId);

//cell高度
#define TwoNoticeCell_Height 60*WIDTH_NIT


@interface TwoNoticeTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIImageView *headImageView; //头像
    UILabel *userNameLabel; //用户名
    UILabel *name; //标题
    UILabel *timeName; //时间
    
}

@property (nonatomic, strong) TwoNoticeModel *model; //模型
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

@end
