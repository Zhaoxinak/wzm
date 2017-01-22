//
//  PersonalMainOneTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/22.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PersonalMainOneTableViewCell.h"
#import "CommonHeader.h"

@implementation PersonalMainOneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setupView {
    

    _headerImgView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerImgView];
    
    _headerImgView.backgroundColor = [UIColor clearColor];
    _headerImgView.image = [UIImage imageNamed:@"heard_img"];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = OneTextColor;
    _titleLabel.font = TwoFont;
    [self.contentView addSubview:_titleLabel];
    
  
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.textAlignment = NSTextAlignmentRight;
    _detailLabel.textColor = TwoTextColor;
    _detailLabel.height = 18;
    _detailLabel.font = TwoFont;
    [self.contentView addSubview:_detailLabel];
    

    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
