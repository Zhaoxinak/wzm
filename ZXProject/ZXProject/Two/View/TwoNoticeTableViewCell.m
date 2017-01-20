//
//  TwoNoticeTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "TwoNoticeTableViewCell.h"
#import "CommonHeader.h"

@implementation TwoNoticeTableViewCell

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
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, 30*WIDTH_NIT, 30*WIDTH_NIT)];
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
    userNameLabel.font = ThreeFont;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
  
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, userNameLabel.bottom+5*WIDTH_NIT, kScreen_Width/3*2, 20*WIDTH_NIT)];
    name.font = ThreeFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width - 70*WIDTH_NIT, 5*WIDTH_NIT, 60*WIDTH_NIT, 20*WIDTH_NIT)];
    timeName.font = FiveFont;
    timeName.textColor = OneTextColor;
    timeName.text = @"时间时间时间";
    [self addSubview:timeName];
    
}

#pragma mark --- 对接数据
-(void)setModel:(TwoNoticeModel *)model{
    
    
    
    
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
