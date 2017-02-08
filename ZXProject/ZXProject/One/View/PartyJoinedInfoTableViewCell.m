//
//  PartyJoinedInfoTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/16.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PartyJoinedInfoTableViewCell.h"
#import "CommonHeader.h"

@implementation PartyJoinedInfoTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setupView];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupView{
    

    //头像
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(8*WIDTH_NIT, 14*WIDTH_NIT, 32*WIDTH_NIT, 32*WIDTH_NIT)];
    headImageView.image = [UIImage imageNamed:@"touxiang02"];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [self addSubview:headImageView];
    
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    
    
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, 19*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = SubNameColor;
    userNameLabel.font = Font13;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 2*WIDTH_NIT, 19*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT)];
    levelLabel.layer.borderWidth = 0.3;
    levelLabel.layer.borderColor = MainGoldColor.CGColor;
    levelLabel.textColor = MainGoldColor;
    levelLabel.font = Font13;
    levelLabel.text = @"Lv15";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 5*WIDTH_NIT, 21*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT)];
    sexImageView.image = [UIImage imageNamed:@"nan"];
    [self addSubview:sexImageView];

    
    //时间
    time = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width-90*WIDTH_NIT, 20*WIDTH_NIT, 80*WIDTH_NIT, 20*WIDTH_NIT)];
    time.font = Font9;
    time.textColor = LessNameColor;
    time.textAlignment = NSTextAlignmentRight;
    time.text = @"2017.1.1";
    [self addSubview:time];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(PartyDetailInfoModel *)model{
    
    
    
    
}

//点击头像
- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
