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
    
    self.height = 50*WIDTH_NIT;
    
    _starImage = [[UIImageView alloc] initWithFrame:CGRectMake(0*WIDTH_NIT, 20*WIDTH_NIT, 8*WIDTH_NIT, 8*WIDTH_NIT)];
    _starImage.image = [UIImage imageNamed:@"star_red"];
    [self.contentView addSubview:_starImage];
    
    CGSize titleSize = [@"" getWidth:@"这是五个字" andFont:Font15];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_starImage.right + 3*WIDTH_NIT, self.height/2-10*WIDTH_NIT, titleSize.width + 3*WIDTH_NIT, 20*WIDTH_NIT)];
    _titleLabel.textColor = NameColor;
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = Font15;
    [self.contentView addSubview:_titleLabel];
    
    _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(_titleLabel.right - 5*WIDTH_NIT, self.height - 1*WIDTH_NIT, kScreen_Width - _titleLabel.right + 5*WIDTH_NIT, 1*WIDTH_NIT)];
    _bottomLine.backgroundColor = BGColor;
    [self.contentView addSubview:_bottomLine];
    
    _detailText = [[UITextField alloc] initWithFrame:CGRectMake(_titleLabel.right, self.height/2-10*WIDTH_NIT, kScreen_Width - _titleLabel.right - 30*WIDTH_NIT, 20*WIDTH_NIT)];
    _detailText.textColor = NameColor;
    _detailText.font = Font15;
    _detailText.delegate = self;
    [self.contentView addSubview:_detailText];
    
    _downArrow = [[UIImageView alloc] initWithFrame:CGRectMake(_detailText.right , 0, 30*WIDTH_NIT, 48*WIDTH_NIT)];
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
        
        _detailText.keyboardType = UIKeyboardTypePhonePad;
    }
    
    if (_cellModel.selectType == AddPartyCellTypeCost) {
        
        _detailText.keyboardType = UIKeyboardTypeDecimalPad;
    }
    
    if (_cellModel.selectType == AddPartyCellTypeNumLimit) {
        
        _detailText.keyboardType = UIKeyboardTypeNumberPad;
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
    
    if ((cellModel.selectType == AddPartyCellTypeTextField) || (cellModel.selectType == AddPartyCellTypePhone) ||  (cellModel.selectType == AddPartyCellTypeCost) ||  (cellModel.selectType == AddPartyCellTypeNumLimit)) {
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
