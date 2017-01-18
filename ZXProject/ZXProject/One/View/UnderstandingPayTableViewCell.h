//
//  UnderstandingPayTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/18.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnderstandingInfoModel.h"

@protocol UnderstandingPayDelegate <NSObject>
#pragma mark -- 实现加入按钮点击
@optional
-(void)understandingPaySelect2go:(NSInteger)tag;
-(void)understandingPayMemberSelect2go:(NSInteger)tag;

@end

@interface UnderstandingPayTableViewCell : UITableViewCell
{
    
    
    UIButton *payBtn; //打赏
    UILabel *paynum; //打赏人数
 
    
}

@property(nonatomic, assign) id<UnderstandingPayDelegate> delegate;
@property (nonatomic, strong) UnderstandingInfoModel *model; //模型

//计算cell高度
+ (CGFloat)caculateUnderstandingPayCellHeightWithPerson:(UnderstandingInfoModel *)model;


@end
