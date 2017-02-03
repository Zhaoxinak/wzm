//
//  MyMiaoQuestionsTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/3.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMiaoQuestionsModel.h"

typedef NS_ENUM(NSUInteger, MyMiaoQuestionsCellMode) {
    
    AskCellMode,  //提问
    AnswerCellMode, //回答
    
};

//cell高度
#define MyMiaoQuestionsCell_Height kScreen_Width/4

@interface MyMiaoQuestionsTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIView *bottomLine; //底部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *time; //时间
    
    UILabel *myReply; //我的回复
 
}

@property (nonatomic, strong) MyMiaoQuestionsModel *model; //模型
@property (nonatomic, assign) MyMiaoQuestionsCellMode mode; //类型

-(void)setModel:(MyMiaoQuestionsModel *)model setMode:(MyMiaoQuestionsCellMode)mode;


@end
