//
//  FourDailyManagementTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FourDailyManagementModel.h"


@protocol FourDailyManagementCellDelegate <NSObject>
#pragma mark -- 012345分别为"收藏", @"认证", @"活动", @"问题", @"帖子", @"心得"
@optional
-(void)fourDailyManagementCellSelect2go:(NSInteger)tag;

@end



//cell高度
#define FourDailyManagementCell_Height kScreen_Width/2

@interface FourDailyManagementTableViewCell : UITableViewCell

@property(nonatomic, assign) id<FourDailyManagementCellDelegate> delegate;
@property (nonatomic, strong) FourDailyManagementModel *model; //模型

@end
