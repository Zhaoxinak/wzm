//
//  OneModifiedEncyclopediaTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/12.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneModifiedEncyclopediaTableViewCell.h"
#import "CommonHeader.h"


@implementation OneModifiedEncyclopediaTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, OneModifiedCell_Height-20*WIDTH_NIT, OneModifiedCell_Height-20*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, 15*WIDTH_NIT, kScreen_Width-(picView.right+20*WIDTH_NIT), 20*WIDTH_NIT)];
    name.font = ThreeFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-(picView.right+20*WIDTH_NIT), 40*WIDTH_NIT)];
    subName.numberOfLines = 2;
    subName.font = FourFont;
    subName.textColor = TwoTextColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, OneModifiedCell_Height-50*WIDTH_NIT, 80*WIDTH_NIT, 40*WIDTH_NIT)];
    [scanBtn setTitle:@"0"];
    [scanBtn setImage:@"scan"];
    [scanBtn setTitleColor:ThreeTextColor];
    scanBtn.titleLabel.font = FiveFont;
    [self addSubview:scanBtn];
    
    //赞
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+10*WIDTH_NIT, OneModifiedCell_Height-50*WIDTH_NIT, 80*WIDTH_NIT, 40*WIDTH_NIT)];
    [zanBtn setTitle:@"0"];
    [zanBtn setImage:@"zan"];
    [zanBtn setTitleColor:ThreeTextColor];
    zanBtn.titleLabel.font = FiveFont;
    [self addSubview:zanBtn];
    
  
}

#pragma mark --- 对接数据
-(void)setModel:(HomePageModel *)model{
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
