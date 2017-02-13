//
//  OneMiaoQuestionSquareModel.m
//  ZXProject
//
//  Created by Mr.X on 2016/12/26.
//  Copyright © 2016年 Mr.X. All rights reserved.
//

#import "OneMiaoQuestionSquareModel.h"

@implementation OneMiaoQuestionSquareModel

@end

@implementation OneMiaoQuestionSquareFrameModel

- (void)setModel:(OneMiaoQuestionSquareModel *)model {
    _model = model;
    
    //头像
    self.headImageViewFrame = CGRectMake(15*WIDTH_NIT, 10*WIDTH_NIT, 30*WIDTH_NIT, 30*WIDTH_NIT);
    
    //用户名
    self.userNameLabelFrame = CGRectMake(CGRectGetMaxX(self.headImageViewFrame) + 5*WIDTH_NIT, 12*WIDTH_NIT, 100*WIDTH_NIT, 20*WIDTH_NIT);
    
    //等级
    self.levelLabelFrame = CGRectMake(CGRectGetMaxX(self.userNameLabelFrame) + 2*WIDTH_NIT, 12*WIDTH_NIT, 30*WIDTH_NIT, 18*WIDTH_NIT);
    
    //性别
    self.sexImageViewFrame = CGRectMake(CGRectGetMaxX(self.levelLabelFrame) + 5*WIDTH_NIT, 12*WIDTH_NIT, 15*WIDTH_NIT, 15*WIDTH_NIT);
    
    
    //标题
    NSString *title = @"阿斯顿发送到发送到发送到发送到发抖上发呆发呆舒服的沙发多少发多少发多少分";
    if (title.length >0) {
        CGSize contentSize = [self sizeWithString:title font:Font14 maxSize:CGSizeMake(kScreen_Width-55*WIDTH_NIT, MAXFLOAT)];
        
        self.titleNameLabelFrame = CGRectMake(50*WIDTH_NIT, CGRectGetMaxY(self.headImageViewFrame) + 5*WIDTH_NIT, contentSize.width, contentSize.height);
    }else{
        self.titleNameLabelFrame = CGRectMake(50*WIDTH_NIT, CGRectGetMaxY(self.headImageViewFrame) + 5*WIDTH_NIT, 0, 0);
    }
    
    //内容
    NSString *comment = @"内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容";
    if (comment.length >0) {
        CGSize contentSize = [self sizeWithString:comment font:Font14 maxSize:CGSizeMake(kScreen_Width-55*WIDTH_NIT, MAXFLOAT)];
        
        self.subNameLabelFrame = CGRectMake(45*WIDTH_NIT, CGRectGetMaxY(self.titleNameLabelFrame) + 5*WIDTH_NIT, contentSize.width, contentSize.height);
    }else{
        self.subNameLabelFrame = CGRectMake(45*WIDTH_NIT, CGRectGetMaxY(self.titleNameLabelFrame) + 5*WIDTH_NIT, 0, 0);
    }
    
    
    //图组
    if ([_model.pics[@"picCount"] integerValue] > 0) {
        self.imageArrayFrame = CGRectMake(15*WIDTH_NIT, CGRectGetMaxY(self.subNameLabelFrame) + 10*WIDTH_NIT, 100*WIDTH_NIT, 100*WIDTH_NIT);
    } else {
        self.imageArrayFrame = CGRectMake(15*WIDTH_NIT, CGRectGetMaxY(self.subNameLabelFrame) + 10*WIDTH_NIT, 100*WIDTH_NIT, 0);
    }
    
    
    //时间
    self.timeLabelFrame = CGRectMake(CGRectGetMaxX(self.headImageViewFrame) + 0*WIDTH_NIT, CGRectGetMaxY(self.imageArrayFrame) + 5*WIDTH_NIT, kScreen_Width/6, 20*WIDTH_NIT);
    
    //评论数
    self.commentNumFrame = CGRectMake(CGRectGetMaxX(self.timeLabelFrame) + 10*WIDTH_NIT, CGRectGetMaxY(self.imageArrayFrame) + 5*WIDTH_NIT, kScreen_Width/6, 20*WIDTH_NIT);
    
    
    //评论
    self.commentBtnFrame = CGRectMake(kScreen_Width/6*5, CGRectGetMaxY(self.imageArrayFrame) + 5*WIDTH_NIT, kScreen_Width/6, 20*WIDTH_NIT);
    
    //总高度
    self.cellHeight = CGRectGetMaxY(self.commentBtnFrame) + 20*WIDTH_NIT;
    
    
  
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
