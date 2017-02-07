//
//  ThreeMiaoCircleTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/20.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "ThreeMiaoCircleTableViewCell.h"
#import "CommonHeader.h"

@implementation ThreeMiaoCircleTableViewCell

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
    avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, 60*WIDTH_NIT, 60*WIDTH_NIT)];
    avatarView.backgroundColor = [UIColor redColor];
    [self addSubview:avatarView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+20*WIDTH_NIT, 10*WIDTH_NIT, (kScreen_Width-avatarView.right)/3*2-40*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = Font14;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [self addSubview:name];
    
    //观看人数
    scanNum = [[UILabel alloc]initWithFrame:CGRectMake(name.right+10*WIDTH_NIT, 10*WIDTH_NIT, kScreen_Width-name.right-10*WIDTH_NIT, 20*WIDTH_NIT)];
    scanNum.font = Font13;
    scanNum.textColor = MainGoldColor;
    scanNum.text = @"今日：110";
    scanNum.hidden = YES;
    [self addSubview:scanNum];
    
    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+20*WIDTH_NIT, name.bottom+2*WIDTH_NIT, kScreen_Width-(avatarView.right+20*WIDTH_NIT)-90*WIDTH_NIT, 40*WIDTH_NIT)];
    subName.numberOfLines = 2;
    subName.font = Font14;
    subName.textColor = LightNameColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [self addSubview:subName];
    
    //加入按钮
    joinBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width-75*WIDTH_NIT, ThreeMiaoCircleCell_Height/2-0*WIDTH_NIT, 70*WIDTH_NIT, 28*WIDTH_NIT)];
    [joinBtn setTitle:@"+加入"];
    joinBtn.titleLabel.font = Font14;
    [joinBtn setTitleColor:MainGoldColor];
    joinBtn.layer.borderWidth = 1;
    joinBtn.layer.borderColor = (MainGoldColor).CGColor;
    [joinBtn addTarget:self action:@selector(joinTap:)];
    joinBtn.hidden = YES;
    [self addSubview:joinBtn];
    
    
    
    
    
    
    
}

#pragma mark --- 对接数据
-(void)setModel:(ThreeMiaoCircleModel *)model{
    
    
    
 
    
    
    [self updateFrame];
}


#pragma mark --- 更新界面
-(void)updateFrame{
    
    //圈子类型展示
    switch (_miaoCircleType) {
        case MyMiaoCircleMode:{
            scanNum.hidden = NO;
            joinBtn.hidden = YES;
        }
            break;
        case OtherMiaoCircleMode:{
            scanNum.hidden = YES;
            joinBtn.hidden = NO;
        }
            break;
        default:
            break;
    }
    
}



#pragma mark --- 加入按钮点击实现
-(void)joinTap:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(ThreeMiaoCircleCellSelect2go:)]) {
        [self.delegate ThreeMiaoCircleCellSelect2go:tag];
        NSLog(@"点击加入");
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
