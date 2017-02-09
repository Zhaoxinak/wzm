//
//  PartyJoinedMemberTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/16.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartyDetailInfoModel.h"

//cell高度
#define PartyJoinedMemberCell_Height 90*WIDTH_NIT

@protocol PartyJoinedMemberCellDelegate <NSObject>

#pragma mark -- 查看参与者头像按钮点击
@optional
-(void)partyJoinedMemberCellSelect2go:(NSInteger)tag;

@end

@interface PartyJoinedMemberTableViewCell : UITableViewCell

@property(nonatomic, assign) id<PartyJoinedMemberCellDelegate> delegate;
@property (nonatomic, strong) PartyDetailInfoModel *model; //模型

@end
