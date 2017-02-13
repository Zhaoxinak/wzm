//
//  MiaoCircleTopView.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/17.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "MiaoCircleTopView.h"
#import "CommonHeader.h"

@interface MiaoCircleTopView(){
    
    UIView *topView;
    UIView *downView;
  
}


@end


@implementation MiaoCircleTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置加入和公告打底图
        [self setupTopBottomView];
        //设置加入
        [self topView];
        //设置公告
        [self downView];
    }
    return self;
}

#pragma mark --- 打底图
-(void)setupTopBottomView{
    
    //加入图
    topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 80*WIDTH_NIT)];
    topView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:topView atIndex:1];
    
    //公告图
    downView = [[UIView alloc]initWithFrame:CGRectMake(0, topView.bottom, self.width, 150*WIDTH_NIT)];
    downView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:downView atIndex:1];
    
    
}

#pragma mark --- 加入图
-(void)topView{
    
    //图片
    avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, 50*WIDTH_NIT, 50*WIDTH_NIT)];
    avatarView.image = [UIImage imageNamed:@"touxiang02"];
    [topView addSubview:avatarView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, 15*WIDTH_NIT, (kScreen_Width-avatarView.right)/3*2-20*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = Font15;
    name.textColor = NameColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [topView addSubview:name];

    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, name.bottom+0*WIDTH_NIT, kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT, 20*WIDTH_NIT)];
    subName.font = Font12;
    subName.textColor = LightNameColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [topView addSubview:subName];
    

    //成员数量
    memberNum = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, subName.bottom+5*WIDTH_NIT, (kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT)/2, 20*WIDTH_NIT)];
    memberNum.font = Font12;
    memberNum.textColor = NameColor;
    memberNum.text = @"成员：250w";
    [topView addSubview:memberNum];
    
    //帖子数量
    subName = [[UILabel alloc]initWithFrame:CGRectMake(memberNum.right+10*WIDTH_NIT, subName.bottom+5*WIDTH_NIT, (kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT)/2, 20*WIDTH_NIT)];
    subName.font = Font12;
    subName.textColor = NameColor;
    subName.text = @"帖子：23w";
    [topView addSubview:subName];
    
    
    //加入按钮
    joinBtn = [[UIButton alloc]initWithFrame:CGRectMake(topView.width-85*WIDTH_NIT, 10*WIDTH_NIT, 80*WIDTH_NIT, 25*WIDTH_NIT)];
    [joinBtn setTitle:@"+加入"];
    joinBtn.titleLabel.font = Font15;
    [joinBtn setTitleColor:MainGoldColor];
    joinBtn.layer.borderWidth = 0.6;
    joinBtn.layer.borderColor = MainGoldColor.CGColor;
    joinBtn.layer.cornerRadius = 5;
    [joinBtn addTarget:self action:@selector(joinTap:)];
    [topView addSubview:joinBtn];
}

#pragma mark --- 公告图
-(void)downView{
    
    //分割线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, downView.width, 1)];
    line.backgroundColor = BGColor;
    [downView addSubview:line];
    
    //公告
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 5*WIDTH_NIT, downView.width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    titleLabel.font = Font14;
    titleLabel.textColor = NameColor;
    titleLabel.text = @"圈子公告";
    [downView addSubview:titleLabel];
    
    
    //公告详情
    contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, titleLabel.bottom, downView.width-20*WIDTH_NIT, downView.height-30*WIDTH_NIT)];
    contentLabel.font = Font14;
    contentLabel.textColor = NameColor;
    contentLabel.numberOfLines = 4;
    contentLabel.text = @"圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容圈子公告内容";
    [downView addSubview:contentLabel];
    
}




#pragma mark --- 对接数据
-(void)setModel:(ThreeMiaoCircleModel *)model{
    
    
   
}



#pragma mark --- 加入按钮点击实现
-(void)joinTap:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(miaoCircleTopViewSelect2go:)]) {
        [self.delegate miaoCircleTopViewSelect2go:tag];
        NSLog(@"点击加入");
    }
    
}


@end
