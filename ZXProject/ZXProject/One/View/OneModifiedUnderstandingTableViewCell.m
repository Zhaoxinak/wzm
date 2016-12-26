//
//  OneModifiedUnderstandingTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/19.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneModifiedUnderstandingTableViewCell.h"

@implementation OneModifiedUnderstandingTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setView];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setView{
    
    //顶部分割线
    topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 1)];
    topLine.backgroundColor = BGColor;
    [self addSubview:topLine];
    
    //图片
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-OneModifiedUnderstandCell_Height, 5*WIDTH_NIT, OneModifiedUnderstandCell_Height-10*WIDTH_NIT, OneModifiedUnderstandCell_Height-10*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    
    
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
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    levelLabel.textColor = OneTextColor;
    levelLabel.font = ThreeFont;
    levelLabel.text = @"12";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    sexImageView.backgroundColor = [UIColor redColor];
    [self addSubview:sexImageView];
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, headImageView.bottom+5*WIDTH_NIT, kScreen_Width-picView.width-15*WIDTH_NIT, 50*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = OneFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    [scanBtn setTitle:@"0"];
    [scanBtn setImage:@"scan"];
    [scanBtn setTitleColor:ThreeTextColor];
    scanBtn.titleLabel.font = FiveFont;
    [self addSubview:scanBtn];
    
    //赞
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    [zanBtn setTitle:@"0"];
    [zanBtn setImage:@"zan"];
    [zanBtn setTitleColor:ThreeTextColor];
    zanBtn.titleLabel.font = FiveFont;
    [self addSubview:zanBtn];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(OneModifiedUnderstandingModel *)model{
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
