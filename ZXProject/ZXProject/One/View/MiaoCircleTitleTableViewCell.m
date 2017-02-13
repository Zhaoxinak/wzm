//
//  MiaoCircleTitleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "MiaoCircleTitleTableViewCell.h"
#import "CommonHeader.h"

@implementation MiaoCircleTitleTableViewCell

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
    
    //头像
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 20*WIDTH_NIT, 40*WIDTH_NIT, 40*WIDTH_NIT)];
    headImageView.image = [UIImage imageNamed:@"touxiang02"];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [self addSubview:headImageView];
    
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    
    
    //vip
    vipImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(headImageView.frame)-13*WIDTH_NIT, CGRectGetMaxY(headImageView.frame)-13*WIDTH_NIT, 13*WIDTH_NIT, 13*WIDTH_NIT)];
    vipImageView.image = [UIImage imageNamed:@"V-huangse"];
    [self addSubview:vipImageView];
    
    
    
    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 2*WIDTH_NIT, 25*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = SubNameColor;
    userNameLabel.font = Font13;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //楼主
    ownerlabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 2*WIDTH_NIT, 25*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT)];
    ownerlabel.textAlignment = NSTextAlignmentCenter;
    ownerlabel.layer.borderWidth = 0.6;
    ownerlabel.layer.borderColor = MainGoldColor.CGColor;
    ownerlabel.textColor = MainGoldColor;
    ownerlabel.font = Font13;
    ownerlabel.text = @"楼主";
    [self addSubview:ownerlabel];
    
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(ownerlabel.right + 2*WIDTH_NIT, 25*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT)];
    levelLabel.textAlignment = NSTextAlignmentCenter;
    levelLabel.layer.borderWidth = 0.6;
    levelLabel.layer.borderColor = MainGoldColor.CGColor;
    levelLabel.textColor = MainGoldColor;
    levelLabel.font = Font13;
    levelLabel.text = @"Lv15";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 2*WIDTH_NIT, 27*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT)];
    sexImageView.image = [UIImage imageNamed:@"nan"];
    [self addSubview:sexImageView];

    
    
    
    cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width - 35*WIDTH_NIT, 25*WIDTH_NIT, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    
    [cancelBtn setImage:@"quxiao"];
    [cancelBtn addTarget:self action:@selector(cancelAct:)];
    [self addSubview:cancelBtn];
    
    
//    //标题
//    name = [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, userNameLabel.bottom+14*WIDTH_NIT, kScreen_Width/2-15*WIDTH_NIT, 20*WIDTH_NIT)];
//    name.numberOfLines = 2;
//    name.font = Font12;
//    name.textColor = LessNameColor;
//    name.text = @"12人回答";
//    [self addSubview:name];
    
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 2*WIDTH_NIT, userNameLabel.bottom+2*WIDTH_NIT, kScreen_Width/2-15*WIDTH_NIT, 20*WIDTH_NIT)];
    timeName.font = Font12;
    timeName.textColor = SubNameColor;
    timeName.text = @"2017年1月1日 19:00";
    [self addSubview:timeName];
    
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(MiaoCircleInfoModel *)model{
    
    
    
    
}

#pragma mark --- 点击头像
- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}


#pragma mark --- 取消按钮
-(void)cancelAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(miaoCircleTitleCancel2go::)]) {
        [self.delegate miaoCircleTitleCancel2go:tag];
        NSLog(@"取消");
    }
    
    
}





#pragma mark - 计算cell高度
+ (CGFloat)caculateMiaoCircleTitleCellHeightWithContent:(MiaoCircleInfoModel *)model{
    
    return kScreen_Width/3;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
