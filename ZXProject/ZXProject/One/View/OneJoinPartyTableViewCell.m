//
//  OneJoinPartyTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneJoinPartyTableViewCell.h"

@implementation OneJoinPartyTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-OneJoinPartyCell_Height, 5*WIDTH_NIT, OneJoinPartyCell_Height-10*WIDTH_NIT, OneJoinPartyCell_Height-10*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-picView.width-15*WIDTH_NIT, 50*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = OneFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //地址
    addrName = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-picView.width-15*WIDTH_NIT, 20*WIDTH_NIT)];
    addrName.font = TwoFont;
    addrName.textColor = TwoTextColor;
    addrName.text = @"地址地址地址地址地址地址地址地址地址地址地址地址地址地址地址";
    [self addSubview:addrName];
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, addrName.bottom+5*WIDTH_NIT, kScreen_Width/4, 20*WIDTH_NIT)];
    timeName.font = ThreeFont;
    timeName.textColor = ThreeTextColor;
    timeName.text = @"时间时间时间时间时间时间";
    [self addSubview:timeName];

    //价格
    priceName = [[UILabel alloc]initWithFrame:CGRectMake(timeName.right+5*WIDTH_NIT, addrName.bottom+5*WIDTH_NIT, kScreen_Width-timeName.width-picView.width-25*WIDTH_NIT, 20*WIDTH_NIT)];
    priceName.textAlignment = NSTextAlignmentRight;
    priceName.font = TwoFont;
    priceName.textColor = TwoTextColor;
    priceName.text = @"价格价格价格";
    [self addSubview:priceName];
    
    //活动类型
    typeName = [[UILabel alloc]initWithFrame:CGRectMake(picView.width-40*WIDTH_NIT, 0, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    typeName.textAlignment = NSTextAlignmentCenter;
    typeName.font = TwoFont;
    typeName.textColor = TwoTextColor;
    typeName.text = @"比赛";
    [picView addSubview:typeName];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(OneJoinPartyModel *)model{
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
