//
//  MyPartyTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPartyModel.h"

typedef NS_ENUM(NSUInteger, MyPartyCellMode) {
    
    JoinPartyCellMode,  //参与者
    OwnerPartyCellMode, //发起者
    
};

@protocol MyPartyCellDelegate <NSObject>
@optional
#pragma mark -- 01分别为"编辑", @"参与者"
-(void)MyPartyCellSelect2go:(NSInteger)tag;

@end


//cell高度
#define MyPartyCell_Height 165*WIDTH_NIT


@interface MyPartyTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIView *bottomLine; //底部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *typeName; //类型
    UILabel *name; //标题
    UILabel *time; //时间
    UILabel *address; //地址
    UILabel *money; //参加费用
    
    UILabel *status; //状态
    UIButton *editBtn; //编辑
    UIButton *memberBtn; //参与者
    
    
}

@property(nonatomic, assign) id<MyPartyCellDelegate> delegate;
@property (nonatomic, strong) MyPartyModel *model; //模型
@property (nonatomic, assign) MyPartyCellMode mode; //类型

-(void)setModel:(MyPartyModel *)model setMode:(MyPartyCellMode)mode;

@end
