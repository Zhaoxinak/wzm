//
//  AllCommentsTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "AllCommentsTableViewCell.h"
#import "CommonHeader.h"

@implementation AllCommentsTableViewCell

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

- (void)setFrameModel:(AllCommentsFrameModel *)frameModel {
    
    _frameModel = frameModel;
    
    self.titleNameLabel.text = @"阿斯顿发送到发送到发送到发送到发抖上发呆发呆舒服的沙发多少发多少发多少分";
    
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    self.userId = @"111";
    
    self.userNameLabel.text = @"水冰月";
    
    self.levelLabel.text = @"12";
    
    [self.sexImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@""]];
    
    self.timeLabel.text = [self TimeStamp:@""];
    
    [self.commentBtn setTitle:@"11"];
    
  
    
    
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
    
    //    //实例化一个NSDateFormatter对象
    //    //1482235852000
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //
    //    //设定时间格式,这里可以设置成自己需要的格式
    //
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //
    //    //用[NSDate date]可以获取系统当前时间
    //
    //    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //
    //    //输出格式为：2010-10-27 10:22:13
    //
    //    NSLog(@"%@",currentDateStr);
    //
    //
    //    return currentDateStr;
    
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
    
    if ([self.delegate respondsToSelector:@selector(AllCommentsCellSelect2go:)]) {
        [self.delegate AllCommentsCellSelect2go:tag];
        NSLog(@"点击回复");
    }
    
}




@end
