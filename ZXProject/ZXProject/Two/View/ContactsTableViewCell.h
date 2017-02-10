//
//  ContactsTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsModel.h"

typedef void (^UserHeadClickBlock)(NSString *userId);

//cell高度
#define ContactsCell_Height 40*WIDTH_NIT

@protocol ContactsCellDelegate <NSObject>
#pragma mark -- 实现按钮按钮点击
@optional
-(void)contactsCellSelect2go:(NSInteger)tag;

@end



@interface ContactsTableViewCell : UITableViewCell
{
    UIImageView *headImageView; //头像
    UILabel *userNameLabel; //用户名
    UILabel *levelLabel; //等级
    UIImageView *sexImageView; //性别～
    UIButton *actButton; //按钮
    
}

@property(nonatomic, assign) id<ContactsCellDelegate> delegate;
@property (nonatomic, strong) ContactsModel *model; //模型
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

@end
