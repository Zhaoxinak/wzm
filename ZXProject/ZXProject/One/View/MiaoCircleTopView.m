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
    topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height/3)];
    topView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:topView atIndex:1];
    
    //公告图
    downView = [[UIView alloc]initWithFrame:CGRectMake(0, topView.bottom, self.width, self.height/3*2)];
    downView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:downView atIndex:1];
    
    
}

#pragma mark --- 加入图
-(void)topView{
    
    //图片
    avatarView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, topView.height-10*WIDTH_NIT, topView.height-10*WIDTH_NIT)];
    avatarView.backgroundColor = [UIColor redColor];
    [topView addSubview:avatarView];
    
    //图片点击
    
    
    //标题
    name = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, 0*WIDTH_NIT, (kScreen_Width-avatarView.right)/3*2-20*WIDTH_NIT, 20*WIDTH_NIT)];
    name.font = TwoFont;
    name.textColor = ThreeTextColor;
    name.text = @"标题标题标题标题标题标题标题标题";
    [topView addSubview:name];

    //内容
    subName = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, name.bottom+0*WIDTH_NIT, kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT, 20*WIDTH_NIT)];
    subName.font = ThreeFont;
    subName.textColor = FiveTextColor;
    subName.text = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    [topView addSubview:subName];
    

    //成员数量
    memberNum = [[UILabel alloc]initWithFrame:CGRectMake(avatarView.right+10*WIDTH_NIT, subName.bottom+0*WIDTH_NIT, (kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT)/2, 20*WIDTH_NIT)];
    memberNum.font = FourFont;
    memberNum.textColor = FiveTextColor;
    memberNum.text = @"成员：250w";
    [topView addSubview:memberNum];
    
    //帖子数量
    subName = [[UILabel alloc]initWithFrame:CGRectMake(memberNum.right+10*WIDTH_NIT, subName.bottom+0*WIDTH_NIT, (kScreen_Width-(avatarView.right+20*WIDTH_NIT)-70*WIDTH_NIT)/2, 20*WIDTH_NIT)];
    subName.font = FourFont;
    subName.textColor = FiveTextColor;
    subName.text = @"帖子：23w";
    [topView addSubview:subName];
    
    
    //加入按钮
    joinBtn = [[UIButton alloc]initWithFrame:CGRectMake(topView.width-65*WIDTH_NIT, 10*WIDTH_NIT, 60*WIDTH_NIT, 30*WIDTH_NIT)];
    [joinBtn setTitle:@"+加入"];
    joinBtn.titleLabel.font = TwoFont;
    [joinBtn setTitleColor:FourTextColor];
    joinBtn.layer.borderWidth = 1;
    joinBtn.layer.borderColor = (FourTextColor).CGColor;
    [joinBtn addTarget:self action:@selector(joinTap:)];
    [topView addSubview:joinBtn];
}

#pragma mark --- 公告图
-(void)downView{
    
    //公告
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 0, downView.width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    titleLabel.text = @"圈子公告";
    [downView addSubview:titleLabel];
    
    
    //公告详情
    UILabel * contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, titleLabel.bottom, downView.width-20*WIDTH_NIT, downView.height-20*WIDTH_NIT)];
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
