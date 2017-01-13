//
//  AddPartyTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/13.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "AddPartyTableViewCell.h"
#import "AddPartyCellModel.h"
#import "CommonHeader.h"

@interface AddPartyTableViewCell ()<UITextFieldDelegate>
@end

@implementation AddPartyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark - setup method
- (void)setupViews {
    _starImage = [[UIImageView alloc] initWithFrame:CGRectMake(13, 20, 8, 8)];
    _starImage.image = [UIImage imageNamed:@"star_red"];
    [self.contentView addSubview:_starImage];
    
    CGSize titleSize = [@"" getWidth:@"所在地区：" andFont:[UIFont systemFontOfSize:16]];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_starImage.right + 3, 14, titleSize.width + 3, 20)];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_titleLabel];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(_titleLabel.right - 5, 47, kScreen_Width - _titleLabel.right + 5, 1)];
    _bottomLine.backgroundColor = BGColor;
    [self.contentView addSubview:_bottomLine];
    
    _detailText = [[UITextField alloc] initWithFrame:CGRectMake(_titleLabel.right, 14, kScreen_Width - _titleLabel.right - 30, 20)];
    _detailText.delegate = self;
    [self.contentView addSubview:_detailText];
    
    _downArrow = [[UIImageView alloc] initWithFrame:CGRectMake(_detailText.right , 0, 30, 48)];
    _downArrow.image = [UIImage imageNamed:@"icon_DisclosureIndicator"];
    [self.contentView addSubview:_downArrow];
}

- (void)setupDetailTextView {
    
}


#pragma mark - setter
- (void)setCellModel:(AddPartyCellModel *)cellModel {
    _titleLabel.text = @"";
    _cellModel = nil;
    _cellModel = cellModel;
    _starImage.hidden = !_cellModel.showStar;
    _titleLabel.text = _cellModel.titleText;
    
    
    if (_cellModel.fullScreenSeperateLine) {
        _bottomLine.left = 0;
        _bottomLine.width = kScreen_Width;
    }
    else
    {
        _bottomLine.left = _titleLabel.right - 5;
        _bottomLine.width = kScreen_Width - _titleLabel.right + 5;
    }
    
    if (_cellModel.selectType == AddPartyCellTypePhone) {
        _bottomLine.left = 0;
        _bottomLine.width = kScreen_Width-35*WIDTH_NIT;
        _titleLabel.frame = CGRectMake(0, 0, 0, 0);
        _detailText.frame = CGRectMake(0, 14, kScreen_Width - 30, 20);
    }
    if (_cellModel.selectType == AddPartyCellTypeMap) {
        UIImageView *addressImage = [[UIImageView alloc]initWithFrame:CGRectMake(_detailText.right, 12, 16, 24)];
        addressImage.image = [UIImage imageNamed:@"icon_location_blue"];
        [self.contentView addSubview:addressImage];
    }
    
    [self configDetailTextByModel:_cellModel];
    _downArrow.hidden = !_cellModel.showDownArrow;
}

- (void)configDetailTextByModel:(AddPartyCellModel *)cellModel {
    
    _detailText.placeholder = cellModel.placeHolderText;
    if (cellModel.placeHolderLeft) {
        _detailText.textAlignment = NSTextAlignmentLeft;
    }else {
        _detailText.textAlignment = NSTextAlignmentRight;
    }
    _detailText.text = cellModel.detailText;
    
    if ((cellModel.selectType == AddPartyCellTypeTextField) || (cellModel.selectType == AddPartyCellTypePhone)) {
        _detailText.enabled = YES;
    }else{
        _detailText.enabled = NO;
    }
    
}

#pragma mark - textField delegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (_cellModel.selectType == AddPartyCellTypePhone) {
        if (![NSString valiMobile:textField.text]) {
            //            textField.text = @"";
            ALERTTK(nil, @"请输入正确电话的号码");
            return;
        }
    }
    
    
    
    if (textField.text.length > 0) {
        _cellModel.detailText = textField.text;
    }
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
