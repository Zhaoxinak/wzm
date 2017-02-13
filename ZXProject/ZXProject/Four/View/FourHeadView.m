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
    
    UIButton *miaobBtn; //喵币
    UIButton *yueBtn; //余额
    UIButton *miaoyBtn; //喵友
    
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
    
    //头像版面执行
    UIButton * headBGBtn = [[UIButton alloc]initWithFrame:headBGView.frame];
    headBGBtn.tag = 0;
    [headBGBtn addTarget:self action:@selector(buttonAct:)];
    [headBGView addSubview:headBGBtn];
    
    //喵币等版面
    miaoBGView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height/2, self.width, self.height/2)];
    miaoBGView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:miaoBGView atIndex:1];
    
    
    //箭头
    UIImageView *arrView = [[UIImageView alloc]initWithFrame:CGRectMake(self.width - 40*WIDTH_NIT, 0, 14*WIDTH_NIT, 26*WIDTH_NIT)];
    arrView.centerY = headBGView.height/2;
    arrView.image = [UIImage imageNamed:@"箭头02"];
    [headBGView addSubview:arrView];
    
}


#pragma mark -- 头像区域
-(void)setupheadView{

    //头像
    headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15*WIDTH_NIT, 10*WIDTH_NIT, 62*WIDTH_NIT, 62*WIDTH_NIT)];
    headImageView.image = [UIImage imageNamed:@"touxiang02"];
    headImageView.clipsToBounds = YES;
    headImageView.layer.cornerRadius = headImageView.size.width / 2;
    [headBGView addSubview:headImageView];
    
    //头像点击
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTapAction:)];
    headImageView.userInteractionEnabled = YES;
    [headImageView addGestureRecognizer:tap];
    

    //用户名
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, 15*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT)];
    userNameLabel.textColor = SubNameColor;
    userNameLabel.font = Font13;
    userNameLabel.text = @"水冰月";
    [self addSubview:userNameLabel];
    
    //性别
    sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(userNameLabel.right + 5*WIDTH_NIT, 17*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT)];
    sexImageView.image = [UIImage imageNamed:@"nan"];
    [self addSubview:sexImageView];
    
    //等级
    levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(sexImageView.right + 2*WIDTH_NIT, 15*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT)];
    levelLabel.textAlignment = NSTextAlignmentCenter;
    levelLabel.layer.borderWidth = 0.6;
    levelLabel.layer.borderColor = MainGoldColor.CGColor;
    levelLabel.textColor = MainGoldColor;
    levelLabel.font = Font13;
    levelLabel.text = @"Lv15";
    [self addSubview:levelLabel];
    
    
    
    //电话
    phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(headImageView.right + 10*WIDTH_NIT, userNameLabel.bottom + 5*WIDTH_NIT, 150*WIDTH_NIT, 20*WIDTH_NIT)];
    phoneLabel.textColor = LightNameColor;
    phoneLabel.font = Font12;
    phoneLabel.text = @"手机号：15683062326";
    [headBGView addSubview:phoneLabel];
    
    

}


#pragma mark -- 喵区域
-(void)setupMiaoView{
    
    //喵币
    miaobBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, miaoBGView.width/3, miaoBGView.height)];
    miaobBtn.tag = 1;
    miaobBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    miaobBtn.titleLabel.numberOfLines = 0;
    [miaobBtn setTitleColor:LightNameColor];
    [miaobBtn setTitle:@"0\n猫币"];
    [miaobBtn addTarget:self action:@selector(buttonAct:)];
    [miaoBGView addSubview:miaobBtn];
    
    
    //分割线
    UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(miaobBtn.right-1, 10*WIDTH_NIT, 1, miaoBGView.height-20*WIDTH_NIT)];
    line1.backgroundColor = BGColor;
    [miaoBGView addSubview:line1];
    
    //余额
    yueBtn = [[UIButton alloc]initWithFrame:CGRectMake(miaobBtn.right, 0, miaoBGView.width/3, miaoBGView.height)];
    yueBtn.tag = 2;
    yueBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    yueBtn.titleLabel.numberOfLines = 0;
    [yueBtn setTitleColor:LightNameColor];
    [yueBtn setTitle:@"0\n余额"];
    [yueBtn addTarget:self action:@selector(buttonAct:)];
    [miaoBGView addSubview:yueBtn];
    
    //分割线
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(yueBtn.right-1, 10*WIDTH_NIT, 1, miaoBGView.height-20*WIDTH_NIT)];
    line2.backgroundColor = BGColor;
    [miaoBGView addSubview:line2];
    
    //喵友
    miaoyBtn = [[UIButton alloc]initWithFrame:CGRectMake(yueBtn.right, 0, miaoBGView.width/3, miaoBGView.height)];
    miaoyBtn.tag = 3;
    miaoyBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    miaoyBtn.titleLabel.numberOfLines = 0;
    [miaoyBtn setTitleColor:LightNameColor];
    [miaoyBtn setTitle:@"0\n喵友"];
    [miaoyBtn addTarget:self action:@selector(buttonAct:)];
    [miaoBGView addSubview:miaoyBtn];
    
    
}








#pragma mark -- 点击事件

//点击头像
- (void)headTapAction:(UITapGestureRecognizer *)tap {
    if (self.userId && self.headClickBlock) {
        self.headClickBlock(self.userId);
    }
}

#pragma mark --- 加入按钮点击实现
#pragma mark -- 0 为跳转用户详情 123分别跳转 喵币、余额、喵友
-(void)buttonAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    NSLog(@">>>>>>>tag:%ld",(long)tag);
    
    if ([self.delegate respondsToSelector:@selector(fourHeadViewSelect2go:)]) {
        [self.delegate fourHeadViewSelect2go:tag];
        NSLog(@"跳转 %ld",(long)tag);
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
