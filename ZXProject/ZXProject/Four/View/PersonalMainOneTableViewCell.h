//
//  PersonalMainOneTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/22.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalMainModel.h"

typedef NS_ENUM(NSUInteger, PersonalMainCellMode) {
    
    UsualCellMode,  //通常
    FollowCarsCellMode, //关注车型
    ModifiedCarsCellMode, //改装车型
    
};


@interface PersonalMainOneTableViewCell : UITableViewCell

@property (nonatomic, assign) PersonalMainCellMode mainCellMode;
@property (nonatomic, strong) PersonalMainModel *model;


@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *picView;

- (void)setMainCellMode:(PersonalMainCellMode)mainCellMode model:(PersonalMainModel *)model;

//计算cell高度
+ (CGFloat)caculatePersonalMainCellHeightWithTitle:(NSString *)title SubTitle:(NSString *)subTitle         PictureArrayNum:(NSInteger)arrayNum MainCellMode:(PersonalMainCellMode)mainCellMode;

@end
