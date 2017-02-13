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
    avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, 63*WIDTH_NIT, 58*WIDTH_NIT)];
    avatarView.image = [UIImage imageNamed:@"touxiang02"];
    [self addSubview:avatarView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+15*WIDTH_NIT, 10*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = Font13;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //能加入的种类
    allowName = [[UILabel alloc]initWithFrame:CGRectMake(name.right +5*WIDTH_NIT, 11*WIDTH_NIT, 55*WIDTH_NIT, 18*WIDTH_NIT)];
    allowName.backgroundColor = [UIColor clearColor];
    allowName.layer.borderWidth = 0.6;
    allowName.layer.borderColor = MainGoldColor.CGColor;
    allowName.layer.cornerRadius = 2;
    allowName.textAlignment = NSTextAlignmentCenter;
    allowName.font = Font11;
    allowName.textColor = MainGoldColor;;
    allowName.text = @"仅工程师";
    [self addSubview:allowName];
    
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+15*WIDTH_NIT, name.bottom+5*WIDTH_NIT, kScreen_Width-(avatarView.right+30*WIDTH_NIT)-70*WIDTH_NIT, 40*WIDTH_NIT)];
    subName.numberOfLines = 2;
    subName.font = Font13;
    subName.textColor = LightNameColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
   
    
    
    //加入按钮
    joinBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width-80*WIDTH_NIT, name.bottom+5*WIDTH_NIT, 70*WIDTH_NIT, 25*WIDTH_NIT)];
    [joinBtn setTitle:@"+加入"];
    joinBtn.titleLabel.font = Font12;
    [joinBtn setTitleColor:MainGoldColor];
    joinBtn.layer.borderWidth = 0.6;
    joinBtn.layer.borderColor = MainGoldColor.CGColor;
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
