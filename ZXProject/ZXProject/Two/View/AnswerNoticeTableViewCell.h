//
//  AnswerNoticeTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnswerNoticeModel.h"

@protocol AnswerNoticeCellDelegate <NSObject>
#pragma mark -- 实现回复按钮点击
@optional
-(void)answerNoticeCellSelect2go:(NSInteger)tag;

@end

typedef void (^UserHeadClickBlock)(NSString *userId);


@interface AnswerNoticeTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UIImageView *sexImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UILabel *titleNameLabel;
@property (nonatomic, strong) UIView *detailView;

@property(nonatomic, assign) id<AnswerNoticeCellDelegate> delegate;
@property (nonatomic, strong) AnswerNoticeFrameModel *frameModel;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

- (void)setFrameModel:(AnswerNoticeFrameModel *)frameModel index:(NSInteger)index;


@end
