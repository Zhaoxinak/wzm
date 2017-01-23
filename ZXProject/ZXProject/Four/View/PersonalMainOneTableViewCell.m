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

#pragma mark - class method
+ (CGFloat)caculatePersonalMainCellHeightWithTitle:(NSString *)title SubTitle:(NSString *)subTitle         PictureArrayNum:(NSInteger)arrayNum MainCellMode:(PersonalMainCellMode)mainCellMode{
    
    NSInteger picNum = arrayNum;
    CGFloat picHeight = 0;
    
    
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(kScreen_Width - 20*WIDTH_NIT, MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName:TwoFont}
                                               context:nil].size;
   
    CGSize subTitleSize = [subTitle boundingRectWithSize:CGSizeMake(kScreen_Width - 20*WIDTH_NIT, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:TwoFont}
                                         context:nil].size;
    
    
    switch (mainCellMode) {
       
        case UsualCellMode:{
            
            picHeight = (kScreen_Width-20*WIDTH_NIT)/5;
            CGFloat height = titleSize.height + subTitleSize.height + 30*WIDTH_NIT;
            
            return MAX(height, 80*WIDTH_NIT);
        }
            
            break;
            
        
        case FollowCarsCellMode:{
            
            picHeight = (kScreen_Width-20*WIDTH_NIT)/5;
            CGFloat height = ((picNum / 6 + 1) * (picHeight + 10*WIDTH_NIT) + 50*WIDTH_NIT + titleSize.height);
            
            return MAX(height, 100*WIDTH_NIT);
        }
            
            break;
            
        case ModifiedCarsCellMode:{
            
            picHeight = (kScreen_Width-80*WIDTH_NIT)/3/2;
            CGFloat height = ((picNum / 4 + 1) * (picHeight + 20*WIDTH_NIT) + 50*WIDTH_NIT + titleSize.height);
            
            return MAX(height, 80*WIDTH_NIT);
        }
            
            break;
        default:
            break;
    }
    
    
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
    

    _headerImgView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerImgView];
    
    _headerImgView.backgroundColor = [UIColor redColor];
//    _headerImgView.image = [UIImage imageNamed:@"heard_img"];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = OneTextColor;
    _titleLabel.font = TwoFont;
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
    
  
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.textColor = TwoTextColor;
    _detailLabel.font = TwoFont;
    _detailLabel.numberOfLines = 0;
    [self.contentView addSubview:_detailLabel];
    
    
    _picView = [[UIView alloc]init];
    _picView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_picView];
    
  
    
}

- (void)setMainCellMode:(PersonalMainCellMode)mainCellMode model:(PersonalMainModel *)model{
    _mainCellMode = mainCellMode;
    _model = model;
    
    
    
    
    [self updateFrame];
}

