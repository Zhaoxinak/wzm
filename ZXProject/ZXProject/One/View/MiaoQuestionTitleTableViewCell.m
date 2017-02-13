//
//  MiaoQuestionTitleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "MiaoQuestionTitleTableViewCell.h"
#import "CommonHeader.h"


@implementation MiaoQuestionTitleTableViewCell

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
    
    
    
    //作者
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 25*WIDTH_NIT, kScreen_Width/2-15*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.font = Font16;
    userNameLabel.textColor = MainGoldColor;
    userNameLabel.text = @"来自水冰月的问题";
    [self addSubview:userNameLabel];
    
    
    
    cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width - 35*WIDTH_NIT, 25*WIDTH_NIT, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    
    [cancelBtn setImage:@"quxiao"];
    [cancelBtn addTarget:self action:@selector(cancelAct:)];
    [self addSubview:cancelBtn];
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, userNameLabel.bottom+14*WIDTH_NIT, kScreen_Width/2-15*WIDTH_NIT, 20*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font12;
    name.textColor = LessNameColor;
    name.text = @"12人回答";
    [self addSubview:name];
    
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width/2, userNameLabel.bottom+14*WIDTH_NIT, kScreen_Width/2-15*WIDTH_NIT, 20*WIDTH_NIT)];
    timeName.font = Font12;
    timeName.textColor = SubNameColor;
    timeName.textAlignment = NSTextAlignmentRight;
    timeName.text = @"2017年1月1日 19:00";
    [self addSubview:timeName];
    
    
    
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(MiaoQuestionInfoModel *)model{
    
    
    
    
}


#pragma mark --- 取消按钮
-(void)cancelAct:(UIButton *)button{
  
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(miaoQuestionTitleCancel2go:)]) {
        [self.delegate miaoQuestionTitleCancel2go:tag];
        NSLog(@"取消");
    }
    
    
}





#pragma mark - 计算cell高度
+ (CGFloat)caculateMiaoQuestionTitleCellHeightWithContent:(MiaoQuestionInfoModel *)model{
    
    return kScreen_Width/3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
