//
//  CasePayTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaseInfoModel.h"

@protocol CasePayDelegate <NSObject>
#pragma mark -- 实现加入按钮点击
@optional
-(void)casePaySelect2go:(NSInteger)tag;
-(void)casePayMemberSelect2go:(NSInteger)tag;

@end

@interface CasePayTableViewCell : UITableViewCell
{
    UIButton *payBtn; //打赏
    UILabel *paynum; //打赏人数
    
}

@property(nonatomic, assign) id<CasePayDelegate> delegate;
@property (nonatomic, strong) CaseInfoModel *model; //模型

//计算cell高度
+ (CGFloat)caculateCasePayCellHeightWithPerson:(CaseInfoModel *)model;


@end
