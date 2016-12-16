//
//  OneJoinMiaoCircleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneJoinMiaoCircleTableViewCell.h"

@implementation OneJoinMiaoCircleTableViewCell

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
    avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, OneJoinMiaoCircleCell_Height-10*WIDTH_NIT, OneJoinMiaoCircleCell_Height-10*WIDTH_NIT)];
    avatarView.backgroundColor = [UIColor redColor];
    [self addSubview:avatarView];
    
    //图片点击
    
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = OneFont;
    name.textColor = OneTextColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT, 40*WIDTH_NIT)];
    subName.numberOfLines = 2;
    subName.font = TwoFont;
    subName.textColor = TwoTextColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    joinBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width-65*WIDTH_NIT, OneJoinMiaoCircleCell_Height/2-15*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
    [joinBtn setTitle:@"+加入"];
    [joinBtn setTitleColor:OneTextColor];
    joinBtn.layer.borderWidth = 1;
    [joinBtn addTarget:self action:@selector(joinTap:)];
    [self addSubview:joinBtn];
    
    
}


-(void)setModel:(OneJoinMiaoCircleModel *)model{
    
    
    
    
}

#pragma mark --- 加入按钮点击实现
-(void)joinTap:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    [self.delegate oneJoinMiaoCircleCellSelect2go: tag];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
