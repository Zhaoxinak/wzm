//
//  UnderstandingTitleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/18.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "UnderstandingTitleTableViewCell.h"
#import "CommonHeader.h"

@implementation UnderstandingTitleTableViewCell

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
    name = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-10*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = TwoFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //作者
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width/3*2-10*WIDTH_NIT, 20*WIDTH_NIT)];
    timeName.font = ThreeFont;
    timeName.textColor = OneTextColor;
    timeName.text = @"水冰月";
    [self addSubview:timeName];
    
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width/3*2, name.bottom+5*WIDTH_NIT, kScreen_Width/3-10*WIDTH_NIT, 20*WIDTH_NIT)];
    timeName.font = ThreeFont;
    timeName.textColor = OneTextColor;
    timeName.text = @"时间时间";
    [self addSubview:timeName];
    
  
    
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(UnderstandingInfoModel *)model{
    
    
    
    
}








#pragma mark - 计算cell高度
+ (CGFloat)caculateUnderstandingTitleCellHeightWithContent:(UnderstandingInfoModel *)model{
    
    return kScreen_Width/4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
