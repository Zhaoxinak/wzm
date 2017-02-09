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
    name = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-30*WIDTH_NIT, 50*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font18;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //时间
    time = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width/2-15*WIDTH_NIT, 30*WIDTH_NIT)];
    time.font = Font12;
    time.textColor = LessNameColor;
    time.text = @"2017-1-1 15:30";
    [self addSubview:time];
    
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width/2, name.bottom+5*WIDTH_NIT, 80*WIDTH_NIT, 30*WIDTH_NIT)];
    [scanBtn setTitle:@"123.3k"];
    [scanBtn setImage:@"眼睛"];
    [scanBtn setTitleColor:NameColor];
    scanBtn.titleLabel.font = Font11;
    scanBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:scanBtn];
    
    //被收藏
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, 80*WIDTH_NIT, 30*WIDTH_NIT)];
    [zanBtn setTitle:@"123.3k"];
    [zanBtn setImage:@"xingxing"];
    [zanBtn setTitleColor:NameColor];
    zanBtn.titleLabel.font = Font11;
    zanBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    
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
