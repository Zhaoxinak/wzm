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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-120*WIDTH_NIT, 15*WIDTH_NIT, 110*WIDTH_NIT, 90*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 20*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font13;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, name.bottom+2*WIDTH_NIT, 50*WIDTH_NIT, 20*WIDTH_NIT)];
    [scanBtn setTitle:@"123.3k"];
    [scanBtn setImage:@"眼睛"];
    [scanBtn setTitleColor:NameColor];
    scanBtn.titleLabel.font = Font8;
    scanBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:scanBtn];
    
    //赞
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+2*WIDTH_NIT, name.bottom+1*WIDTH_NIT, 50*WIDTH_NIT, 20*WIDTH_NIT)];
    [zanBtn setTitle:@"123.3k"];
    [zanBtn setImage:@"赞-"];
    [zanBtn setTitleColor:NameColor];
    zanBtn.titleLabel.font = Font8;
    zanBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:zanBtn];
    
    
    //标签1
    subName = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, zanBtn.bottom+5*WIDTH_NIT, 45*WIDTH_NIT, 15*WIDTH_NIT)];
    subName.font = Font9;
    subName.textColor = LessNameColor;
    subName.textAlignment = NSTextAlignmentCenter;
    subName.layer.cornerRadius = 5;
    subName.layer.borderWidth = 0.5;
    subName.layer.borderColor = LessNameColor.CGColor;
    subName.text = @"音响改装";
    [self addSubview:subName];
    
    
    //标签2
    lessName = [[UILabel alloc]initWithFrame:CGRectMake(subName.right + 7*WIDTH_NIT, zanBtn.bottom+5*WIDTH_NIT, 45*WIDTH_NIT, 15*WIDTH_NIT)];
    lessName.font = Font9;
    lessName.textColor = LessNameColor;
    lessName.textAlignment = NSTextAlignmentCenter;
    lessName.layer.cornerRadius = 5;
    lessName.layer.borderWidth = 0.5;
    lessName.layer.borderColor = LessNameColor.CGColor;
    lessName.text = @"奥迪Q3";
    [self addSubview:lessName];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(OneCasesShowModel *)model{
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



@end
