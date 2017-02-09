//
//  PartyInfoTitleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/14.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartyDetailInfoModel.h"

//cell高度
#define PartyInfoTitleCell_Height 100*WIDTH_NIT


@interface PartyInfoTitleTableViewCell : UITableViewCell{
    
    UILabel *name; //标题
    UILabel *time; //时间
    UIButton *scanBtn; //浏览者
    UIButton *zanBtn; //赞
    
}

@property (nonatomic, strong) PartyDetailInfoModel *model; //模型

@end
