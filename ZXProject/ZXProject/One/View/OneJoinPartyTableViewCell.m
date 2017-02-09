//
//  OneJoinPartyTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneJoinPartyTableViewCell.h"
#import "CommonHeader.h"

@implementation OneJoinPartyTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-130*WIDTH_NIT, 10*WIDTH_NIT, 120*WIDTH_NIT, 100*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font13;
    name.textColor = SubNameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
//    //活动状态
//
//    status = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 20*WIDTH_NIT)];
//    status.font = Font13;
//    status.textColor = MainWhiteColor;
//    status.text = @"即将开始";
//    [self addSubview:status];
    
    
    //地址
    addrName = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, name.bottom+15*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 20*WIDTH_NIT)];
    addrName.font = Font12;
    addrName.textColor = SubNameColor;
    addrName.text = @"地址地址地址地址地址地址地址地址地址地址地址地址地址地址地址";
    [self addSubview:addrName];
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, addrName.bottom+5*WIDTH_NIT, kScreen_Width/3, 20*WIDTH_NIT)];
    timeName.font = Font12;
    timeName.textColor = LittleNameColor;
    timeName.text = @"10分钟之前";
    [self addSubview:timeName];

    //价格
    priceName = [[UILabel alloc]initWithFrame:CGRectMake(timeName.right+2*WIDTH_NIT, addrName.bottom+5*WIDTH_NIT, kScreen_Width-timeName.width-picView.width-30*WIDTH_NIT, 20*WIDTH_NIT)];
    priceName.textAlignment = NSTextAlignmentRight;
    priceName.font = Font15;
    priceName.textColor = LightNameColor;
    priceName.text = @"价格价格价格";
    [self addSubview:priceName];
    
    //活动类型
    typeName = [[UILabel alloc]initWithFrame:CGRectMake(picView.width-50*WIDTH_NIT, 0, 50*WIDTH_NIT, 25*WIDTH_NIT)];
    typeName.backgroundColor = MainGoldColor;
    typeName.textAlignment = NSTextAlignmentCenter;
    typeName.font = Font15;
    typeName.textColor = MainWhiteColor;
    typeName.text = @"活动";
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
