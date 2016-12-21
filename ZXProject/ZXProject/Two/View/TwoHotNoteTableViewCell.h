//
//  TwoHotNoteTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/21.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "TwoMiaoCircleModel.h"
typedef void (^UserHeadClickBlock)(NSString *userId);

@interface TwoHotNoteTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property (nonatomic, assign) CGRect lastFrame;
@property (nonatomic, weak) UIImageView *imagView;
@property (nonatomic, strong) UIScrollView *bgScroll;
@property (nonatomic, assign) CGRect finalFrame;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, assign) NSInteger tapIndex;
@property (nonatomic, strong) NSMutableArray *xl_imageArray;
@property (nonatomic, assign) NSInteger showIndex;

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;

@property (nonatomic, strong) UILabel *titleNameLabel;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UIImageView *sexImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *commentBtn;

@property (nonatomic, strong) TwoHotNoteFrameModel *frameModel;
@property (nonatomic, copy) UserHeadClickBlock headClickBlock;



@end
