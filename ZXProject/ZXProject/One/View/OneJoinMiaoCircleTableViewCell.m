//
//  OneJoinMiaoCircleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneJoinMiaoCircleTableViewCell.h"
#import "CommonHeader.h"

@implementation OneJoinMiaoCircleTableViewCell

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
    avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, OneJoinMiaoCircleCell_Height-10*WIDTH_NIT, OneJoinMiaoCircleCell_Height-10*WIDTH_NIT)];
    avatarView.backgroundColor = [UIColor redColor];
    [self addSubview:avatarView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = Font13;
    name.textColor = ThreeTextColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT, 40*WIDTH_NIT)];
    subName.numberOfLines = 2;
    subName.font = Font13;
    subName.textColor = FiveTextColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    //能加入的种类
    allowName = [[UILabel alloc]initWithFrame:CGRectMake(kScreen_Width- 80*WIDTH_NIT, 0, 70*WIDTH_NIT, 20*WIDTH_NIT)];
    allowName.backgroundColor = [UIColor orangeColor];
    allowName.textAlignment = NSTextAlignmentCenter;
    allowName.font = Font13;
    allowName.textColor = FiveTextColor;
    allowName.text = @"仅工程师";
    [self addSubview:allowName];
    
    
    //加入按钮
    joinBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width-65*WIDTH_NIT, OneJoinMiaoCircleCell_Height/2-15*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
    [joinBtn setTitle:@"+加入"];
    joinBtn.titleLabel.font = Font13;
    [joinBtn setTitleColor:FourTextColor];
    joinBtn.layer.borderWidth = 1;
    joinBtn.layer.borderColor = (FourTextColor).CGColor;
    [joinBtn addTarget:self action:@selector(joinAct:)];
    [self addSubview:joinBtn];

    
    
}


-(void)setModel:(OneJoinMiaoCircleModel *)model{
    
    
    
    
}

#pragma mark --- 加入按钮点击实现
-(void)joinAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(oneJoinMiaoCircleCellSelect2go:)]) {
        [self.delegate oneJoinMiaoCircleCellSelect2go:tag];
        NSLog(@"点击加入");
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
