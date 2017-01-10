//
//  FourHeadView.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/10.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "FourHeadView.h"
#import "CommonHeader.h"

@interface FourHeadView(){
    
    UIView *headBGView;
    UIView *miaoBGView;
    
    UIImageView *headImageView; //头像
    UILabel *userNameLabel; //用户名
    UILabel *levelLabel; //等级
    UIImageView *sexImageView; //性别～
    UILabel *phoneLabel; //电话
}


@end


@implementation FourHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置头像版面和喵币等版面
        [self setupTopBottomView];
        //设置头像版面
        [self setupheadView];
        //设置喵币等版面
        [self setupMiaoView];
    }
    return self;
}


#pragma mark --- 打底图
-(void)setupTopBottomView{
    
    //头像版面
    headBGView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
    headBGView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:headBGView atIndex:1];
    
    //喵币等版面
    miaoBGView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height/2, self.width, self.height/2)];
    miaoBGView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:miaoBGView atIndex:1];
    
    
}


#pragma mark -- 头像区域
-(void)setupheadView{

    //头像
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5*WIDTH_NIT, 5*WIDTH_NIT, headBGView.height-10*WIDTH_NIT, headBGView.height-10*WIDTH_NIT)];
    headImageView.backgroundColor = [UIColor redColor];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [self addSubview:headImageView];
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    

    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = OneTextColor;
    userNameLabel.font = ThreeFont;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(userNameLabel.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 40*WIDTH_NIT, 20*WIDTH_NIT)];
    levelLabel.textColor = OneTextColor;
    levelLabel.font = ThreeFont;
    levelLabel.text = @"12";
    [self addSubview:levelLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(levelLabel.right + 10*WIDTH_NIT, 5*WIDTH_NIT, 20*WIDTH_NIT, 20*WIDTH_NIT)];
    sexImageView.backgroundColor = [UIColor redColor];
    [self addSubview:sexImageView];
    
    
    //电话
    phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, userNameLabel.bottom + 5*WIDTH_NIT, 150*WIDTH_NIT, 20*WIDTH_NIT)];
    phoneLabel.textColor = OneTextColor;
    phoneLabel.font = ThreeFont;
    phoneLabel.text = @"手机号：15683062326";
    [self addSubview:phoneLabel];
    
    

}


#pragma mark -- 喵区域
-(void)setupMiaoView{
    
    
    
    
    
}








#pragma mark -- 点击事件

//点击头像
- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
