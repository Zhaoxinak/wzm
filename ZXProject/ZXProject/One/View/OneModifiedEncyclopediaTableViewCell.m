//
//  OneModifiedEncyclopediaTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/12.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneModifiedEncyclopediaTableViewCell.h"

@implementation OneModifiedEncyclopediaTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, OneModifiedCell_Height-10*WIDTH_NIT, OneModifiedCell_Height-10*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-(picView.right+20*WIDTH_NIT), 20*WIDTH_NIT)];
    name.font = OneFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-(picView.right+20*WIDTH_NIT), 40*WIDTH_NIT)];
    subName.numberOfLines = 2;
    subName.font = TwoFont;
    subName.textColor = TwoTextColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(picView.right+10*WIDTH_NIT, OneModifiedCell_Height-50*WIDTH_NIT, 80*WIDTH_NIT, 40*WIDTH_NIT)];
    [scanBtn setTitle:@"0"];
    [scanBtn setImage:@"scan"];
    [scanBtn setTitleColor:ThreeTextColor];
    [self addSubview:scanBtn];
    
    //赞
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+10*WIDTH_NIT, OneModifiedCell_Height-50*WIDTH_NIT, 80*WIDTH_NIT, 40*WIDTH_NIT)];
    [zanBtn setTitle:@"0"];
    [zanBtn setImage:@"zan"];
    [zanBtn setTitleColor:ThreeTextColor];
    [self addSubview:zanBtn];
    
  
}


-(void)setModel:(HomePageModel *)model{
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
