//
//  ModifiedWikiPayTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModifiedWikiInfoModel.h"

@protocol ModifiedWikiPayDelegate <NSObject>
#pragma mark -- 实现加入按钮点击
@optional
-(void)modifiedWikiPaySelect2go:(NSInteger)tag;
-(void)modifiedWikiPayMemberSelect2go:(NSInteger)tag;

@end

@interface ModifiedWikiPayTableViewCell : UITableViewCell
{
    UIButton *payBtn; //打赏
    UILabel *paynum; //打赏人数
    
}

@property(nonatomic, assign) id<ModifiedWikiPayDelegate> delegate;
@property (nonatomic, strong) ModifiedWikiInfoModel *model; //模型

//计算cell高度
+ (CGFloat)caculateModifiedWikiPayCellHeightWithPerson:(ModifiedWikiInfoModel *)model;



@end
