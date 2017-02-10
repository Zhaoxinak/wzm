//
//  SystemNoticeTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "SystemNoticeTableViewCell.h"
#import "CommonHeader.h"

@implementation SystemNoticeTableViewCell

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
    topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 90*WIDTH_NIT, kScreen_Width, 10*WIDTH_NIT)];
    topLine.backgroundColor = BGColor;
    [self addSubview:topLine];
    
   
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = Font15;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    subName.font = Font12;
    subName.textColor = NameColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    //时间
    time = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, subName.bottom+5*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    time.font = Font12;
    time.textColor = NameColor;
    time.text = @"20分钟前";
    [self addSubview:time];
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(SystemNoticeModel *)model{
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
