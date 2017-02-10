//
//  RewardTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "RewardTableViewCell.h"
#import "CommonHeader.h"

@implementation RewardTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(18*WIDTH_NIT, 16*WIDTH_NIT, 78*WIDTH_NIT, 60*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    //活动类型
    typeName = [[UILabel alloc]initWithFrame:CGRectMake(0*WIDTH_NIT, 0, 35*WIDTH_NIT, 20*WIDTH_NIT)];
    typeName.textAlignment = NSTextAlignmentCenter;
    typeName.backgroundColor = MainGoldColor;
    typeName.font = Font12;
    typeName.textColor = MainWhiteColor;
    typeName.text = @"案例";
    [picView addSubview:typeName];
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, 16*WIDTH_NIT, kScreen_Width-(picView.right+20*WIDTH_NIT)-60*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font14;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //时间
    time = [[UILabel alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-(picView.right+20*WIDTH_NIT)-60*WIDTH_NIT, 20*WIDTH_NIT)];
    time.font = Font12;
    time.textColor = LittleNameColor;
    time.text = @"11-12 15:15";
    [self addSubview:time];
    
    //金钱
    money = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width-70*WIDTH_NIT, 36*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
    money.font = Font24;
    money.textColor = MainGoldColor;
    money.text = @"+¥15";
    [self addSubview:money];
   
    
}

#pragma mark --- 对接数据
-(void)setModel:(RewardModel *)model{
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
