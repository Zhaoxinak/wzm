//
//  OneModifiedUnderstandingTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/19.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneModifiedUnderstandingTableViewCell.h"
#import "CommonHeader.h"

@implementation OneModifiedUnderstandingTableViewCell

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
    
    //顶部分割线
    bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, OneModifiedUnderstandCell_Height-10*WIDTH_NIT, kScreen_Width, 10*WIDTH_NIT)];
    bottomLine.backgroundColor = BGColor;
    [self addSubview:bottomLine];
    
    //图片
    picView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreen_Width-135*WIDTH_NIT, 8*WIDTH_NIT, 125*WIDTH_NIT, 105*WIDTH_NIT)];
    picView.backgroundColor = [UIColor redColor];
    [self addSubview:picView];
    
    //图片点击
    
    
    
    
    
    //头像
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, 30*WIDTH_NIT, 30*WIDTH_NIT)];
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
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, 15*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = SubNameColor;
    userNameLabel.font = Font13;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 2*WIDTH_NIT, 15*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT)];
    levelLabel.layer.borderWidth = 0.4;
    levelLabel.layer.borderColor = MainGoldColor.CGColor;
    levelLabel.textColor = MainGoldColor;
    levelLabel.font = Font13;
    levelLabel.text = @"Lv15";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 5*WIDTH_NIT, 17*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT)];
    sexImageView.image = [UIImage imageNamed:@"nan"];
    [self addSubview:sexImageView];
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, headImageView.bottom+13*WIDTH_NIT, kScreen_Width-picView.width-23*WIDTH_NIT, 40*WIDTH_NIT)];
    name.numberOfLines = 2;
    name.font = Font13;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //浏览者
    scanBtn = [[UIButton alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, name.bottom+2*WIDTH_NIT, 50*WIDTH_NIT, 20*WIDTH_NIT)];
    [scanBtn setTitle:@"123.3k"];
    [scanBtn setImage:@"眼睛"];
    [scanBtn setTitleColor:NameColor];
    scanBtn.titleLabel.font = Font9;
    scanBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:scanBtn];
    
    //赞
    zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(scanBtn.right+5*WIDTH_NIT, name.bottom+2*WIDTH_NIT, 50*WIDTH_NIT, 20*WIDTH_NIT)];
    [zanBtn setTitle:@"123.3k"];
    [zanBtn setImage:@"赞-"];
    [zanBtn setTitleColor:NameColor];
    zanBtn.titleLabel.font = Font9;
    zanBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:zanBtn];
    
    //时间
    timeName = [[UILabel alloc]initWithFrame:CGRectMake(picView.left - 70*WIDTH_NIT, name.bottom+5*WIDTH_NIT, 60*WIDTH_NIT, 20*WIDTH_NIT)];
    timeName.font = Font9;
    timeName.textColor = LessNameColor;
    timeName.text = @"时间时间时间";
    [self addSubview:timeName];
    
}

#pragma mark --- 对接数据
-(void)setModel:(OneModifiedUnderstandingModel *)model{
    
    
    
    
}

//点击头像
- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
