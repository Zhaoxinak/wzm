//
//  SystemNoticeTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemNoticeModel.h"

//cell高度
#define SystemNoticeCell_Height kScreen_Width/4

@interface SystemNoticeTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UILabel *name; //标题
    UILabel *subName; //内容
    UILabel *time; //时间
    
}

@property (nonatomic, strong) SystemNoticeModel *model; //模型

@end
