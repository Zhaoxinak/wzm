//
//  ModifiedWikiTitleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/19.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "ModifiedWikiTitleTableViewCell.h"
#import "CommonHeader.h"

@implementation ModifiedWikiTitleTableViewCell

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
    name = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 25*WIDTH_NIT, kScreen_Width-30*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font16;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, name.bottom+14*WIDTH_NIT, kScreen_Width/2-15*WIDTH_NIT, 20*WIDTH_NIT)];
    timeName.font = Font12;
    timeName.textColor = SubNameColor;
    timeName.text = @"2017年1月1日 19:00";
    [self addSubview:timeName];
    
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(ModifiedWikiInfoModel *)model{
    
    
    
    
}



#pragma mark - 计算cell高度
+ (CGFloat)caculateModifiedWikiTitleCellHeightWithContent:(ModifiedWikiInfoModel *)model{
    
    return kScreen_Width/3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
