//
//  PraiseTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PraiseTableViewCell.h"
#import "CommonHeader.h"

@implementation PraiseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSubViews];
    }
    return self;
}


- (void)initSubViews {
    
    
    self.headImageView = [UIImageView new];
    self.headImageView.clipsToBounds = YES;
    
    self.userNameLabel = [UILabel new];
    self.userNameLabel.textColor = SubNameColor;
    self.userNameLabel.font = Font13;
    
    self.levelLabel = [UILabel new];
    self.levelLabel.textAlignment = NSTextAlignmentCenter;
    self.levelLabel.layer.borderWidth = 0.6;
    self.levelLabel.layer.borderColor = MainGoldColor.CGColor;
    self.levelLabel.textColor = MainGoldColor;
    self.levelLabel.font = Font11;
    
    self.sexImageView = [UIImageView new];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.textColor = LittleNameColor;
    self.timeLabel.font = Font12;
    
    self.commentBtn = [UIButton new];
    self.commentBtn.layer.borderWidth = 0.6;
    self.commentBtn.layer.borderColor = MainGoldColor.CGColor;
    self.commentBtn.layer.cornerRadius = 2;
    self.commentBtn.titleLabel.font = Font13;
    [self.commentBtn setTitle:@"回复"];
    [self.commentBtn addTarget:self action:@selector(commentAct:)];
    [self.commentBtn setTitleColor:MainGoldColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    self.headImageView.userInteractionEnabled = YES;
    [self.headImageView addGestureRecognizer:tap];
    
    self.titleNameLabel = [UILabel new];
    self.titleNameLabel.textColor = SubNameColor;
    self.titleNameLabel.font = Font13;
    self.titleNameLabel.numberOfLines = 0;
    
    /******************************************/
    
    self.detailView = [UIView new];
    self.detailView.backgroundColor = BGColor;
    
    self.headImageView2 = [UIImageView new];
    self.headImageView2.backgroundColor = [UIColor redColor];
    
    self.userNameLabel2 = [UILabel new];
    self.userNameLabel2.textColor = SubNameColor;
    self.userNameLabel2.font = Font13;
    
    self.levelLabel2 = [UILabel new];
    self.levelLabel2.textAlignment = NSTextAlignmentCenter;
    self.levelLabel2.layer.borderWidth = 0.6;
    self.levelLabel2.layer.borderColor = MainGoldColor.CGColor;
    self.levelLabel2.textColor = MainGoldColor;
    self.levelLabel2.font = Font11;
    
    self.sexImageView2 = [UIImageView new];
    
    self.titleNameLabel2 = [UILabel new];
    self.titleNameLabel2.textColor = LessNameColor;
    self.titleNameLabel2.font = Font11;
    self.titleNameLabel2.numberOfLines = 2;
    
    [self.detailView addSubview:self.headImageView2];
    [self.detailView addSubview:self.userNameLabel2];
    [self.detailView addSubview:self.levelLabel2];
    [self.detailView addSubview:self.sexImageView2];
    [self.detailView addSubview:self.titleNameLabel2];
    
    
    /********************************************/
    
    
    self.line = [UIView new];
    self.line.backgroundColor = BGColor;
    
    
    
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.levelLabel];
    [self.contentView addSubview:self.sexImageView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.commentBtn];
    [self.contentView addSubview:self.titleNameLabel];
    [self.contentView addSubview:self.detailView];
    [self.contentView addSubview:self.line];

}

- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setFrameModel:(PraiseFrameModel *)frameModel index:(NSInteger)index{
    
    _frameModel = frameModel;
    
    self.titleNameLabel.text = @"赞了这篇文章";
    
    //    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    self.headImageView.image = [UIImage imageNamed:@"touxiang02"];
    
    self.userId = @"111";
    
    self.userNameLabel.text = @"水冰月";
    
    self.levelLabel.text = @"Lv15";
    
    //    [self.sexImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    self.sexImageView.image = [UIImage imageNamed:@"nan"];
    
    self.timeLabel.text = [self TimeStamp:@""];
    
    [self.commentBtn setTitle:@"回复"];
    self.commentBtn.tag = index;
    
    
    
    self.headImageView.frame = _frameModel.headImageViewFrame;
    self.headImageView.layer.cornerRadius = _frameModel.headImageViewFrame.size.width / 2;
    self.userNameLabel.frame = _frameModel.userNameLabelFrame;
    self.levelLabel.frame = _frameModel.levelLabelFrame;
    self.sexImageView.frame = _frameModel.sexImageViewFrame;
    self.timeLabel.frame = _frameModel.timeLabelFrame;
    self.commentBtn.frame = _frameModel.commentBtnFrame;
    self.titleNameLabel.frame = _frameModel.titleNameLabelFrame;
    
    /********************************************/
    self.detailView.frame = _frameModel.detailViewFrame;
    
    
    //    [self.headImageView2 sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    
    self.userNameLabel2.text = @"水冰月";
    
    self.levelLabel2.text = @"Lv15";
    
    //    [self.sexImageView2 sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    self.sexImageView2.image = [UIImage imageNamed:@"nan"];
    
    self.titleNameLabel2.text = @"阿斯顿发送到发送到发送到发送到发抖上发呆发呆舒服的沙发多少发多少发多少分";
    
    
    
    
    
    
    //图片
    self.headImageView2.frame = CGRectMake(0, 0, self.detailView.height, self.detailView.height);
    
    //用户名
    self.userNameLabel2.frame = CGRectMake(CGRectGetMaxX(self.headImageView2.frame) + 5*WIDTH_NIT, 5*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT);
    
    //等级
    self.levelLabel2.frame = CGRectMake(CGRectGetMaxX(self.userNameLabel2.frame) + 2*WIDTH_NIT, 5*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT);
    
    //性别
    self.sexImageView2.frame = CGRectMake(CGRectGetMaxX(self.levelLabel2.frame) + 5*WIDTH_NIT, 7*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT);
    
    //标题
    self.titleNameLabel2.frame = CGRectMake(CGRectGetMaxX(self.headImageView2.frame) + 5*WIDTH_NIT, self.userNameLabel2.bottom + 5*WIDTH_NIT, self.detailView.width - self.headImageView2.width - 15*WIDTH_NIT, 40*WIDTH_NIT);
    
    
    /********************************************/
    
    
    self.line.frame = CGRectMake(0, self.detailView.bottom + 20*WIDTH_NIT, kScreen_Width, 10*WIDTH_NIT);
    
    
}




- (NSString *)TimeStamp:(NSString *)strTime {
    
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[strTime doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}



#pragma mark --- 回复按钮点击实现
-(void)commentAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(praiseCellSelect2go:)]) {
        [self.delegate praiseCellSelect2go:tag];
        NSLog(@"点击回复");
    }
    
}


@end