- (void)updateFrame {
    
    _headerImgView.hidden = YES;
    _titleLabel.hidden = YES;
    _detailLabel.hidden = YES;
    _picView.hidden = YES;
    
    switch (_mainCellMode) {
        case UsualCellMode:
        {
            _titleLabel.hidden = NO;
            _detailLabel.hidden = NO;
            
            //判断是否有图片
//            if (_headerImgView.image) {
            
                _headerImgView.hidden = NO;
                _headerImgView.frame = CGRectMake(10*WIDTH_NIT, 10*WIDTH_NIT, 60*WIDTH_NIT, 60*WIDTH_NIT);
            
            
                [_headerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(@(10*WIDTH_NIT));
                    make.top.equalTo(@(10*WIDTH_NIT));
                    make.width.height.equalTo(@(60*WIDTH_NIT));
                }];
             
//            }
            
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.headerImgView.mas_right).offset(10*WIDTH_NIT);
                make.top.equalTo(@(10*WIDTH_NIT));
                make.width.equalTo(@(kScreen_Width-self.headerImgView.width-30*WIDTH_NIT));
            }];
            
            
            
            [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.headerImgView.mas_right).offset(10*WIDTH_NIT);
                make.top.equalTo(self.titleLabel.mas_bottom).offset(10*WIDTH_NIT);
                make.width.equalTo(@(kScreen_Width-self.headerImgView.width-30*WIDTH_NIT));
            }];
            
           
            
        }
            break;
            
        case FollowCarsCellMode:
        {
            
            
            _titleLabel.hidden = NO;
            _detailLabel.hidden = YES;
            _picView.hidden = NO;
            
            
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(10*WIDTH_NIT));
                make.top.equalTo(@(10*WIDTH_NIT));
                make.width.equalTo(@(kScreen_Width-20*WIDTH_NIT));
            }];
            
            
            [self clearAllImageViews];
            
            //图片数量
            NSInteger picNum = 6;
            CGFloat picHeight = (kScreen_Width-20*WIDTH_NIT)/5;
            
            [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(10*WIDTH_NIT));
                make.top.equalTo(self.titleLabel.mas_bottom).offset(10*WIDTH_NIT);
                make.width.equalTo(@(kScreen_Width-20*WIDTH_NIT));
                make.height.equalTo(@((picNum / 6 + 1) * (picHeight + 10*WIDTH_NIT)));
            }];
            
           
            for (int i = 0; i < picNum; i++) {
                
                UIButton *addImageView = [self setupImageViewWithModel:_model index:i];
                if (i % 5 == 0) {
                    addImageView.left = 0*WIDTH_NIT;
                }else if (i % 5 == 1) {
                    addImageView.left = 0*WIDTH_NIT+picHeight;
                }else if (i % 5 == 2) {
                    addImageView.left = 0*WIDTH_NIT+picHeight*2;
                }else if (i % 5 == 3) {
                    addImageView.left = 0*WIDTH_NIT+picHeight*3;
                }else {
                    addImageView.left = 0*WIDTH_NIT+picHeight*4;
                }
                
                addImageView.top = (i / 5) * (picHeight +  10*WIDTH_NIT);
                [_picView addSubview:addImageView];
            }
            
            
            
            
        }
            break;
        case ModifiedCarsCellMode:
        {
            
            _titleLabel.hidden = NO;
            _detailLabel.hidden = YES;
            _picView.hidden = NO;
            
            [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(10*WIDTH_NIT));
                make.top.equalTo(@(10*WIDTH_NIT));
                make.width.equalTo(@(kScreen_Width-20*WIDTH_NIT));
            }];
            
            
            [self clearAllImageViews];
            
            //图片数量
            NSInteger picNum = 3;
            CGFloat picHeight = (kScreen_Width-80*WIDTH_NIT)/3/2;
            
            [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@(10*WIDTH_NIT));
                make.top.equalTo(self.titleLabel.mas_bottom).offset(10*WIDTH_NIT);
                make.width.equalTo(@(kScreen_Width-20*WIDTH_NIT));
                make.height.equalTo(@((picNum / 4 + 1) * (picHeight + 20*WIDTH_NIT)));
            }];
            
            
            for (int i = 0; i < picNum; i++) {
                
                UIButton *addImageView = [self setupButtonWithModel:_model index:i];
                if (i % 3 == 0) {
                    addImageView.left = 10*WIDTH_NIT;
                }else if (i % 3 == 1) {
                    addImageView.left = 30*WIDTH_NIT+picHeight*2;
                }else {
                    addImageView.left = 50*WIDTH_NIT+picHeight*4;
                }
                
                addImageView.top = 10*WIDTH_NIT + (i / 3) * (picHeight +  20*WIDTH_NIT);
                [_picView addSubview:addImageView];
            }

            
        }
            break;
            
        default:
            break;
    }
    
}


- (UIButton *)setupImageViewWithModel:(PersonalMainModel *)model index:(int)index{
    CGFloat picHeight = (kScreen_Width-20*WIDTH_NIT)/5;
   
    UIButton *imageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, picHeight, picHeight)];
    imageButton.backgroundColor = [UIColor yellowColor];
    [imageButton setTitle:@"本田"];
    [imageButton setImage:@"猫狗2"];
    [UIButton ImageUptoLabelDown:imageButton margin:5*WIDTH_NIT];
    
    
    return imageButton;
    
}


- (UIButton *)setupButtonWithModel:(PersonalMainModel *)model index:(int)index{
    CGFloat picHeight = (kScreen_Width-80*WIDTH_NIT)/3/2;
    
    UIButton *imageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, picHeight*2, picHeight)];
    imageButton.backgroundColor = [UIColor yellowColor];
    [imageButton setTitle:@"本田"];
  
    return imageButton;
    
}


#pragma mark - private
- (void)clearAllImageViews {
    
    [self.picView removeAllSubviews];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
