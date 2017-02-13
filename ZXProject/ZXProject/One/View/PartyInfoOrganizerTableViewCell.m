//
//  PartyInfoOrganizerTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/14.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PartyInfoOrganizerTableViewCell.h"
#import "CommonHeader.h"

@implementation PartyInfoOrganizerTableViewCell

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
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 30*WIDTH_NIT, 62*WIDTH_NIT, 62*WIDTH_NIT)];
    headImageView.image = [UIImage imageNamed:@"touxiang02"];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [self addSubview:headImageView];
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 15*WIDTH_NIT, 35*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = NameColor;
    userNameLabel.font = Font14;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 2*WIDTH_NIT, 35*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT)];
    levelLabel.textAlignment = NSTextAlignmentCenter;
    levelLabel.layer.borderWidth = 0.6;
    levelLabel.layer.borderColor = MainGoldColor.CGColor;
    levelLabel.textColor = MainGoldColor;
    levelLabel.font = Font13;
    levelLabel.text = @"Lv15";
    [self addSubview:levelLabel];
    
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 5*WIDTH_NIT, 37*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT)];
    sexImageView.image = [UIImage imageNamed:@"nan"];
    [self addSubview:sexImageView];
    
    //地址
    address = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 15*WIDTH_NIT, userNameLabel.bottom+2*WIDTH_NIT, kScreen_Width-headImageView.right-30*WIDTH_NIT, 30*WIDTH_NIT)];
    address.numberOfLines = 2;
    address.font = Font12;
    address.textColor = LightNameColor;
    address.text = @"地址地址地址地址地址地址地址地址地址地址地址地址";
    [self addSubview:address];
    
    //简介
    intro = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 15*WIDTH_NIT, address.bottom+2*WIDTH_NIT, kScreen_Width-headImageView.right-30*WIDTH_NIT, 50*WIDTH_NIT)];
    intro.numberOfLines = 3;
    intro.font = Font12;
    intro.textColor = LightNameColor;
    intro.text = @"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介";
    [self addSubview:intro];

    //主办方
    organizer = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width - 70*WIDTH_NIT, 20*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
    organizer.layer.cornerRadius = 5;
    organizer.layer.borderWidth = 0.5;
    organizer.layer.borderColor = MainGoldColor.CGColor;
    organizer.textAlignment = NSTextAlignmentCenter;
    organizer.font = Font12;
    organizer.textColor = MainGoldColor;
    organizer.text = @"主办方";
    [self addSubview:organizer];
    
    
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
