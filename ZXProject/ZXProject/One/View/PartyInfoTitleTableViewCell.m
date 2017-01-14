//
//  PartyInfoTitleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/14.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PartyInfoTitleTableViewCell.h"
#import "CommonHeader.h"


@implementation PartyInfoTitleTableViewCell

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
    
 
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 50*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = ThreeFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //内容
    time = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width/2-10*WIDTH_NIT, 30*WIDTH_NIT)];
    time.font = FourFont;
    time.textColor = TwoTextColor;
    time.text = @"时间时间时间时间时间时间时间时间时间";
    [self addSubview:time];
    
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2, name.bottom+5*WIDTH_NIT, 80*WIDTH_NIT, 30*WIDTH_NIT)];
    [scanBtn setTitle:@"0"];
    [scanBtn setImage:@"scan"];
    [scanBtn setTitleColor:ThreeTextColor];
    scanBtn.titleLabel.font = FiveFont;
    [self addSubview:scanBtn];
    
    //赞
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, 80*WIDTH_NIT, 30*WIDTH_NIT)];
    [zanBtn setTitle:@"0"];
    [zanBtn setImage:@"zan"];
    [zanBtn setTitleColor:ThreeTextColor];
    zanBtn.titleLabel.font = FiveFont;
    [self addSubview:zanBtn];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(PartyDetailInfoModel *)model{
    
    
    
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
