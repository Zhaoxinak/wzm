//
//  PersonalInfoTableViewCell.m
//  ZXProject
//
//  Created by Mr.X on 2017/1/11.
//  Copyright © 2017年 Mr.X. All rights reserved.
//

#import "PersonalInfoTableViewCell.h"
#import "CommonHeader.h"

@implementation PersonalInfoTableViewCell
{
    UIView *topSeprateLine;
    UIView *bottomSeprateLine;
}

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
    
    topSeprateLine = [[UIView alloc] init];
    topSeprateLine.backgroundColor = BGColor;
    [self.contentView addSubview:topSeprateLine];
    
    bottomSeprateLine = [[UIView alloc] init];
    bottomSeprateLine.backgroundColor = BGColor;
    [self.contentView addSubview:bottomSeprateLine];
    
    
    _headerImgView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerImgView];
    
    _headerImgView.backgroundColor = [UIColor clearColor];
    _headerImgView.image = [UIImage imageNamed:@"heard_img"];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = OneTextColor;
    _titleLabel.font = TwoFont;
    [self.contentView addSubview:_titleLabel];
    
    _arrowImgView = [[UIImageView alloc] init];
    _arrowImgView.image = [UIImage imageNamed:@"icon_DisclosureIndicator"];
    [self.contentView addSubview:_arrowImgView];
    
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.textAlignment = NSTextAlignmentRight;
    _detailLabel.textColor = TwoTextColor;
    _detailLabel.height = 18;
    _detailLabel.font = TwoFont;
    [self.contentView addSubview:_detailLabel];
    
    _vipImageView = [UIImageView new];
    _vipImageView.image = [UIImage imageNamed:@"icon_vip"];
    [self.contentView addSubview:_vipImageView];
    
}

-(void)tapHeadAct{
    NSLog(@"点击头像");
    [self.delegate didPersonalHeadView2go];
}

- (void)setInfoCellMode:(PersonalInfoCellMode)infoCellMode {
    _infoCellMode = infoCellMode;
    [self updateFrame];
}

- (void)updateFrame {
    [topSeprateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
    
    if (!_isHiddenBottomLine) {
        [bottomSeprateLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@0.5);
        }];
    }
    
    _headerImgView.hidden = YES;
    _arrowImgView.hidden = YES;
    switch (_infoCellMode) {
        case HeaderCellMode:
        {
            
            _headerImgView.left = kScreen_Width -100;
            _headerImgView.top = 15;
            _headerImgView.width = 60;
            _headerImgView.height = 60;
            _headerImgView.layer.cornerRadius = 30;
            _headerImgView.layer.masksToBounds = YES;
            _headerImgView.hidden = NO;
            
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(14);
                make.centerY.equalTo(@0);
            }];
            
            
            _arrowImgView.hidden = NO;
            [_arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).offset(-13);
                make.centerY.equalTo(@((0+2)*WIDTH_NIT));
                make.width.equalTo(@30);
                make.height.equalTo(@48);
            }];
        
            UIButton * tapHeadView = [[UIButton alloc]initWithFrame:CGRectMake(kScreen_Width -100, 15, 60, 60)];
            [tapHeadView addTarget:self action:@selector(tapHeadAct) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:tapHeadView];
            
            
            _vipImageView.frame = CGRectMake(CGRectGetMaxX(_headerImgView.frame)-13*WIDTH_NIT-5*WIDTH_NIT, CGRectGetMaxY(_headerImgView.frame)-13*WIDTH_NIT, 13*WIDTH_NIT, 13*WIDTH_NIT);
            
        }
            break;
            
        case ArrowCellMode:
        {
            
            _arrowImgView.hidden = NO;
            [_arrowImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).offset(-13);
                make.centerY.equalTo(@((0+2)*WIDTH_NIT));
                make.width.equalTo(@30);
                make.height.equalTo(@48);
            }];
            
            [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(_arrowImgView.mas_left).offset(0);
                
                make.centerY.equalTo(@0);
            }];
            
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(14);
                
                make.width.equalTo(@100);
                make.centerY.equalTo(@0);
            }];
        }
            break;
        case UsualCellMode:
        {
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(14);
                make.centerY.equalTo(@0);
            }];
            
            [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView.mas_right).offset(-43);
                make.centerY.equalTo(@0);
            }];
        }
            break;
            
        default:
            break;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
