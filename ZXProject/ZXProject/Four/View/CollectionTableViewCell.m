//
//  CollectionTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/24.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "CollectionTableViewCell.h"
#import "CommonHeader.h"

@implementation CollectionTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-90*WIDTH_NIT, 15*WIDTH_NIT, 80*WIDTH_NIT, 60*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 15*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font14;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, name.bottom+10*WIDTH_NIT, kScreen_Width/2, 20*WIDTH_NIT)];
    timeName.font = Font13;
    timeName.textColor = LittleNameColor;
    timeName.text = @"时间时间时间时间时间时间";
    [self addSubview:timeName];
    
    //活动类型
    typeName = [[UILabel alloc]initWithFrame:CGRectMake(picView.width-35*WIDTH_NIT, 0, 35*WIDTH_NIT, 20*WIDTH_NIT)];
    typeName.backgroundColor = MainGoldColor;
    typeName.textAlignment = NSTextAlignmentCenter;
    typeName.font = Font12;
    typeName.textColor = MainWhiteColor;
    typeName.text = @"比赛";
    [picView addSubview:typeName];

    
}

#pragma mark --- 对接数据
-(void)setModel:(CollectionModel *)model{
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
