//
//  AddPicturesCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "AddPicturesCell.h"
#import "AddPictureModel.h"
#import "CommonHeader.h"

static NSString *tipContent1 = @"请添加相关图片";
static NSString *tipContent2 = @"";


static NSInteger kAddButtonTag = 9999;

@interface AddPicturesCell()

@property (nonatomic ,strong) UILabel *addPictureLabel;

//底部提示label
@property (nonatomic, strong) UILabel *tipLabel;


@end


@implementation AddPicturesCell

#pragma mark - class method
+ (CGFloat)caculateAddPicturesCellHeightWithPictureArray:(NSArray *)array {
    NSInteger picNum = array.count;
    CGFloat picWidth = 64*WIDTH_NIT;
    
    CGSize tipSize = [tipContent2 boundingRectWithSize:CGSizeMake(kScreen_Width - 34, MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}
                                               context:nil].size;
    return ((picNum / 3 + 1) * (picWidth + 15) + 70 + tipSize.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - instance method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
    }
    return self;
}

#pragma mark - setup method
- (void)setupViews {
    [self setupTitleLabel];
    [self setupTipLabel];
    [self setupPictureViewWithPictureArray:nil];
}

- (void)setupTitleLabel {
    _addPictureLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 90, 16)];
    _addPictureLabel.font = Font15;
    _addPictureLabel.textColor = NameColor;;
    _addPictureLabel.text = @"主题图片";
    [self.contentView addSubview:_addPictureLabel];
}

- (void)setupTipLabel {
    _tipLabel = [[UILabel alloc] init];
    _tipLabel.font = [UIFont systemFontOfSize:12];
    _tipLabel.numberOfLines = 0;
    _tipLabel.text = tipContent1;
    
    _tipLabel.size = [_tipLabel.text boundingRectWithSize:CGSizeMake(kScreen_Width - 34, MAXFLOAT)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}
                                                  context:nil].size;
    _tipLabel.left = 17;
    _tipLabel.textColor = NameColor;
    [self.contentView addSubview:_tipLabel];
}

- (void)setupPictureViewWithPictureArray:(NSArray *)array {
    NSMutableArray *picArray = [[NSMutableArray alloc] initWithArray:array];
    
    if (picArray.count >=5) {
        
    }else{
        AddPictureModel *addModel = [[AddPictureModel alloc] init];
        addModel.addImage = [UIImage imageNamed:@"kongbai"];
        addModel.modelType = AddPictureTypeAddButton;
        [picArray addObject:addModel];
    }
    
    
    
    CGFloat picWidth = 64*WIDTH_NIT;
    for (int i = 0; i < picArray.count; i++) {
        AddPictureModel *picModel = picArray[i];
        UIButton *addImageView = [self setupImageViewWithModel:picModel index:i];
        if (i % 3 == 0) {
            addImageView.left = 14;
        }else if (i % 3 == 1) {
            addImageView.center = self.center;
        }else {
            addImageView.right = kScreen_Width - 16;
        }
        addImageView.top = 50 + (i / 3) * (picWidth + 15);
        [self.contentView addSubview:addImageView];
    }
    _tipLabel.top = ((picArray.count - 1) / 3 + 1) * (picWidth + 15) + 50;
}

- (UIButton *)setupImageViewWithModel:(AddPictureModel *)model index:(int)index{
    CGFloat picWidth = 64*WIDTH_NIT;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, picWidth, picWidth)];
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
        deleBtn.tag = index +1000;
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
- (void)setPicArray:(NSArray *)picArray {
    [self clearAllImageViews];
    _picArray = picArray;
    _tipLabel.text = tipContent1;
    _addPictureLabel.text = @"主题照片";
    [self setupPictureViewWithPictureArray:_picArray];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
