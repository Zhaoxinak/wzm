//
//  MoreFunctionView.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "MoreFunctionView.h"
#import "CommonHeader.h"

@implementation MoreFunctionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置视图
        [self setupView];
       
    }
    return self;
}

#pragma mark --- 设置视图
-(void)setupView{
    
    self.backgroundColor = MainBlackColor;
    
    CGFloat btnW = (kScreen_Width-20*WIDTH_NIT)/4;
    
    
    //点赞
    self.zanBtn = [[UIButton alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, 0, btnW, self.height)];
    self.zanBtn.tag = 0;
    [self.zanBtn setImage:@"zan"];
    [self.zanBtn addTarget:self action:@selector(btnAct:)];
    [self addSubview:self.zanBtn];
    
    //收藏
    self.collectBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.zanBtn.right, 0, btnW, self.height)];
    self.collectBtn.tag = 1;
    [self.collectBtn setImage:@"xing"];
    [self.collectBtn addTarget:self action:@selector(btnAct:)];
    [self addSubview:self.collectBtn];
    
    //分享
    self.shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.collectBtn.right, 0, btnW, self.height)];
    self.shareBtn.tag = 2;
    [self.shareBtn setImage:@"fenxiang"];
    [self.shareBtn addTarget:self action:@selector(btnAct:)];
    [self addSubview:self.shareBtn];
    
    //评论
    self.commentBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.shareBtn.right, 0, btnW, self.height)];
    self.commentBtn.tag = 3;
    [self.commentBtn setImage:@"xinxi"];
    [self.commentBtn addTarget:self action:@selector(btnAct:)];
    [self addSubview:self.commentBtn];
}



#pragma mark -- 实现按钮 0为点赞 1为收藏 2为分享 3评论
-(void)btnAct:(UIButton *)button{
    
    NSInteger tag = button.tag;
    if ([self.delegate respondsToSelector:@selector(moreFunctionViewSelect2go:)]) {
        [self.delegate moreFunctionViewSelect2go:tag];
        NSLog(@">>>>>>>tag:%ld",(long)tag);
    }
    
}


@end
