//
//  ModifiedWikiAuthorTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ModifiedWikiAuthorTableViewCell.h"
#import "CommonHeader.h"

@implementation ModifiedWikiAuthorTableViewCell

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
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, 60*WIDTH_NIT, 60*WIDTH_NIT)];
    headImageView.backgroundColor = [UIColor redColor];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [self addSubview:headImageView];
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = OneTextColor;
    userNameLabel.font = Font13;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    levelLabel.textColor = OneTextColor;
    levelLabel.font = Font13;
    levelLabel.text = @"12";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    sexImageView.backgroundColor = [UIColor redColor];
    [self addSubview:sexImageView];
    
    //地址
    address = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, userNameLabel.bottom+5*WIDTH_NIT, kScreen_Width-headImageView.right-5*WIDTH_NIT, 50*WIDTH_NIT)];
    address.numberOfLines = 2;
    address.font = Font13;
    address.textColor = OneTextColor;
    address.text = @"地址地址地址地址地址地址地址地址地址地址地址地址";
    [self addSubview:address];
    
    //简介
    intro = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, address.bottom+5*WIDTH_NIT, kScreen_Width-headImageView.right-5*WIDTH_NIT, 70*WIDTH_NIT)];
    intro.numberOfLines = 3;
    intro.font = Font13;
    intro.textColor = OneTextColor;
    intro.text = @"简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介简介";
    [self addSubview:intro];
    
    //关注
    followBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width - 50*WIDTH_NIT, 5*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    followBtn.layer.borderWidth = 1;
    followBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    followBtn.titleLabel.font = Font13;
    [followBtn setTitleColor:OneTextColor];
    [followBtn setTitle:@"关注"];
    [self addSubview:followBtn];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(ModifiedWikiInfoModel *)model{
    
    
    
    
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
