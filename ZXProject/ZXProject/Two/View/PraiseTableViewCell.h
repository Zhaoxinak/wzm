//
//  PraiseTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PraiseModel.h"

@protocol PraiseCellDelegate <NSObject>
#pragma mark -- 实现回复按钮点击
@optional
-(void)praiseCellSelect2go:(NSInteger)tag;

@end

typedef void (^UserHeadClickBlock)(NSString *userId);

@interface PraiseTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UIImageView *sexImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UILabel *titleNameLabel;
@property (nonatomic, strong) UIView *detailView;

@property(nonatomic, assign) id<PraiseCellDelegate> delegate;
@property (nonatomic, strong) PraiseFrameModel *frameModel;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

- (void)setFrameModel:(PraiseFrameModel *)frameModel index:(NSInteger)index;
@end
