//
//  AnswerNoticeTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "AnswerNoticeTableViewCell.h"
#import "CommonHeader.h"

@implementation AnswerNoticeTableViewCell

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
    self.headImageView.backgroundColor = [UIColor redColor];
    
    self.userNameLabel = [UILabel new];
    self.userNameLabel.textColor = OneTextColor;
    self.userNameLabel.font = ThreeFont;
    
    self.levelLabel = [UILabel new];
    self.levelLabel.textColor = OneTextColor;
    self.levelLabel.font = ThreeFont;
    
    self.sexImageView = [UIImageView new];
    self.sexImageView.backgroundColor = [UIColor redColor];
    
    
    self.timeLabel = [UILabel new];
    self.timeLabel.textColor = OneTextColor;
    self.timeLabel.font = ThreeFont;
    
    self.commentBtn = [UIButton new];
    [self.commentBtn setTitle:@"回复"];
    [self.commentBtn addTarget:self action:@selector(commentAct:)];
    [self.commentBtn setTitleColor:OneTextColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    self.headImageView.userInteractionEnabled = YES;
    [self.headImageView addGestureRecognizer:tap];
    
    self.titleNameLabel = [UILabel new];
    self.titleNameLabel.textColor = OneTextColor;
    self.titleNameLabel.font = ThreeFont;
    self.titleNameLabel.numberOfLines = 0;
    
    self.detailView = [UIView new];
    self.detailView.backgroundColor = [UIColor redColor];
    
    
    
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.levelLabel];
    [self.contentView addSubview:self.sexImageView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.commentBtn];
    [self.contentView addSubview:self.titleNameLabel];
    [self.contentView addSubview:self.detailView];
}

- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setFrameModel:(AnswerNoticeFrameModel *)frameModel index:(NSInteger)index {
    
    _frameModel = frameModel;
    
    self.titleNameLabel.text = @"这是路人甲的回答，只显示15个字";
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    self.userId = @"111";
    
    self.userNameLabel.text = @"水冰月";
    
    self.levelLabel.text = @"12";
    
    [self.sexImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    
    self.timeLabel.text = [self TimeStamp:@""];
    
    [self.commentBtn setTitle:@"查看"];
    self.commentBtn.tag = index;
    
    
    
    self.headImageView.frame = _frameModel.headImageViewFrame;
    self.userNameLabel.frame = _frameModel.userNameLabelFrame;
    self.levelLabel.frame = _frameModel.levelLabelFrame;
    self.sexImageView.frame = _frameModel.sexImageViewFrame;
    self.timeLabel.frame = _frameModel.timeLabelFrame;
    self.commentBtn.frame = _frameModel.commentBtnFrame;
    self.titleNameLabel.frame = _frameModel.titleNameLabelFrame;
    self.detailView.frame = _frameModel.detailViewFrame;
    
    self.headImageView.layer.cornerRadius = _frameModel.headImageViewFrame.size.width / 2;
    
    
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



#pragma mark --- 查看按钮点击实现
-(void)commentAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(answerNoticeCellSelect2go:)]) {
        [self.delegate answerNoticeCellSelect2go:tag];
        NSLog(@"点击回复");
    }
    
}



@end
