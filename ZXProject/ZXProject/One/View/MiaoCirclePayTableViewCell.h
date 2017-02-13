//
//  MiaoCirclePayTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MiaoCircleInfoModel.h"

@protocol MiaoCirclePayDelegate <NSObject>
#pragma mark -- 实现加入按钮点击
@optional
-(void)miaoCirclePaySelect2go:(NSInteger)tag;
-(void)miaoCirclePayMemberSelect2go:(NSInteger)tag;

@end

@interface MiaoCirclePayTableViewCell : UITableViewCell
{
    UIButton *payBtn; //打赏
    UILabel *paynum; //打赏人数
    
}

@property(nonatomic, assign) id<MiaoCirclePayDelegate> delegate;
@property (nonatomic, strong) MiaoCircleInfoModel *model; //模型

//计算cell高度
+ (CGFloat)caculateMiaoCirclePayCellHeightWithPerson:(MiaoCircleInfoModel *)model;


@end
