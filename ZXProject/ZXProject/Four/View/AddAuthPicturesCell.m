//
//  AddAuthPicturesCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/2/4.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "AddAuthPicturesCell.h"
#import "CommonHeader.h"
#import "AddPictureModel.h"



static NSInteger kAddButtonTag = 9999;

@interface AddAuthPicturesCell()

@end



@implementation AddAuthPicturesCell

#pragma mark - instance method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


#pragma mark - setup method
- (void)setupViews {
    [self setupTitleLabel];
    [self setupPictureViewWithPicture:nil];
}

- (void)setupTitleLabel {
   
    addPictureLabel = [[UILabel alloc] initWithFrame:CGRectMake(10*WIDTH_NIT, 0, kScreen_Width-20*WIDTH_NIT, 20*WIDTH_NIT)];
    addPictureLabel.font = [UIFont systemFontOfSize:14];
    addPictureLabel.textColor = ThreeTextColor;
    addPictureLabel.text = @"";
    [self.contentView addSubview:addPictureLabel];
    
    //分割线
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(10*WIDTH_NIT, addPictureLabel.bottom, kScreen_Width-20*WIDTH_NIT, 1)];
    line.backgroundColor = BGColor;
    [self.contentView addSubview:line];
}

- (void)setupPictureViewWithPicture:(UIImage *)picImage{

    AddPictureModel *addModel = [[AddPictureModel alloc] init];
    
    if (!picImage) {
        addModel.addImage = [UIImage imageNamed:@"photo_add"];
        addModel.modelType = AddPictureTypeAddButton;
        
    }
    
    AddPictureModel *picModel = addModel;
    UIButton *addImageView = [self setupImageViewWithModel:picModel];
    addImageView.center = self.center;
    addImageView.top = addPictureLabel.bottom + 10*WIDTH_NIT;
    
    [self.contentView addSubview:addImageView];
}


- (UIButton *)setupImageViewWithModel:(AddPictureModel *)model{
    
    CGFloat picWidth = kScreen_Width/3*2;
    CGFloat picHeight = kScreen_Width/9*4;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, picWidth, picHeight)];
    imageView.image = model.addImage;
    
    UIButton *imageButton = [[UIButton alloc] initWithFrame:imageView.bounds];
    [imageButton addTarget:self action:@selector(imageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    imageView.userInteractionEnabled = NO;
    [imageButton addSubview:imageView];
    if (model.modelType == AddPictureTypeAddButton) {
        imageButton.tag = kAddButtonTag;
    }else {
        
        UIButton *deleBtn = [[UIButton alloc]initWithFrame:CGRectMake(imageButton.width-20, 0, 20, 20)];
        deleBtn.layer.cornerRadius = 10;
        [deleBtn setBackgroundImage:[UIImage imageNamed:@"pic_delete"] forState:UIControlStateNormal];
        [deleBtn addTarget:self action:@selector(imageDelete:) forControlEvents:UIControlEventTouchUpInside];
        [imageButton addSubview:deleBtn];
    }
    
    return imageButton;
    
    
    
}

#pragma mark - private
- (void)clearAllImageViews {
    for (UIView *view in self.contentView.subviews) {
        if ([view isKindOfClass:[UIButton class]] || [view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
}

#pragma mark - action
- (void)imageButtonClick:(UIButton *)sender {
    if (sender.tag == kAddButtonTag) {
        if ([_delegate respondsToSelector:@selector(addButtonClick:inCell:)]) {
            [_delegate addButtonClick:sender inCell:self];
        }
    }
}

#pragma mark - action
- (void)imageDelete:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(delePicClick:inCell:)]) {
        [_delegate delePicClick:sender inCell:self];
    }
    
}


#pragma  mark - setter
- (void)setPicImage:(UIImage *)picImage setTip:(NSString *)tipContent{
    [self clearAllImageViews];
    _picImage = picImage;
    addPictureLabel.text = tipContent;
    [self setupPictureViewWithPicture:_picImage];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
