//
//  ContactsTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ContactsTableViewCell.h"
#import "CommonHeader.h"

@implementation ContactsTableViewCell

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
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 10*WIDTH_NIT, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    headImageView.image = [UIImage imageNamed:@"touxiang02"];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [self addSubview:headImageView];
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, 10*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = SubNameColor;
    userNameLabel.font = Font13;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 2*WIDTH_NIT, 10*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT)];
    levelLabel.layer.borderWidth = 0.4;
    levelLabel.layer.borderColor = MainGoldColor.CGColor;
    levelLabel.textColor = MainGoldColor;
    levelLabel.font = Font13;
    levelLabel.text = @"Lv15";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 5*WIDTH_NIT, 12*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT)];
    sexImageView.image = [UIImage imageNamed:@"nan"];
    [self addSubview:sexImageView];
    
    //时间
    actButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width-70*WIDTH_NIT, 5*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
    actButton.titleLabel.font = Font12;
    [actButton setTitle:@"私聊"];
    [actButton setTitleColor:MainGoldColor];
    actButton.layer.cornerRadius = 5;
    actButton.layer.borderWidth = 0.4;
    actButton.layer.borderColor = MainGoldColor.CGColor;
    [actButton addTarget:self action:@selector(buttonAct:)];
    [self addSubview:actButton];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(ContactsModel *)model{
    
    
    
    
}

#pragma mark --- 点击头像
- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}

#pragma mark --- 点击按钮
-(void)buttonAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(contactsCellSelect2go:)]) {
        [self.delegate contactsCellSelect2go:tag];
        NSLog(@"点击按钮");
    }

}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
