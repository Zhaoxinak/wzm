//
//  OneCasesShowTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/26.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneCasesShowTableViewCell.h"
#import "CommonHeader.h"

@implementation OneCasesShowTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-OneCasesShowCell_Height, 5*WIDTH_NIT, OneCasesShowCell_Height-10*WIDTH_NIT, OneCasesShowCell_Height-10*WIDTH_NIT)];
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
    
    
    //特征
    features = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, zanBtn.bottom+5*WIDTH_NIT, kScreen_Width/4, 20*WIDTH_NIT)];
    features.font = ThreeFont;
    features.textColor = ThreeTextColor;
    features.text = @"特性特性特性特性特性";
    [self addSubview:features];
    
   
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(OneCasesShowModel *)model{
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



@end
