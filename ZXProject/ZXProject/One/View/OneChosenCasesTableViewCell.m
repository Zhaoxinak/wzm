//
//  OneChosenCasesTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneChosenCasesTableViewCell.h"

@implementation OneChosenCasesTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-10*WIDTH_NIT, (kScreen_Width-10*WIDTH_NIT)/2)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, OneChosenCasesCell_Height-60*WIDTH_NIT, kScreen_Width-5*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = OneFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, OneChosenCasesCell_Height-30*WIDTH_NIT, kScreen_Width/2, 20*WIDTH_NIT)];
    subName.font = TwoFont;
    subName.textColor = TwoTextColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2, OneChosenCasesCell_Height-30*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
    [scanBtn setTitle:@"0"];
    [scanBtn setImage:@"scan"];
    [scanBtn setTitleColor:ThreeTextColor];
    [self addSubview:scanBtn];
    
    //赞
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+10*WIDTH_NIT, OneChosenCasesCell_Height-30*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
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
