//
//  AddAuthPicturesCell.h
//  ZXProject
//
//  Created by Mr.X on 2017/2/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPictureModel.h"

@class AddAuthPicturesCell;
@protocol AddAuthPicturesCellCellDelegate <NSObject>

@optional

- (void)addButtonClick:(UIButton *)sender inCell:(AddAuthPicturesCell *)cell;
- (void)delePicClick:(UIButton *)sender inCell:(AddAuthPicturesCell *)cell;

@end



//cell高度
#define AddAuthPicturesCell_Height kScreen_Width/3*2

@interface AddAuthPicturesCell : UITableViewCell
{
    UILabel *addPictureLabel;
    
}

@property (nonatomic, weak) id<AddAuthPicturesCellCellDelegate> delegate;

- (void)setPicModel:(AddPictureModel *)model index:(NSInteger)index;
@end
