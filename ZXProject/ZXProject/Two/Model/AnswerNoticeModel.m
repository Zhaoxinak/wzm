//
//  AnswerNoticeModel.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/20.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "AnswerNoticeModel.h"
#import "CommonHeader.h"

@implementation AnswerNoticeModel

@end

@implementation AnswerNoticeFrameModel

- (void)setModel:(AnswerNoticeModel *)model {
    _model = model;
    
    
    //头像
    self.headImageViewFrame = CGRectMake(10*WIDTH_NIT, 20*WIDTH_NIT, 40*WIDTH_NIT, 40*WIDTH_NIT);
    
    //用户名
    self.userNameLabelFrame = CGRectMake(CGRectGetMaxX(self.headImageViewFrame) + 5*WIDTH_NIT, 30*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT);
    
    //等级
    self.levelLabelFrame = CGRectMake(CGRectGetMaxX(self.userNameLabelFrame) + 2*WIDTH_NIT, 30*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT);
    
    //性别
    self.sexImageViewFrame = CGRectMake(CGRectGetMaxX(self.levelLabelFrame) + 5*WIDTH_NIT, 32*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT);
    
    
    //时间
    self.timeLabelFrame = CGRectMake(CGRectGetMaxX(self.headImageViewFrame) + 5*WIDTH_NIT, CGRectGetMaxY(self.userNameLabelFrame) + 2*WIDTH_NIT, kScreen_Width/2, 20*WIDTH_NIT);
    
    //回复
    self.commentBtnFrame = CGRectMake(kScreen_Width-62*WIDTH_NIT, 20*WIDTH_NIT, 52*WIDTH_NIT, 26*WIDTH_NIT);
    
    
    //标题
    NSString *comment = @"这是路人甲的回答，只显示15个字";
    if (comment.length >0) {
        CGSize contentSize = [self sizeWithString:comment font:Font13 maxSize:CGSizeMake(kScreen_Width-20*WIDTH_NIT, MAXFLOAT)];
        
        self.titleNameLabelFrame = CGRectMake(10*WIDTH_NIT, CGRectGetMaxY(self.timeLabelFrame) +10*WIDTH_NIT, contentSize.width, contentSize.height);
    }else{
        self.titleNameLabelFrame = CGRectMake(10*WIDTH_NIT, CGRectGetMaxY(self.timeLabelFrame) +10*WIDTH_NIT, 0, 0);
    }
    
    //详情内容
    self.detailViewFrame = CGRectMake(10*WIDTH_NIT, CGRectGetMaxY(self.titleNameLabelFrame) + 10*WIDTH_NIT, kScreen_Width-20*WIDTH_NIT, kScreen_Width/4);
    
    //总高度
    self.cellHeight = CGRectGetMaxY(self.detailViewFrame) + 20*WIDTH_NIT;
}

/*  计算文本的高
 @param str   需要计算的文本
 @param font  文本显示的字体
 @param maxSize 文本显示的范围，可以理解为limit
 
 @return 文本占用的真实宽高
 */
-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

- (void)configFrameByModel:(id)model {
    
}

@end
