//
//  ExperienceTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/24.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ExperienceTableViewCell.h"
#import "CommonHeader.h"

@implementation ExperienceTableViewCell

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
    
    //顶部分割线
    topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 1)];
    topLine.backgroundColor = BGColor;
    [self addSubview:topLine];
    
    //图片
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-ExperienceCell_Height, 5*WIDTH_NIT, ExperienceCell_Height-10*WIDTH_NIT, ExperienceCell_Height-10*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-picView.width-15*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font13;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width/3, 20*WIDTH_NIT)];
    timeName.font = Font13;
    timeName.textColor = ThreeTextColor;
    timeName.text = @"时间时间时间时间时间时间";
    [self addSubview:timeName];
    
    //活动类型
    typeName = [[UILabel alloc]initWithFrame:CGRectMake(picView.width-40*WIDTH_NIT, 0, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    typeName.textAlignment = NSTextAlignmentCenter;
    typeName.font = Font13;
    typeName.textColor = TwoTextColor;
    typeName.text = @"比赛";
    [picView addSubview:typeName];
    
}

#pragma mark --- 对接数据
-(void)setModel:(ExperienceModel *)model{
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
