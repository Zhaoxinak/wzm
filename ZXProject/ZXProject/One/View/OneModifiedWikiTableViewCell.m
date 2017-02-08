//
//  OneModifiedWikiTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/26.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneModifiedWikiTableViewCell.h"
#import "CommonHeader.h"

@implementation OneModifiedWikiTableViewCell

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
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-150*WIDTH_NIT, 7*WIDTH_NIT, 140*WIDTH_NIT, 100*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 5*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font13;
    name.textColor = SubNameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, name.bottom+0*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 50*WIDTH_NIT)];
    subName.numberOfLines = 3;
    subName.font = Font12;
    subName.textColor = LittleNameColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    //时间
    time = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, subName.bottom+0*WIDTH_NIT, kScreen_Width-picView.width-30*WIDTH_NIT, 20*WIDTH_NIT)];
    time.font = Font12;
    time.textColor = LittleNameColor;
    time.text = @"30分钟以前";
    [self addSubview:time];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(OneModifiedWikiModel *)model{
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
