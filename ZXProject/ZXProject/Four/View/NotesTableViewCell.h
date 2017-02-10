//
//  NotesTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/24.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotesModel.h"

typedef NS_ENUM(NSUInteger, NotesCellMode) {
    
    MainNoteCellMode,  //主贴
    FollowNoteCellMode, //跟帖
 
    
};


//cell高度
#define NotesCell_Height 130*WIDTH_NIT

@interface NotesTableViewCell : UITableViewCell
{
    UIView *topLine; //顶部分割线
    UIView *bottomLine; //底部分割线
    UIImageView *picView; //图片
    UIButton *picBtn; //图片点击
    UILabel *name; //标题
    UILabel *subName; //内容
    UILabel *time; //时间
    
    UILabel *myReply; //我的回复
    UIButton *commentBtn; //评论数
}

@property (nonatomic, strong) NotesModel *model; //模型
@property (nonatomic, assign) NotesCellMode mode; //类型

-(void)setModel:(NotesModel *)model setMode:(NotesCellMode)mode;


@end
