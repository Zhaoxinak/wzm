//
//  TwoMiaoCircleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "TwoMiaoCircleModel.h"

//喵圈类型
typedef NS_ENUM(NSUInteger, MiaoCircleType) {
    MyMiaoCircleMode, //我的喵圈
    OtherMiaoCircleMode, //其他喵圈
};

@protocol TwoMiaoCircleCellDelegate <NSObject>
#pragma mark -- 实现加入按钮点击
@optional
-(void)twoMiaoCircleCellSelect2go:(NSInteger)tag;

@end


//cell高度
#define TwoMiaoCircleCell_Height kScreen_Width/4

@interface TwoMiaoCircleTableViewCell : UITableViewCell{
    
    UIView *topLine; //顶部分割线
    UIImageView *avatarView; //头像
    UIButton *avatarBtn; //头像点击
    UILabel *name; //标题
    UILabel *subName; //内容
    UILabel *scanNum; //观看数量
    UIButton *joinBtn; //加入按钮
    
}

@property(nonatomic, assign) id<TwoMiaoCircleCellDelegate> delegate;
@property (nonatomic, strong) TwoMiaoCircleModel *model; //模型
@property (nonatomic, assign) MiaoCircleType miaoCircleType; //喵圈类型


@end
