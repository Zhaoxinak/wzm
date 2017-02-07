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
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, 30*WIDTH_NIT, 30*WIDTH_NIT)];
    headImageView.backgroundColor = [UIColor redColor];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [self addSubview:headImageView];
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, 15*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = OneTextColor;
    userNameLabel.font = Font13;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 10*WIDTH_NIT, 15*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    levelLabel.textColor = OneTextColor;
    levelLabel.font = Font13;
    levelLabel.text = @"12";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 10*WIDTH_NIT, 15*WIDTH_NIT, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    sexImageView.backgroundColor = [UIColor redColor];
    [self addSubview:sexImageView];
    
    //时间
    actButton = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width-80*WIDTH_NIT, 10*WIDTH_NIT, 80*WIDTH_NIT, 30*WIDTH_NIT)];
    [actButton setTitle:@"私聊"];
    [actButton setTitleColor:OneTextColor];
    actButton.layer.cornerRadius = 5;
    actButton.layer.borderWidth = 0.3;
    actButton.layer.borderColor = OneTextColor.CGColor;
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
