//
//  AllCommentsTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllCommentsModel.h"

@protocol AllCommentsCellDelegate <NSObject>
#pragma mark -- 实现回复按钮点击
@optional
-(void)allCommentsCellSelect2go:(NSInteger)tag;

@end

typedef void (^UserHeadClickBlock)(NSString *userId);

@interface AllCommentsTableViewCell : UITableViewCell


@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UIImageView *sexImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UILabel *titleNameLabel;

 /******************************************/
@property (nonatomic, strong) UIView *detailView;
@property (nonatomic, strong) UIImageView *headImageView2;
@property (nonatomic, strong) UILabel *userNameLabel2;
@property (nonatomic, strong) UILabel *levelLabel2;
@property (nonatomic, strong) UIImageView *sexImageView2;
@property (nonatomic, strong) UILabel *titleNameLabel2;
 /******************************************/

@property (nonatomic, strong) UIView *line;

@property(nonatomic, assign) id<AllCommentsCellDelegate> delegate;
@property (nonatomic, strong) AllCommentsFrameModel *frameModel;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;

- (void)setFrameModel:(AllCommentsFrameModel *)frameModel index:(NSInteger)index;
    
@end
