//
//  AddPicturesCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddPicturesCell;
@protocol AddPicturesCellDelegate <NSObject>

@optional

- (void)addButtonClick:(UIButton *)sender inCell:(AddPicturesCell *)cell;
- (void)delePicClick:(UIButton *)sender inCell:(AddPicturesCell *)cell;

@end


@interface AddPicturesCell : UITableViewCell

@property (nonatomic, weak) id<AddPicturesCellDelegate> delegate;

@property (nonatomic, strong) NSArray *picArray;

//计算cell高度
+ (CGFloat)caculateAddPicturesCellHeightWithPictureArray:(NSArray *)array;


@end
