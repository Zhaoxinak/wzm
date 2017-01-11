//
//  PersonalInfoTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PersonalInfoTableViewCellDelegate <NSObject>

@optional
-(void)didPersonalHeadView2go;

@end

typedef NS_ENUM(NSUInteger, PersonalInfoCellMode) {
    ArrowCellMode,
    HeaderCellMode,
    UsualCellMode,
};


@interface PersonalInfoTableViewCell : UITableViewCell

@property(nonatomic, assign) id<PersonalInfoTableViewCellDelegate> delegate;

@property (nonatomic, assign) PersonalInfoCellMode infoCellMode;

@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *arrowImgView;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *vipImageView;

@property (nonatomic, assign) BOOL isHiddenBottomLine;


@end
