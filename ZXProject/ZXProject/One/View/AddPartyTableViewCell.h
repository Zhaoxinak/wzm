//
//  AddPartyTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddPartyCellModel;
@interface AddPartyTableViewCell : UITableViewCell

//星星图片
@property (nonatomic, strong) UIImageView *starImage;
//标题label
@property (nonatomic, strong) UILabel *titleLabel;
//详情输入框
@property (nonatomic, strong) UITextField *detailText;
//右侧箭头
@property (nonatomic, strong) UIImageView *downArrow;
//分割线
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) AddPartyCellModel *cellModel;

- (void)configDetailTextByModel:(AddPartyCellModel *)cellModel;

@end
