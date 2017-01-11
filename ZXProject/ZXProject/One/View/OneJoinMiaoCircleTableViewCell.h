//
//  OneJoinMiaoCircleTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneJoinMiaoCircleModel.h"

@protocol OneJoinMiaoCircleCellDelegate <NSObject>

#pragma mark -- 实现加入按钮点击
@optional
-(void)oneJoinMiaoCircleCellSelect2go:(NSInteger)tag;

@end

//cell高度
#define OneJoinMiaoCircleCell_Height kScreen_Width/4

@interface OneJoinMiaoCircleTableViewCell : UITableViewCell{
    
    UIView *topLine; //顶部分割线
    UIImageView *avatarView; //头像
    UIButton *avatarBtn; //头像点击
    UILabel *name; //标题
    UILabel *subName; //内容
    UILabel *allowName; //能加入的种类
    UIButton *joinBtn; //加入按钮
  
}

@property(nonatomic, assign) id<OneJoinMiaoCircleCellDelegate> delegate;
@property (nonatomic, strong) OneJoinMiaoCircleModel *model; //模型

@end
