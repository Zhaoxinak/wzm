//
//  OneChosenCasesTableViewCell.h
//  ZXProject
//
//  Created by Mr.X on 2016/12/13.
//  Copyright © 2016年 Mr.X. All rights reserved.
//
//改装百科

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
#import "HomePageModel.h"

//cell高度
#define OneChosenCasesCell_Height kScreen_Width/4*3


@interface OneChosenCasesTableViewCell : UITableViewCell{
    
    UIView *topLine; //顶部分割线
    UIImageView *avatarView; //图片
    UIButton *avatarBtn; //图片点击
    UILabel *name; //标题
    UILabel *subName; //内容
    UIButton *scanBtn; //浏览者
    UIButton *zanBtn; //赞
}

@property (nonatomic, strong) NSString *avatarUrl; //图片地址
@property (nonatomic, strong) NSString *nameStr; //标题
@property (nonatomic, strong) NSString *subNameStr; //内容
@property (nonatomic, strong) NSString *scanStr; //浏览者
@property (nonatomic, strong) NSString *zanStr; //赞
@property (nonatomic, strong) HomePageModel *model; //模型


@end
